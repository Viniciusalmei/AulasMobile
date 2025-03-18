import 'package:flutter/material.dart';

class Filme{
  final String Nome;
  final String genero;
  final String imagem;

  Filme({
    required this.Nome,
    required this.genero, 
    required this.imagem,
    
  

  });

}



class ListaPage extends StatelessWidget {
  ListaPage({super.key});
  final List<Filme> lista_filmes = [
  Filme(
    Nome:'Vingadores',
    genero: 'Ação',
    imagem: 'assets/images/vingadores.jpg'
  ),
  Filme(Nome: 'Toy Story',
  genero: 'Animação',
  imagem: 'assets/images/toystory.jpg')


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
               Text('Lista de Filmes'),
      ),
      body: 
      ListView.builder(
        itemCount: lista_filmes.length ,
        itemBuilder:  (context,index) {
          return
           Container(
          color: Colors.black,
          width: 200,
          height: 500,
          child: Column(
            children: [
            Image.asset(lista_filmes[index].imagem),
            Text(lista_filmes[index].Nome),
            Text(lista_filmes[index].genero),
           
            ]
          )

          
            );
        }
        
        
          ),
    );
  }
}