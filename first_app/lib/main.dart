import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/1',
      routes: {
        '/1': (context) => FirstPage(),
        '/2': (context) => SecondPage(),
        '/3': (context) => ThirdPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NameCard(),
            NameCard(),
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SubmitButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });  
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.add),
                  onPressed: _incrementCounter,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Click'),
      onPressed: () {},
    );
  }
}

class NameCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100.0,
              child: Image.asset(
                'assets/images/AvatarMe.jpg'
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: xxxxxx'),
              Text('DOB: xx / xx / xxxx'),
            ],
          ),
        ],
      ),
    );
  }
}

class BlankPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Blank Page'),
      ),
      body: Center(
        child: Text('This page intentially blank'),
      ),
    );
  }
}

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
        children: List.generate(3, (index) {
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

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Third Page'),
      ),
      body: Center(
        child: Text('This page intentially blank'),
      ),
    );
  }
}