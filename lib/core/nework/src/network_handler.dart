import "dart:convert";
import 'dart:developer';
import "dart:io";
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:http/http.dart" as http;
import 'package:flutter_template/core/flavor/build_config.dart';
import 'package:flutter_template/core/local_cache/src/cache_provider.dart';
import 'package:flutter_template/core/nework/src/error_response.dart';
import 'package:flutter_template/core/nework/src/toaster.dart';

class NetworkHandler {
  // ApiMethod(this.isBasic);

  bool isBasic;

  // late WidgetRef _ref;

  late String _baseUrl = BuildConfig.instance.config.baseUrl;

  late String _token;

  late WidgetRef _ref;

  bool isRefPopulated = false;
  final client = http.Client();

  set refpopulated(WidgetRef ref) {
    if (!isRefPopulated) {
      _ref = ref;
      isRefPopulated = true;
    }
  }

  setToken(String token) => _token = token;

  Map<String, String> basicHeaderInfo() {
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      // HttpHeaders.authorizationHeader:
      //     "Basic " + base64Encode(utf8.encode("$_username:$_password")),
      // HttpHeaders.userAgentHeader: userAgent
    };
  }

  Future<Map<String, String>> bearerHeaderInfo() async {
    String userAgent = '';
    userAgent = Platform.operatingSystem +
        " " +
        Platform.operatingSystemVersion +
        " " +
        Platform.version;
    String? accessToken = _token;

    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.userAgentHeader: userAgent
    };
  }

  NetworkHandler._(this.isBasic); // Initialize isBasic with a parameter

  static final NetworkHandler instanceBasic =
      NetworkHandler._(true); // Pass true for isBasic
  static final NetworkHandler instanceNotBasic =
      NetworkHandler._(false); // Pass false for isBasic

  prevReport(
      {required String method,
      required String url,
      Map<String, dynamic>? body}) {
    log(
      name: " 🚀 📡 🚀 NetworkHandler 🚀 📡 🚀 ",
      "[🚀][📡][$method||$isBasic]: ${_baseUrl + url} || [body]: $body [📡]",
    );
  }

  responseReport({
    required String method,
    required http.Response response,
  }) {
    log(
      name: " 🎁 NetworkHandler - Response 🎁",
      "[🚀][RESPONSE][🎁][$method||$method]*[isBasic||$isBasic]*[statusCode||${response.statusCode}]*[Response BODY] : ${response.body} [🎁]",
    );
  }

  Future<
      ({
        ApiErrorResponse? errorResponse,
        Map<String, dynamic>? response,
      })> get({required url, int code = 200}) async {
    prevReport(method: "GET", url: url);
    try {
      final response = await http
          .get(
            Uri.parse(_baseUrl + url),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: 60));

      responseReport(
        method: "GET",
        response: response,
      );

      if (response.statusCode == code) {
        // {"statusCode":201,"isSuccess":true,"errorMessage":[],"result":{"homeownerOrProjectProfilesCheckInId":"HomOwnChin-B308A8FF-D3F4-4B9F-B","message":"Homeowner check-in created successfully"}}
        try {
          final message = jsonDecode(response.body)['result']['message'];
          Toaster.basicToast(message: message);
        } catch (e) {
          print(e);
        }
        return jsonDecode(response.body);
      } else {
        return unWantedResponseHandler(response);
      }
    } on SocketException catch (e, err) {
      log("",
          name: "NetworkHandler",
          error: '🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');
      Toaster.errorToast(
          warningMessage: 'Check your Internet Connection and try again!');
      return cather(e, err);
    } on TimeoutException {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: 'Time out exception' + url);
      Toaster.errorToast(warningMessage: 'Request Timed out');
      return timeOutRespinse();
    } on http.ClientException catch (err, stackrace) {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: 'client exception hitted');
      log("", name: "NetworkHandler", error: err.toString());
      log("", name: "NetworkHandler", error: stackrace.toString());
      return cather(err, stackrace);
    } catch (e, err) {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: '❌❌❌  unlisted error received 2');
      // log("", name: "NetworkHandler", error: "❌❌❌ " + e.toString());
      // log("", name: "NetworkHandler", error: "❌❌❌ " + err.toString());
      print(e);
      print(err);

      return cather(e, err);
    }
  }

  Future<
          ({
            ApiErrorResponse? errorResponse,
            Map<String, dynamic>? response,
          })>
      paramGet(String url, Map<String, String>? body, {int code = 200}) async {
    prevReport(method: "GET PARAM", url: url, body: body);

    try {
      final response = await http
          .get(
            Uri.parse(url).replace(queryParameters: body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: 60));
      responseReport(
        method: "PARAM GET",
        response: response,
      );

      if (response.statusCode == code) {
        // Toaster.basicToast(message: "Operation Successfull");
        return jsonDecode(response.body);
      } else {
        return unWantedResponseHandler(response);
      }
    } on SocketException catch (e, err) {
      log("",
          name: "NetworkHandler",
          error: '🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');
      Toaster.errorToast(
          warningMessage: 'Check your Internet Connection and try again!');
      return cather(e, err);
    } on TimeoutException {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: 'Time out exception' + url);
      Toaster.errorToast(warningMessage: 'Request Timed out');
      return timeOutRespinse();
    } on http.ClientException catch (err, stackrace) {
      return cather(err, stackrace);
    } catch (e, err) {
      return cather(e, err);
    }
  }

  Future<
      ({
        ApiErrorResponse? errorResponse,
        Map<String, dynamic>? response,
      })> post({
    required String url,
    required Map<String, dynamic>? body,
    int code = 201,
    File? imageFile,
  }) async {
    prevReport(method: "POST", url: url, body: body);

    try {
      if (imageFile == null) {
        final response = await http
            .post(
              Uri.parse("$_baseUrl$url"),
              body: jsonEncode(body),
              headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
            )
            .timeout(Duration(seconds: 60));
        responseReport(
          method: "POST",
          response: response,
        );

        if (response.statusCode == code) {
          try {
            final message = jsonDecode(response.body)['message'];
            Toaster.basicToast(message: message);
          } catch (e) {
            print(e);
          }
          return jsonDecode(response.body);
        } else {
          return unWantedResponseHandler(response);
        }
      } else {
        final request = http.MultipartRequest(
          'POST',
          Uri.parse("$_baseUrl$url"),
        );
        final file = http.MultipartFile('ImageFile',
            imageFile.readAsBytes().asStream(), imageFile.lengthSync(),
            filename: imageFile.path.split("/").last);
        request.files.add(file);
        body!.forEach((key, value) {
          request.fields[key] = value.toString();
        });
        print("${request.fields}");

        request.headers
            .addAll(isBasic ? basicHeaderInfo() : await bearerHeaderInfo());
        // request.fields.addAll(body as Map<String, String>);
        final streamedResponse = await client.send(request);
        List<int> bytes = await streamedResponse.stream.toBytes();
        http.Response httpResponse =
            http.Response.bytes(bytes, streamedResponse.statusCode);

        if (httpResponse.statusCode == code) {
          // Toaster.basicToast(message: "Operation Successfull");
          return jsonDecode(httpResponse.body);
        } else {
          return unWantedResponseHandler(httpResponse);
        }
      }
    } on SocketException catch (e, err) {
      log("",
          name: "NetworkHandler",
          error: '🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');
      Toaster.errorToast(
          warningMessage: 'Check your Internet Connection and try again!');
      return cather(e, err);
    } on TimeoutException {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: 'Time out exception' + url);
      Toaster.errorToast(warningMessage: 'Request Timed out');
      return timeOutRespinse();
    } on http.ClientException catch (err, stackrace) {
      return cather(err, stackrace);
    } catch (e, err) {
      return cather(e, err);
    }
  }

  // patch

  Future<
      ({
        ApiErrorResponse? errorResponse,
        Map<String, dynamic>? response,
      })> patch({
    required String url,
    Map<String, dynamic>? body,
    int code = 201,
    File? imageFile,
  }) async {
    prevReport(method: "PATCH", url: url, body: body);

    try {
      if (imageFile == null) {
        final response = await http
            .patch(
              Uri.parse("$_baseUrl$url"),
              body: body == null ? null : jsonEncode(body),
              headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
            )
            .timeout(Duration(seconds: 60));
        responseReport(
          method: "PATCH",
          response: response,
        );

        if (response.statusCode == code) {
          try {
            final message = jsonDecode(response.body)['message'];
            Toaster.basicToast(message: message);
          } catch (e) {
            print(e);
          }
          return jsonDecode(response.body);
        } else {
          return unWantedResponseHandler(response);
        }
      } else {
        final request = http.MultipartRequest(
          'POST',
          Uri.parse("$_baseUrl$url"),
        );
        final file = http.MultipartFile('ImageFile',
            imageFile.readAsBytes().asStream(), imageFile.lengthSync(),
            filename: imageFile.path.split("/").last);
        request.files.add(file);
        body!.forEach((key, value) {
          request.fields[key] = value.toString();
        });
        print("${request.fields}");

        request.headers
            .addAll(isBasic ? basicHeaderInfo() : await bearerHeaderInfo());
        // request.fields.addAll(body as Map<String, String>);
        final streamedResponse = await client.send(request);
        List<int> bytes = await streamedResponse.stream.toBytes();
        http.Response httpResponse =
            http.Response.bytes(bytes, streamedResponse.statusCode);

        if (httpResponse.statusCode == code) {
          // Toaster.basicToast(message: "Operation Successfull");
          return jsonDecode(httpResponse.body);
        } else {
          return unWantedResponseHandler(httpResponse);
        }
      }
    } on SocketException catch (e, err) {
      log("",
          name: "NetworkHandler",
          error: '🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');
      Toaster.errorToast(
          warningMessage: 'Check your Internet Connection and try again!');
      return cather(e, err);
    } on TimeoutException {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: 'Time out exception' + url);
      Toaster.errorToast(warningMessage: 'Request Timed out');
      return timeOutRespinse();
    } on http.ClientException catch (err, stackrace) {
      return cather(err, stackrace);
    } catch (e, err) {
      return cather(e, err);
    }
  }

  //delete

  Future<
      ({
        ApiErrorResponse? errorResponse,
        Map<String, dynamic>? response,
      })> delete(String url, {int code = 202, bool isLogout = false}) async {
    prevReport(method: "DELETE", url: url);

    try {
      var headers = isBasic ? basicHeaderInfo() : await bearerHeaderInfo();
      // if (isLogout) {
      //   headers
      //     ..addAll(
      //         {"fcm_token": (await FirebaseMessaging.instance.getToken())!});
      // }

      final response = await http
          .delete(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(Duration(seconds: 60));

      responseReport(
        method: "DELETE",
        response: response,
      );

      if (response.statusCode == code) {
        // Toaster.basicToast(message: "Operation Successfull");
        return jsonDecode(response.body);
      } else {
        return unWantedResponseHandler(response);
      }
    } on SocketException catch (e, err) {
      log("",
          name: "NetworkHandler",
          error: '🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');
      Toaster.errorToast(
          warningMessage: 'Check your Internet Connection and try again!');
      return cather(e, err);
    } on TimeoutException {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: 'Time out exception' + url);
      Toaster.errorToast(warningMessage: 'Request Timed out');
      return timeOutRespinse();
    } on http.ClientException catch (err, stackrace) {
      return cather(err, stackrace);
    } catch (e, err) {
      return cather(e, err);
    }
  }

  Future<
      ({
        ApiErrorResponse? errorResponse,
        Map<String, dynamic>? response,
      })> put(String url, Map<String, dynamic>? body, {int code = 202}) async {
    prevReport(method: "PUT", url: url, body: body);

    try {
      final response = await http
          .put(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: 60));
      responseReport(
        method: "PUT",
        response: response,
      );

      if (response.statusCode == code) {
        // Toaster.basicToast(message: "Operation Successfull");
        return jsonDecode(response.body);
      } else {
        return unWantedResponseHandler(response);
      }
    } on SocketException catch (e, err) {
      log("",
          name: "NetworkHandler",
          error: '🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');
      Toaster.errorToast(
          warningMessage: 'Check your Internet Connection and try again!');
      return cather(e, err);
    } on TimeoutException {
      log("", name: "NetworkHandler", error: '🐞🐞🐞 Error Alert 🐞🐞🐞');
      log("", name: "NetworkHandler", error: 'Time out exception' + url);
      Toaster.errorToast(warningMessage: 'Request Timed out');

      return timeOutRespinse();
    } on http.ClientException catch (err, stackrace) {
      return cather(err, stackrace);
    } catch (e, err) {
      return cather(e, err);
    }
  }

  // Time Out
  ({
    ApiErrorResponse? errorResponse,
    Map<String, dynamic>? response,
  }) timeOutRespinse() => (
        errorResponse: ApiErrorResponse(
          errorResponse: ErrorResponse(
              errors: "Request Time Out", message: "Request Time Out"),
          statusCode: -0,
        ),
        response: null
      );

  // Unwanted Response

  ({
    ApiErrorResponse? errorResponse,
    Map<String, dynamic>? response,
  }) unWantedResponseHandler(http.Response response) {
    basicPrinter("res ---> ${response.body}");
    basicPrinter(response.statusCode);
    basicPrinter(response.request);

    final ErrorResponse? errorResponse;

    try {
      errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
      Toaster.errorToast(warningMessage: errorResponse.message);
    } catch (e) {
      basicPrinter(e);
    }

    if (response.statusCode == 401) {
      Toaster.errorToast(warningMessage: "Something Went Wrong!");
      basicPrinter('🐞🐞🐞 Error Alert 401 🐞🐞🐞');
      basicPrinter('Hitted Here!**|token-expire|*******');
      _ref.read(hiveProvider).cleanBox();
      Toaster.errorToast(warningMessage: "Invalid Token");
    } else if (response.statusCode == 204) {
      basicPrinter('🐞🐞🐞 Error Alert 204 🐞🐞🐞');
    } else if (response.statusCode == 406) {
      basicPrinter('🐞🐞🐞 Error Alert 406 🐞🐞🐞');
      // ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
      // Toaster.errorToast(warningMessage: res.message!);
    } else if (response.statusCode == 400) {
      int actualResponseCode = jsonDecode(response.body)['statusCode'] ?? 0;
      if (actualResponseCode == 404) {
        Toaster.errorToast(
            warningMessage:
                (jsonDecode(response.body)['result'] ?? "").toString());
      } else {
        Toaster.errorToast(warningMessage: "Something Went Wrong!");
      }
      // Toaster.errorToast(warningMessage: "Something Went Wrong!");

      basicPrinter(
          '🐞🐞🐞 Error Alert => ${response.statusCode} || ${response.body} 🐞🐞🐞');
      // ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
      // Toaster.errorToast(warningMessage: res.message!);
    } else {
      basicPrinter(
          '🐞🐞🐞 Error Alert || ${response.statusCode} || ${response.body} 🐞🐞🐞');
      basicPrinter(
          'unknown error hitted in status code' + jsonDecode(response.body));
      // ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
      // Toaster.errorToast(warningMessage: res.message!);
    }
    return (
      errorResponse: ApiErrorResponse(),
      response: null,
    );
  }

  ({
    ApiErrorResponse? errorResponse,
    Map<String, dynamic>? response,
  }) cather(e, err) {
    log(
      "",
      error: '🐞🐞🐞 Error Alert 🐞🐞🐞',
    );
    Toaster.errorToast(warningMessage: "Something went  wrong!");
    log("",
        name: "NetworkHandler", error: '❌❌❌  unlisted error received 1 ❌❌❌');
    log("", name: "NetworkHandler", error: e.toString());
    log("", name: "NetworkHandler", error: err.toString());
    print(e);
    print(err);
    return (
      errorResponse: ApiErrorResponse(
        errorResponse: ErrorResponse(),
        statusCode: -0,
      ),
      response: null
    );
  }
}

basicPrinter(dynamic object) => print(object.toString());
