import 'package:flutter/material.dart';
import 'package:atividade_rotas/components/atividades.dart';

class AtividadeInherited extends InheritedWidget {
  AtividadeInherited({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<Atividade> atividadeList = [
    const Atividade(0, 'Aprender Flutter'),
  ];

  int _idCounter = 1;

  void newAtividade(String atividade) {
    atividadeList.add(Atividade(_idCounter++, atividade));
  }

  @override
  bool updateShouldNotify(AtividadeInherited oldWidget) {
    return oldWidget.atividadeList.length != atividadeList.length;
  }
}
