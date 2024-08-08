import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import 'package:salad_start_app/domain/ensalada.dart';

Future<List<Ensalada>> leerEnsaladasDesayuno() async {
  final data = await rootBundle.loadString('assets/xml/ensaladas_desayuno.xml');
  final document = xml.XmlDocument.parse(data);
  final elementos = document.findAllElements('ensalada');

  return elementos.map((elemento) {
    final id = elemento.findElements('id').single.text;
    final nombre = elemento.findElements('nombre').single.text;
    final ingredientes = elemento.findElements('ingredientes').single.text;
    final valoresNutricionales =
        elemento.findElements('valores_nutricionales').single.text;
    final preparacion = elemento.findElements('preparacion').single.text;
    final precio = elemento.findElements('precio').single.text;
    final url = elemento.findElements('url').single.text;
    return Ensalada(
        id: id,
        nombre: nombre,
        ingredientes: ingredientes,
        preparacion: preparacion,
        valoresNutricionales: valoresNutricionales,
        precio: precio,
        url: url);
  }).toList();
}

Future<List<Ensalada>> leerEnsaladasAlmuerzos() async {
  final data = await rootBundle.loadString('assets/xml/ensaladas_almuerzo.xml');
  final document = xml.XmlDocument.parse(data);
  final elementos = document.findAllElements('ensalada');

  return elementos.map((elemento) {
    final id = elemento.findElements('id').single.text;
    final nombre = elemento.findElements('nombre').single.text;
    final ingredientes = elemento.findElements('ingredientes').single.text;
    final valoresNutricionales =
        elemento.findElements('valores_nutricionales').single.text;
    final preparacion = elemento.findElements('preparacion').single.text;
    final precio = elemento.findElements('precio').single.text;
    final url = elemento.findElements('url').single.text;
    return Ensalada(
        id: id,
        nombre: nombre,
        ingredientes: ingredientes,
        preparacion: preparacion,
        valoresNutricionales: valoresNutricionales,
        precio: precio,
        url: url);
  }).toList();
}

Future<List<Ensalada>> leerEnsaladasMerienda() async {
  final data = await rootBundle.loadString('assets/xml/ensaladas_merienda.xml');
  final document = xml.XmlDocument.parse(data);
  final elementos = document.findAllElements('ensalada');

  return elementos.map((elemento) {
    final id = elemento.findElements('id').single.text;
    final nombre = elemento.findElements('nombre').single.text;
    final ingredientes = elemento.findElements('ingredientes').single.text;
    final valoresNutricionales =
        elemento.findElements('valores_nutricionales').single.text;
    final preparacion = elemento.findElements('preparacion').single.text;
    final precio = elemento.findElements('precio').single.text;
    final url = elemento.findElements('url').single.text;
    return Ensalada(
        id: id,
        nombre: nombre,
        ingredientes: ingredientes,
        preparacion: preparacion,
        valoresNutricionales: valoresNutricionales,
        precio: precio,
        url: url);
  }).toList();
}
