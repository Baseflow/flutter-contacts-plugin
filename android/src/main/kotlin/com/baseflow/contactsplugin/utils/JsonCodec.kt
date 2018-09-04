package com.baseflow.contactsplugin.utils

import com.google.gson.Gson
import com.google.gson.GsonBuilder

class JsonCodec {
    companion object {
        @JvmStatic
        private val gsonDecoder : Gson = GsonBuilder().enableComplexMapKeySerialization().create()


        @JvmStatic
        fun <T : Any> encodeToJsonString(objectToEncode: T) : String {
            return gsonDecoder.toJson(objectToEncode)
        }
    }
}