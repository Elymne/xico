abstract class AbstractRepository<T> {
  Future<List<T>> read(String keyword);
  Future<T> write(T keyword);
  Future<List<T>> update(String keyword);
  Future<List<T>> delete(String keyword);
}
