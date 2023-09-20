import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc___/data/cart_items.dart';
import 'package:bloc___/features/home/models/home_product.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSucessState(cartItems: Cartitems));
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) {
    Cartitems.remove(event.dataModel);
    emit(CartSucessState(cartItems: Cartitems));
  }
}
