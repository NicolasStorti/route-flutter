import 'package:flutter/material.dart';
import 'package:atividade_rotas/components/atividades.dart';
import 'package:atividade_rotas/data/atividade_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.atividadeContext}) : super(key: key);

  final BuildContext atividadeContext;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController atividadeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
