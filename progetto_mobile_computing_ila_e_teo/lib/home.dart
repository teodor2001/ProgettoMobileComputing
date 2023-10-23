// ignore_for_file: prefer_const_constructors, duplicate_ignore
//prova
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
                onTap: () => Navigator.pushNamed(context, '/'),
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
            'Guida turistica Roma',
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: larghezza * 0.05,
                  width: altezza * 0.05,
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/attrazioni');
                  },
                  child: Image.asset('assets/images/menu.png',
                      width: 400, height: 300, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  height: 10,
                  width: 20,
                ),
              ),
              Center(
                child: Text(
                  "Benvenuto, \nquesta guida ti permetterà di scoprire le bellezze di questa città, di orientarti e trovare l'itinerario perfetto per te in base ai tuoi interessi.\nTi daremo tutte le informazioni utili che \ndevi sapere prima di venire qui, in modo da goderti a pieno la tua esperienza!!",
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
              Image.asset('assets/images/botton1.png',
                  width: 400, height: 300, fit: BoxFit.cover),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/attrazioni');
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 46, 221),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  'Clicca qui per fare un tour della attrazioni',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    background: Paint()
                      ..color = Color.fromARGB(255, 92, 46, 221)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset('assets/images/botton2.png',
                  width: 400, height: 300, fit: BoxFit.cover),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/itinerario');
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 46, 221),
                    textStyle: const TextStyle(
                        fontSize: 24, fontStyle: FontStyle.italic)),
                child: Text(
                  "Clicca qui per scegliere l'itinerario perfetto per te",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    background: Paint()
                      ..color = Color.fromARGB(255, 92, 46, 221)
                      ..style = PaintingStyle.fill,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
