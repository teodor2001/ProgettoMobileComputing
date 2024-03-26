// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, unused_field, avoid_print, use_build_context_synchronously, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'package:open_route_service/open_route_service.dart' as openrouteservice;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Mappa extends StatefulWidget {
  const Mappa({super.key});

  @override
  State<Mappa> createState() => MappaPageState();
}

class MappaPageState extends State<Mappa> {
  LatLng romaTermini = LatLng(41.9028, 12.4964);
  LatLng colosseo = LatLng(41.8902, 12.4922);
  late LatLng posIniziale = LatLng(41.9028,
      12.4964); //la uso solo per avercela inizializzata all'avvio, poi la cambio col tasto
  LatLng? posCorrente;
  // Coordinate GPS di Roma Termini e Colosseo
  final LatLng RomaTermini = LatLng(41.9028, 12.4964); // Roma Termini
  final LatLng Colosseo = LatLng(41.8902, 12.4922); // Colosseo
  LatLng? currentLocation;
  TextEditingController searchController = TextEditingController();
  String testoRicerca = '';
  bool caricamento = true;
  MapController mapContr = MapController();
  List<Marker> ListaPosizioni = [];
  List<String> ListaSuggeriti = [];
  Timer? testTimer;
  List<Polyline> ListaLinee = [];
  List<String> indicazioniStradali = [];

  @override
  void initState() {
    super.initState();
    TrovaPosCorrente();
    mapContr = MapController();
  }

  @override
  void dispose() {
    testTimer?.cancel();
    super.dispose();
  }

  Future<void> TrovaPosCorrente() async {
    final location.Location loc = location.Location();
    loc.changeSettings(
      accuracy: location.LocationAccuracy.high,
      distanceFilter: 10,
    );

    try {
      final locationData = await Future.delayed(
          Duration(milliseconds: 500), () => loc.getLocation());
      print(
          "Coordinate correnti: ${locationData.latitude}, ${locationData.longitude}");
      setState(() {
        posCorrente = LatLng(locationData.latitude!, locationData.longitude!);
        posIniziale = posCorrente!;
      });
      aggiornaSegnalini(posCorrente, null);
      mapContr.move(posCorrente!, 14.0);
    } catch (error) {
      print("Errore durante il caricamento della posizione: $error");
    }
  }

  Future<void> Ricerca(String query) async {
    if (query.isEmpty) return;

    setState(() {
      caricamento = true;
    });

    try {
      await Future.delayed(Duration(
          milliseconds: 500)); // c'è un delay così ha tempo di caricare
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        setState(() {
          posCorrente = LatLng(locations[0].latitude, locations[0].longitude);
          caricamento = false;
        });
        aggiornaSegnalini(posCorrente, posCorrente);
        mapContr.move(posCorrente!, 14.0);
        if (posCorrente != null) {
          DisegnaLinee(context, posCorrente!, posIniziale);
        }
      } else {
        setState(() {
          caricamento = false;
        });
      }
    } catch (error) {
      print("Errore durante la ricerca della posizione: $error");
      setState(() {
        caricamento = false;
      });
    }
  }

  Future<void> DisegnaLinee(
      BuildContext context, LatLng? startPoint, LatLng? endPoint) async {
    try {
      if (startPoint == null || endPoint == null) {
        throw Exception("StartPoint or endPoint is null");
      }

      String apiKey =
          '5b3ce3597851110001cf624823ec268f418c407abc8438a6c65a8179';
      String url =
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${startPoint.longitude},${startPoint.latitude}&end=${endPoint.longitude},${endPoint.latitude}';
      print('URL della richiesta: $url');

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        print('Risposta: $responseData');

        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = json.decode(response.body);
          List<dynamic> features = responseData['features'];
          if (features.isNotEmpty) {
            List<dynamic> coordinates = features[0]['geometry']['coordinates'];
            List<LatLng> polylinePoints = coordinates.map((coord) {
              double lat = coord[1];
              double lng = coord[0];
              return LatLng(lat, lng);
            }).toList();

            //DA IMPLEMENTARE LA PARTE PER LE INDICAZIONI
            List<dynamic> steps =
                features[0]['properties']['segments'][0]['steps'];
            List<String> istruzioni = steps.map<String>((step) {
              return step['instruction'] as String;
            }).toList();
            setState(() {
              ListaLinee.clear();
              ListaLinee.add(
                Polyline(
                  points: polylinePoints,
                  strokeWidth: 3,
                  color: Colors.blue,
                ),
              );
              indicazioniStradali = istruzioni;
            });
          } else {
            GestioneErrori(context, "Non è stato trovato un percorso");
          }
        } else {
          GestioneErrori(
              context, "La risposta non contiene informazioni sul percorso");
        }
      } else {
        GestioneErrori(context,
            "Caricamento del percorso non riuscito: ${response.reasonPhrase}");
      }
    } catch (error) {
      GestioneErrori(
          context, "Errore durante l'individuazione del percorso: $error");
    }
  }

  void GestioneErrori(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void aggiornaSegnalini(LatLng? userLocation, LatLng? searchedLocation) {
    /*  if (userLocation != null && searchedLocation != null) {
      ListaPosizioni.clear();
      }*/
    if (userLocation != null) {
      ListaPosizioni.add(
        Marker(
          width: 40.0,
          height: 40.0,
          point: userLocation,
          child: Icon(
            Icons.location_on,
            color: Colors.green,
            size: 40.0,
          ),
        ),
      );
    }
    if (searchedLocation != null) {
      ListaPosizioni.add(
        Marker(
          width: 40.0,
          height: 40.0,
          point: searchedLocation,
          child: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40.0,
          ),
        ),
      );
    }
  }

  void suggerimentiBarraRicerca(String query) {
    if (testTimer?.isActive ?? false) testTimer?.cancel();
    testTimer = Timer(const Duration(milliseconds: 500), () {
      if (query.length >= 3) {
        setState(() {
          caricamento = true;
        });
        recuperaSuggeriti(query);
      }
    });
  }

  Future<void> recuperaSuggeriti(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      List<Placemark> placemarks = await placemarkFromCoordinates(
        locations[0].latitude,
        locations[0].longitude,
      );
      setState(() {
        ListaSuggeriti =
            placemarks.map((placemark) => placemark.name ?? '').toList();
        caricamento = false;
      });
    } catch (error) {
      print("Errore durante la ricerca dei suggerimenti: $error");
      setState(() {
        ListaSuggeriti = [];
        caricamento = false;
      });
    }
  }

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
        title: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.white),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                testoRicerca = value;
              });
              suggerimentiBarraRicerca(value);
            },
            decoration: InputDecoration(
              hintText: "Cerca qui il tuo luogo di interesse",
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Ricerca(searchController.text);
            },
          ),
        ],
      ),
body: Stack(
        children: [
          Column(
            children: [
              if (ListaSuggeriti.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: ListaSuggeriti.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(ListaSuggeriti[index]),
                        onTap: () {
                          Ricerca(ListaSuggeriti[index]);
                          searchController.text = ListaSuggeriti[index];
                          setState(() {
                            ListaSuggeriti.clear();
                          });
                        },
                      );
                    },
                  ),
                ),
              Expanded(
                flex: 2,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: posCorrente ?? posIniziale,
                    initialZoom: 14.0,
                    onPositionChanged: (position, hasGesture) {
                      if (!hasGesture) {
                        aggiornaSegnalini(posCorrente, posCorrente);
                      }
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: ListaPosizioni,
                    ),
                    PolylineLayer(
                      polylines: ListaLinee,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
              alignment:
                  Alignment.bottomCenter,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal,
                itemCount: indicazioniStradali.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        right: 10.0),
                    child: Chip(
                      label: Text(indicazioniStradali[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TrovaPosCorrente();
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}
