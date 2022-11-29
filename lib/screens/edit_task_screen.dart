import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/Task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;

  const EditTaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = Task(
                    id: oldTask.id,
                    title: titleController.text,
                    description: descriptionController.text,
                    isDelete: oldTask.isDelete,
                    isDone: oldTask.isDone,
                    isFavorite: oldTask.isFavorite,
                    date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(EditTask(oldTask: oldTask, newTask: editedTask));
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
