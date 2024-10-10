import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/api/api_files/tasks_api.dart';
import 'package:to_do_app/screens/home/widgets/add_task.dart';

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

  editTask(Task task) async {
    await editTaskAPI(task)
        .whenComplete(() => getAllTasks());
  }

  deleteTask(Task task) async {
    await deleteTaskAPI(task.id).whenComplete(() => getAllTasks());
  }

  Future openAddTaskSheet({required BuildContext context, Task? task,}) async{
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
      ),
      backgroundColor: Colors.white,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      enableDrag: true,
      isDismissible: true,
      builder: (context) {
        return AddTask(task: task,);
      },
    );
  }

}
