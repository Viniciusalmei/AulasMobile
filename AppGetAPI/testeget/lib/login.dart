import 'package:flutter/material.dart';
import 'package:testeget/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagina de Login")),
      body: Center(child: Column(children: [
        TextField(controller: _email, 
        decoration: InputDecoration(hintText: "Digite seu email"),),
        TextField(controller: _senha, 
        decoration: InputDecoration(hintText: "Digite sua senha"),
        obscureText: true,
        obscuringCharacter: "*",
        ),
        Row(children: [
          ElevatedButton(onPressed: ()async{
            final message = await AuthService().login(email: _email.text, password: _senha.text);
            if (message!.contains('Success')){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SUATELA()));
            }
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

          }, child: Text("LOGIN")),
        ],)
      ],))
    );
  }
}