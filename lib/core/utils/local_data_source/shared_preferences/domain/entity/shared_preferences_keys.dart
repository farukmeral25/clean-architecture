enum SharedPreferencesKeys { LOGIN }

extension SharedPreferencesKeysExtension on SharedPreferencesKeys {
  String sharedKeyStateToKeyValues() {
    switch (this) {
      case SharedPreferencesKeys.LOGIN:
        return "LOGIN";
    }
  }
}
