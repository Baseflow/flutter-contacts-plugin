package com.baseflow.contactsplugin.data

import com.google.gson.annotations.SerializedName

enum class PhoneNumberType {
    @SerializedName("home")
    HOME,
    @SerializedName("homeFax")
    HOME_FAX,
    @SerializedName("iphone")
    IPHONE,
    @SerializedName("main")
    MAIN,
    @SerializedName("mobile")
    MOBILE,
    @SerializedName("pager")
    PAGER,
    @SerializedName("work")
    WORK,
    @SerializedName("workFax")
    WORK_FAX,
    @SerializedName("other")
    OTHER,
}