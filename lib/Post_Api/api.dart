import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String pasword) async {
    try {
      http.Response response =
          await http.post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': pasword,
      });
      if (response.statusCode == 200) {
        print('account created successfully');
      } else {
        print('Failed to post data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: const Text('Api', style: TextStyle(color: Colors.white))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              login(emailController.text.toString(),
                  passwordController.text.toString());
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text('Login', style: TextStyle(color: Colors.white))),
            ),
          )
        ],
      ),
    );
  }
}
