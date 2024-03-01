// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Fontana extends StatelessWidget {
  const Fontana({super.key});
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
                onTap: () => 'null',
                leading:
                    const Icon(Icons.favorite, color: Colors.white, size: 30),
                title: const Text(
                  "Favorite",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () => 'null',
                leading: const Icon(Icons.notifications,
                    color: Colors.white, size: 30),
                title: const Text(
                  "Notifiche",
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
            'La Fontana di Trevi',
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
        ),
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
                  "La Fontana di Trevi è la più grande fra le celebri fontane di Roma, costruita sulla facciata di Palazzo Poli da Nicola Salvi, per il concorso indetto da papa Clemente XII nel 1731. È inserita in un'ampia piscina rettangolare dagli angoli arrotondati. La scenografia è dominata da una scogliera rocciosa che occupa tutta la parte inferiore del palazzo, al cui centro troviamo una grande nicchia delimitata da colonne che la fa risaltare come fosse sotto un arco di trionfo. Qui si erge una grande statua del dio Oceano di Pietro Bracci dalle forme muscolose e opulente e dallo sguardo fiero e altezzoso. Simbolo della città che rappresenta e probabilmente anche l'imponenza stessa della fontana è all'origine di leggende e aneddoti che le si infittiscono attorno e che sono entrati a far parte della cultura popolare romana: La tradizione più conosciuta e persistente è legata al lancio della monetina dentro la fontana: compiendo questo atto a occhi chiusi, voltando le spalle verso palazzo Poli, ci si propizierebbe un futuro ritorno nella città. È possibile effettuare una prenotazione per una visita guidata dove è possibile avere accesso anche agli ambienti sotterranei (ben nove metri) per vedere l'acquedotto di 2000 anni al seguente link",
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
                  'https://www.getyourguide.it/roma-l33/fontana-di-trevi-e-sotterranei-tour-guidato-express-t392231/?ranking_uuid=abc9c697-3f0d-4f7c-bf94-0753386b59a7'), // Inserisci qui l'URL desiderato
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
                child: Image.asset('assets/images/font.png',
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

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossibile aprire $url';
  }
}
