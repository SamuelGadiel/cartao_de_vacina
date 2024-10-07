import 'package:cartao_de_vacina/app/modules/home/controllers/home_controller.dart';
import 'package:cartao_de_vacina/app/modules/pet/pet_card.dart';
import 'package:cartao_de_vacina/app/modules/vacinas/vacina_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

class PetPage extends StatefulWidget {
  const PetPage({super.key});

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vacinas = homeController.getVacinas();
      if (vacinas?.isNotEmpty ?? false) {
        setState(() {});
      }
    });
  }

  final homeController = Modular.get<HomeController>();

  void showVacinaRegister(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VacinaForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PetCard(),
              const SizedBox(height: 24),
              Text(
                'Vacinas',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Center(
                  child: ListenableBuilder(
                    listenable: homeController,
                    builder: (context, child) {
                      if (homeController.vacinas.isEmpty) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Nenhuma vacina registrada',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Cadastre uma nova vacina',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16),
                            Button.filled(
                              onPressed: () => showVacinaRegister(context),
                              text: 'Cadastrar',
                            )
                          ],
                        );
                      }

                      return ListView.builder(
                        itemCount: homeController.vacinas.length + 1,
                        itemBuilder: (context, index) {
                          if (index == homeController.vacinas.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Button.text(
                                onPressed: () => showVacinaRegister(context),
                                text: 'Cadastrar',
                              ),
                            );
                          }

                          final vacina = homeController.vacinas.elementAt(index);

                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(vacina.nome),
                                  Text(vacina.data),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
