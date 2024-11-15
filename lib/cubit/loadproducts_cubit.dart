import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/Webservices.dart';
import 'package:myshop/cubit/loadproducts_state.dart';
import 'package:myshop/models/product.dart';

class LoadProductsCubit extends Cubit<LoadProductsState> {
  LoadProductsCubit() : super(LoadProductsInitial());

  void loadProducts(String endpoint) async {
    emit(LoadProductsLoading());

    try {
      final Webservices webservices=Webservices();
      final List<Product> products = await webservices.getdata(endpoint);
      emit(LoadProductsLoaded(products));
    } catch (e) {
      emit(LoadProductsError(e.toString()));
    }
  }
}
