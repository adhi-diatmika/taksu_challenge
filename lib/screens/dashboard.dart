import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return WillPopScope(
                  onWillPop: (){
                    return Future.value(true);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            color: Colors.red,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            );
          },
          child: const Text('test'),
        ),
      ),
    );
  }
}
