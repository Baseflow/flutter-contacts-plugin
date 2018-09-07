package com.baseflow.contactsplugin

import android.content.ContentResolver
import android.content.Context
import android.content.res.Resources
import android.database.Cursor
import android.provider.ContactsContract
import com.baseflow.contactsplugin.data.*
import com.baseflow.contactsplugin.models.*

class ContactManager(private val androidContext: Context) {

    fun fetchContacts(): Collection<Contact> {
        val contentResolver: ContentResolver = androidContext.contentResolver

        return fetchContacts(contentResolver)
    }


    private fun fetchContacts(contentResolver: ContentResolver): Collection<Contact> {
        var cursor: Cursor? = null

        val keyColumn: String = ContactsContract.Contacts.LOOKUP_KEY
        val contacts: MutableList<Contact> = mutableListOf()

        try {
            var currentContact: Contact? = null
            cursor = contentResolver.query(
                    ContactsContract.Data.CONTENT_URI,
                    null,
                    null,
                    null,
                    null)
            if (cursor == null)
                return listOf()

            val idIndex: Int = cursor.getColumnIndex(keyColumn)
            val displayNameIndex: Int = cursor.getColumnIndex(ContactsContract.Contacts.DISPLAY_NAME)
            var contactId: String? = null
            while(cursor.moveToNext()) {
                contactId = cursor.getString(idIndex);

                if (currentContact == null || currentContact.id != contactId) {
                    currentContact = Contact(contactId, true)
                    currentContact.displayName = cursor.getString(displayNameIndex)

                    contacts.add(currentContact)
                }

                fillContactWithRow(androidContext.resources, currentContact, cursor)
            }

            return contacts
        } finally {
            cursor?.close()
        }
    }

    private fun fillContactWithRow(resources: Resources, contact: Contact, cursor: Cursor) {
        val mimeTypeIndex: Int = cursor.getColumnIndex(ContactsContract.Data.MIMETYPE)
        val dataType: String = cursor.getString(mimeTypeIndex)

        when (dataType) {
            ContactsContract.CommonDataKinds.Nickname.CONTENT_ITEM_TYPE ->
                contact.nickname = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Nickname.NAME)) ?: ""
            ContactsContract.CommonDataKinds.StructuredName.CONTENT_ITEM_TYPE -> {
                contact.prefix = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredName.PREFIX)) ?: ""
                contact.firstName = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredName.GIVEN_NAME)) ?: ""
                contact.middleName = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredName.MIDDLE_NAME)) ?: ""
                contact.lastName = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredName.FAMILY_NAME)) ?: ""
                contact.suffix = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredName.SUFFIX)) ?: ""
            }
            ContactsContract.CommonDataKinds.StructuredPostal.CONTENT_ITEM_TYPE ->
                contact.addresses.add(getAddress(cursor, resources))
            ContactsContract.CommonDataKinds.Email.CONTENT_ITEM_TYPE ->
                contact.emailAddresses.add(getEmailAddress(cursor, resources))
            ContactsContract.CommonDataKinds.Im.CONTENT_ITEM_TYPE ->
                contact.instantMessagingAccounts.add(getInstantMessagingAccount(cursor, resources))
            ContactsContract.CommonDataKinds.Note.CONTENT_ITEM_TYPE ->
                contact.notes.add(getNote(cursor))
            ContactsContract.CommonDataKinds.Organization.CONTENT_ITEM_TYPE ->
                contact.organizations.add(getOrganization(cursor, resources))
            ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE ->
                contact.phoneNumbers.add(getPhoneNumber(cursor, resources))
            ContactsContract.CommonDataKinds.Relation.CONTENT_ITEM_TYPE ->
                contact.relationships.add(getRelationship(cursor, resources))
            ContactsContract.CommonDataKinds.Website.CONTENT_ITEM_TYPE ->
                contact.websites.add(getWebsite(cursor))
        }
    }

    private fun getAddress(cursor: Cursor, resources: Resources): Address {
        val address = Address()
        address.country = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.COUNTRY)) ?: ""
        address.region = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.REGION)) ?: ""
        address.city = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.CITY)) ?: ""
        address.postalCode = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.POSTCODE)) ?: ""

        val addressDataKind: Int = cursor.getInt(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.TYPE))
        address.type = addressDataKind.toAddressType()
        address.label = if (addressDataKind != ContactsContract.CommonDataKinds.StructuredPostal.TYPE_CUSTOM)
                ContactsContract.CommonDataKinds.StructuredPostal.getTypeLabel(resources, addressDataKind, "").toString()
            else
                cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.LABEL)) ?: ""

        val street: String? = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.STREET))
        val pobox: String? = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.POBOX))
        if (street != null) {
            address.streetAddress = street
        }
        if (pobox != null) {
            address.streetAddress +=
                    if (street != null)
                        System.getProperty("line.separator") + pobox
                    else
                        pobox
        }

        return address

    }

    private fun getEmailAddress(cursor: Cursor, resources: Resources): EmailAddress {
        val emailAddress = EmailAddress()
        emailAddress.address = cursor.getString(cursor.getColumnIndex(ContactsContract.Data.DATA1)) ?: ""

        val emailAddressKind: Int = cursor.getInt(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Email.TYPE))
        emailAddress.type = emailAddressKind.toEmailAddressType()
        emailAddress.label =
                if (emailAddressKind != ContactsContract.CommonDataKinds.Email.TYPE_CUSTOM)
                    ContactsContract.CommonDataKinds.StructuredPostal.getTypeLabel(resources, emailAddressKind, "").toString()
                else
                    cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.StructuredPostal.LABEL)) ?: ""

        return emailAddress
    }

    private fun getInstantMessagingAccount(cursor: Cursor, resources: Resources): InstantMessagingAccount {
        val instantMessagingAccount = InstantMessagingAccount()
        instantMessagingAccount.account = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Im.DATA)) ?: ""

        val instanMessagingKind: Int = cursor.getInt(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Im.PROTOCOL))
        instantMessagingAccount.service = instanMessagingKind.toInstantMessagingService()
        instantMessagingAccount.label =
                if (instanMessagingKind != ContactsContract.CommonDataKinds.Im.TYPE_CUSTOM)
                    ContactsContract.CommonDataKinds.Im.getProtocolLabel(resources, instanMessagingKind, "").toString()
                else
                    cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Im.LABEL)) ?: ""

        return instantMessagingAccount
    }

    private fun getNote(cursor: Cursor): Note {
        val note = Note()
        note.content = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Note.DATA1)) ?: ""

        return note
    }

    private fun getOrganization(cursor: Cursor, resources: Resources): Organization {
        val organization = Organization()
        organization.name = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Organization.COMPANY)) ?: ""
        organization.contactTitle = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Organization.TITLE)) ?: ""

        val organizationKind: Int = cursor.getInt(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Organization.TYPE))
        organization.type = organizationKind.toOrganizationType()
        organization.label =
                if (organizationKind != ContactsContract.CommonDataKinds.Organization.TYPE_CUSTOM)
                    ContactsContract.CommonDataKinds.Organization.getTypeLabel(resources, organizationKind, "").toString()
                else
                    cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Organization.LABEL)) ?: ""

        return organization
    }

    private fun getPhoneNumber(cursor: Cursor, resources: Resources): PhoneNumber {
        val phoneNumber = PhoneNumber()
        phoneNumber.number = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER)) ?: ""

        val phoneNumberKind: Int = cursor.getInt(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.TYPE))
        phoneNumber.type = phoneNumberKind.toPhoneNumberType()
        phoneNumber.label =
                if (phoneNumberKind != ContactsContract.CommonDataKinds.Phone.TYPE_CUSTOM)
                    ContactsContract.CommonDataKinds.Phone.getTypeLabel(resources, phoneNumberKind, "").toString()
                else
                    cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.LABEL)) ?: ""

        return phoneNumber
    }

    private fun getRelationship(cursor: Cursor, resources: Resources): Relationship {
        val relationship = Relationship()
        val relationshipKind: Int = cursor.getInt(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Relation.TYPE))
        relationship.type = relationshipKind.toRelationshipType()
        relationship.label =
                if (relationshipKind != ContactsContract.CommonDataKinds.Relation.TYPE_CUSTOM)
                    ContactsContract.CommonDataKinds.Relation.getTypeLabel(resources, relationshipKind, "").toString()
                else
                    cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Relation.LABEL)) ?: ""

        return relationship
    }

    private fun getWebsite(cursor: Cursor): Website {
        val website = Website()
        website.address = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Website.URL)) ?: ""

        return website
    }

    private fun Int.toAddressType(): AddressType {
        return when(this) {
            ContactsContract.CommonDataKinds.StructuredPostal.TYPE_HOME ->
                AddressType.HOME
            ContactsContract.CommonDataKinds.StructuredPostal.TYPE_WORK ->
                AddressType.WORK
            else ->
                AddressType.OTHER
        }
    }

    private fun Int.toEmailAddressType(): EmailAddressType {
        return when(this) {
            ContactsContract.CommonDataKinds.StructuredPostal.TYPE_HOME ->
                EmailAddressType.HOME
            ContactsContract.CommonDataKinds.StructuredPostal.TYPE_WORK ->
                EmailAddressType.WORK
            else ->
                EmailAddressType.OTHER
        }
    }

    private fun Int.toInstantMessagingService(): InstantMessagingService {
        return when(this) {
            ContactsContract.CommonDataKinds.Im.PROTOCOL_AIM ->
                InstantMessagingService.AIM
            ContactsContract.CommonDataKinds.Im.PROTOCOL_GOOGLE_TALK ->
                InstantMessagingService.GOOGLE_TALK
            ContactsContract.CommonDataKinds.Im.PROTOCOL_ICQ ->
                InstantMessagingService.ICQ
            ContactsContract.CommonDataKinds.Im.PROTOCOL_JABBER ->
                InstantMessagingService.JABBER
            ContactsContract.CommonDataKinds.Im.PROTOCOL_MSN ->
                InstantMessagingService.MSN
            ContactsContract.CommonDataKinds.Im.PROTOCOL_QQ ->
                InstantMessagingService.QQ
            ContactsContract.CommonDataKinds.Im.PROTOCOL_SKYPE ->
                InstantMessagingService.SKYPE
            ContactsContract.CommonDataKinds.Im.PROTOCOL_YAHOO ->
                InstantMessagingService.YAHOO
            else ->
                InstantMessagingService.OTHER
        }
    }

    private fun Int.toOrganizationType(): OrganizationType {
        return when(this) {
            ContactsContract.CommonDataKinds.Organization.TYPE_WORK ->
                OrganizationType.WORK
            else ->
                OrganizationType.OTHER
        }
    }

    private fun Int.toPhoneNumberType(): PhoneNumberType {
        return when(this) {
            ContactsContract.CommonDataKinds.Phone.TYPE_HOME ->
                PhoneNumberType.HOME
            ContactsContract.CommonDataKinds.Phone.TYPE_FAX_HOME ->
                PhoneNumberType.HOME_FAX
            ContactsContract.CommonDataKinds.Phone.TYPE_MOBILE ->
                PhoneNumberType.MOBILE
            ContactsContract.CommonDataKinds.Phone.TYPE_PAGER,
            ContactsContract.CommonDataKinds.Phone.TYPE_WORK_PAGER ->
                PhoneNumberType.HOME_FAX
            ContactsContract.CommonDataKinds.Phone.TYPE_WORK ->
                PhoneNumberType.WORK
            ContactsContract.CommonDataKinds.Phone.TYPE_FAX_WORK ->
                PhoneNumberType.WORK_FAX
            else ->
                PhoneNumberType.OTHER
        }
    }

    private fun Int.toRelationshipType(): RelationshipType {
        return when(this) {
            ContactsContract.CommonDataKinds.Relation.TYPE_FATHER ->
                RelationshipType.FATHER
            ContactsContract.CommonDataKinds.Relation.TYPE_MOTHER ->
                RelationshipType.MOTHER
            ContactsContract.CommonDataKinds.Relation.TYPE_PARENT ->
                RelationshipType.PARENT
            ContactsContract.CommonDataKinds.Relation.TYPE_BROTHER ->
                RelationshipType.BROTHER
            ContactsContract.CommonDataKinds.Relation.TYPE_SISTER ->
                RelationshipType.SISTER
            ContactsContract.CommonDataKinds.Relation.TYPE_DOMESTIC_PARTNER,
            ContactsContract.CommonDataKinds.Relation.TYPE_PARTNER ->
                RelationshipType.PARTNER
            ContactsContract.CommonDataKinds.Relation.TYPE_SPOUSE ->
                RelationshipType.SPOUSE
            ContactsContract.CommonDataKinds.Relation.TYPE_FRIEND ->
                RelationshipType.FRIEND
            ContactsContract.CommonDataKinds.Relation.TYPE_MANAGER ->
                RelationshipType.MANAGER
            ContactsContract.CommonDataKinds.Relation.TYPE_ASSISTANT ->
                RelationshipType.ASSISTANT
            else ->
                RelationshipType.OTHER
        }
    }

}