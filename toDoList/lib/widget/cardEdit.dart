import 'package:flutter/material.dart';
import 'package:toDoList/model/usuario.dart';

class CardEdit extends StatelessWidget {
  final Usuario usuario;
  final int index;
  final void Function(int) acao;
  CardEdit(this.usuario, this.index, this.acao);

  _retornarDados() {
    acao(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.person_rounded,
              color: Colors.purple,
            ),
            title: Text('${usuario.nome} ${usuario.sobreNome}'),
            //onTap: () {},
            onTap: _retornarDados,
          ),
          Divider(
            color: Colors.purple[700],
            height: 10,
          ),
        ],
      ),
    );
  }
}
