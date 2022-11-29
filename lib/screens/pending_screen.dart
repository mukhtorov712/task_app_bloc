import 'package:flutter/material.dart';
import 'package:task_app_bloc/models/Task.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed',
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
