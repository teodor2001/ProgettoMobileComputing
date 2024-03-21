// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_progetto_ila_e_teo/main.dart';
import 'package:provider/provider.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double larghezza = MediaQuery.of(context).size.width;
    double altezza = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 188, 160, 230),
        drawer: Drawer(
          backgroundColor: const Color(0xff784abc),
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(""),
                accountEmail: Text(""),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/prova.png"),
                  ),
                ),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/home'),
                leading: const Icon(Icons.home_filled,
                    color: Colors.white, size: 30),
                title: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () => 'null',
                leading:
                    const Icon(Icons.favorite, color: Colors.white, size: 30),
                title: const Text(
                  "Preferiti",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/meteo'),
                leading: const Icon(Icons.sunny, color: Colors.white, size: 30),
                title: const Text(
                  "Meteo",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/mappa'),
                leading: const Icon(Icons.map, color: Colors.white, size: 30),
                title: const Text(
                  "Mappa",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () => 'null',
                leading:
                    const Icon(Icons.settings, color: Colors.white, size: 30),
                title: const Text(
                  "Impostazioni",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/'),
                leading:
                    const Icon(Icons.logout, color: Colors.white, size: 30),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            'Guida turistica Roma',
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
              icon: Icon(Icons.language, color: Colors.white),
              onPressed: () {
                // Mostra un dialogo o una modalità per selezionare la lingua
                showDialog(
                  context: context,
                  builder: (context) => LanguageSelectorDialog(),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: larghezza * 0.05,
                  width: altezza * 0.05,
                ),
              ),
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/menu.png',
                      width: 400, height: 300, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 10,
                  width: 20,
                ),
              ),
              Center(child: Consumer<LanguageProvider>(
                  builder: (context, languageProvider, _) {
                return _buildTranslatedWidget(
                    languageProvider.locale.languageCode);
              })),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 5,
                  width: 5,
                ),
              ),
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/botton1.png',
                      width: 400, height: 300, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 5,
                  width: 5,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/attrazioni');
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 46, 221),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Clicca qui per fare un tour della attrazioni',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color.fromARGB(255, 92, 46, 221)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 5,
                  width: 5,
                ),
              ),
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/botton2.png',
                      width: 400, height: 300, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 5,
                  width: 5,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/itinerario');
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 46, 221),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  "Clicca qui per scegliere l'itinerario perfetto per te",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color.fromARGB(255, 92, 46, 221)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8.0),
                  child: SizedBox(
                    height: 15,
                    width: 5,
                  )),
            ],
          ),
        ));
  }
}

class LanguageSelectorDialog extends StatelessWidget {
  const LanguageSelectorDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLanguageButton(context, 'English', 'en', 'US'),
          _buildLanguageButton(context, 'Italiano', 'it', 'IT'),
          // Aggiungi altri pulsanti per le lingue supportate...
        ],
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context, String language,
      String countryCode, String languageCode) {
    return TextButton(
      onPressed: () {
        Provider.of<LanguageProvider>(context, listen: false)
            .changeLanguage(Locale(languageCode, countryCode));
        Navigator.pop(
            context); // Chiudi il dialogo dopo aver selezionato la lingua
      },
      child: Text(language),
    );
  }
}

Widget _buildTranslatedWidget(String languageCode) {
  switch (languageCode) {
    case 'it':
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Benvenuto, \nquesta guida ti permetterà di scoprire le bellezze di questa città, di orientarti e trovare l'itinerario perfetto per te in base ai tuoi interessi.\nTi daremo tutte le informazioni utili che \ndevi sapere prima di venire qui, in modo da goderti a pieno la tua esperienza!!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );

    case 'en':
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Welcome, \nthis guide will allow you to discover the beauties of this city, orient yourself, and find the perfect itinerary for you based on your interests.\nWe will provide you with all the useful information that \nyou need to know before coming here, so that you can fully enjoy your experience!!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );

    default:
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Benvenuto, \nquesta guida ti permetterà di scoprire le bellezze di questa città, di orientarti e trovare l'itinerario perfetto per te in base ai tuoi interessi.\nTi daremo tutte le informazioni utili che \ndevi sapere prima di venire qui, in modo da goderti a pieno la tua esperienza!!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
  }
}
