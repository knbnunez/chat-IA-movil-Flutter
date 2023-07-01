import 'package:http/http.dart' as http;
import 'package:flutter_demo_app/data/ia_response.dart';

Future<IaResponse> sendQuestionToChat(String question) async { // Future es equivalente a la promesa en JS
  Uri url = Uri.http('tnt2023.panaltesting.com.ar', 'chat', {'question': ('$question Respondeme en español')});
  http.Response response = await http.get(url);
  return iaResponseFromJson(response.body);
}

