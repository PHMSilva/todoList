import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toDoList/model/usuario.dart';

class CardToDo extends StatelessWidget {
  final Usuario toDoUsuario;

  CardToDo(this.toDoUsuario);

  Widget _infoCard(String dado) {
    return Text(
      dado,
      style: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          dividerColor:
              Colors.transparent), // evita sombra atrás do widget card
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.purple,
            width: 1.5,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        //color: Colors.yellow[200],
        color: Colors.grey[100],
        child: ExpansionTile(
          leading: Icon(
            Icons.person,
            color: Colors.purple,
          ),
          title: _infoCard('${toDoUsuario.nome} ${toDoUsuario.sobreNome}'),
          subtitle: _infoCard('${toDoUsuario.numeroTelefone}'),
          children: [
            _infoCard('${toDoUsuario.email}'),
            Divider(
              height: 10,
            ),
            _infoCard('${toDoUsuario.email}'),
            Divider(
              height: 10,
            ),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
