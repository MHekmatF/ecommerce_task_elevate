import 'package:ecommerce_task_elevate/shared/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
GetIt configureDependencies() => serviceLocator.init();
