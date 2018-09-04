package com.baseflow.contactsplugin.models

import com.baseflow.contactsplugin.data.OrganizationType

class Organization {
    var contactTitle: String = ""
    var label: String = ""
    var name: String = ""
    var type: OrganizationType = OrganizationType.OTHER
}