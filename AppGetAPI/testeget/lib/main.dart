import 'package:flutter/material.dart';
import 'package:testeget/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Exemplo de GET"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Bem-vindo ao Programa de GET por API',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                 SizedBox(height: 12),
                 Text(
                  "Aqui você vai aprender a fazer um GET simples!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                 SizedBox(height: 8),
                 Text(
                  "Vamos utilizar a Jikan API.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                 SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1oS9lOlCJE1OTy8FMK8qffeD2tshyeOedUQ&s',
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GetScreen()));
                }, child: Text('Navegar'))
                
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
