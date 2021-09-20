import 'package:mobx/mobx.dart';
import 'package:toDoList/model/usuario.dart';
part 'todoStore.g.dart';

class ToDoStore = _ToDoStore
    with _$ToDoStore; // para conectar a classe abstrata
// _ToDoStore com todoStore.g.dart ;

abstract class _ToDoStore with Store {
/*  @observable
  List<Usuario> listaTodo = []; todo action altera um observável
  Para usar o todoStore.g.dart é preceiso colocar a classe como abstract para ela nao ser instanciada
  */
  var listaTodo = ObservableList<Usuario>();

  @action
  void add(Usuario todoUser) {
    listaTodo.add(todoUser);
  }

  @action
  void edit(Usuario todoUser, int index) {
    listaTodo.removeAt(
        index); // remove o elemento de uma lista especificando o indice;
    listaTodo.insert(index,
        todoUser); // insere o elemento especificando o posicao desejada na lista
  }

  @action
  void resetChecked() {
    listaTodo.forEach((element) {
      element.checked = false;
    });
  }

  @action
  void changedChecked(int index) {
    listaTodo[index].checked = !listaTodo[index].checked;
  }

  @action
  void delete() {
    List<Usuario> toRemove = [];
    listaTodo.forEach((element) {
      if (element.checked) {
        //listaTodo.remove(element);
        toRemove.add(element);
      }
    });
    listaTodo.removeWhere((element) => toRemove.contains(element));
  }
}
//todo action altera um observável;

//para fazer a geracao do arquivo todoStore.g.dart é nescessário rodar o comando abaixo:
//flutter packages pub run build_runner build
//para fazer a limpar a os arquivo g.dart que sao residuos do mobx use o comando abaixo:
//flutter packages pub run build_runner clean 