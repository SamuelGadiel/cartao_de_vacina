import 'package:cartao_de_vacina/app/app_module.dart';
import 'package:cartao_de_vacina/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_commons/mobile_commons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  CacheService.init();

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
