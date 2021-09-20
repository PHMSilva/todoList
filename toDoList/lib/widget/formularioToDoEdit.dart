import 'package:flutter/material.dart';
import 'package:toDoList/model/usuario.dart';

class FormularioToDoEdit extends StatefulWidget {
  final void Function(String, String, String, String, int) editar;
  final Usuario usuarioEdit;
  final int index;
  FormularioToDoEdit(this.editar, this.usuarioEdit, this.index);

  @override
  State<FormularioToDoEdit> createState() => _FormularioToDoEditState();
}

class _FormularioToDoEditState extends State<FormularioToDoEdit> {
  GlobalKey<FormState> _form = GlobalKey();

  final Map<String, String> _dados = {
    'nome': '',
    'sobreNome': '',
    'email': '',
    'numeroTelefone': '',
  };

  void _salvarAlteracoes() {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
    widget.editar(_dados['nome'], _dados['sobreNome'], _dados['email'],
        _dados['numeroTelefone'], widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                initialValue: widget.usuarioEdit.nome,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onSaved: (value) => _dados['nome'] = value,
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                initialValue: widget.usuarioEdit.sobreNome,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Sobrenome",
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onSaved: (value) => _dados['sobreNome'] = value,
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                initialValue: widget.usuarioEdit.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Informe um e-mail válido ! ';
                  }
                  return null;
                },
                onSaved: (value) => _dados['email'] = value,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                initialValue: widget.usuarioEdit.numeroTelefone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Número telefone",
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo nao preenchido';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) => _dados['numeroTelefone'] = value,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    // onPressed: () => _salvarInformacoes(context),
                    onPressed: _salvarAlteracoes,
                    child: Text(
                      'Aplicar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.amber,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
