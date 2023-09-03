import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/product_dto.dart';
import 'base_api.dart';
import 'obtained_response.dart';

class ProductCmsApi {
  Future<ObtainedResponse> getProducts(num pageId) async {
    List<ProductDto> products = [];
    final modelApiData = {
      'page_id': pageId,
    };
    
    final response = await http.post(
      Uri.parse(BASE_API + "/cms/products/fetch/all"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(modelApiData)
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print()
      if (responseJson['response']['error'] == 0) {
        for (int i = 0;
            i < responseJson['content'].length;
            i++) {
          ProductDto assignment =
              ProductDto.fromJson(responseJson['content'][i]);
          products.add(assignment);
        }
        return ObtainedResponse(API_RESULT.SUCCESS, products);
      } 
      
      return ObtainedResponse(API_RESULT.FAILED, responseJson['response']['message']);
    }
    return ObtainedResponse(API_RESULT.FAILED, "Bad response from server");
  }

  Future<ObtainedResponse> saveProduct(ProductDto dto) async {
    final response = await http.post(
      Uri.parse(BASE_API + "/cms/products/create"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dto.toJson())
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print()
      if (responseJson['response']['error'] == 0) {
        // for (int i = 0;
        //     i < responseJson['content'].length;
        //     i++) {
        //   ProductDto assignment =
        //       ProductDto.fromJson(responseJson['content'][i]);
        //   products.add(assignment);
        // }
        return ObtainedResponse(API_RESULT.SUCCESS, true);
      } 
      
      return ObtainedResponse(API_RESULT.FAILED, responseJson['response']['message']);
    }
    return ObtainedResponse(API_RESULT.FAILED, "Bad response from server");
      
  }

  Future<ObtainedResponse> getProduct(String productId) async {
    
    final response = await http.get(
      Uri.parse(BASE_API + "/cms/products/$productId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print()
      if (responseJson['response']['error'] == 0) {
        // for (int i = 0;
        //     i < responseJson['content'].length;
        //     i++) {
        //   ProductDto assignment =
        //       ProductDto.fromJson(responseJson['content'][i]);
        //   products.add(assignment);
        // }
        ProductDto resp = ProductDto.fromJson(responseJson['content']);
        return ObtainedResponse(API_RESULT.SUCCESS, resp);
      } 
      
      return ObtainedResponse(API_RESULT.FAILED, responseJson['response']['message']);
    }
    return ObtainedResponse(API_RESULT.FAILED, "Bad response from server");
  }

  Future<ObtainedResponse> getTrendingProducts() async {
    List<ProductDto> trendingProductList = [];
    final response = await http.get(
      Uri.parse(BASE_API + "/app/products/trending-products"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      //print(responseJson);
      if (responseJson['response']['error'] == 0) {
        for (int i = 0;
            i < responseJson['content'].length;
            i++) {
          ProductDto assignment =
              ProductDto.fromJson(responseJson['content'][i]);
          trendingProductList.add(assignment);
        }
        //ProductDto resp = ProductDto.fromJson(responseJson['content']);
        return ObtainedResponse(API_RESULT.SUCCESS, trendingProductList);
      } 
      
      return ObtainedResponse(API_RESULT.FAILED, responseJson['response']['message']);
    }
    return ObtainedResponse(API_RESULT.FAILED, "Bad response from server");
  }

  Future<ObtainedResponse> getCategoryWiseProducts(String categoryId) async {

    List<ProductDto> trendingProductList = [];
    final response = await http.get(
      Uri.parse(BASE_API + "/app/products/category-products/$categoryId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (responseJson['response']['error'] == 0) {
        for (int i = 0;
            i < responseJson['content'].length;
            i++) {
          ProductDto assignment =
              ProductDto.fromJson(responseJson['content'][i]);
          trendingProductList.add(assignment);
        }
        //ProductDto resp = ProductDto.fromJson(responseJson['content']);
        return ObtainedResponse(API_RESULT.SUCCESS, trendingProductList);
      } 
      
      return ObtainedResponse(API_RESULT.FAILED, responseJson['response']['message']);
    }
    return ObtainedResponse(API_RESULT.FAILED, "Bad response from server");
  }

  Future<ObtainedResponse> getProductDetailBySlug(String productSlug) async {
    final response = await http.get(
      Uri.parse(BASE_API + "/app/products/detail/$productSlug"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print()
      if (responseJson['response']['error'] == 0) {
        // for (int i = 0;
        //     i < responseJson['content'].length;
        //     i++) {
        //   ProductDto assignment =
        //       ProductDto.fromJson(responseJson['content'][i]);
        //   products.add(assignment);
        // }
        ProductDto resp = ProductDto.fromJson(responseJson['content']);
        return ObtainedResponse(API_RESULT.SUCCESS, resp);
      } 
      
      return ObtainedResponse(API_RESULT.FAILED, responseJson['response']['message']);
    }
    return ObtainedResponse(API_RESULT.FAILED, "Bad response from server");
  }
}