// 该类主要是用来展示，当请求出错时，在ui层上需要展示的错误信息
class UIErrMessage {
  // 请求的状态码
  final int statusCode;

  /*
   表示是否需要解析错误信息
    true: 需要解析错误信息,400错误
    false: 不需要解析错误信息,非400错误
  */
  final bool needsErrorParsing;

  /*
    该字段用于 UI 显示的错误信息
      needsErrorParsing 为 true 时，表示需要解析错误信息
      needsErrorParsing 为 false 时，表示不需要解析错误信息,从key为_的字段中获取错误信息,如果没有提供该字段，则使用默认的错误信息
  */
  final Map<String, dynamic> errorMessage;
  // 默认的错误信息
  static const Map<String, dynamic> baseM = {"_": "默认错误信息-请求异常"};

  UIErrMessage({
    required int? statusCode,
    required Map<String, dynamic>? errorMessage,
  }) : statusCode = statusCode ?? 0,
       needsErrorParsing = statusCode == 400,
       errorMessage =
           errorMessage != null ? {...baseM, ...errorMessage} : baseM;

  // TODO 格式化请求异常信息
  @override
  String toString() {
    return 'UIErrMessage{needsErrorParsing: $needsErrorParsing, errorMessage: $errorMessage}';
  }
}
