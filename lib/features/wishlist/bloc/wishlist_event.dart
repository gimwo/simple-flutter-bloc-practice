part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class AddItemToWishlistEvent extends WishlistEvent {}

class RemoveItemToWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  RemoveItemToWishlistEvent({required this.productDataModel});
}
