import 'dart:convert';
import 'dart:developer';
import 'package:crafty_bay/data/response_data.dart';
import 'package:http/http.dart' as http;

class NetaorkCaller {
  Future<ResponseData> getRequest(String url, {String? token}) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      "token": token.toString(),
      "Content-type": "Aapplication/json"
    });
    log(url);
    log(token.toString());
    log(response.statusCode.toString());
    log(response.headers.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse["msg"] == "success") {
        return ResponseData(
          isSucass: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else {
        return ResponseData(
          isSucass: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: decodedResponse["data"] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
        isSucass: false,
        statusCode: response.statusCode,
        responseData: "",
      );
    }
  }

  Future<ResponseData> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    http.Response response =
        await http.post(Uri.parse(url), body: jsonEncode(body));
    log(url);
    log(response.statusCode.toString());
    log(response.body.toString());

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse["msg"] == "success") {
        return ResponseData(
          isSucass: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else {
        return ResponseData(
          isSucass: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: decodedResponse["data"] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
        isSucass: false,
        statusCode: response.statusCode,
        responseData: "",
      );
    }
  }
}
