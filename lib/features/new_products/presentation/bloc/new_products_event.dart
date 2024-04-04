part of 'new_products_bloc.dart';

sealed class NewProductsEvent extends Equatable {
  const NewProductsEvent();
}

class FetchListNewProductsEvent extends NewProductsEvent {
  const FetchListNewProductsEvent();

  @override
  List<Object?> get props => [];
}
