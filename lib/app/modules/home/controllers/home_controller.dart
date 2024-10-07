import 'package:cartao_de_vacina/app/objetos/vacina.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

import '../../../objetos/pet.dart';

class HomeController extends ChangeNotifier {
  final CacheServiceImplementation cache;

  HomeController(this.cache);

  final formPet = FormController();
  final formVacina = FormController();
  Pet? pet;
  List<Vacina> vacinas = [];

  Pet? getPet() {
    try {
      final petJson = cache.get('PET');
      pet = Pet.fromJson(petJson);

      return pet;
    } catch (e) {
      return null;
    }
  }

  List<Vacina>? getVacinas() {
    try {
      final vacinasJson = cache.get('VACINAS');

      if (vacinasJson == null) return null;

      final vacinasList = vacinasJson.map((vacina) => Vacina.fromJson(vacina)).toList().cast<Vacina>();

      vacinas.addAll(vacinasList);

      notifyListeners();

      return vacinas;
    } catch (e) {
      return null;
    }
  }

  void registerPet() {
    cache.set('PET', formPet.values);
    pet = Pet.fromJson(formPet.values);

    Modular.to.navigate('/pet');
    notifyListeners();
  }

  void registerVacina() {
    final vacina = Vacina.fromJson(formVacina.values);

    vacinas.add(vacina);

    final vacinasJson = vacinas.map((vacina) => vacina.toJson()).toList();
    cache.set('VACINAS', vacinasJson);

    formVacina.reset();
    Modular.to.pop();
    notifyListeners();
  }
}
