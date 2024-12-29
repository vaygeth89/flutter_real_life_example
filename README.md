# Flutter Real Life Example

## About

### Abstract Classes
Are the interfaces which dictates & enforces class to implement certain behaviour

Examples
* [AuthenticationRepository](lib/interfaces/authentication_repository.dart)
* [TodoRepository](lib/interfaces/todo_repository.dart)

### API Repositories
Are the objects/classes responsible for calling an APIs services

Examples
* [TodoApiRepository](lib/repositories/todo_api_repository.dart)
* [FakeAuthenticationApiRepository](lib/repositories/fake_authentication_api_repository.dart)

## Cubits
Are the classes responsible for doing the business logic, like calling APIs, storing data on phone, calculations...etc

Examples
* [AuthenticationCubit](lib/cubits/authentication_cubit.dart)
  * Login/Sign-in
  * Refresh Token
  * Sign out
* [TodoCubit](lib/cubits/todo_cubit.dart)
  * Get Todos
  * Add Todos
  * Update Todos
  * Delete Todos

## How To Login
To simulate successful login use
* Email: user@example.com
* Password: 123456