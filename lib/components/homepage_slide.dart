import 'package:flutter/material.dart';
import 'package:my_app/components/pages/class/pacote_class.dart';
import 'package:my_app/components/pages/lista_pacotes.dart';

class HomepageSlide extends StatefulWidget {
  const HomepageSlide({super.key});

  @override
  State<HomepageSlide> createState() => _HomepageSlideState();
}

class _HomepageSlideState extends State<HomepageSlide> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.0, // Defina uma altura para o seu slider
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pacotes.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalhesPacoteScreen(pacote: pacotes[index]),
                    ),
                  );
                },
                child: Image.asset(
                    pacotes[index].homeWpp ,
                    fit: BoxFit.cover,
                  ),
              );
            },
          ),
          if (pacotes.length > 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < pacotes.length; i++) {
      indicators.add(
        Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}