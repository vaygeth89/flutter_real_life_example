# Flutter Real Life Example

## About

### Abstract Classes
Are the interfaces which dictates & enforces class to implement certain behaviour

Examples
* [lib/interfaces/authentication_repository.dart](AuthenticationRepository)
* [lib/interfaces/todo_repository.dart](TodoRepository)

### API Repositories
Are the objects/classes responsible for calling an APIs services

Examples
* [lib/repositories/todo_api_repository.dart](TodoApiRepository)
* [lib/repositories/fake_authentication_api_repository.dart](FakeAuthenticationApiRepository)

## Cubits
Are the classes responsible for doing the business logic, like calling APIs, storing data on phone, calculations...etc

Examples
* [lib/cubits/authentication_cubit.dart](AuthenticationCubit)
  * Login/Sign-in
  * Refresh Token
  * Sign out
* [lib/cubits/todo_cubit.dart](TodoCubit)
  * Get Todos
  * Add Todos
  * Update Todos
  * Delete Todos