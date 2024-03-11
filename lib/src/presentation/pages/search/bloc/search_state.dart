part of 'search_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

class SearchState extends Equatable {
  final Product? product;
  final ProductStatus? status;

  const SearchState({this.product, this.status});

  static SearchState initial() =>
      const SearchState(product: null, status: ProductStatus.initial);

  SearchState copyWith({
    Product? product,
    ProductStatus? status,
  }) {
    return SearchState(
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [product, status];
}
