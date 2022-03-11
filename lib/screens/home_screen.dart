import 'package:flutter/material.dart';
import 'package:test_taksu/databases/todo_db.dart';
import 'package:test_taksu/models/todo.dart';
import 'package:test_taksu/models/user.dart';
import 'package:test_taksu/screens/forms/add_todo.dart';
import 'package:test_taksu/services/colors.dart';
import 'package:test_taksu/services/helper.dart';
import 'package:test_taksu/services/widget.dart';

class HomeScreen extends StatefulWidget {
  final User? initData;
  const HomeScreen({
    Key? key,
    this.initData
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TodoDB _todoDB;
  Todo todo = Todo();
  List<Todo> todos = [];

  //get to do data
  getTodoData() async{
    List<Todo> listTodos = await _todoDB.fetchTodo(userId: widget.initData!.id!);
    if(mounted){
      setState(() {
        todos = listTodos;
      });
    }
  }
  
  //update to do
  updateTodo(Todo newTodo) async{
    todo.id = newTodo.id;
    todo.userId = newTodo.userId;
    todo.title = newTodo.title;
    todo.status = 'done';
    todo.createdAt = newTodo.createdAt;
    todo.dueDate = newTodo.dueDate;
    
    await _todoDB.updateTodo(todo).then((value) {
      getTodoData();
    });
  }

  //delete to do
  deleteTodo(int id)async{
    await _todoDB.deleteTodo(id).then((value) {
      getTodoData();
    });
  }

  //color based on status
  Color statusColor(String status){
    if(status == 'done'){
      return TaksuColor.primaryGreen();
    } else if (status == 'overdue'){
      return TaksuColor.primaryRed();
    } else{
      return TaksuColor.primaryGrey();
    }
  }

  //check expired status
  String statusCheck ({required String date, required String status}){
    if(DateTime.now().compareTo(DateTime.parse(date))>0 && status == 'open'){
      return 'overdue';
    }
    return status;
  }

  @override
  void initState() {
    setState(() {
      _todoDB = TodoDB.instance;
    });
    getTodoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaksuColor.primaryBG(),
      appBar: Wh.appBar(context,
        title: 'Hi, ' + widget.initData!.name!
      ),
      body: todos.isEmpty ? const Center(
        child: TextCustom(
          text: 'No Data',
        ),
      ) : ListView(
        padding: const EdgeInsets.only(top: 30),
        children: List.generate(todos.length, (index) {
          var data = todos[index];
          String newStatus = statusCheck(date: data.dueDate!, status: data.status!);

          return WidSplash(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            padding: const EdgeInsets.all(28),
            color: TaksuColor.primaryCard(),
            radius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidSplash(
                      color: statusColor(newStatus),
                      radius: BorderRadius.circular(30),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: TextCustom(
                        size: 10,
                        weight: FontWeight.bold,
                        text: newStatus.toUpperCase(),
                        color: newStatus == 'open' ? TaksuColor.primaryBlack() : TaksuColor.white(),
                      ),
                    ),
                    WidSplash(
                      radius: BorderRadius.circular(5),
                      padding: const EdgeInsets.all(8),
                      color: TaksuColor.primaryBG(),
                      onTap: (){
                        deleteTodo(data.id!);
                      },
                      child: const SVGPicture(
                          'assets/icons/trash.svg'
                      ),
                    )
                  ],
                ),
                TextCustom(
                  text: data.title,
                  size: 20,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 7,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextCustom(
                            text: 'Due date:',
                            size: 16,
                          ),
                          TextCustom(
                            text: dateConvert(date: data.dueDate),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    data.status == 'done' ? const SizedBox.shrink() : WidSplash(
                      color: TaksuColor.primaryPurple(),
                      radius: BorderRadius.circular(6),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                      onTap: (){
                        updateTodo(data);
                      },
                      child: const TextCustom(
                        text: 'DONE',
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TaksuColor.primaryGreen(),
        onPressed: (){
          Wh.dialog(
              context,
              child: AddTodo(initData: widget.initData,),
              transparent: false,
              then: (res){
                getTodoData();
              }
          );
        },
        child: Icon(
          Icons.add_rounded,
          size: 35,
          color: TaksuColor.primaryBG(),
        ),
      ),
    );
  }
}
