//class for table user
class User{
  static const tblUser = 'user';
  static const colId = 'id';
  static const colName = 'name';
  static const colCreatedAt = 'created_at';

  late int? id;
  late String? name;
  late String? createdAt;

  User({this.id, this.name, this.createdAt});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      colId: id,
      colName: name,
      colCreatedAt: createdAt
    };
    return map;
  }

  User.fromMap(Map<dynamic, dynamic> map){
    id = map[colId];
    name = map[colName];
    createdAt = map[colCreatedAt];
  }
}