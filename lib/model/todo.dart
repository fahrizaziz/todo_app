class Todo {
  final String id;
  final String title;
  final String desc;
  bool isCompleted;
  Todo({
    required this.id,
    required this.desc,
    required this.title,
    this.isCompleted = false,
  });
}

List<Todo> dataTodo = [
  Todo(
    id: DateTime.now().toString(),
    desc: 'Tugas Kuliah',
    title: 'Mengerjakan tugas',
  ),
  Todo(
    id: DateTime.now().toString(),
    desc: 'Memasak Ikan',
    title: 'Memasak',
  ),
];
