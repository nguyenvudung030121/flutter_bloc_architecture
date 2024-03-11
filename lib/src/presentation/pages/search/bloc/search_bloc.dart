import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blocxx/src/data/model/product/product.dart';
import 'package:flutter_blocxx/src/data/repository/product_repository.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<GetProductEvent>(onGetProductEvent);
  }

  final repository = ProductRepositoryImpl();

  void onGetProductEvent(
      GetProductEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));

    final productResponse = await repository.getProduct(event.idProduct);

    productResponse.fold(
        (left) => emit(state.copyWith(status: ProductStatus.error)),
        (right) =>
            emit(state.copyWith(status: ProductStatus.loaded, product: right)));
  }
}
