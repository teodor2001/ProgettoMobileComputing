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
