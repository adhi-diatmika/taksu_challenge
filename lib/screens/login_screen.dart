import 'package:flutter/material.dart';
import 'package:test_taksu/databases/user_db.dart';
import 'package:test_taksu/models/user.dart';
import 'package:test_taksu/screens/home_screen.dart';
import 'package:test_taksu/services/colors.dart';
import 'package:test_taksu/services/helper.dart';
import 'package:test_taksu/services/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  bool nameValidate = false;

  late UserDB _userDB;
  User user = User();

  //user login
  login()async{
    user.name = nameController.text.toLowerCase();
    user.createdAt = DateTime.now().toString();
    await _userDB.insertUser(user);
    getLoggedUser();
  }

  //get user
  getLoggedUser() async{
    List<User> listUsers = await _userDB.fetchUser(name: nameController.text);
    if(mounted){
      push(context, HomeScreen(initData: listUsers[0],));
    }
  }

  @override
  void initState() {
    setState(() {
      _userDB = UserDB.instance;
    });
    nameController.addListener(() {
      if(nameController.text.isNotEmpty){
        setState(() {
          nameValidate = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaksuColor.primaryBG(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 281,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInputCustom(
                  label: 'Name',
                  controller: nameController,
                  hint: 'Name',
                  action: TextInputAction.done,
                  errorText: nameValidate ? 'Name cannot empty' : null,
                ),

                const SizedBox(height: 20,),
                WidSplash(
                  width: 112,
                  color: TaksuColor.primaryGreen(),
                  radius: BorderRadius.circular(5),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  onTap: (){
                    if(nameController.text.isEmpty){
                      setState(() {
                        nameValidate = true;
                      });
                    }else{
                      login();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextCustom(text: 'Next'),
                      Icon(
                        Icons.arrow_forward,
                        color: TaksuColor.white(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
