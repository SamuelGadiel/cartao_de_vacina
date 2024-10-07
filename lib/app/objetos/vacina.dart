import 'package:mobile_commons/mobile_commons.dart';

class Vacina {
  final String nome;
  final String data;

  Vacina({
    required this.nome,
    required this.data,
  });

  factory Vacina.fromJson(Json json) {
    return Vacina(
      nome: json['nome'],
      data: json['data'],
    );
  }

  Json toJson() {
    return {
      'nome': nome,
      'data': data,
    };
  }
}
