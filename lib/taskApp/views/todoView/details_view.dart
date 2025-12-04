import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_target_sistemas/taskApp/core/styles/text_style_custom.dart';
import 'package:teste_target_sistemas/taskApp/core/widgets/grafico_view.dart';
import 'package:teste_target_sistemas/taskApp/stores/home_store.dart';

class DetalhesView extends StatelessWidget {
  final HomeStore store;

  const DetalhesView({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close, size: 28),
                          ),
                        ),
                        const Text(
                          "Detalhes",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Observer(
                builder: (_) => Column(
                  children: [
                    Text(
                      "Quantidade total de linhas: ${store.totalLinhas}",
                      style: const TextStyle().textLargerCustom(
                        cor: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Quantidade total de edições: ${store.totalEdicoes}",
                      style: const TextStyle().textLargerCustom(
                        cor: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total de caracteres: ${store.totalCaracteres}",
                      style: const TextStyle().textLargerCustom(
                        cor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Observer(
                builder: (_) {
                  final dados = store.porcentagemTotalLetrasNumeros;
                  final letras = dados["letras"]!;
                  final numeros = dados["numeros"]!;

                  return Column(
                    children: [
                      const Text(
                        "Análise de Conteúdo",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${letras.toStringAsFixed(0)}%",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade900,
                                ),
                              ),
                              const Text("Letras"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${numeros.toStringAsFixed(0)}%",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              const Text("Números"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GraficoView(letras: letras, numeros: numeros),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
