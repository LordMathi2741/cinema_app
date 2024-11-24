abstract class BaseRepository<TEntity> {

  Future<int> insert(TEntity dataToInsert);
  Future<List<TEntity>?> getAll();
  Future<TEntity?> getById(int id);
  Future<int> update(int id, TEntity newElement);
  Future<int> delete(int id);
}