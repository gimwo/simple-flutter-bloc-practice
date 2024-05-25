import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice_akshit/data/wishlist_items.dart';
import 'package:bloc_practice_akshit/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveItemToWishlistEvent>(removeItemToWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> removeItemToWishlistEvent(
      RemoveItemToWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistItemRemovedActionState(name: event.productDataModel.name));
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
