import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostClimateScreen extends StatefulWidget {
  const PostClimateScreen({super.key});

  @override
  State<PostClimateScreen> createState() => _PostClimateScreenState();
}

class _PostClimateScreenState extends State<PostClimateScreen> {
  final TextEditingController temperatureController = TextEditingController(); //Variavel que visualiza os dados.
  final TextEditingController humidityController = TextEditingController();

  Future<void> postData() async { //Future, é uma função que sua conclusão esta no futuro.
  final double temp = double.parse(temperatureController.text); //variavel que converte o valor para double.
  final double humi = double.parse(humidityController.text);

  await FirebaseFirestore.instance.collection('Monte Mor').add(//Espera o Firebase , vai no coleção desajada, e adicione um item
    {
      'temperature': temp,
      'humidity': humi,
      
    }
  );

  ScaffoldMessenger.of(context).showSnackBar( //Mensagem , que mostra um SnackBar.
    SnackBar(content:Text('Seus dados foram enviados com sucesso!'))
    );

    temperatureController.clear(); //limpa os campos , para poder colocar outro valor.
    humidityController.clear();


  }//Future 



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Sua tela de Post')
    ),
    body: Column(
      children: [
        TextField(
          controller: temperatureController, //variavel que visualiza os dados
          keyboardType: TextInputType.number,  //tipo de dado.
          decoration: InputDecoration(labelText: 'Insira Temperatura'), //texto que vai aparecer.
        ),

        TextField(
          controller: humidityController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText:'Insira a Umidade'),
        ),
        ElevatedButton(onPressed: postData, child: Text('Enviar'))


      ],
    )
    
    );
  }
}


