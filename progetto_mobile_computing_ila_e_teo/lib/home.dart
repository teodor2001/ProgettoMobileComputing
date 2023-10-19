// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);
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
              onTap: () => Navigator.pushNamed(context, '/') ,
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
          'Guida turistica Roma',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff784abc),
      ),
      body: Column(
        children: [
                    Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: SizedBox(
              height: larghezza*0.05,
              width: altezza*0.05,
            ),
          ),
          Material(
        child: InkWell(
          onTap: () {
                Navigator.pushNamed(context, '/attrazioni');
              },
              child: Image.asset('assets/images/menu.png',
                  width: larghezza*0.50, height: altezza*0.50,
                  fit:BoxFit.cover),

        ),
    ),
              Padding(
  padding: EdgeInsets.only(left: 16.0, top: 8.0),
  child: SizedBox(
    height: 100,
    width: 100,
  ),
),
          Center(
            child: Text(
              "Benvenuto, \nquesta guida ti permetterà di scoprire le bellezze di questa città, a orientarti e trovare l'itinerario perfetto per te in base ai tuoi interessi.\nTi daremo tutte le informazioni utili che devi sapere prima di venire qui, in modo da goderti a pieno la tua esperienza!!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
  padding: EdgeInsets.only(left: 16.0, top: 8.0),
  child: SizedBox(
    height: 100,
    width: 100,
  ),
),
                  TextButton(
  onPressed: () { Navigator.pushNamed(context, '/attrazioni');},
  child: Text('Clicca qua per fare un tour della attrazioni'),
)
        ],
      ),
    );
  }
}
