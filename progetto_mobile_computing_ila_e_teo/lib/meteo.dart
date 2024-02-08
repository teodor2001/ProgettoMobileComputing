// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_progetto_ila_e_teo/costanti.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

//PRIMA PROVA DI IMPLETENAZIONE DELLE API DEL METEO
class Meteo extends StatefulWidget {
  const Meteo({super.key});

  @override
  State<Meteo> createState() => MeteoPageState();
}

class MeteoPageState extends State<Meteo> {
  final WeatherFactory meteo = WeatherFactory(Chiave_API_Meteo);
  Weather?
      infometeo; //conterrà le informazioni che riguardano il meteo di un X luogo

  @override
  void initState() {
    super.initState();
    meteo.currentWeatherByCityName("Rome").then((w) {
      setState(() {
        infometeo = w; //salva lo stato del meteo di Roma dentro a infometeo
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('METEO ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
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
    return SizedBox(
      //costruisce una pagina che contiene le informazioni relative a luogo data meteo ecc
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
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
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget InfoData() {
    DateTime infocorrente = infometeo!
        .date!; //vado a prevelare i dati del preciso momento in cui questo widget viene chiamato
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(infocorrente),
          style: const TextStyle(
            fontSize: 35,
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
              DateFormat("EEEE").format(infocorrente),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "  ${DateFormat("d.m.y").format(infocorrente)}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
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
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget Temperatura() {
    return Text("${infometeo?.temperature?.celsius?.toStringAsFixed(0)} °C",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 90,
          fontWeight: FontWeight.w500,
        ));
  }

  Widget InfoExtra() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: MediaQuery.sizeOf(context).width * 0.80,
      decoration: BoxDecoration(color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(20),
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
              Text("Max: ${infometeo?.tempMax?.celsius?.toStringAsFixed(0)} °C",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              ),
              Text(
                "Min: ${infometeo?.tempMin?.celsius?.toStringAsFixed(0)} °C",
                style: const TextStyle(
                  color: Colors.white,
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "Umidità: ${infometeo?.humidity?.toStringAsFixed(0)} %",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}