
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Okay'),
                  action: SnackBarAction(
                    label: 'Accept',
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You are already at page 1.'),
                  ),
                );

                return;
              }

              Navigator.pushNamed(context, '/${index + 1}');
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text('Page ${index + 1}'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
