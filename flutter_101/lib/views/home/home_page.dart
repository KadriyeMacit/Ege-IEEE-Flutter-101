import 'package:flutter/material.dart';
import 'package:flutter_101/views/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = [
    'Matematik',
    'Fizik',
    'Veri Yapıları',
    'Algoritmalar',
    'Yapay Zeka',
    'Mobil Programlama',
    'Kimya',
    'Biyoloji',
    'Beden Eğitimi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Anasayfa',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _buildBody(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => _listOnTap(context, index),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(notes[index]),
                ),
              ),
            );
          }),
    );
  }

  Future _listOnTap(BuildContext context, int index) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Silmek istediğinize emin misiniz?'),
          content: Text(notes[index]),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Evet'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hayır'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Kadriye'),
            accountEmail: Text('kadriye@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
            ),
          ),
          _buildListTile('Anasayfa', Icons.home),
          const Divider(
            color: Colors.indigo,
          ),
          _buildListTile('Profil', Icons.person),
          const Divider(
            color: Colors.indigo,
          ),
          _buildListTile('Ayarlar', Icons.settings),
          const Divider(
            color: Colors.indigo,
          ),
          _buildListTile('Çıkış yap', Icons.logout),
        ],
      ),
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.pop(context);
  }

  void _goToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(),
      ),
    );
  }

  Widget _buildListTile(String text, IconData icon) {
    return ListTile(
      onTap: () {
        _goToSettings(context);
      },
      title: Text(text),
      // subtitle: Text('kadriyemacit@gmail.com'),
      leading: Icon(
        icon,
        color: Colors.indigo,
      ),
      trailing: const Icon(
        Icons.arrow_forward,
        color: Colors.indigo,
      ),
    );
  }
}
