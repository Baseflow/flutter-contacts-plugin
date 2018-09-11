part of contacts_plugin;

/// A representation of a contact retrieved from the platforms address book.
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

  /// A unique identifier which is used to identify this contact on the platform.
  final String id;

  /// Indicates if the contact is an aggregated representation from the same contact stored on different locations.
  final bool isAggregate;

  /// The display name of the contact.
  String displayName;

  /// The contact's honorific prefix.
  String prefix;

  /// The given name for the contact.
  String firstName;

  /// The contact's middle name.
  String middleName;

  /// The family name for the contact.
  String lastName;

  /// The nickname for the contact.
  String nickName;

  /// The contact's honorific suffix.
  String suffix;

  /// Creates a new instance of the [Contact] class.
  Contact({@required this.id, @required this.isAggregate});

  /// Create a new instance of the [Contact] class and populates it's properties based on the supplied JSON message.
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        id: json['id'] as String, isAggregate: json['isAggregate'] as bool)
      ..displayName = json['displayName'] as String
      ..prefix = json['prefix'] as String
      ..firstName = json['firstName'] as String
      ..middleName = json['middleName'] as String
      ..lastName = json['lastName'] as String
      ..nickName = json['nickName'] as String
      ..suffix = json['suffix'] as String
      ..addresses = (json['addresses'] as List)
          ?.map((e) =>
              e == null ? null : Address.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..emailAddresses = (json['emailAddresses'] as List)
          ?.map((e) => e == null
              ? null
              : EmailAddress.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..instantMessagingAccounts = (json['instantMessagingAccounts'] as List)
          ?.map((e) => e == null
              ? null
              : InstantMessagingAccount.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..notes = (json['notes'] as List)
          ?.map((e) =>
              e == null ? null : Note.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..organizations = (json['organizations'] as List)
          ?.map((e) => e == null
              ? null
              : Organization.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..phoneNumbers = (json['phoneNumbers'] as List)
          ?.map((e) => e == null
              ? null
              : PhoneNumber.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..relationships = (json['relationships'] as List)
          ?.map((e) => e == null
              ? null
              : Relationship.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..websites = (json['websites'] as List)
          ?.map((e) =>
              e == null ? null : Website.fromJson(e as Map<String, dynamic>))
          ?.toList();
  }

  /// Converts the [Contact] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'isAggregate': this.isAggregate,
        'displayName': this.displayName,
        'prefix': this.prefix,
        'firstName': this.firstName,
        'middleName': this.middleName,
        'lastName': this.lastName,
        'nickName': this.nickName,
        'suffix': this.suffix,
        'addresses': this.addresses,
        'emailAddresses': this.emailAddresses,
        'instantMessagingAccounts': this.instantMessagingAccounts,
        'notes': this.notes,
        'organizations': this.organizations,
        'phoneNumbers': this.phoneNumbers,
        'relationships': this.relationships,
        'websites': this.websites
      };

  /// A collection of all addresses related to this contact.
  List<Address> get addresses => _addresses;
  set addresses(List<Address> value) => _addresses = List.from(value);

  /// A collection of all email addresses related to this contact.
  List<EmailAddress> get emailAddresses => _emailAddresses;
  set emailAddresses(List<EmailAddress> value) =>
      _emailAddresses = List.from(value);

  /// A collection of all instant messaging accounts related to this contact.
  List<InstantMessagingAccount> get instantMessagingAccounts =>
      _instantMessagingAccounts;
  set instantMessagingAccounts(List<InstantMessagingAccount> value) =>
      _instantMessagingAccounts = List.from(value);

  /// A collection of all notes related to this contact.
  List<Note> get notes => _notes;
  set notes(List<Note> value) => _notes = List.from(value);

  /// A collection of all organizations related to this contact.
  List<Organization> get organizations => _organizations;
  set organizations(List<Organization> value) =>
      _organizations = List.from(value);

  /// A collection of all phone numbers related to this contact.
  List<PhoneNumber> get phoneNumbers => _phoneNumbers;
  set phoneNumbers(List<PhoneNumber> value) => _phoneNumbers = List.from(value);

  /// A collection of all relations related to this contact.
  List<Relationship> get relationships => _relationships;
  set relationships(List<Relationship> value) =>
      _relationships = List.from(value);

  /// A collection of all websites related to this contact.
  List<Website> get websites => _websites;
  set websites(List<Website> value) => _websites = List.from(value);
}
