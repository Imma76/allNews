


class Todo {
  final String countryName;
  final String code;

  Todo(this.code, this.countryName);
}
final todos = List<Todo>.generate(
  20,
      (i) => Todo(
    'Todo $i',
    'A description of what needs to be done for Todo $i',
  ),
);
