import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const Todo._();

  factory Todo({
    required int key,
    required String title,
    required String registeredDateTime,
    @Default('') String achievedDateTime,
  }) = _Todo;

  @override
  bool operator ==(covariant Todo other) => key == other.key;

  @override
  int get hashCode => key;
}
