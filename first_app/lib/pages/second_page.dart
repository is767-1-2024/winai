
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  final List<String> entries = <String>['AA', 'BB', 'CC', 'DD', 'EE', 'GG', 'FF'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100, 600];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Second Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pushNamed(context, '/3');
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 200.0,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Text('Item ${entries[index]}'),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}