import 'package:bloc___/features/cart/bloc/cart_bloc.dart';
import 'package:bloc___/features/home/models/home_product.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final DataModel dataModel;
  final CartBloc cartBloc;

  const CartTile({super.key, required this.dataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(dataModel.imageUrl),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            dataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + dataModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(RemoveFromCartEvent(
                        dataModel: dataModel
                      ));
                    },
                    icon: Icon(Icons.delete),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
