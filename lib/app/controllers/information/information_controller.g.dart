// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationController on InformationControllerBase, Store {
  late final _$isUpdatingAtom =
      Atom(name: 'InformationControllerBase.isUpdating', context: context);

  @override
  bool get isUpdating {
    _$isUpdatingAtom.reportRead();
    return super.isUpdating;
  }

  @override
  set isUpdating(bool value) {
    _$isUpdatingAtom.reportWrite(value, super.isUpdating, () {
      super.isUpdating = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: 'InformationControllerBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$informationListAtom =
      Atom(name: 'InformationControllerBase.informationList', context: context);

  @override
  ObservableList<String> get informationList {
    _$informationListAtom.reportRead();
    return super.informationList;
  }

  @override
  set informationList(ObservableList<String> value) {
    _$informationListAtom.reportWrite(value, super.informationList, () {
      super.informationList = value;
    });
  }

  late final _$getListAsyncAction =
      AsyncAction('InformationControllerBase.getList', context: context);

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  late final _$addItemAsyncAction =
      AsyncAction('InformationControllerBase.addItem', context: context);

  @override
  Future<void> addItem({required String value}) {
    return _$addItemAsyncAction.run(() => super.addItem(value: value));
  }

  late final _$updateItemAsyncAction =
      AsyncAction('InformationControllerBase.updateItem', context: context);

  @override
  Future<void> updateItem({required int index, required String value}) {
    return _$updateItemAsyncAction
        .run(() => super.updateItem(index: index, value: value));
  }

  late final _$removeItemAsyncAction =
      AsyncAction('InformationControllerBase.removeItem', context: context);

  @override
  Future<void> removeItem({required int index}) {
    return _$removeItemAsyncAction.run(() => super.removeItem(index: index));
  }

  @override
  String toString() {
    return '''
isUpdating: ${isUpdating},
currentIndex: ${currentIndex},
informationList: ${informationList}
    ''';
  }
}
