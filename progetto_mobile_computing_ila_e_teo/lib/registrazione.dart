import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Registration Form',
      debugShowCheckedModeBanner: false,
      home: PaginaRegistrazione(),
    );
  }
}

class PaginaRegistrazione extends StatefulWidget {
  const PaginaRegistrazione({super.key});

  @override
  PaginaRegistrazioneState createState() => PaginaRegistrazioneState();
}

class PaginaRegistrazioneState extends State<PaginaRegistrazione> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = '';

  Future<void> _register() async {
    var url =
        'http://192.168.1.180:5000/register'; // Assicurati di usare l'indirizzo IP locale del server Python
    var body = jsonEncode({
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        setState(() {
          _message = 'Registrazione avvenuta con successo';
        });
      } else {
        setState(() {
          _message = 'Errore durante la registrazione: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Errore durante la registrazione: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina di Registrazione'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/it.png', // Percorso dell'immagine
              width: 24, // Larghezza desiderata dell'immagine
              height: 24, // Altezza desiderata dell'immagine
            ),
            tooltip: 'Clicca per cambiare lingua in italiano',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaRegistrazione()));
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaRegistrazioneEng()));
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Inserire il nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Inserire l\'email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Inserire la password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _register();
                  }
                },
                child: const Text('Registrati'),
              ),
              const SizedBox(height: 16.0),
              Text(
                _message,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginaRegistrazioneEng extends StatefulWidget {
  const PaginaRegistrazioneEng({super.key});

  @override
  PaginaRegistrazioneStateEng createState() => PaginaRegistrazioneStateEng();
}

class PaginaRegistrazioneStateEng extends State<PaginaRegistrazioneEng> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = '';

  Future<void> _register() async {
    var url =
        'http://192.168.1.180:5000/register'; // Assicurati di usare l'indirizzo IP locale del server Python
    var body = jsonEncode({
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        setState(() {
          _message = 'Successful registration';
        });
      } else {
        setState(() {
          _message = 'Error during registration: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Error during registration: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/it.png', // Percorso dell'immagine
              width: 24, // Larghezza desiderata dell'immagine
              height: 24, // Altezza desiderata dell'immagine
            ),
            tooltip: 'Clicca per cambiare lingua in italiano',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaRegistrazione()));
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaRegistrazioneEng()));
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your\'email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _register();
                  }
                },
                child: const Text('Registered'),
              ),
              const SizedBox(height: 16.0),
              Text(
                _message,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
