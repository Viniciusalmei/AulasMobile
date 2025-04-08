

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
    (stream: stream, builder: builder)
    
    );
  }
}

