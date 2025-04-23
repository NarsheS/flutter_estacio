import 'package:flutter/material.dart';
import 'package:my_app/components/pages/class/pacote_class.dart';
import 'package:my_app/components/pages/lista_pacotes.dart';

class PacotesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacotes de Viagem'),
      ),
      body: ListView.builder(
        itemCount: pacotes.length,
        itemBuilder: (context, index) {
          final pacote = pacotes[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesPacoteScreen(pacote: pacote),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    child: (pacote.imagensUrl.length > 1)
                        ? PageView.builder(
                            itemCount: pacote.imagensUrl.length,
                            itemBuilder: (context, imageIndex) {
                              return Image.asset(
                                pacote.imagensUrl[imageIndex],
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            pacote.imagensUrl.first,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      pacote.title,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, color: Colors.grey),
                                      const SizedBox(width: 4.0),
                                      Text(pacote.subtitle, style: TextStyle(color: Colors.grey[500]),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            Text(pacote.rating),
                            const Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Preço: R\$${pacote.preco.toStringAsFixed(2)} por pessoa'),
                            Text('${pacote.duracaoDias} dias'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}