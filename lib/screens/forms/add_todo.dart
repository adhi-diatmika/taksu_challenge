import 'package:flutter/material.dart';
import 'package:test_taksu/databases/todo_db.dart';
import 'package:test_taksu/models/todo.dart';
import 'package:test_taksu/models/user.dart';
import 'package:test_taksu/services/colors.dart';
import 'package:test_taksu/services/helper.dart';
import 'package:test_taksu/services/widget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTodo extends StatefulWidget {
  final User? initData;
  const AddTodo({
    Key? key,
    this.initData
  }) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController(text: ''),
      dueDateController = TextEditingController(text: '');
  bool titleValidate = false,
      dueDateValidate = false;

  late TodoDB _todoDB;
  Todo todo = Todo();

  addTodo()async{
    todo.title = titleController.text;
    todo.dueDate = dueDateController.text;
    todo.userId = widget.initData!.id;
    todo.status = 'open';
    todo.createdAt = DateTime.now().toString();

    await _todoDB.insertTodo(todo).then((value) {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    setState(() {
      _todoDB = TodoDB.instance;
    });
    titleController.addListener(() {
      if(titleController.text.isNotEmpty){
        setState(() {
          titleValidate = false;
        });
      }else{
        setState(() {
          titleValidate = true;
        });
      }
    });
    dueDateController.addListener(() {
      if(dueDateController.text.isNotEmpty){
        setState(() {
          dueDateValidate = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextCustom(
              text: 'New Todo',
              size: 20,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 20,),
            TextInputCustom(
              label: 'Title',
              controller: titleController,
              hint: 'This is todo title',
              action: TextInputAction.next,
              errorText: titleValidate ? 'Title cannot empty' : null,
            ),
            const SizedBox(height: 10,),
            TextInputCustom(
              label: 'Due Date',
              controller: dueDateController,
              hint: 'DD/MM/YYYY',
              action: TextInputAction.done,
              readOnly: true,
              showCursor: false,
              errorText: dueDateValidate ? 'Due date cannot empty' : null,
              onTap: () {
                DatePicker.showDateTimePicker(context,
                  minTime: DateTime.now(),
                  theme: DatePickerTheme(
                    backgroundColor: TaksuColor.primaryBG(),
                    itemStyle: TextStyle(
                      color: TaksuColor.white()
                    ),
                    doneStyle: TextStyle(
                        color: TaksuColor.primaryGreen()
                    ),
                    cancelStyle: TextStyle(
                        color: TaksuColor.white()
                    ),
                  ),
                  onConfirm: (date){
                    setState(() {
                      dueDateController.text = dateConvert(date: date.toString());
                    });
                  }
                );
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: WidSplash(
                color: TaksuColor.primaryPurple(),
                radius: BorderRadius.circular(5),
                width: 179,
                padding: const EdgeInsets.symmetric(vertical: 10),
                onTap: (){
                  if(titleController.text.isEmpty || dueDateController.text.isEmpty){
                    if(titleController.text.isEmpty){
                      setState(() {
                        titleValidate = true;
                      });
                    }
                    if(dueDateController.text.isEmpty){
                      setState(() {
                        dueDateValidate = true;
                      });
                    }
                  }else{
                    addTodo();
                  }
                },
                child: const TextCustom(
                  text: 'Save',
                  align: TextAlign.center,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: WidSplash(
                width: 179,
                padding: const EdgeInsets.symmetric(vertical: 10),
                onTap: (){
                  Navigator.pop(context);
                },
                child: const TextCustom(
                  text: 'Cancel',
                  align: TextAlign.center,
                  weight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
