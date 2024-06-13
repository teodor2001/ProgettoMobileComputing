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
            'Cucina Romana',
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
              text:
                  '\nCarbonara\n Un primo piatto condito con uova, guanciale o pancetta, pecorino romano e pepe nero.',
            ),
            ImageTile(
              imageAsset: 'assets/images/amatriciana.jpg',
              text:
                  '\nAmatriciana\n Un primo piatto condito con sugo a base di pomodoro, guanciale, pecorino romano e pepe nero. ',
            ),
            ImageTile(
              imageAsset: 'assets/images/cacio.jpg',
              text:
                  '\nCacio e pepe\n Un primo piatto condito con formaggio pecorino romano e pepe nero macinato fresco.',
            ),
            ImageTile(
              imageAsset: 'assets/images/suppli.jpg',
              text:
                  '\nSupplì\nComposto da riso, sugo di pomodoro, mozzarella e carne tritata. Il riso viene modellato in forma di palla, farcito con il formaggio e il condimento, quindi impanato e fritto fino a ottenere una crosta croccante dorata.',
            ),
            ImageTile(
              imageAsset: 'assets/images/carciofo.jpg',
              text:
                  '\nCarciofo alla giudia\nCarciofi interi puliti delle foglie esterne più dure, poi fritti in olio bollente finché non diventano dorati e croccanti, durante la quale si aprono come un fiore.',
            ),
            ImageTile(
              imageAsset: 'assets/images/trippa.jpg',
              text:
                  '\nTrippa\n Stomaco di bovino cucinato in una salsa a base di pomodoro, cipolla, carota, sedano e aromi vari come alloro e pepe nero.',
            ),
            ImageTile(
              imageAsset: 'assets/images/saltimbocca.jpg',
              text:
                  '\nSaltimbocca\n Sottili fettine di vitello avvolte in una foglia di salvia fresca e una fetta di prosciutto crudo, e quindi infilate con uno stecchino per tenerle insieme.',
            ),
            ImageTile(
              imageAsset: 'assets/images/vaccinara.jpg',
              text:
                  '\nCoda alla vaccinara\n Coda di bue, che viene brasata a lungo in una salsa a base di pomodoro, sedano, carote, cipolle, vino rosso e aromi come chiodi di garofano e cannella.',
            ),
            ImageTile(
              imageAsset: 'assets/images/porchetta.jpg',
              text:
                  "\nPorchetta\n Maiale intero disossato, farcito con una miscela di erbe aromatiche, aglio, sale, pepe e altri condimenti, arrotolato e cotto lentamente fino a ottenere una crosta croccante e dorate e tenera e succosa all'interno.\n",
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
                child: Image.asset(
                  imageAsset,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )),
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
            "Roman cuisine",
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
              text:
                  '\nCarbonara\n A first course dressed with eggs, guanciale or pancetta, pecorino romano cheese, and black pepper.',
            ),
            ImageTile(
              imageAsset: 'assets/images/amatriciana.jpg',
              text:
                  '\nAmatriciana\nA first course dressed with a tomato-based sauce, guanciale, pecorino romano cheese, and black pepper. ',
            ),
            ImageTile(
              imageAsset: 'assets/images/cacio.jpg',
              text:
                  '\nCacio e pepe\n A first course dressed with pecorino romano cheese and freshly ground black pepper.',
            ),
            ImageTile(
              imageAsset: 'assets/images/suppli.jpg',
              text:
                  '\nSupplì\n Composed of rice, tomato sauce, mozzarella cheese, and minced meat. The rice is shaped into a ball, stuffed with cheese and seasoning, then breaded and fried until golden and crispy crust is obtained.',
            ),
            ImageTile(
              imageAsset: 'assets/images/carciofo.jpg',
              text:
                  '\nCarciofo alla giudia\n Whole artichokes cleaned of the toughest outer leaves, then fried in hot oil until they become golden and crispy, during which they open up like a flower.',
            ),
            ImageTile(
              imageAsset: 'assets/images/trippa.jpg',
              text:
                  '\nTrippa\nBeef stomach cooked in a sauce based on tomato, onion, carrot, celery, and various spices such as bay leaf and black pepper. ',
            ),
            ImageTile(
              imageAsset: 'assets/images/saltimbocca.jpg',
              text:
                  '\nSaltimbocca\nThin slices of veal wrapped in a fresh sage leaf and a slice of raw ham, then secured with a toothpick.',
            ),
            ImageTile(
              imageAsset: 'assets/images/vaccinara.jpg',
              text:
                  '\nCoda alla vaccinara\nBeef tail, which is braised for a long time in a sauce made of tomato, celery, carrots, onions, red wine, and spices such as cloves and cinnamon.',
            ),
            ImageTile(
              imageAsset: 'assets/images/porchetta.jpg',
              text:
                  '\nPorchetta\n Whole boneless pork, stuffed with a mixture of aromatic herbs, garlic, salt, pepper, and other seasonings, rolled and slowly cooked until obtaining a crispy golden crust outside and tender and juicy inside.\n',
            ),
          ],
        ));
  }
}
