import 'package:flutter/material.dart';
import 'package:test_taksu/services/colors.dart';
import 'package:test_taksu/services/widget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController(text: ''),
      dueDateController = TextEditingController(text: '');
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
            ),
            const SizedBox(height: 10,),
            TextInputCustom(
              label: 'Due Date',
              controller: dueDateController,
              hint: 'DD/MM/YYYY',
              action: TextInputAction.done,
              onTap: () {
                DatePicker.showDateTimePicker(context,
                  minTime: DateTime.now(),
                  theme: DatePickerTheme(
                    backgroundColor: TaksuColor.primaryBG(),
                    itemStyle: TextStyle(
                      color: TaksuColor.white()
                    ),
                    doneStyle: TextStyle(
                        color: TaksuColor.primaryPurple()
                    ),
                    cancelStyle: TextStyle(
                        color: TaksuColor.white()
                    ),
                  ),
                  onConfirm: (date){
                    setState(() {
                      dueDateController.text = date.toString();
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
