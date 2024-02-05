import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopos/src/blocs/specific%20party/specific_party_state.dart';
import 'package:shopos/src/models/input/order.dart';

import 'package:shopos/src/models/party.dart';
import 'package:shopos/src/services/specific_party.dart';

import '../../pages/checkout.dart';

class SpecificPartyCubit extends Cubit<SpecificPartyState> {
  final List<Order> _specificsaleParties = [];
  final List<Order> _specificpurchaseParties = [];
  final SpecificPartyService _partyService = SpecificPartyService();
  late final Party _partyDetails;
  SpecificPartyCubit() : super(SpecificPartyInitial());

  ///
  void getInitialCreditHistory(String id) async {
    emit(SpecificPartyLoading());
    try {
      print('oo');
      final sales = await _partyService.getSalesCreditHistory(id);
      print("line 27 in specific party cubit");
      _partyDetails = await _partyService.getCreditSaleParty(id);
      print("line 31 in specific party cubit");
      print(_partyDetails.toMap().toString());
      print('okk');
      _specificsaleParties.clear();
      _specificpurchaseParties.clear();
      _specificsaleParties.addAll(sales);

    
      emit(
        SpecificPartyListRender(
          specificparty: sales,
          partyDetails: _partyDetails,
        ),
      );
    } catch (err) {
      log("$err");
      SpecificPartyError("Error fetching parties");
    }
  }

  ///
  void getInitialpurchasedHistory(String id) async {
    emit(SpecificPartyLoading());
    try {
      print("line 47 in specitparty");
      final purchase = await _partyService.getpurchaseCreditHistory(id);
      _partyDetails = await _partyService.getCreditPurchaseParty(id);
      _specificsaleParties.clear();
      _specificpurchaseParties.clear();
      _specificpurchaseParties.addAll(purchase);
      emit(SpecificPartyListRender(
        specificparty: purchase,
        partyDetails: _partyDetails,
      ));
    } catch (err) {
      log("$err");
      SpecificPartyError("Error fetching parties");
    }
  }

  ///
  void updateCreditHistory(Party p) async {
    final response = await _partyService.updateSalesCredit(p);
    print(response.data);
    print("line 66 in specific party cubit");
    final sales = await _partyService.getSalesCreditHistory(p.id!);
    if ((response.statusCode ?? 400) > 300) {
      emit(SpecificPartyError("Error updating party"));
      return;
    }
    final _partyDetail = await _partyService.getCreditSaleParty(p.id!);
    return emit(SpecificPartyListRender(
      partyDetails: _partyDetail,
      specificparty: sales,
    ));
  }

  ///
  void updatepurchaseHistory(Party p) async {
    final response = await _partyService.updatepurchasedCredit(p);
    final purchase = await _partyService.getpurchaseCreditHistory(p.id!);
    if ((response.statusCode ?? 400) > 300) {
      emit(SpecificPartyError("Error updating party"));
      return;
    }
    final _partyDetail = await _partyService.getCreditPurchaseParty(p.id!);
    return emit(SpecificPartyListRender(
      partyDetails: _partyDetail,
      specificparty: purchase,
    ));
  }

  ///
  void updateAmountCustomer(Party p, String partyId) async {
    print("updating amount customer");
    print("p is: ${p.toMap().toString()}");
    final response = await _partyService.updateSaleAmount(p);
    print("response.data is ${response.data}");
    if ((response.statusCode ?? 400) > 300) {
      emit(SpecificPartyError("Error updating party"));
      return;
    }
    print("party id: ${partyId}");
    final sales = await _partyService.getSalesCreditHistory(partyId);
    final _partyDetail = await _partyService.getCreditSaleParty(partyId);
    print("sales is ${sales}");
    print("_partyDetail is ${_partyDetail.toMap().toString()}");

    return emit(SpecificPartyListRender(
        partyDetails: _partyDetail, specificparty: sales));
  }

  ///
  void updateAmountSupplier(Party p, String partyId) async {
    final response = await _partyService.updatepurchasedAmount(p);
    if ((response.statusCode ?? 400) > 300) {
      emit(SpecificPartyError("Error updating party"));
      return;
    }
    final purchase = await _partyService.getpurchaseCreditHistory(partyId);
    final _partyDetail = await _partyService.getCreditPurchaseParty(partyId);
    return emit(SpecificPartyListRender(
        partyDetails: _partyDetail, specificparty: purchase));
  }

  ///
  void deleteCustomerExpense(Party p, String partyId) async {
    try {
      final response = await _partyService.deletesaleAmount(p.id.toString());
      if ((response.statusCode ?? 400) > 300) {
        emit(SpecificPartyError(response.data['message']));
        return;
      }
    } on DioError catch (err) {
      emit(SpecificPartyError(err.message.toString()));
    }
    final sales = await _partyService.getSalesCreditHistory(partyId);
    final _partyDetail = await _partyService.getCreditSaleParty(partyId);
    return emit(SpecificPartyListRender(
        partyDetails: _partyDetail, specificparty: sales));
  }

  ///
  void deleteSupplierExpense(Party p, String partyId) async {
    try {
      final response =
          await _partyService.deletepurchaseAmount(p.id.toString());
      if ((response.statusCode ?? 400) > 300) {
        emit(SpecificPartyError(response.data['message']));
        return;
      }
    } on DioError catch (err) {
      emit(SpecificPartyError(err.message.toString()));
    }
    final purchase = await _partyService.getpurchaseCreditHistory(partyId);
    final _partyDetail = await _partyService.getCreditPurchaseParty(partyId);
    return emit(SpecificPartyListRender(
        partyDetails: _partyDetail, specificparty: purchase));
  }
}
