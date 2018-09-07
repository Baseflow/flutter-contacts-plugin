package com.baseflow.contactsplugin.data

import com.google.gson.annotations.SerializedName

enum class RelationshipType {
    @SerializedName("father")
    FATHER,
    @SerializedName("mother")
    MOTHER,
    @SerializedName("parent")
    PARENT,
    @SerializedName("brother")
    BROTHER,
    @SerializedName("sister")
    SISTER,
    @SerializedName("child")
    CHILD,
    @SerializedName("friend")
    FRIEND,
    @SerializedName("spouse")
    SPOUSE,
    @SerializedName("partner")
    PARTNER,
    @SerializedName("assistant")
    ASSISTANT,
    @SerializedName("manager")
    MANAGER,
    @SerializedName("other")
    OTHER,
}