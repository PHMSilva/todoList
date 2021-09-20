import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:toDoList/controller/todoStore.dart';
import 'package:toDoList/model/usuario.dart';
import 'package:toDoList/widget/cardEdit.dart';
import 'package:toDoList/widget/cardToDo.dart';
import 'package:toDoList/widget/formularioToDo.dart';
import 'package:toDoList/widget/formularioToDoEdit.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final todoUsuario = ToDoStore();
  bool isEdit = false;
  bool isDelete = false;

  _cadastrarUsuario(
      String nome, String sobreNome, String email, String numeroTelefone) {
    var usuario = new Usuario(
      nome: nome,
      sobreNome: sobreNome,
      email: email,
      numeroTelefone: numeroTelefone,
    );
    todoUsuario.add(usuario);
    Navigator.of(context).pop();
  }

  _editarUsuario(String nome, String sobreNome, String email,
      String numeroTelefone, int index) {
    var usuario = new Usuario(
      nome: nome,
      sobreNome: sobreNome,
      email: email,
      numeroTelefone: numeroTelefone,
    );
    todoUsuario.edit(usuario, index);
    setState(() {
      isEdit = !isEdit;
    });
    Navigator.of(context).pop();
  }

  _alterarCard(int index) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FormularioToDoEdit(
              _editarUsuario, todoUsuario.listaTodo[index], index);
        });
  }

  _setEdit(BuildContext context) {
    setState(() {
      isEdit = !isEdit;
    });
  }

  _setDelete(BuildContext context) {
    setState(() {
      isDelete = !isDelete;
    });
  }

  _formularioTodo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FormularioToDo.cadastrar(_cadastrarUsuario);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'To Do List',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
          ),
          child: Observer(
            builder: (_) => ListView.builder(
              itemCount: todoUsuario.listaTodo.length,
              itemBuilder: (context, index) {
                var usuario = todoUsuario.listaTodo[index];
                //return Text(usuario.nome);
                return isEdit == false && isDelete == false
                    ? CardToDo(usuario)
                    : isEdit == true
                        ? CardEdit(usuario, index, _alterarCard)
                        : Text('deletar');
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red[100],
            child: Icon(
              Icons.delete,
              color: Colors.red[700],
            ),
            onPressed: () => _setDelete(context),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            backgroundColor: Colors.amber[100],
            child: Icon(
              Icons.edit,
              color: Colors.orange[700],
            ),
            onPressed: () => _setEdit(context),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            backgroundColor: Colors.purple[100],
            child: Icon(
              Icons.add,
              size: 30.0,
              color: Colors.purple[700],
            ),
            onPressed: () => _formularioTodo(context),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
/*

   var usuario = new Usuario(
              nome: 'pedro',
              email: 'magalhaes@gmail.com',
              senha: 'catupiri',
              dataNascimento: '15011995',
            );
todoUsuario.add(usuario);
Widget _createList(String nome, String email) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.0,
          color: Colors.purple,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          Icons.person_rounded,
          size: 30,
          color: Colors.purple,
        ),
        title: Text(nome),
        subtitle: Text(email),
        onTap: () {},
      ),
    );
  }



Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _createList('PedroSilva', 'pedro@gmail.com'),
              _createList('PedroSilva', 'pedro@gmail.com'),
              _createList('PedroSilva', 'pedro@gmail.com'),
            ],
          ),
        )
 */