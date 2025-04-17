import 'package:flutter/material.dart';
import 'package:my_app/components/pages/destination_screen.dart';
import 'package:my_app/components/pages/pacotes.dart';
import 'pages/about_us.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Explorar Viagens'),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DestinationScreen())
            );
          },
          child: Text('Destinos', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PacotesScreen())
              );
          },
          child: Text('Pacotes', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUsScreen())
            );
          },
          child: Text('Sobre', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}