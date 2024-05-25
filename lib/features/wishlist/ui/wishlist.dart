import 'package:bloc_practice_akshit/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_practice_akshit/features/wishlist/ui/wishlist_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listener: (context, state) {
            if (state is WishlistItemRemovedActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item ${state.name} removed!')));
            }
          },
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (WishlistSuccessState):
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                    itemCount: successState.wishlistItems.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                        productDataModel: successState.wishlistItems[index],
                        wishlistBloc: wishlistBloc,
                      );
                    });

              default:
                return SizedBox();
            }
          },
        ));
  }
}
