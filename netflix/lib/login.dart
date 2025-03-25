import 'package:flutter/material.dart';
import 'package:netflix/lista.dart';

TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usuario_cadastrado = 'Vinicius';
  String senha_cadastrada = '123';
  String verificador = '';

  bool Logar() {
    if(_user.text == usuario_cadastrado && _pass.text == senha_cadastrada ){
      verificador = '';
      print('Login realizado com sucesso');
      return true;
    }
    else{
      print('Credenciais Erradas');
      setState(() {
        verificador = 'Credenciais Erradas';
         
      });
      return false;
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Image.asset('assets/images/logonetflix.png'),
      toolbarHeight: 200,
      centerTitle: true,
      backgroundColor: Colors.black,
      
      
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        TextField(
          decoration: InputDecoration( 
            hintText: 'Insira seu usuario',  //texto de sobreposição
            border: OutlineInputBorder(
              
            ),
          ),
          controller: _user,       //Qual variavel que ira preencher este textfield??


        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Insira sua senha',
            border: OutlineInputBorder(),
          ),
          controller: _pass,
          obscureText: true,
          

        ),
        ElevatedButton(onPressed: (){
          if(Logar()){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaPage()));
          };
        },
         child:   Icon(Icons.login)
         
         ),
         Text('$verificador'),


        ],
      )

    );
  }
}