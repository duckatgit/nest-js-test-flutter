import 'package:flutter/cupertino.dart';
import 'package:to_do_app/api/api_files/tasks_api.dart';

import '../../model/task_model.dart';

class HomeNotifier with ChangeNotifier {
  List<Task> tasksList = [];

  getAllTasks() {
    getTasksAPI().then((value) {
      tasksList = [];
      tasksList = value;
    }).whenComplete(() {
      notifyListeners();
    });
  }

  updateTask(Task task) async {
    await updateTaskAPI(task.id, !task.isCompleted)
        .whenComplete(() => getAllTasks());
  }

  addTask(Task task) async {
    await addTaskAPI(task).whenComplete(() => getAllTasks());
  }

  deleteTask(Task task) async {
    await deleteTaskAPI(task.id).whenComplete(() => getAllTasks());
  }
}
