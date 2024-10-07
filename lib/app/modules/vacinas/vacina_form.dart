import 'package:cartao_de_vacina/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

class VacinaForm extends StatelessWidget {
  VacinaForm({super.key});

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nova Vacina'),
      content: FormBuilder(
        key: homeController.formVacina.key,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormInput(name: 'nome', label: 'Nome'),
            SizedBox(height: 12),
            FormInput(name: 'data', label: 'Data da Vacina'),
          ],
        ),
      ),
      actions: [
        Button.text(onPressed: Modular.to.pop, text: 'Cancelar'),
        Button.filled(
          onPressed: homeController.registerVacina,
          text: 'Salvar',
        ),
      ],
    );
  }
}
