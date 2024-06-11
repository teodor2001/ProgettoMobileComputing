// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Altare extends StatelessWidget {
  const Altare({super.key});
    Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await launchUrl(uri);
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
              "L'Altare della Patria",
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
                      .push(MaterialPageRoute(builder: (context) => Altare()));
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
                      MaterialPageRoute(builder: (context) => AltareEng()));
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
                  "Il Monumento nazionale a Vittorio Emanuele II , noto come Altare della Patria, è un monumento nazionale italiano situato a piazza Venezia. Con la sua imponente dimensione, vantando ben 70m di altezza, il monumento fu inaugurato ufficialmente ed aperto al pubblico in occasione delle celebrazioni del cinquantenario dell'Unità d'Italia. Ha un grande valore rappresentativo del complesso processo di unità nazionale e liberazione dalla dominazione straniera portato a compimento sotto il regno di Vittorio Emanuele II di Savoia, cui il monumento è dedicato: per tale motivo il Vittoriano è considerato uno dei simboli patri italiani. Il monumento accoglie anche la tomba del Milite Ignoto, militare italiano caduto al fronte durante la prima guerra mondiale. La tomba del Milite Ignoto è sempre piantonata da due militari (posizionati alle estremità della tomba) appartenenti alle diverse armi delle forze armate italiane che si alternano nel servizio. \nÈ possibile visitare l’ampio museo del Risorgimento custodito al suo interno nonché prendere l’ascensore panoramico e godersi la vista su Roma. Visita per maggiori informazioni il seguente link",
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
                  'https://www.getyourguide.it/roma-l33/roma-ascensore-di-vetro-musei-e-biglietti-per-autobus-hop-on-hop-off-t447482/?ranking_uuid=6fb3416f-f56f-4d04-9e40-89dd8315c38a'), // Inserisci qui l'URL desiderato
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
                child: Image.asset('assets/images/altare2.png',
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
class AltareEng extends StatelessWidget {
  const AltareEng({super.key});
      Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await launchUrl(uri);
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
              "L'Altare della Patria",
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
                      .push(MaterialPageRoute(builder: (context) => Altare()));
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
                      MaterialPageRoute(builder: (context) => AltareEng()));
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
                  "The National Monument to Victor Emmanuel II, known as the Altare della Patria, is an Italian national monument located in Piazza Venezia. With its imposing size, boasting a height of 70 meters, the monument was officially inaugurated and opened to the public during the celebrations of the fiftieth anniversary of the Unification of Italy. It holds great symbolic value for the complex process of national unity and liberation from foreign domination achieved under the reign of Victor Emmanuel II of Savoy, to whom the monument is dedicated: for this reason, the Vittoriano is considered one of Italy's patriotic symbols. The monument also houses the Tomb of the Unknown Soldier, an Italian soldier who fell in battle during World War I. The Tomb of the Unknown Soldier is always guarded by two soldiers (positioned at the ends of the tomb) belonging to different branches of the Italian Armed Forces, who take turns in the service. You can visit the extensive Risorgimento Museum housed inside it and take the panoramic elevator to enjoy the view of Rome. For more information, visit the following link",
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
                  'https://www.getyourguide.it/roma-l33/roma-ascensore-di-vetro-musei-e-biglietti-per-autobus-hop-on-hop-off-t447482/?ranking_uuid=6fb3416f-f56f-4d04-9e40-89dd8315c38a'), // Inserisci qui l'URL desiderato
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
                child: Image.asset('assets/images/altare2.png',
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
