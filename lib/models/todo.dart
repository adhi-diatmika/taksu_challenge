//class for table to do
class Todo{
  static const tblTodo = 'todo';
  static const colId = 'id';
  static const colUserId = 'user_id';
  static const colTitle = 'title';
  static const colStatus = 'status';
  static const colDueDate = 'due_date';
  static const colCreatedAt = 'created_at';

  int? id;
  int? userId;
  String? title;
  String? status;
  String? dueDate;
  String? createdAt;

  Todo({
    this.id,
    this.userId,
    this.title,
    this.status,
    this.dueDate,
    this.createdAt
  });

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      colId: id,
      colUserId: userId,
      colTitle: title,
      colStatus: status,
      colDueDate: dueDate,
      colCreatedAt: createdAt
    };
    return map;
  }

  Todo.fromMap(Map<dynamic, dynamic> map){
    id = map[colId];
    userId = map[colUserId];
    title = map[colTitle];
    status = map[colStatus];
    dueDate = map[colDueDate];
    createdAt = map[colCreatedAt];
  }
}