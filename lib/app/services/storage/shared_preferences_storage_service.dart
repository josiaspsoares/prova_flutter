import 'package:shared_preferences/shared_preferences.dart';
import 'storage_service.dart';

class SharedPreferencesStorageService implements StorageService {
  @override
  Future<void> addToList({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> list = prefs.getStringList(key) ?? <String>[];

    list.add(value);

    await prefs.setStringList(key, list);
  }

  @override
  Future<List<String>?> getList({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(key);
  }

  @override
  Future<void> removeFromList({required String key, required int index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> list = await getList(key: key) ?? <String>[];

    list.removeAt(index);

    await prefs.setStringList(key, list);
  }
  
  @override
  Future<void> updateList({required String key, required int index, required String value}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> list = await getList(key: key) ?? <String>[];

    list[index] = value;

    await prefs.setStringList(key, list);
  }
}
