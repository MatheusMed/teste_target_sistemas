# Target Sistemas Task App

Este é um projeto de aplicação Flutter para gerenciamento de atividades (Tasks) que utiliza a arquitetura MobX para gerenciamento de estado e o Sqflite para persistência local de dados.

---

## Tecnologias Utilizadas

- **Flutter**
- **MobX**
- **Sqflite** (persistência local)
- **SQLite**
- **Build Runner**

## Configuração Inicial

Antes de executar o projeto, rode o comando:

```bash
flutter pub get
```

Este comando irá baixar todas as dependências necessárias.

---

## Gerando Arquivos .g do MobX

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

## Banco de Dados

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

## Estrutura do Projeto

```bash
lib/
├── taskApp/
│   ├── core/
│   │   ├── dao/         # Acesso ao banco de dados (Sqflite)
│   │   ├── extensions/  # Métodos de extensão
│   │   ├── styles/      # Estilos e temas customizados
│   │   └── widgets/     # Widgets reutilizáveis (Ex: TextFormCustom)
│   ├── model/           # Definição dos modelos de dados (Ex: TaskEntity)
│   ├── stores/          # Gerenciamento de Estado MobX (Ex: HomeStore)
│   └── views/           # Camada de Apresentação (Telas/Views)
└── main.dart
```

---

## Observações

- Caso erro de colisão de arquivos apareça, utilize `--delete-conflicting-outputs`.
- O banco de dados é criado automaticamente com Sqflite.

---
