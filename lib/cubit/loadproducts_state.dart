import 'package:myshop/models/product.dart';

abstract class LoadProductsState {}

class LoadProductsInitial extends LoadProductsState {}

class LoadProductsLoading extends LoadProductsState {}

class LoadProductsLoaded extends LoadProductsState {
  final List<Product> products; // Adjust type as needed

  LoadProductsLoaded(this.products);
}

class LoadProductsError extends LoadProductsState {
  final String message;

  LoadProductsError(this.message);
}
