// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_progetto_ila_e_teo/costanti.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

//PRIMA PROVA DI IMPLETENAZIONE DELLE API DEL METEO
class Meteo extends StatefulWidget {
  const Meteo({super.key});

  @override
  State<Meteo> createState() => MeteoPageState();
}

class MeteoPageState extends State<Meteo> {
  DateTime tempoCorrente = DateTime.now();
  late Timer timer;
  final WeatherFactory meteo =
      WeatherFactory(Chiave_API_Meteo, language: Language.ITALIAN);
  Weather? infometeo;

  @override
  void initState() {
    super.initState();
    // Il timer riaggiorna la data corrente ogni secondo per tenere conto dell'ora giusta
    timer = Timer.periodic(Duration(seconds: 1), AggiornaTempo);
    initializeDateFormatting('it_IT', null);
    meteo.currentWeatherByCityName("Roma").then((w) {
      setState(() {
        infometeo = w; //salva lo stato del meteo di Roma dentro a infometeo
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 188, 160, 230),
      //backgroundColor: sceltaSfondo(infometeo!.weatherConditionCode ?? 0),
      appBar: AppBar(
        title:Text('METEO ',
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
        backgroundColor: const Color(0xff784abc),
      ),
      body: costruisciMeteo(),
    );
  }

  Widget costruisciMeteo() {
    if (infometeo == null) {
      return const Center(
        child:
            CircularProgressIndicator(), //serve per far comparire una schermata di caricamento in caso i dati non siano ancora stati caricati correttamente
      );
    }
    return Container(
      //costruisce una pagina che contiene le informazioni relative a luogo data meteo ecc
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: immagineSfondo(infometeo!.weatherConditionCode ?? 0),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //aggiunge le informazioni che ci interessano relative al luogo
          Luogo(),
          SizedBox(
            //le sized box le usiamo come separatori per creare un po' di spazio tra gli elementi
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          InfoData(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          IconaMeteo(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Temperatura(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          InfoExtra(),
        ],
      ),
    );
  }

  Widget Luogo() {
    return Text(
      infometeo?.areaName ?? "",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0)
      ),
    );
  }

  Widget InfoData() {
    DateTime infocorrente = infometeo!
        .date!; //vado a prevelare i dati del preciso momento in cui questo widget viene chiamato
    return Column(
      children: [
        Text(
          DateFormat("H:mm").format(tempoCorrente),
          style: TextStyle(
            fontSize: 35,
            color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0)
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE", 'it').format(infocorrente),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0)
              ),
            ),
            Text(
              "  ${DateFormat("yMMMMd", 'it').format(infocorrente)}",
              style: TextStyle(
              fontWeight: FontWeight.w400,
              color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0)
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget IconaMeteo() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://openweathermap.org/img/wn/${infometeo?.weatherIcon}@4x.png"))),
        ),
        Text(
          infometeo?.weatherDescription ?? "",
          style: TextStyle(
            color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0),
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget Temperatura() {
    return Text("${infometeo?.temperature?.celsius?.toStringAsFixed(0)} °C",
        style: TextStyle(
          color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0),
          fontSize: 90,
          fontWeight: FontWeight.w500,
        ));
  }

  Widget InfoExtra() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: MediaQuery.sizeOf(context).width * 0.80,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Temp Max: ${infometeo?.tempMax?.celsius?.toStringAsFixed(0)} °C",
                style: TextStyle(
                  fontSize: 15,
                  color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0)
                ),
              ),
              Text(
                "Temp Min: ${infometeo?.tempMin?.celsius?.toStringAsFixed(0)} °C",
                style: TextStyle(
                color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0),
                fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Vento: ${infometeo?.windSpeed?.toStringAsFixed(0)} m/s",
                style: TextStyle(
                  color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0),
                  fontSize: 15,
                ),
              ),
              Text(
                "Umidità: ${infometeo?.humidity?.toStringAsFixed(0)} %",
                style: TextStyle(
                  color: sceltaSfondo(infometeo?.weatherConditionCode ?? 0),
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void AggiornaTempo(Timer timer) {
    setState(() {
      // RIlegge l'ora atualizzandola a quella corrente
      tempoCorrente = DateTime.now();
    });
  }

  Color sceltaSfondo(int codiceMeteo) {
    switch (codiceMeteo ~/ 100) {
      case 2: // Tempesta
        return Colors.purple;
      case 3: // Leggera Pioggia
        return Colors.lightBlue;
      case 5: // Pioggia
        return Colors.blue;
      case 6: // Neve
        return Colors.white;
      case 7: // Nebbioso
        return Colors.grey;
      case 8: // Sereno e leggermente nuvoloso
        if (codiceMeteo == 800) {
          return Colors.yellow;
        } else {
          return Colors.orange;
        }
      default: //normale
        return Colors.white;
    }
  }

  AssetImage immagineSfondo(int? weatherCode) {
    switch (weatherCode! ~/ 100) {
      case 2: // Tempesta
        return AssetImage('assets/images/Tempesta.jpg');
      case 3: // Leggera pioggia
        return AssetImage('assets/images/Tempesta.jpg');
      case 5: // Pioggia
        return AssetImage('assets/images/Tempesta.jpg');
      case 6: // Neve
        return AssetImage('assets/images/Tempesta.jpg');
      case 7: // Nebbioso
        return AssetImage('assets/images/Tempesta.jpg');
      case 8: // Sereno o leggermente nuvoloso
        if (weatherCode == 800) {
          return AssetImage('assets/images/Tempesta.jpg');
        } else {
          return AssetImage('assets/images/Tempesta.jpg');
        }
      default:
        return AssetImage('assets/images/Tempesta.jpg');
    }
  }
}
