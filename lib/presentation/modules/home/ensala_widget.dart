import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salad_start_app/domain/ensalada.dart';

class EnsalaWidget extends StatelessWidget {
  final List<Ensalada> ensalada;

  const EnsalaWidget({super.key, required this.ensalada});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 8.0),
          child: Text(
            'Ensaladas',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ensalada.length,
            itemBuilder: (context, index) {
              final receta = ensalada[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(receta.url,
                        fit: BoxFit.cover, height: 120, width: 160),
                    Text(
                      receta.nombre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Text(
                      receta.ingredientes,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          '/ensalada-detail',
                          extra: receta,
                        );
                      },
                      child: const Text('Ver información'),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          '/order-screen',
                          extra: receta,
                        );
                      },
                      child: const Text('Hacer pedido'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
