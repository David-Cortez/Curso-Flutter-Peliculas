
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/datasource/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repositpory_impl.dart';











final actorsRepositoryProvider = Provider((ref) {

  return ActorRepositoryImpl(ActorMovieDbDatatasources());
});
