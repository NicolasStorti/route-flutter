import 'package:atividade_rotas/components/atividades.dart';
import 'package:atividade_rotas/data/atividade_dao.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        title: Text('Minhas atividades'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 55.0,
                backgroundImage: AssetImage('Assets/perfil.jpg'),
              ),
              accountName: Text('Nicolas Storti'),
              accountEmail: Text('dev.nicolasstorti@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () => onButtonSairClicked(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: AtividadeDao().findAll(),
          builder: (context, snapshot) {
            List<Atividade>? items = snapshot.data as List<Atividade>?;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Atividade atividade = items[index];
                        return atividade;
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128,),
                        Text(
                          'Não há nenhuma Atividade',
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar Atividades');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onButtonAddAtividadeClicked(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onButtonAddAtividadeClicked(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/addAtividade");
  }

  void onButtonSairClicked(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/login");
  }
}
