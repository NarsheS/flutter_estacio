import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nós'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: ListView( // Replace Wrap with ListView
          children: <Widget>[
            Text('''
              Nós da "Explore o Mundo", buscamos sempre o melhor e nos preocupamos com nossos clientes e queremos que eles recebam o melhor, com o máximo de segurança. Para atender tais requisitos, a "Explore o mundo" usa uma RESTful API, atualizada em tempo real, que disponibiliza destinos e pontos de interesse verificados para nossos clientes. Também disponibilizamos pelo app, pacotes de viagem, afinal, para que perder tempo buscando por passagens e hospedagens se nós estamos aqui e podemos fazer isso por você apenas com o clique de um botão?! Junte-se a nós e venha explorar o mundo!

            email: 
            - expMundo@gmail.com
            contato: 
            - +55 98585-8585

            A Explore o Mundo fornece seus serviços desde 2025.
            ''',
            style: TextStyle(
            fontSize: 18.0, // Defina o tamanho da fonte desejado aqui
          ),
          ),
          ],
        ),
      ),
    );
  }
}