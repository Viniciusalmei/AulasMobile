import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaContador(),
    );
  }
}

class PaginaContador extends StatefulWidget {
  const PaginaContador({super.key});

  @override
  State<PaginaContador> createState() => _PaginaContadorState();
}

class _PaginaContadorState extends State<PaginaContador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Netflix',style: TextStyle(
         color: Colors.red,
         fontWeight: FontWeight.bold,

      

      ),),centerTitle: true,backgroundColor: Colors.black,),
      body: 
      Stack(
        
         children:[
        //   Container(
        //     height: 400,
        //     child:
        //     Image.asset('images/net.jpg'),

        //   ),
          
          

          
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
          
          ),
           TextField(),
           ElevatedButton(onPressed: () {

           }, child:Text('Logar')),
           
           
        ],
      ),
        ]

      )
    
    );
  }
}