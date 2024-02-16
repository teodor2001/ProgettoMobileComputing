// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Colosseo extends StatelessWidget {
  const Colosseo({Key? key}) : super(key: key);
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
            'Il Colosseo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff784abc),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Text(
                "\n Il Colosseo, originariamente conosciuto come Anfiteatro Flavio (in latino: Amphitheatrum Flavium) è il più grande anfiteatro romano del mondo (in grado di contenere un numero di spettatori stimato tra 50 000 e 87 000), situato nel centro della città di Roma, nonché il più imponente monumento dell'antica Roma che sia giunto fino a noi. Inserito nel 1980 nella lista dei Patrimoni dell'umanità dell'UNESCO è stato anche inserito fra le Nuove sette meraviglie del mondo. L'anfiteatro fu edificato in epoca Flavia su un'area al limite orientale del Foro Romano. La sua costruzione, iniziata da Vespasiano nel 70 d.C., fu conclusa da Tito, che lo inaugurò il 21 aprile nell'80 d.C. Anticamente era usato per gli spettacoli dei gladiatori e altre manifestazioni pubbliche (spettacoli di caccia, battaglie navali, rievocazioni di battaglie famose e drammi basati sulla mitologia classica) Ad oggi è possibile effettuare una prenotazione per una visita guidata al suo interno al seguente link: \n https://www.getyourguide.it/roma-l33/roma-tour-di-gruppo-salta-fila-colosseo-foro-palatino-t405524/?ranking_uuid=6abbbdc6-1766-4783-b1a5-257dc030e0db \n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
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
            Image.asset('assets/images/c2.png',
                width: 400, height: 300, fit: BoxFit.cover),
          ]),
        ));
  }
}
