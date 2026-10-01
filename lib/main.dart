import 'package:flutter/material.dart';

import 'stationery_item.dart';
import 'home_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const StationeryApp());
}


class StationeryApp extends StatelessWidget {
  const StationeryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Alat Tulis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        scaffoldBackgroundColor: const Color(0xFFFFF7F2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<StationeryItem> _stationery = StationeryItem.sampleData;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(stationerys: _stationery, onChanged: () => setState(() {})),
      const ProfilePage(name: 'Naftali Margareta'), 
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.restaurant), label: 'Menu'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
