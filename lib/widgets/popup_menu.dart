import 'package:flutter/material.dart';

import '../models/Task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback removeOrDeleteCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopupMenu({
    Key? key,
    required this.task,
    required this.likeOrDislikeCallback,
    required this.removeOrDeleteCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDelete == false
            ? ((context) => [
                  PopupMenuItem(
                    onTap: null,
                    child: TextButton.icon(
                      onPressed: editTaskCallback,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: likeOrDislikeCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove),
                      label: task.isFavorite == false
                          ? const Text('Add to \nBookmarks')
                          : const Text('Remove from \nBookmarks'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: removeOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    onTap: restoreTaskCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: removeOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever'),
                    ),
                  )
                ]);
  }
}
