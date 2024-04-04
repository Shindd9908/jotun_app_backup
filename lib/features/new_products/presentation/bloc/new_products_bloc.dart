import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/new_products/domain/entities/new_product_entity.dart';
import 'package:jotub_app/features/new_products/domain/repositories/new_products_repository.dart';

part 'new_products_event.dart';

part 'new_products_state.dart';

class NewProductsBloc extends Bloc<NewProductsEvent, NewProductsState> {
  NewProductsBloc({required this.newProductsRepository}) : super(NewProductsInitial()) {
    on<FetchListNewProductsEvent>(_fetchListNewProduct);
  }

  final NewProductsRepository newProductsRepository;

  Future<void> _fetchListNewProduct(FetchListNewProductsEvent event, Emitter<NewProductsState> emit) async {
    emit(FetchListNewProductsLoadingState());
    final result = await newProductsRepository.fetchListNewProduct();
    result.fold(
      (l) => emit(FetchListNewProductsFailState(message: l)),
      (r) => emit(FetchListNewProductsSuccessState(listNewProduct: r)),
    );
  }
}
