// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Data {
  String text;

  Data({
    required this.text,
  });
}

final List _text = [
  Data(text: "Itinerario per 1 giorno di permanenza:"),
  Data(text: "Itinerario per 2 giorni di permanenza:"),
  Data(text: "Itinerario per 3 giorni di permanenza:"),
  Data(text: "Itinerario per 5 giorni di permanenza:"),
];

class Itinerario extends StatelessWidget {
  const Itinerario({Key? key}) : super(key: key);

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
          'Scegli il tuo itinerario',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff784abc),
      ),
      body: ListView.separated(
        itemCount: 4,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text(
              _text[index].text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Itinerario1()));
                  break; // The switch statement must be told to exit, or it will execute every case.
                case 1:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Itinerario2()));
                  break;
                case 2:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Itinerario3()));
                  break;
                case 3:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Itinerario4()));
                  break;
              }
            },
            leading: Icon(Icons.map),
          );
        },
        separatorBuilder: (BuildContext context, index) => Divider(
          color: Colors.white,
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class Itinerario1 extends StatelessWidget {
  const Itinerario1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITINERARIO 1 GIORNO ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'PROVA 1 GIORNO',
            )),
      ),
    );
  }
}

class Itinerario2 extends StatelessWidget {
  const Itinerario2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITINERARIO 2 GIORNI ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'PROVA 2 GIORNI',
            )),
      ),
    );
  }
}

class Itinerario3 extends StatelessWidget {
  const Itinerario3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITINERARIO 3 GIORNI ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'PROVA 3 GIORNI',
            )),
      ),
    );
  }
}

class Itinerario4 extends StatelessWidget {
  const Itinerario4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITINERARIO 5 GIORNI ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'PROVA 5 GIORNI',
            )),
      ),
    );
  }
}
