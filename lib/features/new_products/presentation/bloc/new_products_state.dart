part of 'new_products_bloc.dart';

sealed class NewProductsState extends Equatable {
  const NewProductsState();
}

final class NewProductsInitial extends NewProductsState {
  @override
  List<Object> get props => [];
}

class FetchListNewProductsLoadingState extends NewProductsState {
  @override
  List<Object> get props => [];
}

class FetchListNewProductsSuccessState extends NewProductsState {
  final List<NewProductEntity> listNewProduct;

  const FetchListNewProductsSuccessState({required this.listNewProduct});

  @override
  List<Object> get props => [listNewProduct];
}

class FetchListNewProductsFailState extends NewProductsState {
  final String message;

  const FetchListNewProductsFailState({required this.message});

  @override
  List<Object> get props => [message];
}
