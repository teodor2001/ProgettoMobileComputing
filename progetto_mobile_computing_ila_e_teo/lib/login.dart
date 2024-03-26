// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
        throw Exception('Errore di caricamento dei dati');
      }
    } catch (e) {
      throw Exception('Errore di connesione al server: $e');
    }
  }
*/

  Future<Map<String, String>> datiUtenti(String email, String password) async {
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
      backgroundColor: Color.fromARGB(255, 188, 160, 230),
      appBar: AppBar(
        title: const Text(
          "Guida Turistica Roma",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff784abc),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/it.png', // Percorso dell'immagine
              width: 24, // Larghezza desiderata dell'immagine
              height: 24, // Altezza desiderata dell'immagine
            ),
            tooltip: 'Clicca per cambiare lingua in italiano',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/en.png', // Percorso dell'immagine
              width: 26, // Larghezza desiderata dell'immagine
              height: 35, // Altezza desiderata dell'immagine
            ),
            tooltip: 'Clicca per cambiare lingua in inglese',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPageEng()));
            },
          ),
        ],
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
                        Map<String, String> credentials = await datiUtenti(
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

class LoginPageEng extends StatefulWidget {
  const LoginPageEng({super.key});

  @override
  State<LoginPageEng> createState() => LoginPageStateEng();
}

// CREDENZIALI BURATTINO

class LoginPageStateEng extends State<LoginPageEng> {
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
        throw Exception('Errore di caricamento dei dati');
      }
    } catch (e) {
      throw Exception('Errore di connesione al server: $e');
    }
  }
*/

  Future<Map<String, String>> datiUtenti(String email, String password) async {
    // Verifica se le credenziali corrispondono ai dati di login di prova
    if (utentiFake.containsKey(email) && utentiFake[email] == password) {
      return {'email': email, 'password': password};
    } else {
      throw Exception('Invalis credentials');
    }
  }

  Map<String, String> utentiFake = {
    'ila@puliani.com': 'ilaria',
    'teo@pascu.com': 'teodor',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 188, 160, 230),
      appBar: AppBar(
        title: const Text(
          "Rome's guide for tourists",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff784abc),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/it.png', // Percorso dell'immagine
              width: 24, // Larghezza desiderata dell'immagine
              height: 24, // Altezza desiderata dell'immagine
            ),
            tooltip: 'Clicca per cambiare lingua in italiano',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/en.png', // Percorso dell'immagine
              width: 26, // Larghezza desiderata dell'immagine
              height: 35, // Altezza desiderata dell'immagine
            ),
            tooltip: 'Click here to change language to english',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPageEng()));
            },
          ),
        ],
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
                      return "Insert an e-mail";
                    } else if (!emailValid) {
                      return "Insert a valid e-mail";
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
                      return 'Insert password';
                    } else if (passController.text.length < 6) {
                      return 'The password must contain at least 6 characters';
                    }
                    return null;
                  },
                ),
                if (showError) const SizedBox(height: 20),
                Text(
                  showError ? "Invalid credentials" : "",
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 60),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        Map<String, String> credentials = await datiUtenti(
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
                        print('Error: $e');
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
                      "Are you new?",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registrazione');
                      },
                      child: const Text(
                        "Register!",
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
