import 'package:firebaseapp/clima.dart';
import 'package:firebaseapp/history.dart';
import 'package:firebaseapp/main.dart';
import 'package:firebaseapp/post.dart';
import 'package:flutter/material.dart';


class NavApp extends StatefulWidget {
  const NavApp({super.key});

  @override
  State<NavApp> createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {
  int selectIndex = 0; // Index da nossa lista.
  static const TextStyle optionStyle =    // personalização padrao do nosso texto.
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
    static List<Widget> _widgetOptions = <Widget> [  //Lista das nossas telas.
      HomeScreen(),
      ClimateScreen(),
      ClimateHistoryScreen(),
      

    ];


    void showItemTrap (int index) {
      setState(() {
        selectIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.cloud),
            label: 'Monitoramento',
            backgroundColor: Colors.cyan
            ),
            BottomNavigationBarItem(icon: Icon(Icons.history),
            label: 'Historico',
            backgroundColor: Colors.cyan
            )
             
           
            


        ],
        currentIndex: selectIndex,
        selectedItemColor: Colors.amber,
        onTap: showItemTrap,
        
        
        ),



    );
  }
}