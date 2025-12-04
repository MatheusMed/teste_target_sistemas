// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<Map<String, double>>? _$porcentagemTotalLetrasNumerosComputed;

  @override
  Map<String, double> get porcentagemTotalLetrasNumeros =>
      (_$porcentagemTotalLetrasNumerosComputed ??=
              Computed<Map<String, double>>(
                () => super.porcentagemTotalLetrasNumeros,
                name: '_HomeStoreBase.porcentagemTotalLetrasNumeros',
              ))
          .value;
  Computed<int>? _$totalLinhasComputed;

  @override
  int get totalLinhas => (_$totalLinhasComputed ??= Computed<int>(
    () => super.totalLinhas,
    name: '_HomeStoreBase.totalLinhas',
  )).value;
  Computed<int>? _$totalEdicoesComputed;

  @override
  int get totalEdicoes => (_$totalEdicoesComputed ??= Computed<int>(
    () => super.totalEdicoes,
    name: '_HomeStoreBase.totalEdicoes',
  )).value;
  Computed<int>? _$totalCaracteresComputed;

  @override
  int get totalCaracteres => (_$totalCaracteresComputed ??= Computed<int>(
    () => super.totalCaracteres,
    name: '_HomeStoreBase.totalCaracteres',
  )).value;

  late final _$tasksAtom = Atom(name: '_HomeStoreBase.tasks', context: context);

  @override
  ObservableList<TaskEntity> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskEntity> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$inputTextAtom = Atom(
    name: '_HomeStoreBase.inputText',
    context: context,
  );

  @override
  String get inputText {
    _$inputTextAtom.reportRead();
    return super.inputText;
  }

  @override
  set inputText(String value) {
    _$inputTextAtom.reportWrite(value, super.inputText, () {
      super.inputText = value;
    });
  }

  late final _$isEditingAtom = Atom(
    name: '_HomeStoreBase.isEditing',
    context: context,
  );

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$editingIdAtom = Atom(
    name: '_HomeStoreBase.editingId',
    context: context,
  );

  @override
  int get editingId {
    _$editingIdAtom.reportRead();
    return super.editingId;
  }

  @override
  set editingId(int value) {
    _$editingIdAtom.reportWrite(value, super.editingId, () {
      super.editingId = value;
    });
  }

  late final _$loadtasksAsyncAction = AsyncAction(
    '_HomeStoreBase.loadtasks',
    context: context,
  );

  @override
  ObservableFuture<void> loadtasks() {
    return ObservableFuture<void>(
      _$loadtasksAsyncAction.run(() => super.loadtasks()),
    );
  }

  late final _$addTaskAsyncAction = AsyncAction(
    '_HomeStoreBase.addTask',
    context: context,
  );

  @override
  Future<void> addTask() {
    return _$addTaskAsyncAction.run(() => super.addTask());
  }

  late final _$confirmEditTaskAsyncAction = AsyncAction(
    '_HomeStoreBase.confirmEditTask',
    context: context,
  );

  @override
  Future<void> confirmEditTask() {
    return _$confirmEditTaskAsyncAction.run(() => super.confirmEditTask());
  }

  late final _$removeTaskAsyncAction = AsyncAction(
    '_HomeStoreBase.removeTask',
    context: context,
  );

  @override
  Future<void> removeTask(int id) {
    return _$removeTaskAsyncAction.run(() => super.removeTask(id));
  }

  late final _$_HomeStoreBaseActionController = ActionController(
    name: '_HomeStoreBase',
    context: context,
  );

  @override
  void setInput(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.setInput',
    );
    try {
      return super.setInput(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startEditTask(TaskEntity entity) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.startEditTask',
    );
    try {
      return super.startEditTask(entity);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
inputText: ${inputText},
isEditing: ${isEditing},
editingId: ${editingId},
porcentagemTotalLetrasNumeros: ${porcentagemTotalLetrasNumeros},
totalLinhas: ${totalLinhas},
totalEdicoes: ${totalEdicoes},
totalCaracteres: ${totalCaracteres}
    ''';
  }
}
