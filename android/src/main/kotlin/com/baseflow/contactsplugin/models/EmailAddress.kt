package com.baseflow.contactsplugin.models

import com.baseflow.contactsplugin.data.EmailAddressType

class EmailAddress {
    var address: String = ""
    var label: String = ""
    var type: EmailAddressType = EmailAddressType.OTHER
}