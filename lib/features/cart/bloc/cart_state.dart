part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSucessState extends CartState {
  final List<DataModel> cartItems;

  CartSucessState({required this.cartItems});
}
