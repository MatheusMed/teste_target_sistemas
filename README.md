🎯 Target Sistemas Task App

Este é um projeto de aplicação Flutter para gerenciamento de atividades (Tasks) que utiliza a arquitetura MobX para gerenciamento de estado e o Sqflite para persistência local de dados.

⚙️ Estrutura do Projeto

O projeto segue uma estrutura modular e organizada, focada na separação de responsabilidades (Clean Architecture ou similar):

lib/
├── taskApp/
│   ├── core/      # Componentes essenciais e utilitários
│   │   ├── dao/   # Camada de Acesso a Dados (Sqflite)
│   │   ├── extensions/ # Métodos de extensão
│   │   ├── styles/  # Estilos e temas customizados
│   │   └── widgets/ # Widgets reutilizáveis (Ex: TextFormCustom)
│   ├── model/     # Definição dos modelos de dados (Ex: TaskEntity)
│   ├── stores/    # Gerenciamento de Estado MobX (Ex: HomeStore)
│   ├── views/     # Camada de Apresentação (Telas/Widgets)
│   └── main.dart
└── main.dart


core/dao: Contém a lógica de comunicação com o banco de dados Sqflite, responsável por CRUD (Criar, Ler, Atualizar, Deletar) das tarefas.

model: Contém a classe TaskEntity, que representa a tabela de tarefas no banco de dados.

stores: Contém as classes HomeStore, que gerenciam o estado da aplicação e a comunicação com o dao.

views: Contém as telas principais do aplicativo (HomeView, DetalhesView).

💾 Persistência de Dados (Sqflite)

O aplicativo utiliza o Sqflite para armazenar dados de forma local no dispositivo do usuário.

Onde os dados são salvos:

Atividades (Tasks): Todas as tarefas criadas, editadas e deletadas são persistidas localmente.

Dados do Usuário: O sistema pode utilizar o banco de dados local para armazenar informações de login ou outras preferências do usuário, dependendo da implementação completa do LoginView.

🚀 Como Rodar o Projeto

Siga os passos abaixo para configurar e iniciar o aplicativo.

1. Obtenha as Dependências

Primeiro, você deve garantir que todas as dependências listadas no pubspec.yaml estejam instaladas:

flutter pub get


2. Gere os Arquivos MobX (.g files)

Este projeto utiliza o MobX para gerenciamento de estado. O MobX requer a geração de arquivos *.g.dart (chamados de code generation) para implementar o código observável (@observable, @action, @computed).

Você deve rodar o seguinte comando para gerar esses arquivos. Sempre execute este comando quando houver alterações nas suas classes Store (.dart):

flutter pub run build_runner build --delete-conflicting-outputs


💡 Dica: O argumento --delete-conflicting-outputs é crucial para limpar arquivos antigos e garantir que a geração seja bem-sucedida.

3. Inicie o Aplicativo

Após gerar os arquivos, você pode iniciar a aplicação em qualquer dispositivo ou simulador conectado:

flutter run
