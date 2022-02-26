import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  StackWidget({Key? key}) : super(key: key);

  final names = ['Mehmet Ali Günaydın', 'Alen', 'Cemre', 'Muhammet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(),
      body: Stack(
        children: [
          // Container(
          //   height: 700,
          //   color: Colors.grey,
          // ),
          // Container(
          //   height: 600,
          //   color: Colors.red,
          // ),
          // Container(
          //   height: 500,
          //   color: Colors.green,
          // ),
          // Container(
          //   color: Colors.white,
          //   height: 200,
          //   width: 200,
          //   child: ListView(
          //     children: const [
          //       Text('Muhammet'),
          //       Text('Yusuf'),
          //       Text('Alen'),
          //       Text('Merve'),
          //     ],
          //   ),
          // ),
          Center(
            child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          names[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
