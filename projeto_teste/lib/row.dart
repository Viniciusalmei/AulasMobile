import 'package:flutter/material.dart';
import 'package:projeto_teste/column.dart';
import 'package:projeto_teste/main.dart';


class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Row Alignment Example")),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Altera o eixo principal
            crossAxisAlignment: CrossAxisAlignment.center, // Altera o eixo cruzado
            children: [
              Container(width: 50, height: 50, color: Colors.blue),
              Container(width: 50, height: 50, color: Colors.red),
              Container(width: 50, height: 50, color: Colors.green),
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColumnExample(),
                  ),
                );
              },
              child: const Text('Voltar para Column'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
            }, child: Text( 'Home'))
            ],

          ),
        ),
    )
    ;
  }
}
