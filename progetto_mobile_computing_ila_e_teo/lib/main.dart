// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progetto_ila_e_teo/attrazioni.dart';
import 'package:flutter_progetto_ila_e_teo/mappa.dart';
import 'package:flutter_progetto_ila_e_teo/meteo.dart';
import 'package:flutter_progetto_ila_e_teo/registrazione.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
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
import 'fori.dart';
import 'castel.dart';
import 'corso.dart';
import 'villa.dart';
import 'mangiare.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    ChangeNotifierProvider(
        create: (context) => LanguageProvider(), child: const MyApp()),
  );
}

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Locale('it', 'IT');

  Locale get locale => _locale;

  void changeLanguage(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'), // Inglese
            Locale('it', 'IT'), // Italiano
            // Aggiungi altre lingue supportate qui...
          ],
          locale: languageProvider.locale,
          title: 'Guida per Roma',
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
            '/mangiare': (context) => const Mangiare(),
            '/colosseo': (context) => const Colosseo(),
            '/altare': (context) => const Altare(),
            '/fontana': (context) => const Fontana(),
            '/piazza': (context) => const Piazza(),
            '/navona': (context) => const Navona(),
            '/sanpietro': (context) => const Sanpietro(),
            '/pspagna': (context) => const Piazzaspagna(),
            '/fori': (context) => const Fori(),
            '/castel': (context) => const Castel(),
            '/corso': (context) => const Corso(),
            '/villa': (context) => const Villa(),
            '/mappa': (context) => const Mappa(),
            '/registrazione': (context) => const PaginaRegistrazione(),
          },
        );
      },
    );
  }
}
