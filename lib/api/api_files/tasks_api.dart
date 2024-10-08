import 'dart:convert';
import 'dart:developer';

import 'package:to_do_app/api/api_handler/api_handler.dart';
import 'package:to_do_app/api/api_urls/api_urls.dart';
import 'package:to_do_app/model/task_model.dart';

Future<List<Task>> getTasksAPI() async {
  List<Task> list = [];

  try {
    var response = await ApiHandler().get(url: ApiUrl.tasks);
    var data = jsonDecode(response);

    for (var task in data) {
      list.add(Task.fromJson(task));
    }
    log("task list: ${list.length}");
  } catch (e) {
    list = [];
    log('Error: $e');
  }

  return list;
}

Future addTaskAPI(Task task) async {
  try {
    final params = {
      "title": task.title,
      "description": task.description,
      "completed": false
    };
    var response = await ApiHandler().post(
      url: ApiUrl.tasks,
      queryParameters: params,
    );
    var data = jsonDecode(response);
    log("data: $data");
  } catch (e) {
    log('Error: $e');
  }
}

Future updateTaskAPI(String id, bool status) async {
  try {
    final params = {
      "completed": status,
    };
    var response = await ApiHandler().patch(
      url: "${ApiUrl.tasks}/$id",
      queryParameters: params,
    );
    var data = jsonDecode(response);
    log("data: $data");
  } catch (e) {
    log('Error: $e');
  }
}

Future deleteTaskAPI(String id) async {
  try {
    var response = await ApiHandler().delete(
      url: "${ApiUrl.tasks}/$id",
    );
    var data = jsonDecode(response);
    log("data: $data");
  } catch (e) {
    log('Error: $e');
  }
}
