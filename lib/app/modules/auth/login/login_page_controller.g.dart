// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageController on LoginPageControllerBase, Store {
  late final _$_errorAtom =
      Atom(name: 'LoginPageControllerBase._error', context: context);

  String get error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  String get _error => error;

  @override
  set _error(String value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: 'LoginPageControllerBase._loading', context: context);

  bool get loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  bool get _loading => loading;

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$LoginPageControllerBaseActionController =
      ActionController(name: 'LoginPageControllerBase', context: context);

  @override
  void showLoading() {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.showLoading');
    try {
      return super.showLoading();
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideLoading() {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.hideLoading');
    try {
      return super.hideLoading();
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String error) {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.setError');
    try {
      return super.setError(error);
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
