import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/services/storage/shared_preferences_storage_service.dart';
import 'package:prova_flutter/app/services/storage/storage_service.dart';

part 'information_controller.g.dart';

class InformationController = InformationControllerBase with _$InformationController;

abstract class InformationControllerBase with Store {
  StorageService storageService = SharedPreferencesStorageService();

  @observable
  bool isUpdating = false;

  @observable
  int currentIndex = -1;

  @observable
  ObservableList<String> informationList = ObservableList<String>();

  @action
  Future<void> getList() async {
    final List<String>? list = await storageService.getList(key: 'information');

    if (list != null) {
      informationList = list.asObservable();
    }
  }

  @action
  Future<void> addItem({required String value}) async {
    await storageService.addToList(
      key: 'information',
      value: value,
    );

    await getList();
  }

  @action
  Future<void> updateItem({required int index, required String value}) async {
    await storageService.updateList(
      key: 'information',
      index: index,
      value: value,
    );

    await getList();
  }

  @action
  Future<void> removeItem({required int index}) async {
    await storageService.removeFromList(
      key: 'information',
      index: index,
    );

    await getList();
  }

 
}
