import 'package:sqflite/sqflite.dart';
import 'package:atividade_rotas/components/atividades.dart';
import 'package:atividade_rotas/data/database.dart';

class AtividadeDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTO INCREMENT'
      '$_atividade TEXT)';

  static const String _tableName = 'atividadeTable';
  static const String _id = 'id';
  static const String _atividade = 'atividade';

  save(Atividade atividade) async{
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(atividade.atividade);

    Map<String, dynamic> atividadeMap = toMap(atividade);
    if(itemExists.isEmpty){
      return await bancoDeDados.insert(_tableName, atividadeMap);
    }else{
      return await bancoDeDados.update(
        _tableName,
        atividadeMap,
        where: '$_atividade = ?',
        whereArgs: [atividade.atividade]
      );
    }
  }

  Map<String, dynamic> toMap(Atividade atividade){
    final Map<String, dynamic> mapaDeAtividades = Map();

    mapaDeAtividades[_atividade] = atividade.atividade;
    return mapaDeAtividades;
  }

  Future<List<Atividade>> findAll() async{
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tableName);

    print('Procurando dados no banco de dados.. encontrado: $result');

    return toList(result);
  }

  List<Atividade> toList(List<Map<String, dynamic>> mapaDeAtividades){
    final List<Atividade>  atividades = [];
    for (Map<String, dynamic> linha in mapaDeAtividades) {
      final Atividade atividade = Atividade(linha[_atividade]);

      atividades.add(atividade);
    }
    print('Lista de Tarefa $atividades');
    return atividades;
  }

  Future<List<Atividade>> find(String idDaAtividade)async{
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName, where: '$_id = ?',
      whereArgs: [idDaAtividade]
    );
    return toList(result);
  }

  delete(String idDaAtividade) async{
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [idDaAtividade]
    );
  }

  Future<int> update(Atividade atividade) async{
      final Database bancoDeDados = await getDatabase();
      var itemExists = await find(atividade.atividade);

      if (itemExists.isEmpty) {
        print('Tarefa não encontrada para atualizar');
        return 0;
      } else {
        Map<String, dynamic> taskMap = toMap(atividade);

        int result = await bancoDeDados.update(
          _tableName,
          taskMap,
          where: '$_id = ?',
          whereArgs: [atividade.atividade],
        );

        print('Tarefa atualizada: ${atividade.atividade}');
        return result;
    }
  }
}
