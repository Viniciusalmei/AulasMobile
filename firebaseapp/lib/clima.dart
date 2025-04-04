import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClimateScreen extends StatefulWidget {
  const ClimateScreen({super.key});

  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  double temperature = 0.0; // declare as variaveis aqui :)
  double humidity = 0.0; // declare 
  @override
  void initState() { // funcao para poder os dados atualizarem sem precisar reiniciar o app.
    super.initState();
    fetchData();
  }

 void fetchData() { // funcao para buscar os dados.
    FirebaseFirestore.instance.collection('Monte Mor').snapshots().listen((snapshot) {
      var data = snapshot.docs.first.data();
      setState(() {
        temperature = (data['temperature'] ?? 0).toDouble();
        humidity = (data['humidity'] ?? 0).toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        
        title: Text('Clima - Monte Mor'),
        centerTitle: true,
        toolbarHeight: 150,
        
      ),
      body: Center(
        
        child: 
        ListView(
          children: [
            Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Temperatura: $temperature°C',  //impressao dos dados 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Umidade: $humidity%',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            
          ],
        ),
          ],
        )
        
      ),
    );
  }
}
