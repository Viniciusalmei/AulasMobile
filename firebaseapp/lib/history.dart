

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/put.dart';

import 'package:flutter/material.dart';

class ClimateHistoryScreen extends StatefulWidget {
  const ClimateHistoryScreen({super.key});

  @override
  State<ClimateHistoryScreen> createState() => _ClimateHistoryScreenState();
}

class _ClimateHistoryScreenState extends State<ClimateHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: StreamBuilder<QuerySnapshot>
    (stream: FirebaseFirestore.instance.collection('Monte Mor').snapshots(),
     builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator()
        );
      }
      if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
        return Center(child: Text('Nao tem dado dispónivel'));
      }

      var dataList = snapshot.data!.docs;

      return ListView.builder(itemCount: dataList.length,
      itemBuilder: (context,index){
        var data = dataList[index].data() as Map<String, dynamic>;
                        //adicionar variavel doc
        double temperature_historico = (data['temperature'] ?? 0).toDouble();
        double humidity_historico = (data['humidity'] ?? 0).toDouble();
        var doc = dataList[index];

        return GestureDetector(//adiciona função ao clicar em algo.
          onTap: () {// onTap (quando clicar)
            Navigator.push(context, MaterialPageRoute(builder: (context)=> //navega para outra tela.
            PutClimateScreen(
              documentId: doc.id,   //atributos para construir a tela PutClimate.
              initialTemperature: temperature_historico, 
              initialHumidity: humidity_historico))
           );

          },
          child:Card(
          margin: EdgeInsets.symmetric(horizontal: 16,vertical:8),
          child: ListTile(
          title: Text('Temperatura: $temperature_historico ºC'),
          subtitle: Text('Humidade $humidity_historico %'),
          leading: Icon(Icons.thermostat),
          trailing: IconButton(onPressed: () async {
             await FirebaseFirestore.instance.collection('Monte Mor').doc(doc.id).delete();
          },
           icon: Icon(Icons.delete)),
          
          
        )

        )

        );
        
        
        
      
      },
      );

     })
    
    );
  }
}

