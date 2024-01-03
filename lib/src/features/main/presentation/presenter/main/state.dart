import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';

part 'state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    required int todayTodoCnt,
    required int notAchievedTodoCnt,
    required List<Todo> todos,
  }) = _TodoState;

  factory TodoState.empty() => _TodoState(
        todayTodoCnt: 0,
        notAchievedTodoCnt: 0,
        todos: [],
      );
}
