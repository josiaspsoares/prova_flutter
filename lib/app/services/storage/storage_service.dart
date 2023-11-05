abstract class StorageService {
  Future<void> addToList({required String key, required String value});
  Future<List<String>?> getList({required String key});
  Future<void> removeFromList({required String key, required int index});
  Future<void> updateList({required String key, required int index, required String value});
}
