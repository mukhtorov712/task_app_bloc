import 'package:flutter/material.dart';
import 'package:task_app_bloc/models/Task.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.completedTasks.length} tasks',
                ),
              ),
            ),
            TasksList(taskList: tasksList),
          ],
        );
      },
    );
  }
}
