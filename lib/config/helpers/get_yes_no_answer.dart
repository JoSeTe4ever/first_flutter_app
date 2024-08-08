//es como un servicio
import 'package:dio/dio.dart';
import 'package:first_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://yesno.wtf/api',
    ),
  );

  Future<Message> getAnswer() {
    return _dio.get('/').then((response) {
      final data = response.data;
      return Message(
          text: data['answer'], fromWho: FromWho.hers, imgUrl: data['image']);
    });
  }
}
