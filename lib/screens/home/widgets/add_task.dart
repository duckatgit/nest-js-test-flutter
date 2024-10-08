import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/home/home_notifier.dart';
import 'package:to_do_app/utils/spacing_extension.dart';

import '../../../components/button_text.dart';
import '../../../components/custom_button.dart';
import '../../../components/text_form_field_decoration.dart';
import '../../../model/task_model.dart';
import '../../../utils/get_size.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, notifier, child) {
        return SizedBox(
          height: getHeight(context) * 0.8,
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

                        Task task = Task(
                          id: '',
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false,
                        );

                        await notifier.addTask(task).whenComplete(() {
                          Navigator.pop(context);
                        });
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
