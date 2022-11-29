import 'package:flutter/material.dart';
import 'package:task_app_bloc/models/Task.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.favoriteTasks.length} tasks',
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
