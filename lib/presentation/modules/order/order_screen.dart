import 'package:flutter/material.dart';
import 'package:salad_start_app/domain/ensalada.dart';

class OrderScreen extends StatefulWidget {
  final Ensalada ensalada;

  const OrderScreen({super.key, required this.ensalada});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _cedulaController = TextEditingController();
  final _fechaController = TextEditingController();
  bool _isSubmitted = false;

  void _submitOrder() {
    setState(() {
      _isSubmitted = true;
    });

    // Aquí podrías enviar los datos a un backend o procesarlos como sea necesario
    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pedido enviado'),
        ),
      );
      Navigator.pop(context); // Volver a la pantalla anterior
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacer Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido para: ${widget.ensalada.nombre}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _cedulaController,
              decoration: const InputDecoration(
                labelText: 'Cédula',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _fechaController,
              decoration: const InputDecoration(
                labelText: 'Fecha de Entrega (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitOrder,
              child: _isSubmitted
                  ? const Text('Enviado')
                  : const Text('Enviar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
