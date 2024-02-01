import 'package:flutter/material.dart';

class dashboardScreen extends StatelessWidget {
  const dashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                accountEmail: Text('dev.nicolasstorti@gmail.com'),),
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
        child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Estudar Flutter'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Estudar Unity'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Aprender Dart'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
  void onButtonSairClicked(BuildContext context){
    Navigator.of(context).pushReplacementNamed("/login");
  }
}
