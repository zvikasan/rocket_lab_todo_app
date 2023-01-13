enum TaskPriority {
  low(0),
  med(1),
  high(2);

  final int id;
  const TaskPriority(this.id);
}

enum SortBy {
  name,
  priority,
  dateAdded,
}
