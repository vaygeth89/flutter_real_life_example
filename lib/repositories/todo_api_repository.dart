import 'package:dio/dio.dart';
import 'package:flutter_example/interfaces/todo_repository.dart';
import 'package:flutter_example/models/todo.dart';
import 'package:retrofit/retrofit.dart';

part 'todo_api_repository.g.dart';

//!Note class responsible for the doing the API calls
@RestApi()
abstract class TodoApiRepository implements TodoRepository {
  factory TodoApiRepository(Dio dio) = _TodoApiRepository;
  @override
  @GET("/")
  Future<List<Todo>> getTodos();

  @override
  @GET("")
  Future<List<Todo>> getTodoById(@Query("id") int id);

  @override
  @POST("")
  Future<Todo> add(@Body() Todo todo);

  @override
  @PUT("/{id}")
  Future<void> update(@Path("id") int id, Todo todo);

  @override
  @DELETE("/{id}")
  Future<void> delete(@Path("id") int id, Todo todo);
}
