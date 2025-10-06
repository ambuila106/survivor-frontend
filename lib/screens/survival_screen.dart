import 'package:flutter/material.dart';
import '../components/header_banner.dart';

class SurvivalScreen extends StatelessWidget {
  const SurvivalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // número de tabs
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: HeaderBanner(),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.yellow[800],
              labelColor: Colors.yellow[800],
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: 'Por jugar'),
                Tab(text: 'Resultados'),
                Tab(text: 'Tabla'),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      'Partidos por jugar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Resultados',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Tabla de posiciones',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
