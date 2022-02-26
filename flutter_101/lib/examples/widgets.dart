import 'package:flutter/material.dart';

class ExampleWidgets extends StatelessWidget {
  const ExampleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blueAccent,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
            const Text('merhaba'),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            const Text('merhaba'),

            const SizedBox(
              height: 60,
            ),

            //Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.greenAccent,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.cyan,
                ),
                const Text('merhaba'),
              ],
            ),

            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            const Text('merhaba'),

            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            const Text('merhaba'),

            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            const Text('merhaba'),

            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            const Text('merhaba'),
          ],
        ),
      ),
    );
  }
}
