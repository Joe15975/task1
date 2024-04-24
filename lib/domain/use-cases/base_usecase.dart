
abstract class FutureBaseUseCase<T> {
  Future<T> execute();
}

abstract class BaseUseCase<T> {
  T execute();
}