import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_advisor_clean_architecture/core/constants.dart';
import 'package:flutter_advisor_clean_architecture/data/exceptions/exception.dart';
import 'package:flutter_advisor_clean_architecture/data/models/advice_model_dto.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  /// Request random advice from API
  /// return [AdviceModel] if succesfull
  /// throws a server-Exception if status code is not 200
  Future<AdviceModelDTO> getRandomAdviceFromAPI();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();
  @override
  Future<AdviceModelDTO> getRandomAdviceFromAPI() async {
    final response = await client.get(
      Uri.parse(kRemoteDataSourceAPILink),
      headers: {
        'accept': 'application/json',
      },
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModelDTO.fromJSON(responseBody);
    }
  }
}
