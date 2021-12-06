import 'package:brazilian_banks/brazilian_banks.dart';
import 'package:flutter/material.dart';

class BanksPage extends StatefulWidget {
  const BanksPage({Key? key}) : super(key: key);

  @override
  _BanksPageState createState() => _BanksPageState();
}

class _BanksPageState extends State<BanksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Bancos Brasileiros'),
      ),
      body: Center(
        child: FutureBuilder<List<BrasilApiBanks>>(
          future: BrasilApiBanks.getBanks(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length + 1,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].code.toString()),
                    subtitle: Text(snapshot.data![index].name ?? ""),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
