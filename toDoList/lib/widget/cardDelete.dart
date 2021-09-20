import 'package:flutter/material.dart';
import 'package:toDoList/model/usuario.dart';

class CardDelete extends StatelessWidget {
  final Usuario usuario;
  final int index;
  final void Function(int) acao;
  CardDelete(this.usuario, this.index, this.acao);
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
          CheckboxListTile(
            title: Text('${usuario.nome} ${usuario.sobreNome}'),
            //onTap: () {},
            secondary: Icon(
              Icons.person_rounded,
              color: Colors.purple,
            ),
            //onTap: _retornarDados,
            controlAffinity: ListTileControlAffinity.leading,
            value: false,
            onChanged: (value) {
              value = value;
            },
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
