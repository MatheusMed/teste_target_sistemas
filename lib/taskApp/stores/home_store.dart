import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_target_sistemas/taskApp/core/dao/task_dao.dart';
import 'package:teste_target_sistemas/taskApp/model/task_entity.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final dao = GetIt.I.get<TaskDao>();

  @observable
  ObservableList<TaskEntity> tasks = ObservableList<TaskEntity>();

  @observable
  String inputText = '';

  @observable
  bool isEditing = false;

  @observable
  int editingId = -1;

  @action
  Future<void> loadtasks() async {
    final data = await dao.getAll();
    tasks = ObservableList.of(data);
  }

  @action
  void setInput(String value) {
    inputText = value;
  }

  @action
  Future<void> addTask() async {
    if (inputText.isEmpty) return;
    final id = await dao.create(inputText, 0);
    tasks.add(TaskEntity(id: id, informacao: inputText, totalEdit: 0));

    inputText = '';
  }

  @action
  void startEditTask(TaskEntity entity) {
    editingId = entity.id;
    inputText = entity.informacao!;
    isEditing = true;
  }

  @action
  Future<void> confirmEditTask() async {
    if (editingId < 0) return;
    final index = tasks.indexWhere((e) => e.id == editingId);
    if (index == -1) return;
    final oldTask = tasks[index];
    final updated = oldTask.copyWith(
      informacao: inputText,
      totalEdit: oldTask.totalEdit! + 1,
    );
    await dao.update(updated);
    tasks[index] = updated;
    inputText = '';
    editingId = -1;
    isEditing = false;
  }

  @action
  Future<void> removeTask(int id) async {
    await dao.delete(id);
    tasks.removeWhere((e) => e.id == id);
  }

  int contarLinhas(String texto) {
    if (texto.isEmpty) return 0;

    return texto.split('\n').length;
  }

  @computed
  Map<String, double> get porcentagemTotalLetrasNumeros {
    int letrasTotal = 0;
    int numerosTotal = 0;

    for (var task in tasks) {
      if (task.informacao == null) continue;

      for (var c in task.informacao!.split('')) {
        if (RegExp(r'[0-9]').hasMatch(c)) {
          numerosTotal++;
        } else if (RegExp(r'[A-Za-z]').hasMatch(c)) {
          letrasTotal++;
        }
      }
    }

    final totalGeral = (letrasTotal + numerosTotal).toDouble();
    if (totalGeral == 0) return {"letras": 0, "numeros": 0};

    return {
      "letras": (letrasTotal / totalGeral) * 100,
      "numeros": (numerosTotal / totalGeral) * 100,
    };
  }

  @computed
  int get totalLinhas => tasks.fold<int>(0, (sum, item) {
    return sum + contarLinhas(item.informacao!);
  });
  @computed
  int get totalEdicoes =>
      tasks.fold<int>(0, (sum, item) => sum + item.totalEdit!);

  @computed
  int get totalCaracteres =>
      tasks.fold<int>(0, (sum, item) => sum + item.informacao!.length);
}
