enum SharedPreferencesKeys { SEARCH }

extension SharedPreferencesKeysExtension on SharedPreferencesKeys {
  String sharedKeyStateToKeyValues() {
    switch (this) {
      case SharedPreferencesKeys.SEARCH:
        return "SEARCH";
    }
  }
}
