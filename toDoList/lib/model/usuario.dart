class Usuario {
  String nome;
  String sobreNome;
  String email;
  String senha;
  String numeroTelefone;

  Usuario(
      {this.nome, this.sobreNome, this.email, this.senha, this.numeroTelefone});

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    sobreNome = json['sobreNome'];
    email = json['email'];
    senha = json['senha'];
    numeroTelefone = json['numeroTelefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['sobreNome'] = this.sobreNome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['numeroTelefone'] = this.numeroTelefone;
    return data;
  }
}
