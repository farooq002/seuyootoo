import 'package:get_storage/get_storage.dart';
import 'package:souyoutoo/model/auth_models/login_model.dart';

class StorageService {
  // --- Singleton setup ---
  StorageService._privateConstructor();
  static final StorageService _instance = StorageService._privateConstructor();
  static StorageService get instance => _instance;

  // GetStorage instance
  final _box = GetStorage();

  // Store token
  void saveToken(String token) => _box.write("token", token);

  String? getToken() => _box.read("token");

  // Store user data
  void saveUser(UserData user) => _box.write("user", user.toJson());

  UserData? getUser() {
    final data = _box.read("user");
    return data != null ? UserData.fromJson(data) : null;
  }

  void clearAll() => _box.erase();
}
