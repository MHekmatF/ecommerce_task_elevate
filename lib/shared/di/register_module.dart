import 'package:dio/dio.dart';
import 'package:ecommerce_task_elevate/shared/api_constant.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        // connectTimeout:const  Duration(seconds: 120),
        // receiveTimeout:const  Duration(seconds: 120)
      ));


}
