part of contacts_plugin;

/// A representation of a instant messaging account linked to a contact.
class InstantMessagingAccount {
  /// The name of the account (or account name).
  String account;

  /// A user defined label for the [InstantMessagingAccount].
  String label;

  /// Indicates the instant messaging services to which this account belongs.
  InstantMessagingService service;

  /// Creates a new (empty) instance of the [InstantMessagingAccount] class.
  InstantMessagingAccount();

  /// Create a new instance of the [InstantMessagingAccount] class and populates it's properties based on the supplied JSON message.
  factory InstantMessagingAccount.fromJson(Map<String, dynamic> json) {
    return InstantMessagingAccount()
      ..account = json['account'] as String
      ..label = json['label'] as String
      ..service = _JsonCodec._decodeNullableEnum(
          InstantMessagingService.values, json['service']);
  }

  /// Converts the [InstantMessagingAccount] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account': this.account,
        'label': this.label,
        'service': _JsonCodec._encodeNullableEnum(this.service)
      };
}
