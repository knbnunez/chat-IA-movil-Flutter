import 'package:shared_preferences/shared_preferences.dart';

const String _kTextResponsesCount = 'text_responses_count';

Future<int> getTextResponsesCount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_kTextResponsesCount) ?? 0; // Checkeamos además que si es null, retorne 0
}

void incrementTextResponsesCount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int currentCount = await getTextResponsesCount();
  prefs.setInt(_kTextResponsesCount, (currentCount+1)); // aumentamos en 1 la cantidad de respuestas
}