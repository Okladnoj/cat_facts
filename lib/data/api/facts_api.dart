import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../models/facts.dart';
import 'api_constants.dart';

class FactsApi {
  static Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
      ),
    )..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  final Dio dio;

  FactsApi(this.dio);

  Future<Fact> getFact() async {
    final response = await dio.get(
      ApiConstants.randomFactUrl,
      queryParameters: {
        'amount': 1,
        'animal_type': 'cat',
      },
    );

    return Fact.fromJson(response.data);
  }
}
