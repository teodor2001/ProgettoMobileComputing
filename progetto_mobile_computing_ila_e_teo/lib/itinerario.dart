// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  Data(text: "Itinerario per 4 giorni di permanenza:"),
];

class Itinerario extends StatelessWidget {
  const Itinerario({super.key});

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
          'Scegli il tuo itinerario',
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
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      backgroundColor: Color.fromARGB(255, 196, 165, 242),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/colosseo');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Colosseo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fori');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fori imperiali',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/altare');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Altare della Patria',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/corso');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Via del Corso',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fontana');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fontana di Trevi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Image.asset('assets/images/mappa1.jpg',
                  width: 400, height: 400, fit: BoxFit.cover),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mappa');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Clicca qui per consultare la mappa',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
                title: Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 8.0),
                    child: SizedBox(
                      height: 15,
                      width: 5,
                    ))),
          ],
        ),
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
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      backgroundColor: Color.fromARGB(255, 196, 165, 242),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'PRIMO GIORNO:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/colosseo');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Colosseo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fori');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fori imperiali',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/altare');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Altare della Patria',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/corso');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Via del Corso',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fontana');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fontana di Trevi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'SECONDO GIORNO',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pspagna');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza di Spagna',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/navona');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza Navona',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/piazza');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza del Popolo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Image.asset('assets/images/mappa1.jpg',
                  width: 400, height: 400, fit: BoxFit.cover),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mappa');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Clicca qui per consultare la mappa',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
                title: Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 8.0),
                    child: SizedBox(
                      height: 15,
                      width: 5,
                    ))),
          ],
        ),
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
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      backgroundColor: Color.fromARGB(255, 196, 165, 242),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'PRIMO GIORNO',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/colosseo');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Colosseo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fori');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fori imperiali',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/altare');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Altare della Patria',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/corso');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Via del Corso',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fontana');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fontana di Trevi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'SECONDO GIORNO',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pspagna');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza di Spagna',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/navona');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza Navona',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/piazza');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza del Popolo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'TERZO GIORNO',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sanPietro');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'San Pietro',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/castel');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Castel Sant Angelo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Image.asset('assets/images/mappa1.jpg',
                  width: 400, height: 400, fit: BoxFit.cover),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mappa');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Clicca qui per consultare la mappa',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
                title: Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 8.0),
                    child: SizedBox(
                      height: 15,
                      width: 5,
                    ))),
          ],
        ),
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
        title: const Text('ITINERARIO 4 GIORNI ',
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
            )),
        centerTitle: true,
        backgroundColor: Color(0xff784abc),
      ),
      backgroundColor: Color.fromARGB(255, 196, 165, 242),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/colosseo');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Colosseo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fori');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fori imperiali',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/altare');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Altare della Patria',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/corso');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Via del Corso',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fontana');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Fontana di Trevi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
                title: Text(
              'SECONDO GIORNO',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pspagna');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza di Spagna',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/navona');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza Navona',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/piazza');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Piazza del Popolo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'TERZO GIORNO',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sanPietro');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'San Pietro',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/castel');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Castel Sant Angelo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'QUARTO GIORNO',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/villa');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Villa Borghese',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Image.asset('assets/images/mappa1.jpg',
                  width: 400, height: 400, fit: BoxFit.cover),
            ),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mappa');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff784abc),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Clicca qui per consultare la mappa',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    background: Paint()
                      ..color = Color(0xff784abc)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
                title: Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 8.0),
                    child: SizedBox(
                      height: 15,
                      width: 5,
                    ))),
          ],
        ),
      ),
    );
  }
}
