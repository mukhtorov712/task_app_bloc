import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final String date;
  bool? isDone;
  bool? isDelete;
  bool? isFavorite;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isDone,
    this.isDelete,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    bool? isDone,
    bool? isDelete,
    bool? isFavorite,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: title ?? this.description,
        date: title ?? this.date,
        isDone: isDone ?? this.isDone,
        isDelete: isDelete ?? this.isDelete,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
      'isDelete': isDelete,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      isDone: map['isDone'],
      isDelete: map['isDelete'],
      isFavorite: map['isFavorite'],
    );
  }

  @override
  List<Object?> get props =>
      [id, title, description, date, isDone, isDelete, isFavorite];
}
