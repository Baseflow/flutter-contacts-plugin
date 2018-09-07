part of contacts_plugin;

enum AddressType {
  /// Indicates that the user marked this address his or her as "home" address.
  home,

  /// Indicates that the user marked this address his or her as "work" address.
  work,

  /// Indicates the address is neither a "home" nor "work" address.
  other,
}

enum EmailAddressType {
  /// Indicates that the user marked this emailaddress as his or her "home" emailaddress.
  home,

  /// Indicates that the user marked this emailaddress as his or her "work" emailaddress.
  work,

  /// Indicates the emailaddress is neither a "home" nor "work" emailaddress.
  other,
}

enum InstantMessagingService {
  /// Indicates that the account represents a AIM account.
  aim,

  /// Indicates that the account represents a Facebook account.
  facebook,

  /// Indicates that the account represents a Gadu Gadu account.
  gaduGadu,

  /// Indicates that the account represents a Google account.
  googleTalk,

  /// Indicates that the account represents an ICQ account.
  icq,

  /// Indicates that the account represents a Jabber account.
  jabber,

  /// Indicates that the account represents a MSN account.
  msn,

  /// Indicates that the account represents a QQ messenger account.
  qq,

  /// Indicates that the account represents a Skype account.
  skype,

  /// Indicates that the account represents a Yahoo account.
  yahoo,

  /// Indicates that the user marked this number as something that does not match with one of the options in [InstantMessagingService] enum.
  other,
}

enum OrganizationType {
  /// Indicates that the user marked this organization as "work".
  work,

  /// Indicates the organization is something other then "work".
  other,
}

enum PhoneNumberType {
  /// Indicates that the user marked this number as the "home" telephone number.
  home,

  /// Indicates that the user marked this number as the "home fax" number.
  homeFax,

  /// Indicates that the user marked this number as the "iPhone" telephone number.
  iphone,

  /// Indicates that the user marked this number as the "main" telephone number.
  main,

  /// Indicates that the user marked this number as the "mobile" telephone number.
  mobile,

  /// Indicates that the user marked this number as the "pager" number.
  pager,

  /// Indicates that the user marked this number as the "work" telephone number.
  work,

  /// Indicates that the user marked this number as the "work fax" number.
  workFax,

  /// Indicates that the user marked this number as something that does not match with one of the options in the [PhoneNumberType] enum.
  other,
}

enum RelationshipType {
  /// Indicates that the [Contact] is marked as being the father of the user.
  father,

  /// Indicates that the [Contact] is marked as being the mother of the user.
  mother,

  /// Indicates that the [Contact] is marked as being a parent of the user.
  parent,

  /// Indicates that the [Contact] is marked as being the brother of the user.
  brother,

  /// Indicates that the [Contact] is marked as being the sister of the user.
  sister,

  /// Indicates that the [Contact] is marked as being a child of the user.
  child,

  /// Indicates that the [Contact] is marked as being a friend of the user.
  friend,

  /// Indicates that the [Contact] is marked as being the spouse of the user.
  spouse,

  /// Indicates that the [Contact] is marked as being a partner of the user.
  partner,

  /// Indicates that the [Contact] is marked as being an assistant of the user.
  assistant,

  /// Indicates that the [Contact] is marked as being a manager of the user.
  manager,

  /// Indicates that the user marked this number as something that does not match with one of the options in the [RelationshipType] enum.
  other,
}
