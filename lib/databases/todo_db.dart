import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_taksu/models/todo.dart';
import 'package:path/path.dart';

class TodoDB{
  static const _databaseName = 'Todo.db';
  static const _databaseVersion = 1;

  TodoDB._();
  static final TodoDB instance = TodoDB._();

  Database? _database;

  _onCreateDB(Database db, int version) async {
    await db.execute(
        '''
        CREATE TABLE ${Todo.tblTodo}(
          ${Todo.colId} INTEGER PRIMARY KEY,
          ${Todo.colUserId} INT NOT NULL,
          ${Todo.colTitle} TEXT NOT NULL,
          ${Todo.colStatus} TEXT NOT NULL,
          ${Todo.colDueDate} TEXT NOT NULL,
          ${Todo.colCreatedAt} TEXT NOT NULL
        )
        '''
    );
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath, version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<int> insertTodo(Todo todo) async{
    Database? db = await database;
    return await db!.insert(Todo.tblTodo, todo.toMap());
  }

  Future<List<Todo>> fetchTodo({int? userId}) async{
    Database? db = await database;
    List<Map> todos = await db!.rawQuery('SELECT * FROM ${Todo.tblTodo} WHERE ${Todo.colUserId}=?', [userId]);
    return todos.isEmpty ? [] : todos.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int> deleteCart(int id) async{
    Database? db = await database;
    return await db!.delete(Todo.tblTodo,
        where: '${Todo.colId}=?', whereArgs: [id]
    );
  }
}