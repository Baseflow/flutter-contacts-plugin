package com.baseflow.contactsplugin

import android.content.Context
import com.baseflow.contactsplugin.models.Contact
import com.baseflow.contactsplugin.utils.JsonCodec
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar

class ContactsPlugin(private val registrar: PluginRegistry.Registrar): MethodCallHandler {
  private val androidContext: Context = registrar.activity() ?: registrar.activeContext()

    companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter.baseflow.com/contacts_plugin/methods")
      channel.setMethodCallHandler(ContactsPlugin(registrar))
    }
  }

    override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getContacts") {
        val contactManager = ContactManager(androidContext)
        val contacts: Collection<Contact> = contactManager.fetchContacts()
        result.success(JsonCodec.encodeToJsonString(contacts))
    } else {
      result.notImplemented()
    }
  }
}
