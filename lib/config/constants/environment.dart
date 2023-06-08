
import 'package:flutter_dotenv/flutter_dotenv.dart';





class Environment {

  static String movieDbKey = dotenv.env['THE_MOVIES_KEY'] ?? 'No hay datos';

}