part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

//State of the Home screen
final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

final class HomeErrorState extends HomeState {}

// Button Clicks in the App
final class HomeNavigateToWishlistPageActionState extends HomeActionState {}

final class HomeNavigateToCartPageActionState extends HomeActionState {}

final class HomeProductItemWishlistedActionState extends HomeActionState {}

final class HomeProductItemCartedActionState extends HomeActionState {}
