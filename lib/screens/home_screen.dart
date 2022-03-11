import 'package:flutter/material.dart';
import 'package:test_taksu/models/user.dart';
import 'package:test_taksu/screens/forms/add_todo.dart';
import 'package:test_taksu/services/colors.dart';
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
  List todoData = [
    {
      'title' : 'Submit Code to Taksu',
      'due_date' : '21 October 2021 08:30PM',
      'status' : 'open'
    },
    {
      'title' : 'Interview with Taksu',
      'due_date' : '21 October 2021 08:30PM',
      'status' : 'done'
    },
    {
      'title' : 'Interview with Taksu',
      'due_date' : '21 October 2021 08:30PM',
      'status' : 'overdue'
    }
  ];
  
  Color statusColor(String status){
    if(status == 'done'){
      return TaksuColor.primaryGreen();
    } else if (status == 'overdue'){
      return TaksuColor.primaryRed();
    } else{
      return TaksuColor.primaryGrey();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaksuColor.primaryBG(),
      appBar: Wh.appBar(context,
        title: 'Hi, ' + widget.initData!.name!
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: List.generate(todoData.length, (index) {
          var data = todoData[index];
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
                      color: statusColor(data['status']),
                      radius: BorderRadius.circular(30),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: TextCustom(
                        size: 10,
                        weight: FontWeight.bold,
                        text: data['status'].toString().toUpperCase(),
                        color: data['status'] == 'open' ? TaksuColor.primaryBlack() : TaksuColor.white(),
                      ),
                    ),
                    WidSplash(
                      radius: BorderRadius.circular(5),
                      padding: const EdgeInsets.all(8),
                      color: TaksuColor.primaryBG(),
                      child: const SVGPicture(
                          'assets/icons/trash.svg'
                      ),
                    )
                  ],
                ),
                TextCustom(
                  text: data['title'],
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
                            text: data['due_date'],
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    data['status'] == 'done' ? const SizedBox.shrink() : WidSplash(
                      color: TaksuColor.primaryPurple(),
                      radius: BorderRadius.circular(6),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
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
              child: const AddTodo(),
              transparent: false
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
