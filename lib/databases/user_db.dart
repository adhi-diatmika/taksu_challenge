import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:test_taksu/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class UserDB{
  static const _databaseName = 'User.db';
  static const _databaseVersion = 1;

  UserDB._();
  static final UserDB instance = UserDB._();

  Database? _database;

  _onCreateDB(Database db, int version) async {
    await db.execute(
        '''
        CREATE TABLE ${User.tblUser}(
          ${User.colId} INTEGER PRIMARY KEY,
          ${User.colName} TEXT NOT NULL UNIQUE,
          ${User.colCreatedAt} INT NOT NULL
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

  Future insertUser(User user) async{
    Database? db = await database;
    List<Map> users = await db!.query(
        User.tblUser,
        where: '${User.colName}=?',
        whereArgs: [user.name]
    );

    if(users.isEmpty){
      return await db.insert(User.tblUser, user.toMap()).then((value) => print('object'));
    }else{
      return print('te');
    }
    // return await db.insert(User.tblUser, user.toMap());
  }

  Future<List<User>> fetchUser({String? name}) async{
    Database? db = await database;
    List<Map> users = await db!.rawQuery('SELECT * FROM ${User.tblUser} WHERE ${User.colName}=?', [name]);
    return users.isEmpty ? [] : users.map((e) => User.fromMap(e)).toList();
  }

  Future<int> deleteUser() async{
    Database? db = await database;
    return await db!.delete(User.tblUser);
  }
}