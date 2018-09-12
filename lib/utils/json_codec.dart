part of contacts_plugin;

class _JsonCodec {
  static T _decodeEnum<T>(List<T> enumValues, dynamic source) {
    if (source == null) {
      throw ArgumentError('A value must be provided. Supported values: '
          '${enumValues.join(', ')}');
    }
    return enumValues.singleWhere((e) => e.toString().split('.').last == source,
        orElse: () =>
            throw ArgumentError('`$source` is not one of the supported values: '
                '${enumValues.join(', ')}'));
  }

  static T _decodeNullableEnum<T>(List<T> enumValues, dynamic source) {
    if (source == null) {
      return null;
    }
    return _decodeEnum<T>(enumValues, source);
  }

  static String _encodeEnum<T>(T source) {
    return source.toString().split('.').last;
  }

  static String _encodeNullableEnum<T>(T source) {
    if (source == null) {
      return null;
    }

    return _encodeEnum(source);
  }
}
