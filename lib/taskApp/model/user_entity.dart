// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserEntity {
  final int id;
  final String nome;
  final String senha;
  UserEntity({required this.id, required this.nome, required this.senha});

  UserEntity copyWith({int? id, String? nome, String? senha}) {
    return UserEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'nome': nome, 'senha': senha};
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as int,
      nome: map['nome'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserEntity(id: $id, nome: $nome, senha: $senha)';

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.senha == senha;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ senha.hashCode;
}
