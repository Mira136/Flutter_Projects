import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
  class _SplashPageState extends State<SplashPage> {
    void initState(){
      Timer(Duration(seconds:3),()async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      bool isLoggedin = sharedPreferences.getBool('isLoggedin')??false;
      if(isLoggedin){
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
      } else {
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        )
        Text('My Ecom App'),
        ),),
        ],
      ),
    );
  }
}
}