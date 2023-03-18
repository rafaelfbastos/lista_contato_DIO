// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller_pages.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthControllerPages on AuthControllerPagesBase, Store {
  late final _$_errorAtom =
      Atom(name: 'AuthControllerPagesBase._error', context: context);

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
      Atom(name: 'AuthControllerPagesBase._loading', context: context);

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

  late final _$_successAtom =
      Atom(name: 'AuthControllerPagesBase._success', context: context);

  bool get success {
    _$_successAtom.reportRead();
    return super._success;
  }

  @override
  bool get _success => success;

  @override
  set _success(bool value) {
    _$_successAtom.reportWrite(value, super._success, () {
      super._success = value;
    });
  }

  late final _$AuthControllerPagesBaseActionController =
      ActionController(name: 'AuthControllerPagesBase', context: context);

  @override
  void showLoading() {
    final _$actionInfo = _$AuthControllerPagesBaseActionController.startAction(
        name: 'AuthControllerPagesBase.showLoading');
    try {
      return super.showLoading();
    } finally {
      _$AuthControllerPagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideLoading() {
    final _$actionInfo = _$AuthControllerPagesBaseActionController.startAction(
        name: 'AuthControllerPagesBase.hideLoading');
    try {
      return super.hideLoading();
    } finally {
      _$AuthControllerPagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isSucess() {
    final _$actionInfo = _$AuthControllerPagesBaseActionController.startAction(
        name: 'AuthControllerPagesBase.isSucess');
    try {
      return super.isSucess();
    } finally {
      _$AuthControllerPagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String error) {
    final _$actionInfo = _$AuthControllerPagesBaseActionController.startAction(
        name: 'AuthControllerPagesBase.setError');
    try {
      return super.setError(error);
    } finally {
      _$AuthControllerPagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
