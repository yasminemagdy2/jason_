import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/views/widgets/button.dart';
import 'package:helloworld/views/widgets/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 200,
                child: Image.asset("assets/images/flutter.png"),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  //controller: UserNamecontroller,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value!.isNotEmpty && value!.contains("@")) {
                      return null;
                    } else {
                      return "add valid email";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "password"),
                  validator: (value) {
                    if (value!.length < 9) {
                      return "Add Vaild password";
                    }
                  },
                ),
              ),
              MyCustomButton(
                label: "Login",
                onTap: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('email', emailController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UsersScreen(
                              // email: emailController.text,
                              )),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error')),
                    );
                  }
                },
              ),
              // onPressed: () {}, child: Container(height: 50, width: 200, child: Center(child: Text("login"))))
            ],
          ),
        ),
      ),
    );
  }
}
