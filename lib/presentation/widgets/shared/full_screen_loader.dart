
import 'package:flutter/material.dart';






class FullScreenLoader extends StatelessWidget {

  const FullScreenLoader({super.key});



  Stream<String> getLoadingMessage() {

    final message = <String> [
      'Cargando Pelicula',
      'Comprando palomitas de maiz',
      'Cargando Populares',
      'LLamando a mi Novia',
      'Ya merito...',
      'Esto esta tardando mas de lo esperado. :(',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step){
      return message[step];
    }).take(message.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text('Espere Por Favor...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessage(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!);
            }
          )

        ],
      ),
    );
  }
}