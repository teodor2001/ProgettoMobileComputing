import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}
// CREDENZIALI BURATTINO
Map<String, String> utentiFake = {
  'ila@puliani.com': 'ilaria',
  'teo@pascu.com': 'teodor',
};

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  bool showError = false;



  //LOGIN TRAMITE SERVERINOPOTENTISSIMO
/*
  Future<Map<String, String>> datiUtenti(
      String email, String password) async {
    var url = Uri.parse(
        'http://192.168.1.180:5000/login?email=$email&password=$password');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return {'email': data['email'], 'password': data['password']};
      } else {
        throw Exception('Failed to load user credentials');
      }
    } catch (e) {
      throw Exception('Failed to connect to server: $e');
    }
  }
*/

Future<Map<String, String>> datiUtenti(
      String email, String password) async {
    // Verifica se le credenziali corrispondono ai dati di login di prova
    if (utentiFake.containsKey(email) && utentiFake[email] == password) {
      return {'email': email, 'password': password};
    } else {
      throw Exception('Credenziali non valide');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guida Turistica Roma"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Inserire una e-mail";
                    } else if (!emailValid) {
                      return "Inserire una e-mail valida";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Inserire la password';
                    } else if (passController.text.length < 6) {
                      return 'La password deve contenere almeno 6 caratteri';
                    }
                    return null;
                  },
                ),
                if (showError) const SizedBox(height: 20),
                Text(
                  showError ? "Credenziali non valide" : "",
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 60),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        Map<String, String> credentials =
                            await datiUtenti(
                                emailController.text, passController.text);
                        if (credentials.isNotEmpty &&
                            credentials['password'] == passController.text) {
                          emailController.clear();
                          passController.clear();
                          setState(() {
                            showError = false;
                          });
                          Navigator.pushNamed(context, '/home');
                        } else {
                          setState(() {
                            showError = true;
                          });
                        }
                      } catch (e) {
                        setState(() {
                          showError = true;
                        });
                        print('Errore: $e');
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sei nuovo?",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registrazione');
                      },
                      child: const Text(
                        "Registrati",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
