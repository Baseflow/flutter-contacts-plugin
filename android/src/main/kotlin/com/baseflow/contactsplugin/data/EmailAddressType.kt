package com.baseflow.contactsplugin.data

import com.google.gson.annotations.SerializedName

enum class EmailAddressType {
    @SerializedName("home")
    HOME,
    @SerializedName("work")
    WORK,
    @SerializedName("other")
    OTHER
}