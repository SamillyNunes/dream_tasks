// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_projects_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListProjectsStore on _ListProjectsStore, Store {
  final _$projectNameAtom = Atom(name: '_ListProjectsStore.projectName');

  @override
  String get projectName {
    _$projectNameAtom.reportRead();
    return super.projectName;
  }

  @override
  set projectName(String value) {
    _$projectNameAtom.reportWrite(value, super.projectName, () {
      super.projectName = value;
    });
  }

  final _$temporaryTaskNameAtom =
      Atom(name: '_ListProjectsStore.temporaryTaskName');

  @override
  String get temporaryTaskName {
    _$temporaryTaskNameAtom.reportRead();
    return super.temporaryTaskName;
  }

  @override
  set temporaryTaskName(String value) {
    _$temporaryTaskNameAtom.reportWrite(value, super.temporaryTaskName, () {
      super.temporaryTaskName = value;
    });
  }

  final _$_ListProjectsStoreActionController =
      ActionController(name: '_ListProjectsStore');

  @override
  void setProject(String value) {
    final _$actionInfo = _$_ListProjectsStoreActionController.startAction(
        name: '_ListProjectsStore.setProject');
    try {
      return super.setProject(value);
    } finally {
      _$_ListProjectsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTemporaryTaskName(String newValue) {
    final _$actionInfo = _$_ListProjectsStoreActionController.startAction(
        name: '_ListProjectsStore.setTemporaryTaskName');
    try {
      return super.setTemporaryTaskName(newValue);
    } finally {
      _$_ListProjectsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTemporaryTask() {
    final _$actionInfo = _$_ListProjectsStoreActionController.startAction(
        name: '_ListProjectsStore.addTemporaryTask');
    try {
      return super.addTemporaryTask();
    } finally {
      _$_ListProjectsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProject() {
    final _$actionInfo = _$_ListProjectsStoreActionController.startAction(
        name: '_ListProjectsStore.addProject');
    try {
      return super.addProject();
    } finally {
      _$_ListProjectsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projectName: ${projectName},
temporaryTaskName: ${temporaryTaskName}
    ''';
  }
}
