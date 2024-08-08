import 'package:flutter/material.dart';
import 'package:salad_start_app/domain/ensalada.dart';
import 'package:salad_start_app/presentation/modules/home/ensala_widget.dart';
import 'package:salad_start_app/presentation/modules/home/xml_service.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Ensalada>> _ensaladaDesayuno;
  late Future<List<Ensalada>> _ensadalaAlmuerzo;
  late Future<List<Ensalada>> _ensadalaMerienda;

  @override
  void initState() {
    super.initState();
    _ensaladaDesayuno = leerEnsaladasDesayuno();
    _ensadalaAlmuerzo = leerEnsaladasAlmuerzos();
    _ensadalaMerienda = leerEnsaladasMerienda();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Ensalada>>(
              future: _ensaladaDesayuno,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay datos disponibles'));
                } else {
                  return EnsalaWidget(ensalada: snapshot.data!);
                }
              },
            ),
            FutureBuilder<List<Ensalada>>(
              future: _ensadalaAlmuerzo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay datos disponibles'));
                } else {
                  return EnsalaWidget(ensalada: snapshot.data!);
                }
              },
            ),
            FutureBuilder<List<Ensalada>>(
              future: _ensadalaMerienda,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay datos disponibles'));
                } else {
                  return EnsalaWidget(ensalada: snapshot.data!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
