import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys.dart';

class SharedPreferencesKeyWithValueParams {
  final SharedPreferencesKeys key;
  final String data;

  SharedPreferencesKeyWithValueParams({required this.key, required this.data});
}
