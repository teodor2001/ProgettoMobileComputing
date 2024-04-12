// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Mangiare extends StatelessWidget {
  const Mangiare({super.key});

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
              const Divider(
                color: Colors.white,
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
            'Piatti tipici romani',
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
                    .push(MaterialPageRoute(builder: (context) => Mangiare()));
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
                    MaterialPageRoute(builder: (context) => MangiareEn()));
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            ImageTile(
              imageAsset: 'assets/images/carbo.png',
              text: 'Carbonara',
            ),
            ImageTile(
              imageAsset: 'assets/images/amatriciana.jpg',
              text: 'Amatriciana',
            ),
            ImageTile(
              imageAsset: 'assets/images/cacio.jpg',
              text: 'Cacio e pepe',
            ),
            ImageTile(
              imageAsset: 'assets/images/suppli.jpg',
              text: 'Supplì',
            ),
            ImageTile(
              imageAsset: 'assets/images/carciofo.jpg',
              text: 'Carciofo alla giudia',
            ),
            ImageTile(
              imageAsset: 'assets/images/trippa.jpg',
              text: 'Trippa',
            ),
            ImageTile(
              imageAsset: 'assets/images/saltimbocca.jpg',
              text: 'Saltimbocca',
            ),
            ImageTile(
              imageAsset: 'assets/images/vaccinara.jpg',
              text: 'Coda alla vaccinara',
            ),
            ImageTile(
              imageAsset: 'assets/images/porchetta.jpg',
              text: 'Porchetta',
            ),
            // Aggiungi altri ImageTile se necessario
          ],
        ));
  }
}

class ImageTile extends StatelessWidget {
  final String imageAsset;
  final String text;

  const ImageTile({
    required this.imageAsset,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 4.0), // Aggiunge spazio verticale tra le immagini
        child: ListTile(
            title: Column(children: [
          Image.asset(
            imageAsset,
            width: 300,
            height: 300,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
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
        ])));
  }
}

class MangiareEn extends StatelessWidget {
  const MangiareEn({super.key});
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
              const Divider(
                color: Colors.white,
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
            "Typical Roman dishes",
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
                    .push(MaterialPageRoute(builder: (context) => Mangiare()));
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
                    MaterialPageRoute(builder: (context) => MangiareEn()));
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            ImageTile(
              imageAsset: 'assets/images/carbo.png',
              text: 'Carbonara',
            ),
            ImageTile(
              imageAsset: 'assets/images/amatriciana.jpg',
              text: 'Amatriciana',
            ),
            ImageTile(
              imageAsset: 'assets/images/cacio.jpg',
              text: 'Cacio e pepe',
            ),
            ImageTile(
              imageAsset: 'assets/images/suppli.jpg',
              text: 'Supplì',
            ),
            ImageTile(
              imageAsset: 'assets/images/carciofo.jpg',
              text: 'Carciofo alla giudia',
            ),
            ImageTile(
              imageAsset: 'assets/images/trippa.jpg',
              text: 'Trippa',
            ),
            ImageTile(
              imageAsset: 'assets/images/saltimbocca.jpg',
              text: 'Saltimbocca',
            ),
            ImageTile(
              imageAsset: 'assets/images/vaccinara.jpg',
              text: 'Coda alla vaccinara',
            ),
            ImageTile(
              imageAsset: 'assets/images/porchetta.jpg',
              text: 'Porchetta',
            ),
          ],
        ));
  }
}
