import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xff784abc),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Sviluppatori App"),
                accountEmail: Text("ilariapuliani@libero.it, teo")),
            ListTile(
              onTap: () => null,
              leading: Icon(Icons.home_filled, color: Colors.white, size: 30),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(Icons.favorite, color: Colors.white, size: 30),
              title: Text(
                "Favorite",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(Icons.notifications, color: Colors.white, size: 30),
              title: Text(
                "Notifiche",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(Icons.settings, color: Colors.white, size: 30),
              title: Text(
                "Impostazioni",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(Icons.logout, color: Colors.white, size: 30),
              title: Text(
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
        title: Text('Side Menu'),
        backgroundColor: Color(0xff784abc),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    home:
    const SideBarMenu();
    return Scaffold(
      appBar: AppBar(
        title: Text('Benvenuto'),
      ),
      body: Center(
        child: Text('Prova'),
      ),
    );
  }
}
