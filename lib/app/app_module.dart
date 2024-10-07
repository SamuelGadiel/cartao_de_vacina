import 'package:cartao_de_vacina/app/modules/home/controllers/home_controller.dart';
import 'package:cartao_de_vacina/app/modules/home/home_page.dart';
import 'package:cartao_de_vacina/app/modules/pet/pet_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(CacheServiceImplementation.new);
    i.addSingleton(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => HomePage());
    r.child('/pet', child: (context) =>  PetPage());
  }
}
