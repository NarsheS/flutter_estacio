import 'package:flutter/material.dart';
import 'package:my_app/components/title_section.dart';

class Pacote {
  final String title;
  final String subtitle;
  final String rating;
  final String homeWpp;
  final List<String> imagensUrl;
  final String descricaoDetalhada;
  final double preco;
  final int duracaoDias;

  Pacote({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.homeWpp,
    required this.imagensUrl,
    required this.descricaoDetalhada,
    required this.preco,
    required this.duracaoDias,
  });
}

class DetalhesPacoteScreen extends StatefulWidget {
  final Pacote pacote;

  DetalhesPacoteScreen({required this.pacote});

  @override
  _DetalhesPacoteScreenState createState() => _DetalhesPacoteScreenState();
}

class _DetalhesPacoteScreenState extends State<DetalhesPacoteScreen> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pacote.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 200.0,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pacote.imagensUrl.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.pacote.imagensUrl[index],
                    fit: BoxFit.cover,
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            if (widget.pacote.imagensUrl.length > 1)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.pacote.imagensUrl.length,
                    (index) => _buildPageIndicator(index),
                  ),
                ),
              ),
            SizedBox(height: 20.0),
            TitleSection(
              title: widget.pacote.title,
              subtitle: widget.pacote.subtitle,
              rating: widget.pacote.rating,
            ),
            SizedBox(height: 10.0),
            Text(
              'Preço: \$${widget.pacote.preco.toStringAsFixed(2)} por pessoa',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'Duração: ${widget.pacote.duracaoDias} dias',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 15.0),
            Text(
              'Descrição Detalhada:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              widget.pacote.descricaoDetalhada,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pacote "${widget.pacote.title}" reservado!')),
                );
              },
              child: Text('Reservar Pacote'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}