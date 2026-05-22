import 'package:dio/dio.dart';
import 'package:yes_or_no_app/domain/message.dart';
import 'package:yes_or_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}
