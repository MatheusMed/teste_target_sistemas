import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_target_sistemas/taskApp/core/extensions/snack_bar_extensions.dart';
import 'package:teste_target_sistemas/taskApp/core/widgets/text_form_custom.dart';
import 'package:teste_target_sistemas/taskApp/model/task_entity.dart';
import 'package:teste_target_sistemas/taskApp/stores/home_store.dart';
import 'package:teste_target_sistemas/taskApp/views/todoView/details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final store = GetIt.I.get<HomeStore>();

  final TextEditingController _textController = TextEditingController();
  final _keyHome = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    store.loadtasks();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _keyHome,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Atividades",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye,
                      size: 28,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetalhesView(store: store),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Observer(
                    builder: (_) {
                      return ListView.builder(
                        itemCount: store.tasks.length,
                        itemBuilder: (_, index) {
                          final TaskEntity item = store.tasks[index];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.informacao!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                IconButton(
                                  icon: const Icon(Icons.edit, size: 20),
                                  onPressed: () {
                                    store.startEditTask(item);
                                  },
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                  onPressed: () {
                                    store.removeTask(item.id);
                                    context.snackBar(
                                      backgroundColor: Colors.red,
                                      content:
                                          "Atividade Deletada com Sucesso!!",
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Observer(
                builder: (_) {
                  if (_textController.text != store.inputText) {
                    _textController.value = _textController.value.copyWith(
                      text: store.inputText,
                      selection: TextSelection.collapsed(
                        offset: store.inputText.length,
                      ),
                    );
                  }

                  return TextFormCustom(
                    labelText: "Digite sua atividade",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'A atividade não pode ser vazia.';
                      }
                      return null;
                    },
                    controller: _textController,
                    onChanged: (value) {
                      store.setInput(value);
                    },
                  );
                },
              ),

              const SizedBox(height: 20),
              Observer(
                builder: (_) => SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_keyHome.currentState!.validate()) {
                        if (store.isEditing) {
                          store.confirmEditTask();
                          context.snackBar(
                            backgroundColor: Color(0xffff8c42),
                            content: "Atividade Alterada com Sucesso!!",
                          );
                        } else {
                          store.addTask();

                          context.snackBar(
                            backgroundColor: Colors.green,
                            content: "Atividade Criada com Sucesso!!",
                          );
                        }

                        _textController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      store.isEditing ? "Atualizar" : "Adicionar",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
