// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:tasks_mobile/main.dart';
import 'package:tasks_mobile/model/response_function.dart';
import 'package:tasks_mobile/model/task.dart';
import 'package:tasks_mobile/model/user.dart';
import 'package:tasks_mobile/utils/dio_config.dart';
part 'utils.g.dart';

class Utils = UtilsBase with _$Utils;

abstract class UtilsBase with Store {
  @observable
  int indexPage = 0;

  @action
  setIndexPage(int i) {
    indexPage = i;
  }

  @observable
  bool loading = false;

  @action
  setLoading(bool v) {
    loading = v;
  }

  @observable
  int indexPageLogin = 0;

  @action
  setIndexPageLogin(int v) {
    indexPageLogin = v;
  }

  //validador form
  @observable
  String messageEmailValida = '';

  @action
  setMessageEmailValida(v) {
    messageEmailValida = v;
  }

  @observable
  bool seePassword = false;

  @action
  setSeePassword(bool v) {
    seePassword = v;
  }

  @observable
  bool seePasswordConfimartion = false;

  @action
  setSeePasswordConfimartion(bool v) {
    seePasswordConfimartion = v;
  }

  @observable
  bool formLogin = true;

  @action
  setformLogin(bool v) {
    formLogin = v;
  }

  @action
  login({String? email, String? password}) async {
    try {
      var data = {
        'email': email,
        'password': password,
      };
      Response? res =
          await (await dioInstance()).post("/users/login", data: data);
      await sharedPreferences?.setString('token', res.data['token']);
      getMe();

      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      return response;
    } catch (e) {
      loading = false;
      String message =
          "Algo deu errado. Verifique o campo digitado e tente novamente.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @action
  register(
      {String? name,
      String? email,
      String? password,
      String? passwordConfirmation}) async {
    try {
      var data = {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };

      Response? res =
          await (await dioInstance()).post("/users/register", data: data);
      await sharedPreferences?.setString('token', res.data['token']);
      getMe();

      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      return response;
    } catch (e) {
      loading = false;
      String message = "Aconteceu algum erro. Tente novamente mais tarde.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @observable
  User user = User();

  @action
  setUser(u) {
    user = u;
  }

  @action
  getMe() async {
    try {
      Response? res = await (await dioInstance()).get("/users/user");
      User u = User.fromJson(res.data['data'] ?? {});
      setUser(u);
      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      return response;
    } catch (e) {
      loading = false;
      String message =
          "Algo deu errado. Verifique o campo digitado e tente novamente.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @observable
  Task? task;

  final tasks = ObservableList<Task>.of([]);

  @action
  setTask(p) {
    task = p;
  }

  @action
  getTasks() async {
    try {
      Response? res = await (await dioInstance()).get("/tasks/all");
      tasks.clear();
      res.data['tasks'].forEach((i) {
        Task p = Task.fromJson(i ?? {});
        if (p.id != null) {
          int index = tasks.indexWhere((element) => element.id == p.id);
          if (index == -1) {
            tasks.add(p);
          } else {
            tasks.removeAt(index);
            tasks.insert(index, p);
          }
        }
      });

      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      return response;
    } catch (e) {
      loading = false;
      String message =
          "Algo deu errado. Verifique o campo digitado e tente novamente.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @action
  create(
      {String? name,
      String? description,
      String? deadline,
      String? status,
      String? priority,
      String? tag}) async {
    try {
      int priorityNumber;
      switch (priority) {
        case 'Baixa':
          priorityNumber = 0;
          break;
        case 'Média':
          priorityNumber = 1;
          break;
        case 'Alta':
          priorityNumber = 2;
          break;
        default:
          priorityNumber = 0;
          break;
      }
      var data = {
        'user_id': user.id,
        'name': name,
        'description': description,
        'deadline': deadline ?? '',
        'status': status,
        'priority': priorityNumber,
        'tag': tag,
      };
      Response? res =
          await (await dioInstance()).post("/tasks/task/create", data: data);
      await getTasks();
      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      response.message = res.data['responseData']['task']['id'].toString();
      return response;
    } catch (e) {
      loading = false;
      String message = "Aconteceu algum erro. Tente novamente mais tarde.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @observable
  int idTask = 0;

  @action
  setidTask(int id) {
    idTask = id;
  }

  @observable
  int idTaskDelete = 0;

  @action
  setidTaskDelete(int id) {
    idTaskDelete = id;
  }

  @action
  deleteTask() async {
    try {
      var data = {
        'id': idTaskDelete,
      };

      await (await dioInstance()).delete("/tasks/task/delete", data: data);
      getTasks();
      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      return response;
    } catch (e) {
      loading = false;
      String message = "Aconteceu algum erro. Tente novamente mais tarde.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @observable
  bool edit = false;

  @action
  setEdit(bool v) {
    edit = v;
  }

  @observable
  int idTaskEdit = 0;

  @action
  setidTaskEdit(int id) {
    idTaskEdit = id;
  }

  @action
  update(
      {String? name,
      String? description,
      String? deadline,
      String? status,
      String? priority,
      String? tag}) async {
    try {
      int priorityNumber;
      switch (priority) {
        case 'Baixa':
          priorityNumber = 0;
          break;
        case 'Média':
          priorityNumber = 1;
          break;
        case 'Alta':
          priorityNumber = 2;
          break;
        default:
          priorityNumber = 0;
          break;
      }
      var data = {
        'user_id': user.id,
        'name': name,
        'description': description,
        'deadline': deadline,
        'status': status,
        'priority': priorityNumber,
        'tag': tag,
      };
      Response? res = await (await dioInstance())
          .put("/tasks/task/$idTaskEdit/update", data: data);
      getTasks();
      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      response.message = res.data['task']['id'].toString();
      return response;
    } catch (e) {
      loading = false;
      String message = "Aconteceu algum erro. Tente novamente mais tarde.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @action
  showTask() async {
    try {
      var data = {
        'id': idTask,
      };
      await (await dioInstance()).get("/tasks/task/$idTask", data: data);

      ResponseFunction response = ResponseFunction();
      loading = false;
      response.success = true;
      return response;
    } catch (e) {
      loading = false;
      String message = "Aconteceu algum erro. Tente novamente mais tarde.";
      if (e is DioError) {
        if (e.response?.data != null) {
          if (e.response?.data['message'] != null) {
            message = e.response?.data['message'];
          } else {
            message = e.response?.data;
          }
        }
      }
      ResponseFunction response = ResponseFunction();
      response.success = false;
      response.message = message;
      return response;
    }
  }

  @observable
  int index = 0;

  @action
  setIndex(int id) {
    index = id;
  }
}
