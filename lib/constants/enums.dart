enum TaskPriority {
  low(0, 'Low'),
  med(1, 'Medium'),
  high(2, 'High');

  final int id;
  final String caption;
  const TaskPriority(this.id, this.caption);
}

enum SortBy {
  name,
  priority,
  dateAdded,
}
