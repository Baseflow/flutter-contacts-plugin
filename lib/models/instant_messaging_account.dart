part of contacts_plugin;

@JsonSerializable()
class InstantMessagingAccount {
  String account;
  String label;
  InstantMessagingService service;

  InstantMessagingAccount();

  factory InstantMessagingAccount.fromJson(Map<String, dynamic> json) =>
      _$InstantMessagingAccountFromJson(json);

  Map<String, dynamic> toJson() => _$InstantMessagingAccountToJson(this);
}
