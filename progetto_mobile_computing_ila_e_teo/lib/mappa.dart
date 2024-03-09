// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mappa extends StatefulWidget {
  const Mappa({super.key});

  @override
  State<Mappa> createState() => MappaPageState();
}

class MappaPageState extends State<Mappa> {
  // Coordinate GPS di Roma Termini e Colosseo
  final LatLng RomaTermini = LatLng(41.9028, 12.4964); // Roma Termini
  final LatLng Colosseo = LatLng(41.8902, 12.4922); // Colosseo

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
                "Preferiti",
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
        title: Text('Progetto Ila e Teo'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: RomaTermini, // Centro della mappa
          initialZoom: 14.0, // Livello di zoom iniziale
        ),
        children: [
          // Aggiungi un layer di mappa OpenStreetMap
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          // Aggiungi un layer per il percorso
          PolylineLayer(
            polylines: [
              Polyline(
                points: [RomaTermini, Colosseo], // Punti del percorso
                color: Colors.blue, // Colore del percorso
                strokeWidth: 3.0, // Spessore del percorso
              ),
            ],
          ),
          // Aggiungi un marker per Roma Termini
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: RomaTermini,
                child: Icon(
                  Icons.location_on,
                  color: Colors.green,
                  size: 40.0,
                ),
              ),
              // Aggiungi un marker per il Colosseo
              Marker(
                width: 40.0,
                height: 40.0,
                point: Colosseo,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
