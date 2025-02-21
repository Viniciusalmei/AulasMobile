import 'package:flutter/material.dart';
import 'package:projeto_teste/main.dart';
import 'package:projeto_teste/row.dart';


class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column Alignment Example"),centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Altera o eixo principal
          crossAxisAlignment: CrossAxisAlignment.center, // Altera o eixo cruzado
          children: [
            Container(width: 50, height: 50, color: Colors.blue),
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
            Text('Exemplo',style:TextStyle(color: Colors.green,fontSize: 20),textAlign: TextAlign.center,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RowExample(),
                  ),
                );
              },
              child: const Text('Ir para Row'),
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
            }, child: Text("Voltar para Home")),
             ElevatedButton(onPressed: (){
             
            }, child: Icon(Icons.home)),
           
          ],
        ),
      ),
    );
  }
}
