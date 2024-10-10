import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constant/app_constant.dart';
import 'package:to_do_app/screens/home/home_notifier.dart';
import 'package:to_do_app/utils/spacing_extension.dart';

import '../../../components/button_text.dart';
import '../../../components/custom_button.dart';
import '../../../components/text_form_field_decoration.dart';
import '../../../model/task_model.dart';
import '../../../utils/get_size.dart';

class AddTask extends StatelessWidget {
  final Task? task;
  AddTask({this.task, super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController assigneeIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(task != null) {
      titleController.text = task!.title;
      descriptionController.text = task!.description;
      assigneeIdController.text = task!.assigneeId;
    }
    return Consumer<HomeNotifier>(
      builder: (context, notifier, child) {
        return SizedBox(
          height: getHeight(context) * 0.9,
          width: getWidth(context),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  (36.0).height,
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  (6.0).height,
                  TextFormField(
                    controller: titleController,
                    decoration:
                        textFormFieldInputDecoration(context: context).copyWith(
                      hintText: 'Title',
                    ),
                  ),
                  (20.0).height,
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  (6.0).height,
                  TextFormField(
                    controller: descriptionController,
                    decoration:
                        textFormFieldInputDecoration(context: context).copyWith(
                      hintText: 'Description',
                    ),
                  ),
                  (20.0).height,
                  const Text(
                    "Assignee Id (Optional)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  (6.0).height,
                  TextFormField(
                    controller: assigneeIdController,
                    decoration:
                    textFormFieldInputDecoration(context: context).copyWith(
                      hintText: 'Assignee Id',
                    ),
                  ),
                  (getHeight(context) * 0.07).height,
                  Center(
                    child: CustomButton(
                      onTap: () async {
                        if (titleController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Enter title!!',
                              ),
                            ),
                          );
                          return;
                        }

                        if (descriptionController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Enter description!!',
                              ),
                            ),
                          );
                          return;
                        }

                        Task addTask = Task(
                          id: task == null ? '' : task!.id,
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false,
                          creatorId: AppConstant.uid,
                          assigneeId: assigneeIdController.text.trim()
                        );

                        if(task == null) {
                          await notifier.addTask(addTask).whenComplete(() {
                            Navigator.pop(context);
                          });
                        } else {
                          await notifier.editTask(addTask).whenComplete(() {
                            Navigator.pop(context);
                          });
                        }
                      },
                      widget: buttonText(
                        text: "Save",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
