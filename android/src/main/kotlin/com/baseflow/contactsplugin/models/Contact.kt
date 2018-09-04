package com.baseflow.contactsplugin.models

class Contact(val id: String, val isAggregate: Boolean) {
    var displayName: String = ""
    var firstName: String = ""
    var middleName: String = ""
    var lastName: String = ""
    var prefix: String = ""
    var nickname: String = ""
    var suffix: String = ""

    var addresses: Array<Address> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
    var emailAddresses: Array<EmailAddress> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
    var instantMessagingAccounts: Array<InstantMessagingAccount> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
    var notes: Array<Note> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
    var organizations: Array<Organization> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
    var phoneNumbers: Array<PhoneNumber> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
    var relationships: Array<Relationship> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
    var website: Array<Website> = arrayOf()
        set(value) {
            field = arrayOf(*value)
        }
}