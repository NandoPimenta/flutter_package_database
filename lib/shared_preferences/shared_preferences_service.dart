import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../database_service.dart';

class SharedPreferencesService extends DatabaseService {
  late SharedPreferences db;

  SharedPreferencesService(){
    init();
  }

  @override
  Future<void> init() async {
    db = await SharedPreferences.getInstance();
  }

  @override
  Future delete($table, {$collumn = '', $key = ''}) async {
    await db.remove($table);
  }

  @override
  Future deleteAll() async {
    try {
      await db.clear();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future dropDb() {
    throw UnimplementedError();
  }

  @override
  Future getAll($table) async{
    var data = (db.get($table) ?? "[]") as String;
    return json.decode(data);
  }

  @override
  Future save($table, $value) async {
    db.setString($table, json.encode($value));
  }

  @override
  Future saveBool($table, $value) async {
    db.setBool($table, $value);
  }

  @override
  Future saveString($table, $value) async {
    db.setString($table, $value);
  }

  @override
  Future saveAll($table, $list) {
    throw UnimplementedError();
  }

  @override
  Future getOne($table, $query) async {
    return  db.get($table);
  }

  @override
  Future getBool($table) async {
    await init();
    var resp = (db.getBool($table) ?? false);
    return resp;
  }

  @override
  Future getString($table) async {
    return (db.getString($table) ?? '');
  }

  @override
  Future getInt($table) async {
    return (db.getInt($table) ?? 0);
  }

  @override
  Future saveInt($table, $value) async {
    db.setInt($table, $value);
  }
}
