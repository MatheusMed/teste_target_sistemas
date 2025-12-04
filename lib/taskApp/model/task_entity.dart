// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskEntity {
  final int id;
  final String? informacao;
  final int? totalEdit;
  TaskEntity({required this.id, this.informacao, this.totalEdit});

  TaskEntity copyWith({int? id, String? informacao, int? totalEdit}) {
    return TaskEntity(
      id: id ?? this.id,
      informacao: informacao ?? this.informacao,
      totalEdit: totalEdit ?? this.totalEdit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'informacao': informacao,
      'totalEdit': totalEdit,
    };
  }

  factory TaskEntity.fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      id: map['id'] as int,
      informacao: map['informacao'] != null
          ? map['informacao'] as String
          : null,
      totalEdit: map['totalEdit'] != null ? map['totalEdit'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskEntity.fromJson(String source) =>
      TaskEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TaskEntity(id: $id, informacao: $informacao, totalEdit: $totalEdit)';

  @override
  bool operator ==(covariant TaskEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.informacao == informacao &&
        other.totalEdit == totalEdit;
  }

  @override
  int get hashCode => id.hashCode ^ informacao.hashCode ^ totalEdit.hashCode;
}
