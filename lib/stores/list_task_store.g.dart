// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListTaskStore on _ListTaskStore, Store {
  final _$newTaskAtom = Atom(name: '_ListTaskStore.newTask');

  @override
  String get newTask {
    _$newTaskAtom.reportRead();
    return super.newTask;
  }

  @override
  set newTask(String value) {
    _$newTaskAtom.reportWrite(value, super.newTask, () {
      super.newTask = value;
    });
  }

  final _$barValueAtom = Atom(name: '_ListTaskStore.barValue');

  @override
  double get barValue {
    _$barValueAtom.reportRead();
    return super.barValue;
  }

  @override
  set barValue(double value) {
    _$barValueAtom.reportWrite(value, super.barValue, () {
      super.barValue = value;
    });
  }

  final _$barValueTaxAtom = Atom(name: '_ListTaskStore.barValueTax');

  @override
  double get barValueTax {
    _$barValueTaxAtom.reportRead();
    return super.barValueTax;
  }

  @override
  set barValueTax(double value) {
    _$barValueTaxAtom.reportWrite(value, super.barValueTax, () {
      super.barValueTax = value;
    });
  }

  final _$_ListTaskStoreActionController =
      ActionController(name: '_ListTaskStore');

  @override
  void addBarValue() {
    final _$actionInfo = _$_ListTaskStoreActionController.startAction(
        name: '_ListTaskStore.addBarValue');
    try {
      return super.addBarValue();
    } finally {
      _$_ListTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subBarValue() {
    final _$actionInfo = _$_ListTaskStoreActionController.startAction(
        name: '_ListTaskStore.subBarValue');
    try {
      return super.subBarValue();
    } finally {
      _$_ListTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restartBarValue(double newValue) {
    final _$actionInfo = _$_ListTaskStoreActionController.startAction(
        name: '_ListTaskStore.restartBarValue');
    try {
      return super.restartBarValue(newValue);
    } finally {
      _$_ListTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewTask(String value) {
    final _$actionInfo = _$_ListTaskStoreActionController.startAction(
        name: '_ListTaskStore.setNewTask');
    try {
      return super.setNewTask(value);
    } finally {
      _$_ListTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask() {
    final _$actionInfo = _$_ListTaskStoreActionController.startAction(
        name: '_ListTaskStore.addTask');
    try {
      return super.addTask();
    } finally {
      _$_ListTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(int index) {
    final _$actionInfo = _$_ListTaskStoreActionController.startAction(
        name: '_ListTaskStore.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$_ListTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTask: ${newTask},
barValue: ${barValue},
barValueTax: ${barValueTax}
    ''';
  }
}
