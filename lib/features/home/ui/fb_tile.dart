import 'package:bloc___/features/home/bloc/home_bloc.dart';
import 'package:bloc___/features/home/models/home_product.dart';
import 'package:flutter/material.dart';

class fbtile extends StatelessWidget {
  final DataModel dataModel;
  final HomeBloc homeBloc;

  const fbtile({super.key, required this.dataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: Colors.black)),
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
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        clickedProduct: dataModel
                      ));
                    },
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: dataModel
                      ));
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
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
