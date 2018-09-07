package com.baseflow.contactsplugin.data

import com.google.gson.annotations.SerializedName

enum class AddressType {
    @SerializedName("home")
    HOME,
    @SerializedName("work")
    WORK,
    @SerializedName("other")
    OTHER
}