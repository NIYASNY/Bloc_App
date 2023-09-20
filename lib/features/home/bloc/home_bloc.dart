import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc___/data/cart_items.dart';
import 'package:bloc___/data/first.dart';
import 'package:bloc___/data/wishlist.dart';
import 'package:bloc___/features/home/models/home_product.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadingSuccessState(
        products: WatchProductsData.watchProducts
            .map(
              (e) => DataModel(
                  name: e['name'],
                  nickName: e['nickName'],
                  price: e['price'],
                  imageUrl: e['imageUrl']),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('This is called Wishlist');
    wishlistitems.add(event.clickedProduct);
    emit(HomeProductItemsWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("This is called CartClicked");
    Cartitems.add(event.clickedProduct);
    emit(HomeProductItemsCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('This is called Wishlist Navigate');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('This is called Cart Navigate');
    emit(HomeNavigateToCartPageActionState());
  }
}
