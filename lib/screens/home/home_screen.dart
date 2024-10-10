import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/app_widget.dart';
import 'package:to_do_app/components/button_text.dart';
import 'package:to_do_app/components/custom_button.dart';
import 'package:to_do_app/screens/home/home_notifier.dart';
import 'package:to_do_app/utils/get_size.dart';
import 'package:to_do_app/utils/spacing_extension.dart';

import '../../model/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeNotifier>(context, listen: false).getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, notifier, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              'Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // backgroundColor: Colors.blue.shade50,
          body: AppWidget(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    (10.0).height,
                    // HomeAppBar(notifier: notifier),
                    Expanded(
                      child: notifier.tasksList.isEmpty
                          ? const Center(
                              child: Text(
                                'No Tasks Found!!',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: notifier.tasksList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                Task task = notifier.tasksList[index];
                                return Dismissible(
                                  key: UniqueKey(), // Unique key for each item
                                  onDismissed: (direction) async {
                                    notifier.tasksList.removeWhere(
                                        (element) => element.id == task.id);
                                  },
                                  background: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: getWidth(context) * 0.1),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 10,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              task.title,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              task.description,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () async {
                                            notifier.openAddTaskSheet(
                                              context: context,
                                              task: task,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.edit_rounded,
                                          ),
                                        ),
                                        Checkbox(
                                            value: task.isCompleted,
                                            onChanged: (value) {
                                              notifier.updateTask(task);
                                            }),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    CustomButton(
                      onTap: () async {
                        notifier.openAddTaskSheet(context: context);
                      },
                      width: getWidth(context),
                      widget: buttonText(
                        text: "Add new task +",
                      ),
                    ),
                    (getHeight(context) * 0.04).height,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
