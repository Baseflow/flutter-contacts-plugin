package com.baseflow.contactsplugin.data

import com.google.gson.annotations.SerializedName

enum class InstantMessagingService {
    @SerializedName("aim")
    AIM,
    @SerializedName("facebook")
    FACEBOOK,
    @SerializedName("gaduGadu")
    GADU_GADU,
    @SerializedName("googleTalk")
    GOOGLE_TALK,
    @SerializedName("icq")
    ICQ,
    @SerializedName("jabber")
    JABBER,
    @SerializedName("msn")
    MSN,
    @SerializedName("qq")
    QQ,
    @SerializedName("skype")
    SKYPE,
    @SerializedName("yahoo")
    YAHOO,
    @SerializedName("other")
    OTHER,
}