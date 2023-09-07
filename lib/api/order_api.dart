import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/product_dto.dart';
import 'base_api.dart';
import 'obtained_response.dart';

class OrderApi {
  Future<ObtainedResponse> createOrder(ProductDto productDto, String userName, String userPhone, String address) async {
    final modelApiData = {
      'item': productDto,
      'user_name': userName, 
      'user_phone':userPhone, 
      'user_address': address
    };
    
    final response = await http.post(
      Uri.parse(BASE_API + "/app/orders/create"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(modelApiData)
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print()
      if (responseJson['response']['error'] == 0) {
        return ObtainedResponse(API_RESULT.SUCCESS, 'Order created succesful');
      } 
      
      return ObtainedResponse(API_RESULT.FAILED, responseJson['response']['message']);
    }
    return ObtainedResponse(API_RESULT.FAILED, "Bad response from server");
  }
}