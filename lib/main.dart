import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;
  final double width;
  final double height;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.icon = Icons.favorite,
    this.iconColor = Colors.red,
    this.width = 80,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 9),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.blueGrey[900]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 10),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),            
            ],
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'LeagueGothic',
              color: Colors.blueGrey[100]!.withOpacity(0.7),
              fontSize: 14,
              letterSpacing: .8,
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'SURVIVAL LA LIGA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarHeight: 250,
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/stadium.png',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'SURVIVAL LA LIGA',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'LeagueGothic',
                          color: Colors.white,
                          fontSize: 50,
                          letterSpacing: 1.5,
                          height: .7,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatCard(
                            value: '3.5/5',
                            label: 'VIDAS',
                            width: 70,
                            height: 60,
                            icon: Icons.favorite,
                            iconColor: Colors.red,
                          ),
                          StatCard(
                            value: '22/1000',
                            label: 'POSICIÓN',
                            width: 80,
                            height: 60,
                            icon: Icons.emoji_events,
                            iconColor: Colors.amber,
                          ),
                          StatCard(
                            value: '20k',
                            label: 'POZO ACUMULADO',
                            width: 100,
                            height: 60,
                            icon: Icons.monetization_on,
                            iconColor: Colors.green,
                          ),
                          StatCard(
                            value: '20k',
                            label: 'SOBREVIVIENTES',
                            width: 100,
                            height: 60,
                            icon: Icons.people,
                            iconColor: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/by_penka.png',
                        fit: BoxFit.cover,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
