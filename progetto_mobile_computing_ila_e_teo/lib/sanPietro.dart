// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Sanpietro extends StatelessWidget {
  const Sanpietro({Key? key}) : super(key: key);
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
            'San Pietro',
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
              child: Container(
                padding:
                    EdgeInsets.all(30.0), // padding intorno al testo nel box
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  "La basilica di San Pietro in Vaticano, ufficialmente papale basilica maggiore di San Pietro in Vaticano, è una basilica cattolica ubicata in Piazza San Pietro nello stato della Città del Vaticano; è un capolavoro dell'arte italiana e uno dei simboli di Roma, di cui domina il panorama con la sua cupola. È indicata come la più grande chiesa del mondo sia per le sue dimensioni sia, metaforicamente, per la sua importanza come centro del cattolicesimo, nonché Patrimonio dell'umanità UNESCO denominato Città del Vaticano e istituito nel 1984. La sistemazione della piazza fu realizzata da Gian Lorenzo Bernini, di forma ovale con l'imponente colonnato architravato sormontato da sculture. La basilica di San Pietro vanta una lunghezza di ben 218 metri e un’altezza fino alla cupola 132,30 metri, la superficie totale è di circa 23 000 metri quadrati e può contenere 60 000 fedeli. L'edificio è interamente percorribile lungo il suo perimetro, attraverso cui possiamo accedere anche agli adiacenti Musei Vaticani, i quali sono ogni giorno visitati ogni giorno da migliaia di turisti, in particolare per il famoso affresco di Michelangelo nella cappella Sistina. Vi suggeriamo di effettuare una visita guidata per poter esplorare al meglio questi ambienti e lasciarsi trasportare dalla spiegazione di una guida qualificata. Al seguente link: \n “https://www.getyourguide.it/musei-vaticani-l2738/evita-la-coda-musei-vaticani-e-cappella-sistina-t62214/?ranking_uuid=36d76887-65eb-48f8-bfbd-73c8ecf1f747” ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0),
              child: SizedBox(
                height: 5,
                width: 5,
              ),
            ),
            Image.asset('assets/images/sanp.png',
                width: 400, height: 450, fit: BoxFit.cover),
            Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 5,
                  width: 5,
                )),
            Image.asset('assets/images/sistina.png',
                width: 400, height: 300, fit: BoxFit.cover),
          ]),
        ));
  }
}
