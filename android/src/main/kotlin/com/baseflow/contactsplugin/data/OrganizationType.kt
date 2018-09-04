package com.baseflow.contactsplugin.data

import com.google.gson.annotations.SerializedName

enum class OrganizationType {
    @SerializedName("work")
    WORK,
    @SerializedName("other")
    OTHER
}