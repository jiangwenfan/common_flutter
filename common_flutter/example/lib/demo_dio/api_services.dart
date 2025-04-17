// import 'dio_client2.dart';
import 'package:common_flutter/common_flutter.dart';
// import 'package:dio/dio.dart';

// class ApiService {
//   final Dio dio = DioClient().dio;

//   Future<dynamic> getUserProfile() async {
//     try {
//       final response = await dio.get('/user/profile');
//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> login(String username, String password) async {
//     try {
//       final response = await dio.post(
//         '/auth/login',
//         data: {'username': username, 'password': password},
//       );

//       // 拿到 token 后你可以存储起来
//       final token = response.data['access_token'];
//       // await secureStorage.write(key: 'access_token', value: token);

//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

// 最终响应结果
class ResponseFinalRes {
  //  true 表示成功，false 表示失败
  bool status;
  // data 表示响应的内容；可能是成功的Map数据，也可能是失败的String数据
  dynamic data;

  ResponseFinalRes({required this.status, required this.data});

  @override
  String toString() {
    return 'ResponseFinalRes{status: $status, data: $data}';
  }
}

class UserApi {
  final DioClient _dioClient = DioClient(baseUrl: "http://192.168.90.167:8010");

  // 封装login登陆接口
  Future<dynamic> login(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.post("/users/login/", data: data);
      return response.data;
    } catch (e) {
      return Future.error(e);
    }
  }

  // 封装 /customers/ 接口
  Future<ResponseFinalRes> getCustomers() async {
    try {
      final response = await _dioClient.get("/customers/");
      // 根据后端返回数据格式进行解析
      return ResponseFinalRes(status: true, data: response.data);
    } on HandledRequestException catch (e) {
      // print("自定义异常: ${e.message}");
      return ResponseFinalRes(status: false, data: e.message);
    } catch (e) {
      // 根据实际需求做异常处理或者直接往上传递错误
      print("无法处理异常: $e");
      return Future.error(e);
    }
  }

  // 封装创建 entities 接口
  /*
    {
    "status":true,
    "data": res
    }
  */
  Future<ResponseFinalRes> createEntities(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.post("/entities/", data: data);
      return ResponseFinalRes(status: true, data: response.data);
      // } catch (e) {
      //   // return Future.error(e);
      //   // e.toString()
      //   return ResponseFinalRes(status: false, data: "请求失败");
      // }
    } on HandledRequestException catch (e) {
      // print("自定义异常: ${e.uiErrMessage}");
      return ResponseFinalRes(status: false, data: e.uiErrMessage);
    } catch (e) {
      // 根据实际需求做异常处理或者直接往上传递错误
      print("无法处理异常: $e");
      // return Future.error(e);
      return ResponseFinalRes(status: false, data: "请求失败");
    }
  }
}
