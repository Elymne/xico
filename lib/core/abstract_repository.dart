abstract class AbstractRepository<T, R> {
  Future<List<T>> read(R keyword);
  Future<T> write(T keyword);
  Future<List<T>> update(R keyword);
  Future<List<T>> delete(R keyword);
}
