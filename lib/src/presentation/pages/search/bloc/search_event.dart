part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductEvent extends SearchEvent {
  final int idProduct;

  GetProductEvent(this.idProduct);

  @override
  List<Object?> get props => [idProduct];
}
