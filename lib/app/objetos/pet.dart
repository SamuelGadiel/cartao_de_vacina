import 'package:mobile_commons/mobile_commons.dart';

class Pet {
  final String nome;
  final int idade;
  final String raca;
  final String genero;
  final String cor;

  Pet({
    required this.nome,
    required this.idade,
    required this.raca,
    required this.genero,
    required this.cor,
  });

  factory Pet.fromJson(Json json) {
    return Pet(
      nome: json['nome'] ?? '',
      idade: int.tryParse(json['idade']) ?? -1,
      raca: json['raca'] ?? '',
      genero: json['genero'] ?? '',
      cor: json['cor'] ?? '',
    );
  }
}
