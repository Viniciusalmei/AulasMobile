

import 'package:cloud_firestore/cloud_firestore.dart';
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

        double temperature = (data['temperature'] ?? 0).toDouble();
        double humidity = (data['humidity'] ?? 0).toDouble();

        return Card(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical:8),
        child: ListTile(
          title: Text('Temperatura: $temperature ºC'),
          subtitle: Text('Humidade $humidity %'),
          leading: Icon(Icons.thermostat),
          
          
        )

        );
      },
      );

     })
    
    );
  }
}

