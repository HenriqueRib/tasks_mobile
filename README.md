# Aplicativo

**Nome do Aplicativo:** tasks_mobile
**Autor do Aplicativo:** Henrique Ribeiro
**Licença do Aplicativo:** MIT License
**Tecnologia do Aplicativo:** Flutter ^3.13.7

## Descrição

Aplicativo desenvolvido para teste técnico.
Objetivo: integração com API RESTful desenvolvido em laravel.
Arquitetura em MobX para genrenciamento de estado.

## Funcionalidades

- Adicionar terefa
- Editar terefa
- Deletar terefa
- Listar terefas
- Criar usuario
- Autenticação com JWT

## Requisitos

- [Dart: ^3.1.3]
- [Flutter: ^3.13.7]

## Instalação

1. flutter pub get
   [Necessário para baixar dependencias]
2. flutter pub run flutter_native_splash:create
   [Necessário ter splash funcionar]
3. flutter pub run flutter_launcher_icons:main
   [Necessário ter gerar icons para o aplicativo]
4. flutter packages pub run build_runner watch --delete-conflicting-outputs
   [Projeto com arquitetura em MobX. Comando necessário para gerar os códigos, com o objetivo de gerenciar o estado]

## Build Android

1. flutter build appbundle
   [Este gera o app-release.aab que é o arquivo que sobe na google play]

2. flutter build apk --release
   [Este gera o app-release.apk que é o arquivo para testar no aparelho fisico]

## Instalação - ios

1.  cd ios && pod install && cd .. [Necessário ter xcode]

## Uso

## Telas - Login e Cadastro de usuário

<img src="images/_1.png" alt="Login" width="200"/>
<img src="images/_2.png" alt="Cadastro" width="200"/>

## Tela - Home

<img src="images/_3.png" alt="home" width="200"/>

## Tela - Perfil

<img src="images/_4.png" alt="perfil" width="200"/>

## Tela - Sobre a empresa do aplicativo (Informações ficticias sobre a TASKS)

<img src="images/_11.png" alt="Sobre a empresa do aplicativo " width="200"/>

## Tela - Lista de tarefas

<img src="images/_5.png" alt="lista de tarefas" width="200"/>

## Tela - Adicionar tarefa

<img src="images/_12.png" alt="adicionar tarefa" width="200"/>

Tela - Visualizar tarefa

---

<img src="images/_6.png" alt="visualizar tarefa" width="200"/>

## Telas - Listagem de Tarefas - botão deletar tarefa

<img src="images/_7.png" alt="botão deletar tarefa" width="200"/>

## Tela - Listagem de Tarefas - botão visualizar ou editar ou deleter tarefa

<img src="images/_8.png" alt="botão visualizar ou editar ou deleter tarefa" width="200"/>

## Tela - Listagem de Tarefas - Mensagem de sucesso de cadastro de nova tarefa em pop up mais direcionamento para listagem de tarefas

<img src="images/_9.png" alt="Mensagem de sucesso de cadastro de nova tarefa em pop up mais direcionamento para listagem de tarefas" width="200"/>

## Tela - Listagem de Tarefas - Mensagem de sucesso ao de deletar uma tarefa em pop up.

<img src="images/_10.png" alt="Mensagem de sucesso ao de deletar uma tarefa em pop up" width="200"/>

## Licença

Este projeto está licenciado sob a Licença MIT - consulte o arquivo [LICENSE](LICENSE) para obter mais detalhes.

## Contato

Henrique Ribeiro – ribeiro.henriquem@gmail.com

---

_Fique a vontade para entrar em contato atravez do e-mail._
