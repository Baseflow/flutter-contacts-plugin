package com.baseflow.contactsplugin.models

import com.baseflow.contactsplugin.data.PhoneNumberType

class PhoneNumber {
    var label: String = ""
    var number: String = ""
    var type: PhoneNumberType = PhoneNumberType.OTHER
}