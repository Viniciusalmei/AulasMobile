import 'package:flutter/material.dart';
import 'package:projeto_teste/column.dart';
import 'package:projeto_teste/row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orientation Widgets'),centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: 
      
      Center(
        child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
        Image.network('https://docs.flutterflow.io/assets/images/row-main-axis-51a849d58cd39f3daaf64557e0845bcb.png'),
        Text('Discover Orientation Widgets.',style: TextStyle(fontSize: 20),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 ElevatedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ColumnExample()));


                 }, child: Text('Column Widgets')),
         ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> RowExample()));
         }, child: Text('Row Widgets')),
          ],
        ),
   
      ],)
    ));
  }
}


