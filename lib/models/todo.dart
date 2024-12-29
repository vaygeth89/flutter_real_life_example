import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(name: 'userId')
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    this.completed = false,
  });

  @override
  Map<String, dynamic> toJson() => _$TodoToJson(this);

  factory Todo.fromJson(Map<String, dynamic> map) => _$TodoFromJson(map);
}
