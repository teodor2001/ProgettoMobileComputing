// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Piazzaspagna extends StatelessWidget {
  const Piazzaspagna({super.key});
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
              'Piazza di Spagna',
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Piazzaspagna()));
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
                      builder: (context) => PiazzaSpagnaEng()));
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
                  "Piazza di Spagna, ai piedi della monumentale scalinata di ben 136 gradini che la collega con la chiesa di Trinità dei Monti, è una delle più famose di Roma. Deve il suo nome al palazzo di Spagna, sede dell'ambasciata dello Stato iberico presso la Santa Sede dal 1622. Vista dall'alto appare come la forma ad “ali di farfalla”, formata da due triangoli con il vertice in comune. Al centro della piazza vi è la nota fontana della Barcaccia, che risale al primo periodo barocco, realizzata da Pietro Bernini e da suo figlio, il più celebre Gian Lorenzo. L'8 settembre 1857 Papa Pio IX inaugurò la Colonna dell'Immacolata che presiede Piazza di Spagna in ricordo della definizione del dogma dell'Immacolata. Attualmente l'omaggio floreale di piazza di Spagna, sempre accompagnato da una preghiera mariana del Papa, è una delle cerimonie religiose più amate e popolari di Roma.",
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
                child: Image.asset('assets/images/barcaccia.png',
                    width: 450, height: 450, fit: BoxFit.cover),
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

class PiazzaSpagnaEng extends StatelessWidget {
  const PiazzaSpagnaEng({super.key});
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
              'Piazza di Spagna',
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Piazzaspagna()));
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
                      builder: (context) => PiazzaSpagnaEng()));
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
                  "Piazza di Spagna, at the foot of the monumental staircase of 136 steps that connects it to the church of Trinità dei Monti, is one of the most famous squares in Rome. It owes its name to the Spanish Embassy to the Holy See since 1622, which was formerly housed in the nearby Palazzo di Spagna. When viewed from above, it resembles the shape of 'butterfly wings', formed by two triangles with a common vertex. At the center of the square stands the famous Barcaccia Fountain, dating back to the early Baroque period, created by Pietro Bernini and his son, the renowned Gian Lorenzo. On September 8, 1857, Pope Pius IX inaugurated the Column of the Immaculate Conception overlooking Piazza di Spagna in memory of the definition of the dogma of the Immaculate Conception. Currently, the floral tribute in Piazza di Spagna, always accompanied by a Marian prayer from the Pope, is one of the most beloved and popular religious ceremonies in Rome.",
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
                child: Image.asset('assets/images/barcaccia.png',
                    width: 450, height: 450, fit: BoxFit.cover),
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
