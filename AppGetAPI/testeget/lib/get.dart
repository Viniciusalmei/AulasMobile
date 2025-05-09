

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
   List animes = [];

  @override
  void initState() {
    super.initState();
    getAnimes();
  }

  void getAnimes() async {
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        animes = data['data'];
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animes Populares')),
      body: animes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: animes.length,
              itemBuilder: (context, index) {
                final anime = animes[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      anime['images']['jpg']['image_url'],
                      width: 50,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    title: Text(anime['title']),
                    subtitle: Text("Score: ${anime['score'] ?? 'N/A'}"),
                  ),
                );
              },
            ),
    );
  }
}