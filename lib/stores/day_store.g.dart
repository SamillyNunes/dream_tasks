// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DayStore on _DayStore, Store {
  final _$dateSelectedAtom = Atom(name: '_DayStore.dateSelected');

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

  final _$_DayStoreActionController = ActionController(name: '_DayStore');

  @override
  void changeDaySelected(DateTime newDate) {
    final _$actionInfo = _$_DayStoreActionController.startAction(
        name: '_DayStore.changeDaySelected');
    try {
      return super.changeDaySelected(newDate);
    } finally {
      _$_DayStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateSelected: ${dateSelected}
    ''';
  }
}
