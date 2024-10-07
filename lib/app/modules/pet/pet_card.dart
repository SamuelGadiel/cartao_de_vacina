import 'package:cartao_de_vacina/app/modules/home/controllers/home_controller.dart';
import 'package:cartao_de_vacina/app/objetos/pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PetCard extends StatelessWidget {
  PetCard({super.key});

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    final Pet pet = homeController.pet!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              pet.nome,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Raça: ${pet.raca}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                ),
                Text(
                  'Idade: ${pet.idade} ${pet.idade == 1 ? 'ano' : 'anos'}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gênero: ${pet.genero}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                ),
                Text(
                  'Cor: ${pet.cor}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
