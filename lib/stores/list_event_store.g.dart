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

  final _$nameEventAtom = Atom(name: '_ListEventStore.nameEvent');

  @override
  String get nameEvent {
    _$nameEventAtom.reportRead();
    return super.nameEvent;
  }

  @override
  set nameEvent(String value) {
    _$nameEventAtom.reportWrite(value, super.nameEvent, () {
      super.nameEvent = value;
    });
  }

  final _$descriptionEventAtom = Atom(name: '_ListEventStore.descriptionEvent');

  @override
  String get descriptionEvent {
    _$descriptionEventAtom.reportRead();
    return super.descriptionEvent;
  }

  @override
  set descriptionEvent(String value) {
    _$descriptionEventAtom.reportWrite(value, super.descriptionEvent, () {
      super.descriptionEvent = value;
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
  void addEvent(DateTime date) {
    final _$actionInfo = _$_ListEventStoreActionController.startAction(
        name: '_ListEventStore.addEvent');
    try {
      return super.addEvent(date);
    } finally {
      _$_ListEventStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameEvent(String newName) {
    final _$actionInfo = _$_ListEventStoreActionController.startAction(
        name: '_ListEventStore.setNameEvent');
    try {
      return super.setNameEvent(newName);
    } finally {
      _$_ListEventStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescriptionEvent(String newDesc) {
    final _$actionInfo = _$_ListEventStoreActionController.startAction(
        name: '_ListEventStore.setDescriptionEvent');
    try {
      return super.setDescriptionEvent(newDesc);
    } finally {
      _$_ListEventStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateSelected: ${dateSelected},
nameEvent: ${nameEvent},
descriptionEvent: ${descriptionEvent}
    ''';
  }
}
