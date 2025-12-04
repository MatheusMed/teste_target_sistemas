# 📌 Aplicação Flutter - Task App

Este projeto foi desenvolvido utilizando **Flutter**, integrando **MobX** para gerenciamento de estado e **Sqflite** para armazenamento local.

---

## 🚀 Tecnologias Utilizadas

- **Flutter**
- **MobX**
- **Sqflite** (persistência local)
- **SQLite**
- **Build Runner**

---

## 📦 Dependências principais

Certifique-se de que as seguintes dependências estejam no `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  mobx: ^2.0.0
  flutter_mobx: ^2.0.0
  sqflite: ^2.0.0+4
  path: ^1.8.0
  path_provider: ^2.0.0

dev_dependencies:
  mobx_codegen: ^2.0.0
  build_runner: ^2.3.0
```

---

## ⚙️ Configuração Inicial

Antes de executar o projeto, rode o comando:

```bash
flutter pub get
```

Este comando irá baixar todas as dependências necessárias.

---

## 🔨 Gerando Arquivos .g do MobX

O MobX exige geração automática de código, então execute:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Sempre que alterar stores, rode novamente este comando.

Caso queira assistir alterações em tempo real, use:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

---

## 🗄️ Banco de Dados

O app utiliza **Sqflite** para salvar os dados localmente.

- Todas as tarefas criadas são armazenadas no SQLite.
- Informações persistem mesmo ao fechar o aplicativo.
- Geração de tabela automática no primeiro uso.

---

## ▶️ Execução da Aplicação

Após instalar dependências e gerar arquivos MobX, basta rodar:

```bash
flutter run
```

---

## 📁 Estrutura do Projeto

```bash
lib/
 ├─ core/
 │   └─ dao/            # Acesso ao banco de dados (Sqflite)
 │
 ├─ model/
 │   └─ task_entity.dart
 │
 ├─ stores/
 │   └─ home_store.dart # Store principal com MobX
 │
 ├─ views/
 │   └─ detalhes_view.dart
 │
 └─ widgets/
     └─ grafico_view.dart
```

---

## ✔️ Observações

- Sempre rode o build_runner após alterações no store.
- Caso erro de colisão de arquivos apareça, utilize `--delete-conflicting-outputs`.
- O banco de dados é criado automaticamente com Sqflite.

---

## 💡 Dica

Caso o app falhe com erro `no column named`, lembre-se de **incrementar versão no `onUpgrade`** ou **desinstalar o app** para limpar o DB.

---

## 📞 Suporte

Se precisar de melhorias ou dúvidas, entre em contato.
