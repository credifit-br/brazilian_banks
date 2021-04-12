import 'package:flutter/material.dart';

import 'banks_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BanksPage()));
              },
              child: Text(
                'Lista de Bancos Brasileiros',
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.orange[800],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
