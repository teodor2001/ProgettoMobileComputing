import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progetto_ila_e_teo/attrazioni.dart';
import 'package:flutter_progetto_ila_e_teo/mappa.dart';
import 'package:flutter_progetto_ila_e_teo/meteo.dart';
import 'login.dart';
import 'home.dart';
import 'itinerario.dart';
import 'colosseo.dart';
import 'altare.dart';
import 'fontana.dart';
import 'piazza.dart';
import 'navona.dart';
import 'sanpietro.dart';
import 'pspagna.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Specifica la rotta iniziale
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const SideBarMenu(),
        '/attrazioni': (context) => const Attrazioni(),
        '/itinerario': (context) => const Itinerario(),
        '/meteo': (context) => const Meteo(),
        '/colosseo': (context) => const Colosseo(),
        '/altare': (context) => const Altare(),
<<<<<<< HEAD
        '/fontana': (context) => const Fontana(),
        '/piazza': (context) => const Piazza(),
        '/navona': (context) => const Navona(),
        '/sanpietro': (context) => const Sanpietro(),
        '/pspagna': (context) => const Piazzaspagna(),
=======
        '/mappa' : (context) => const Mappa(),
>>>>>>> main
      },
    );
  }
}
