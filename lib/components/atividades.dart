import 'package:flutter/material.dart';

class Atividade extends StatefulWidget {
  final String atividade;

  const Atividade(this.atividade, {Key? key}) : super(key: key);

  @override
  State<Atividade> createState() => _AtividadeState();
}

class _AtividadeState extends State<Atividade> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.check),
            title: Text(widget.atividade),
          ),
        ],
      ),
    );
  }
}

