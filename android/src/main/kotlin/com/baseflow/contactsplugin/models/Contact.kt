package com.baseflow.contactsplugin.models

class Contact(val id: String, val isAggregate: Boolean) {
    var displayName: String = ""
    var firstName: String = ""
    var middleName: String = ""
    var lastName: String = ""
    var prefix: String = ""
    var nickname: String = ""
    var suffix: String = ""

    var addresses: MutableList<Address> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
    var emailAddresses: MutableList<EmailAddress> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
    var instantMessagingAccounts: MutableList<InstantMessagingAccount> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
    var notes: MutableList<Note> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
    var organizations: MutableList<Organization> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
    var phoneNumbers: MutableList<PhoneNumber> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
    var relationships: MutableList<Relationship> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
    var websites: MutableList<Website> = mutableListOf()
        set(value) {
            field = mutableListOf(*value.toTypedArray())
        }
}