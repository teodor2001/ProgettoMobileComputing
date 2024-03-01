import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

class PaginaRegistrazione extends StatefulWidget {
  const PaginaRegistrazione({super.key});

  @override
  State<PaginaRegistrazione> createState() => PaginaRegistrazioneState();
}

class PaginaRegistrazioneState extends State<PaginaRegistrazione> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _databasePath =
      ''; // Variabile per memorizzare il percorso del database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrazione'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        await _checkAndRequestPermission(context);
                        await memorizzaDati(
                          _usernameController.text,
                          _passwordController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Dati salvati con successo.'),
                          ),
                        );
                        // Aggiorna il percorso del database dopo averlo memorizzato
                        _updateDatabasePath();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Si è verificato un errore durante il salvataggio dei dati: $e',
                            ),
                          ),
                        );
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
              child:
                  _isLoading ? CircularProgressIndicator() : Text('Registrati'),
            ),
            SizedBox(height: 20),
            Text(
              'Percorso del database: $_databasePath',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkAndRequestPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        var result = await Permission.storage.request();
        if (result.isGranted) {
          // Permesso concesso
        } else if (result.isDenied) {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text('Permessi richiesti'),
                content: Text(
                  'È necessario il permesso di scrittura esterna per salvare i dati. Vuoi abilitare i permessi dall\'app impostazioni?',
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Text('Annulla'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(dialogContext).pop();
                      await AppSettings
                          .openAppSettings(); // Apre le impostazioni dell'app
                    },
                    child: Text('Impostazioni'),
                  ),
                ],
              );
            },
          );
          throw Exception('Permesso di scrittura esterna negato');
        }
      }
    }
  }

  Future<Database> creaDatabase() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String databasePath = join(appDocPath, 'databaseUtenti.db');
      return await openDatabase(databasePath, onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE utenti (
            id INTEGER PRIMARY KEY,
            email TEXT,
            password TEXT
          )
        ''');
      }, version: 1);
    } catch (e) {
      print('Errore durante l\'apertura del database: $e');
      rethrow;
    }
  }

  Future<void> memorizzaDati(String email, String password) async {
    Database database = await creaDatabase();
    await database.insert(
      'utenti',
      {'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Funzione per aggiornare il percorso del database
  Future<void> _updateDatabasePath() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String databasePath = join(appDocPath, 'databaseUtenti.db');
      setState(() {
        _databasePath = databasePath;
      });
    } catch (e) {
      print('Errore durante l\'aggiornamento del percorso del database: $e');
    }
  }
}
