part of 'party_cubit.dart';

@immutable
abstract class PartyState {}

class PartyInitial extends PartyState {}

class PartyLoading extends PartyState {}

class PartyError extends PartyState {
  final String message;
  PartyError(this.message);
}

class PartyListRender extends PartyState {
  final List<Party> parties;
  PartyListRender(this.parties);
}

class OrdersListRender extends PartyState {
  final List<Order> salesOrders;
  final List<Order> purchaseOrders;
  OrdersListRender({
    required this.salesOrders,
    required this.purchaseOrders,
  });
}

class PartyUpdate extends PartyState {}

class PartySuccess extends PartyState {}