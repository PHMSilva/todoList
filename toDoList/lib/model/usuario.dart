class Usuario {
  int id;
  String nome;
  String sobreNome;
  String email;
  String senha;
  String numeroTelefone;
  bool checked;

  Usuario(
      {this.id,
      this.nome,
      this.sobreNome,
      this.email,
      this.senha,
      this.numeroTelefone,
      this.checked = false});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    sobreNome = json['sobreNome'];
    email = json['email'];
    senha = json['senha'];
    numeroTelefone = json['numeroTelefone'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['sobreNome'] = this.sobreNome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['numeroTelefone'] = this.numeroTelefone;
    data['checked'] = this.checked;
    return data;
  }
}
