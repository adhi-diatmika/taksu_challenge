import 'package:flutter/material.dart';
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

  @override
  void initState() {
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
                ),
                const SizedBox(height: 20,),
                WidSplash(
                  width: 112,
                  color: TaksuColor.primaryGreen(),
                  radius: BorderRadius.circular(5),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  onTap: (){
                    push(context, const HomeScreen());
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
