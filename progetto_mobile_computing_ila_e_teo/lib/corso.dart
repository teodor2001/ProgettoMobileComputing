// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Corso extends StatelessWidget {
  const Corso({super.key});
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
              'Via del Corso',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                shadows: const [
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
                      .push(MaterialPageRoute(builder: (context) => Corso()));
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
                      MaterialPageRoute(builder: (context) => CorsoEng()));
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
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(75, 0, 0, 0),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: Text(
                  "Via del Corso è una nota strada storica del centro di Roma che collega piazza Venezia a piazza del Popolo e misura all'incirca 1,6 chilometri. È l'arteria centrale del complesso stradale conosciuto come Tridente. Molto famosa per essere anche la via dello shopping, presentando ambo i lati numerose proposte di negozi il tutto a pochi passi da alcune delle più importanti attrazioni di Roma. Molto consigliata nei periodi di festa dove viene abbellita con luci decorative a tema.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    shadows: const [
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
                child: Image.asset('assets/images/corso.png',
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
                child: Image.asset('assets/images/corso2.png',
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

class CorsoEng extends StatelessWidget {
  const CorsoEng({super.key});
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
              'Via del Corso',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                shadows: const [
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
                      .push(MaterialPageRoute(builder: (context) => Corso()));
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
                      MaterialPageRoute(builder: (context) => CorsoEng()));
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
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(75, 0, 0, 0),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: Text(
                  "Via del Corso is a well-known historic street in the center of Rome that connects Piazza Venezia to Piazza del Popolo and measures approximately 1.6 kilometers. It is the central artery of the road complex known as the Trident. It is very famous for also being the shopping street, with numerous shops on both sides, all within walking distance of some of Rome's most important attractions. Highly recommended during the holiday seasons when it is adorned with themed decorative lights.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    shadows: const [
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
                child: Image.asset('assets/images/corso.png',
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
                child: Image.asset('assets/images/corso2.png',
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
