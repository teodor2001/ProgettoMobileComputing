// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Fori extends StatelessWidget {
  const Fori({super.key});
      Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
    } else {
      throw 'Impossibile aprire $url';
    }
  }
  @override
  Widget build(BuildContext context) {
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
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/mangiare'),
                leading:
                    const Icon(Icons.food_bank, color: Colors.white, size: 30),
                title: const Text(
                  "Piatti tipici",
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
              'Fori Imperiali',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
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
                      .push(MaterialPageRoute(builder: (context) => Fori()));
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ForiEng()));
                },
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(30.0),
                margin: EdgeInsets.all(20), // padding intorno al testo nel box
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: const Color.fromARGB(75, 0, 0, 0),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: Text(
                  "Costituiscono una serie di cinque piazze monumentali edificate nel corso di un secolo e mezzo (tra il 46 a.C. e il 113 d.C.) nel cuore della città di Roma da parte di Giulio Cesare e degli imperatori Augusto, Vespasiano, Nerva e Traiano. È possibile passeggiare lungo questa via storica di Roma e osservare a cielo aperto gli scavi e i resti storici di quell’epoca. Si può prenotare una visita guidata al seguente link: ",
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
              ),
            ),
            ElevatedButton(
              onPressed: () => _launchURL(
                  'https://www.getyourguide.it/roma-l33/roma-tour-al-crepuscolo-del-colosseo-e-visita-ai-fori-imperiali-t487730/?ranking_uuid=91e5ad70-f9ac-408c-abfa-2ed8d42a7656'), // Inserisci qui l'URL desiderato
              child: Text('Apri Link'),
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
              height: 500,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/fori.png',
                    width: 400, height: 450, fit: BoxFit.cover),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 5,
                  width: 5,
                )),
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/fori2.png',
                    width: 400, height: 300, fit: BoxFit.cover),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 15,
                  width: 5,
                )),
          ]),
        ));
  }
}
class ForiEng extends StatelessWidget {
  const ForiEng({super.key});
      Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
    } else {
      throw 'Impossibile aprire $url';
    }
  }
  @override
  Widget build(BuildContext context) {
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
                onTap: () => Navigator.pushNamed(context, '/meteo'),
                leading: const Icon(Icons.sunny, color: Colors.white, size: 30),
                title: const Text(
                  "Weather",
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
                  "Map",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/mangiare'),
                leading:
                    const Icon(Icons.food_bank, color: Colors.white, size: 30),
                title: const Text(
                  "Typical dishes",
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
              'Fori Imperiali',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
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
                      .push(MaterialPageRoute(builder: (context) => Fori()));
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ForiEng()));
                },
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(30.0),
                margin: EdgeInsets.all(20), // padding intorno al testo nel box
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: const Color.fromARGB(75, 0, 0, 0),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: Text(
                  "They constitute a series of five monumental squares built over a century and a half (between 46 BC and 113 AD) in the heart of the city of Rome by Julius Caesar and the emperors Augustus, Vespasian, Nerva, and Trajan. You can stroll along this historic street of Rome and observe open-air excavations and historical remains from that era. You can book a guided tour at the following link: ",
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
              ),
            ),
            ElevatedButton(
              onPressed: () => _launchURL(
                  'https://www.getyourguide.it/roma-l33/roma-tour-al-crepuscolo-del-colosseo-e-visita-ai-fori-imperiali-t487730/?ranking_uuid=91e5ad70-f9ac-408c-abfa-2ed8d42a7656'), // Inserisci qui l'URL desiderato
              child: Text('Open Link'),
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
              height: 500,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/fori.png',
                    width: 400, height: 450, fit: BoxFit.cover),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 5,
                  width: 5,
                )),
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/fori2.png',
                    width: 400, height: 300, fit: BoxFit.cover),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 15,
                  width: 5,
                )),
          ]),
        ));
  }
}
