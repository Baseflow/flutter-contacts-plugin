package com.baseflow.contactsplugin.models

import com.baseflow.contactsplugin.data.InstantMessagingService

class InstantMessagingAccount {
    var account: String = ""
    var label: String = ""
    var service: InstantMessagingService = InstantMessagingService.OTHER
}