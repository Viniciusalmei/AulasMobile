import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PutClimateScreen extends StatefulWidget {
  final String documentId;   //1° passo : definir variaveis para iniciar.
  final double initialTemperature;
  final double initialHumidity;

  const PutClimateScreen({super.key,required this.documentId,required this.initialTemperature,
   required this.initialHumidity});

  @override
  State<PutClimateScreen> createState() => _PutClimateScreenState();
}

class _PutClimateScreenState extends State<PutClimateScreen> {
  TextEditingController temperatureController = TextEditingController(); //2° Passo , definir variaveis de observação de escrita.
  TextEditingController humidityController = TextEditingController();

  Future<void> updateClimate() async {   //3° passo , criar uma função FUTURA e assincrona, para comunicar com o Firebase.
  double? temp = double.tryParse(temperatureController.text);
  double? hum = double.tryParse(humidityController.text);
//4° Passo esperar o Firebase, e alterar os dados.
  await FirebaseFirestore.instance.collection('Monte Mor').doc(widget.documentId).set({
    'temperature': temp,
    'humidity': hum, 

  },SetOptions(merge: true));//diz ao firebase que terá alteração a um dado anterior.

  ScaffoldMessenger.of(context).showSnackBar(//notificacao que avisa que os dados foram entregue.
    SnackBar(content: Text('Dados enviados com sucesso!'))
  );
  
  }//funcao future 

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}