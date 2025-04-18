import 'package:flutter/material.dart';
import 'package:netflix/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        fontFamily: 'BigFont',
        textTheme: TextTheme(
          bodyLarge:  TextStyle(
            fontSize: 24,fontWeight: FontWeight.bold
          ),

        )
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),       //QUAL A TELA QUE IRA INICIAR MEU APP?    
    );
  }
}

