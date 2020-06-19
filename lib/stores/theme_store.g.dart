// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  final _$darkAtom = Atom(name: '_ThemeStore.dark');

  @override
  bool get dark {
    _$darkAtom.reportRead();
    return super.dark;
  }

  @override
  set dark(bool value) {
    _$darkAtom.reportWrite(value, super.dark, () {
      super.dark = value;
    });
  }

  final _$themeDataAtom = Atom(name: '_ThemeStore.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.reportRead();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.reportWrite(value, super.themeData, () {
      super.themeData = value;
    });
  }

  final _$greenGradientAtom = Atom(name: '_ThemeStore.greenGradient');

  @override
  bool get greenGradient {
    _$greenGradientAtom.reportRead();
    return super.greenGradient;
  }

  @override
  set greenGradient(bool value) {
    _$greenGradientAtom.reportWrite(value, super.greenGradient, () {
      super.greenGradient = value;
    });
  }

  final _$defaultGradientAtom = Atom(name: '_ThemeStore.defaultGradient');

  @override
  LinearGradient get defaultGradient {
    _$defaultGradientAtom.reportRead();
    return super.defaultGradient;
  }

  @override
  set defaultGradient(LinearGradient value) {
    _$defaultGradientAtom.reportWrite(value, super.defaultGradient, () {
      super.defaultGradient = value;
    });
  }

  final _$_ThemeStoreActionController = ActionController(name: '_ThemeStore');

  @override
  void toggleDark() {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
        name: '_ThemeStore.toggleDark');
    try {
      return super.toggleDark();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
        name: '_ThemeStore.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleGreenGradient() {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
        name: '_ThemeStore.toggleGreenGradient');
    try {
      return super.toggleGreenGradient();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeGradient() {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
        name: '_ThemeStore.changeGradient');
    try {
      return super.changeGradient();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dark: ${dark},
themeData: ${themeData},
greenGradient: ${greenGradient},
defaultGradient: ${defaultGradient}
    ''';
  }
}
