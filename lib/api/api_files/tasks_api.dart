import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/api/api_handler/api_handler.dart';
import 'package:to_do_app/api/api_urls/api_urls.dart';
import 'package:to_do_app/constant/app_constant.dart';
import 'package:to_do_app/model/task_model.dart';

import '../../main.dart';

Future<List<Task>> getTasksAPI() async {
  List<Task> list = [];

  try {
    var response =
        await ApiHandler().get(url: "${ApiUrl.tasks}?uid=${AppConstant.uid}");
    var data = jsonDecode(response);

    for (var task in data) {
      list.add(Task.fromJson(task));
    }
    log("task list: ${list.length}");
  } catch (e) {
    list = [];
    log('Error: $e');
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }

  return list;
}

Future addTaskAPI(Task task) async {
  try {
    final params = {
      "title": task.title,
      "description": task.description,
      "completed": false,
      "creatorId": task.creatorId,
      "assigneeId": task.assigneeId,
    };
    var response = await ApiHandler().post(
      url: ApiUrl.tasks,
      queryParameters: params,
    );
    var data = jsonDecode(response);
    log("data: $data");
  } catch (e) {
    log('Error: $e');
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
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
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }
}

Future editTaskAPI(Task task) async {
  try {
    final params = {
      "title": task.title,
      "description": task.description,
      "completed": task.isCompleted,
      "assigneeId": task.assigneeId,
    };
    var response = await ApiHandler().patch(
      url: "${ApiUrl.tasks}/${task.id}?uid=${AppConstant.uid}",
      queryParameters: params,
    );
    var data = jsonDecode(response);
    log("data: $data");
  } catch (e) {
    log('Error: $e');
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
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
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }
}
