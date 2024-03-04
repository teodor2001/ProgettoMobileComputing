// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Data {
  String image;
  String text;

  Data({
    required this.image,
    required this.text,
  });
}

final List _photos = [
  Data(image: "assets/images/menu.png", text: "Colosseo"),
  Data(image: "assets/images/fontanaTrevi.png", text: "Fontana di Trevi"),
  Data(image: "assets/images/altarePatria.png", text: "Altare della Patria"),
  Data(image: "assets/images/piazzaPopolo.png", text: "Piazza del popolo"),
  Data(image: "assets/images/piazzaNavona.png", text: "Piazza Navona"),
  Data(image: "assets/images/sanPietro.png", text: "San Pietro"),
  Data(
      image: "assets/images/piazzaSpagna.png",
      text: "Piazza di Spagna e la Barcaccia"),
  Data(image: "assets/images/foriImperiali.png", text: "Fori Imperiali"),
  Data(image: "assets/images/angelo.png", text: "Caste Sant'Angelo"),
  Data(image: "assets/images/viaCorso.png", text: "Via del corso"),
];

class Attrazioni extends StatelessWidget {
  const Attrazioni({super.key});

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
              leading:
                  const Icon(Icons.home_filled, color: Colors.white, size: 30),
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
              leading: const Icon(Icons.logout, color: Colors.white, size: 30),
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
          'Le attrazioni più amate',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
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
      body: GridView.builder(
          itemCount: _photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, '/colosseo');
                        break; // The switch statement must be told to exit, or it will execute every case.
                      case 1:
                        Navigator.pushNamed(context, '/fontana');
                        break;
                      case 2:
                        Navigator.pushNamed(context, '/altare');
                        break;
                      case 3:
                        Navigator.pushNamed(context, '/piazza');
                        break;
                      case 4:
                        Navigator.pushNamed(context, '/navona');
                        break;
                      case 5:
                        Navigator.pushNamed(context, '/sanpietro');
                        break;
                      case 6:
                        Navigator.pushNamed(context, '/pspagna');
                        break;
                      case 7:
                        Navigator.pushNamed(context, '/fori');
                        break;
                      case 8:
                        Navigator.pushNamed(context, '/castel');
                        break;
                      case 9:
                        Navigator.pushNamed(context, '/corso');
                        break;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(_photos[index].image),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, '/colosseo');
                        break; // The switch statement must be told to exit, or it will execute every case.
                      case 1:
                        Navigator.pushNamed(context, '/fontana');
                        break;
                      case 2:
                        Navigator.pushNamed(context, '/altare');
                        break;
                      case 3:
                        Navigator.pushNamed(context, '/piazza');
                        break;
                      case 4:
                        Navigator.pushNamed(context, '/navona');
                        break;
                      case 5:
                        Navigator.pushNamed(context, '/sanpietro');
                        break;
                      case 6:
                        Navigator.pushNamed(context, '/pspagna');
                        break;
                      case 7:
                        Navigator.pushNamed(context, '/fori');
                        break;
                      case 8:
                        Navigator.pushNamed(context, '/castel');
                        break;
                      case 9:
                        Navigator.pushNamed(context, '/corso');
                        break;
                    }
                  },
                  child: Text(
                    _photos[index].text,
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
                ),
              ],
            );
          }),
    );
  }
}
