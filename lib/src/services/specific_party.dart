import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopos/src/models/party.dart';
import 'package:shopos/src/models/specific_party.dart';
import 'package:shopos/src/services/api_v1.dart';

class SpecificPartyService {
  Future<List<SpecificParty>> getSalesCreditHistory(String id) async {
    final response = await ApiV1Service.getRequest('/sales/credit-history/$id');
    print(response.toString());
    return (response.data['data'] as List)
        .map((e) => SpecificParty.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SpecificParty>> getpurchaseCreditHistory(String id) async {
    final response =
        await ApiV1Service.getRequest('/purchase/credit-history/$id');

    return (response.data['data'] as List)
        .map((e) => SpecificParty.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
