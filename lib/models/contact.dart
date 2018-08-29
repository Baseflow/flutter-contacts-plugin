part of contacts_plugin;

class Contact {
  List<Address> _addresses = <Address>[];
  List<EmailAddress> _emailAddresses = <EmailAddress>[];
  List<InstantMessagingAccount> _instantMessagingAccounts =
      <InstantMessagingAccount>[];
  List<Note> _notes = <Note>[];
  List<Organization> _organizations = <Organization>[];
  List<PhoneNumber> _phoneNumbers = <PhoneNumber>[];
  List<Relationship> _relationships = <Relationship>[];
  List<Website> _websites = <Website>[];

  final String id;
  final bool isAggregate;
  Object tag;
  String displayName;
  String prefix;
  String firstName;
  String middleName;
  String lastName;
  String nickName;
  String suffix;

  Contact({@required this.id, @required this.isAggregate});

  List<Address> get addresses => _addresses;
  set addresses(List<Address> value) => _addresses = List.from(value);

  List<EmailAddress> get emailAddresses => _emailAddresses;
  set emailAddresses(List<EmailAddress> value) =>
      _emailAddresses = List.from(value);

  List<InstantMessagingAccount> get instantMessagingAccounts =>
      _instantMessagingAccounts;
  set instantMessagingAccounts(List<InstantMessagingAccount> value) =>
      _instantMessagingAccounts = List.from(value);

  List<Note> get notes => _notes;
  set notes(List<Note> value) => _notes = List.from(value);

  List<Organization> get organizations => _organizations;
  set organizations(List<Organization> value) =>
      _organizations = List.from(value);

  List<PhoneNumber> get phoneNumbers => _phoneNumbers;
  set phoneNumbers(List<PhoneNumber> value) => _phoneNumbers = List.from(value);

  List<Relationship> get relationships => _relationships;
  set relationships(List<Relationship> value) =>
      _relationships = List.from(value);

  List<Website> get websites => _websites;
  set websites(List<Website> value) => _websites = List.from(value);
}
