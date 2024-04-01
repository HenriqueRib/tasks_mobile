// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Utils on UtilsBase, Store {
  late final _$indexPageAtom =
      Atom(name: 'UtilsBase.indexPage', context: context);

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  late final _$loadingAtom = Atom(name: 'UtilsBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$indexPageLoginAtom =
      Atom(name: 'UtilsBase.indexPageLogin', context: context);

  @override
  int get indexPageLogin {
    _$indexPageLoginAtom.reportRead();
    return super.indexPageLogin;
  }

  @override
  set indexPageLogin(int value) {
    _$indexPageLoginAtom.reportWrite(value, super.indexPageLogin, () {
      super.indexPageLogin = value;
    });
  }

  late final _$messageEmailValidaAtom =
      Atom(name: 'UtilsBase.messageEmailValida', context: context);

  @override
  String get messageEmailValida {
    _$messageEmailValidaAtom.reportRead();
    return super.messageEmailValida;
  }

  @override
  set messageEmailValida(String value) {
    _$messageEmailValidaAtom.reportWrite(value, super.messageEmailValida, () {
      super.messageEmailValida = value;
    });
  }

  late final _$seePasswordAtom =
      Atom(name: 'UtilsBase.seePassword', context: context);

  @override
  bool get seePassword {
    _$seePasswordAtom.reportRead();
    return super.seePassword;
  }

  @override
  set seePassword(bool value) {
    _$seePasswordAtom.reportWrite(value, super.seePassword, () {
      super.seePassword = value;
    });
  }

  late final _$seePasswordConfimartionAtom =
      Atom(name: 'UtilsBase.seePasswordConfimartion', context: context);

  @override
  bool get seePasswordConfimartion {
    _$seePasswordConfimartionAtom.reportRead();
    return super.seePasswordConfimartion;
  }

  @override
  set seePasswordConfimartion(bool value) {
    _$seePasswordConfimartionAtom
        .reportWrite(value, super.seePasswordConfimartion, () {
      super.seePasswordConfimartion = value;
    });
  }

  late final _$formLoginAtom =
      Atom(name: 'UtilsBase.formLogin', context: context);

  @override
  bool get formLogin {
    _$formLoginAtom.reportRead();
    return super.formLogin;
  }

  @override
  set formLogin(bool value) {
    _$formLoginAtom.reportWrite(value, super.formLogin, () {
      super.formLogin = value;
    });
  }

  late final _$userAtom = Atom(name: 'UtilsBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$taskAtom = Atom(name: 'UtilsBase.task', context: context);

  @override
  Task? get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(Task? value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$idTaskAtom = Atom(name: 'UtilsBase.idTask', context: context);

  @override
  int get idTask {
    _$idTaskAtom.reportRead();
    return super.idTask;
  }

  @override
  set idTask(int value) {
    _$idTaskAtom.reportWrite(value, super.idTask, () {
      super.idTask = value;
    });
  }

  late final _$idTaskDeleteAtom =
      Atom(name: 'UtilsBase.idTaskDelete', context: context);

  @override
  int get idTaskDelete {
    _$idTaskDeleteAtom.reportRead();
    return super.idTaskDelete;
  }

  @override
  set idTaskDelete(int value) {
    _$idTaskDeleteAtom.reportWrite(value, super.idTaskDelete, () {
      super.idTaskDelete = value;
    });
  }

  late final _$editAtom = Atom(name: 'UtilsBase.edit', context: context);

  @override
  bool get edit {
    _$editAtom.reportRead();
    return super.edit;
  }

  @override
  set edit(bool value) {
    _$editAtom.reportWrite(value, super.edit, () {
      super.edit = value;
    });
  }

  late final _$idTaskEditAtom =
      Atom(name: 'UtilsBase.idTaskEdit', context: context);

  @override
  int get idTaskEdit {
    _$idTaskEditAtom.reportRead();
    return super.idTaskEdit;
  }

  @override
  set idTaskEdit(int value) {
    _$idTaskEditAtom.reportWrite(value, super.idTaskEdit, () {
      super.idTaskEdit = value;
    });
  }

  late final _$indexAtom = Atom(name: 'UtilsBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('UtilsBase.login', context: context);

  @override
  Future login({String? email, String? password}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, password: password));
  }

  late final _$registerAsyncAction =
      AsyncAction('UtilsBase.register', context: context);

  @override
  Future register(
      {String? name,
      String? email,
      String? password,
      String? passwordConfirmation}) {
    return _$registerAsyncAction.run(() => super.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation));
  }

  late final _$getMeAsyncAction =
      AsyncAction('UtilsBase.getMe', context: context);

  @override
  Future getMe() {
    return _$getMeAsyncAction.run(() => super.getMe());
  }

  late final _$getTasksAsyncAction =
      AsyncAction('UtilsBase.getTasks', context: context);

  @override
  Future getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  late final _$createAsyncAction =
      AsyncAction('UtilsBase.create', context: context);

  @override
  Future create(
      {String? name,
      String? description,
      String? deadline,
      String? status,
      String? priority,
      String? tag}) {
    return _$createAsyncAction.run(() => super.create(
        name: name,
        description: description,
        deadline: deadline,
        status: status,
        priority: priority,
        tag: tag));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('UtilsBase.deleteTask', context: context);

  @override
  Future deleteTask() {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask());
  }

  late final _$updateAsyncAction =
      AsyncAction('UtilsBase.update', context: context);

  @override
  Future update(
      {String? name,
      String? description,
      String? deadline,
      String? status,
      String? priority,
      String? tag}) {
    return _$updateAsyncAction.run(() => super.update(
        name: name,
        description: description,
        deadline: deadline,
        status: status,
        priority: priority,
        tag: tag));
  }

  late final _$showTaskAsyncAction =
      AsyncAction('UtilsBase.showTask', context: context);

  @override
  Future showTask(dynamic id) {
    return _$showTaskAsyncAction.run(() => super.showTask(id));
  }

  late final _$UtilsBaseActionController =
      ActionController(name: 'UtilsBase', context: context);

  @override
  dynamic setIndexPage(int i) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setIndexPage');
    try {
      return super.setIndexPage(i);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool v) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setLoading');
    try {
      return super.setLoading(v);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndexPageLogin(int v) {
    final _$actionInfo = _$UtilsBaseActionController.startAction(
        name: 'UtilsBase.setIndexPageLogin');
    try {
      return super.setIndexPageLogin(v);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMessageEmailValida(dynamic v) {
    final _$actionInfo = _$UtilsBaseActionController.startAction(
        name: 'UtilsBase.setMessageEmailValida');
    try {
      return super.setMessageEmailValida(v);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSeePassword(bool v) {
    final _$actionInfo = _$UtilsBaseActionController.startAction(
        name: 'UtilsBase.setSeePassword');
    try {
      return super.setSeePassword(v);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSeePasswordConfimartion(bool v) {
    final _$actionInfo = _$UtilsBaseActionController.startAction(
        name: 'UtilsBase.setSeePasswordConfimartion');
    try {
      return super.setSeePasswordConfimartion(v);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setformLogin(bool v) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setformLogin');
    try {
      return super.setformLogin(v);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUser(dynamic u) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setUser');
    try {
      return super.setUser(u);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTask(dynamic p) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setTask');
    try {
      return super.setTask(p);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setidTask(int id) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setidTask');
    try {
      return super.setidTask(id);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setidTaskDelete(int id) {
    final _$actionInfo = _$UtilsBaseActionController.startAction(
        name: 'UtilsBase.setidTaskDelete');
    try {
      return super.setidTaskDelete(id);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEdit(bool v) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setEdit');
    try {
      return super.setEdit(v);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setidTaskEdit(int id) {
    final _$actionInfo = _$UtilsBaseActionController.startAction(
        name: 'UtilsBase.setidTaskEdit');
    try {
      return super.setidTaskEdit(id);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int id) {
    final _$actionInfo =
        _$UtilsBaseActionController.startAction(name: 'UtilsBase.setIndex');
    try {
      return super.setIndex(id);
    } finally {
      _$UtilsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage},
loading: ${loading},
indexPageLogin: ${indexPageLogin},
messageEmailValida: ${messageEmailValida},
seePassword: ${seePassword},
seePasswordConfimartion: ${seePasswordConfimartion},
formLogin: ${formLogin},
user: ${user},
task: ${task},
idTask: ${idTask},
idTaskDelete: ${idTaskDelete},
edit: ${edit},
idTaskEdit: ${idTaskEdit},
index: ${index}
    ''';
  }
}
