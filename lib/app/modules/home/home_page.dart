import 'package:cartao_de_vacina/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final pet = homeController.getPet();

    if (pet != null) {
      Modular.to.navigate('/pet');
    }
  }

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro do pet'),
      ),
      body: ListenableBuilder(
        listenable: homeController,
        builder: (context, widget) {
          return Center(
            child: FormBuilder(
              key: homeController.formPet.key,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    const FormInput(name: 'nome', label: 'Nome'),
                    const SizedBox(height: 12),
                    const FormInput(
                      name: 'idade',
                      label: 'Idade',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    const FormInput(name: 'raca', label: 'Raça'),
                    const SizedBox(height: 12),
                    const FormInput(name: 'genero', label: 'Gênero'),
                    const SizedBox(height: 12),
                    const FormInput(name: 'cor', label: 'Cor'),
                    const SizedBox(height: 12),
                    Button.filled(
                      onPressed: homeController.registerPet,
                      text: 'Cadastrar',
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
