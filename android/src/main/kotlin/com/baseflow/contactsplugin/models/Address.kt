package com.baseflow.contactsplugin.models

import com.baseflow.contactsplugin.data.AddressType

class Address {
    var type: AddressType = AddressType.OTHER
    var label: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var region: String = ""
    var country: String = ""
    var postalCode: String = ""
}