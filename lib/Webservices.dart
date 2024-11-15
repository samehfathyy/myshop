import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:myshop/models/product.dart';

//@RestApi(baseUrl: "https://dummyjson.com/")
class Webservices {
  // factory Webservices(Dio dio, {String? baseUrl}) = _Webservices;
  //final dio = Dio();
  final Dio dio;

  Webservices() : dio = Dio() {
    // Configure dio to ignore certificate errors
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  // @GET('products')
  // Future<Products> getAllProducts();
  Future<List<Product>> getdata(String endpoint) async {
    Map<String, dynamic> query = {};
    final response = await dio.get('https://fakestoreapi.com/$endpoint',
        queryParameters: query);
    List<dynamic> jsonData = response.data;
    List<Product> products =
        jsonData.map((item) => Product.fromJson(item)).toList();

    return products;
  }
}
