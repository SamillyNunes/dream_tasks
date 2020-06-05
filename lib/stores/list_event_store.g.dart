// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_event_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListEventStore on _ListEventStore, Store {
  final _$dateSelectedAtom = Atom(name: '_ListEventStore.dateSelected');

  @override
  DateTime get dateSelected {
    _$dateSelectedAtom.reportRead();
    return super.dateSelected;
  }

  @override
  set dateSelected(DateTime value) {
    _$dateSelectedAtom.reportWrite(value, super.dateSelected, () {
      super.dateSelected = value;
    });
  }

  final _$_ListEventStoreActionController =
      ActionController(name: '_ListEventStore');

  @override
  void changeDaySelected(DateTime newDate) {
    final _$actionInfo = _$_ListEventStoreActionController.startAction(
        name: '_ListEventStore.changeDaySelected');
    try {
      return super.changeDaySelected(newDate);
    } finally {
      _$_ListEventStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEvent(String titleEvent, String description, DateTime date) {
    final _$actionInfo = _$_ListEventStoreActionController.startAction(
        name: '_ListEventStore.addEvent');
    try {
      return super.addEvent(titleEvent, description, date);
    } finally {
      _$_ListEventStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateSelected: ${dateSelected}
    ''';
  }
}
