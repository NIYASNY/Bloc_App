import 'package:bloc___/features/cart/ui/cart.dart';
import 'package:bloc___/features/home/bloc/home_bloc.dart';
import 'package:bloc___/features/home/ui/fb_tile.dart';
import 'package:bloc___/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeProductItemsCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Carted')));
        } 
        
        else if (state is HomeProductItemsWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Wishlisted')));
        } 
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Luxury Watches...'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(itemCount: successState.products.length, itemBuilder: (context, index) {
                return fbtile(homeBloc: homeBloc, dataModel: successState.products[index]);
              }),
            );

          case HomeErrorState:
            return Scaffold(
              appBar: AppBar(
                title: Text('Error State'),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
