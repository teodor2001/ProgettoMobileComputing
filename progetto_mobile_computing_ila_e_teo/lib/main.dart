import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progetto_ila_e_teo/attrazioni.dart';
import 'login.dart';
import 'home.dart';
import 'itinerario.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp(), Type);
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
      },
    );
  }
}
