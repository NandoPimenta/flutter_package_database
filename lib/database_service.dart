
abstract class DatabaseService {
  Future init();

  Future getOne($table, $query);

  Future getBool($table);

  Future getString($table);

  Future getAll($table);

  Future save($table, $value);
  
  Future saveBool($table, $value);
  
  Future saveString($table, $value);

  Future saveAll($table, $list);

  Future delete($table, {$collumn =''  , $key=''});

  Future deleteAll();

  Future dropDb();

  Future getInt($table);

  Future saveInt($table, $value);
}
