// ignore_for_file: prefer_const_constructors

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
  const Attrazioni({Key? key}) : super(key: key);

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
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff784abc),
      ),
      body: GridView.builder(
          itemCount: _photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
          itemBuilder: (context, index) {
            return Column(
              children: [
                          Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8.0),
                  child: SizedBox(
                    height: altezza*0.01,
                    width: larghezza*0.01,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height:  altezza*0.75,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(_photos[index].image),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(_photos[index].text, style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,)),
              ],
            );
          }),
    );
  }
}
