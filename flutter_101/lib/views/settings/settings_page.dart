import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool voiceValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Ayarlar',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body:
          //WebView(initialUrl: 'https://ege.edu.tr'),
          _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          _buildSwitch(),
          _buildEmail(),
        ],
      ),
    );
  }

  Widget _buildSwitch() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Ses ayarları'),
            Switch(
                value: voiceValue,
                onChanged: (value) {
                  setState(() {
                    voiceValue = value;
                  });
                })
          ],
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Vecdi Aytaç'),
            IconButton(
              onPressed: () {
                // _sendToEmail();
                _launchInWebViewWithJavaScript();
              },
              icon: const Icon(
                Icons.email,
                color: Colors.indigo,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _sendToEmail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: 'vecdi@gmail.com',
    );
    await launch(launchUri.toString());
  }

  Future<void> _launchInWebViewWithJavaScript() async {
    if (!await launch(
      'https://ege.edu.tr',
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) {
      throw 'Could not launch https://ege.edu.tr';
    }
  }
}
