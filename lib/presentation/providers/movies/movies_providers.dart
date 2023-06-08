


import 'package:cinemapedia/presentation/providers/movies/movies_reposity_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';




final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  final fetchMoreMoview = ref.watch( movieRepositoryProvider ).getNowPlaying;
  
  return MoviesNotifier(
    fechMoreMovies: fetchMoreMoview
  );
});



final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  final fetchMoreMoview = ref.watch( movieRepositoryProvider ).getPopular;
  
  return MoviesNotifier(
    fechMoreMovies: fetchMoreMoview
  );
});



final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  final fetchMoreMoview = ref.watch( movieRepositoryProvider ).getUpcoming;
  
  return MoviesNotifier(
    fechMoreMovies: fetchMoreMoview
  );
});



final topRaterMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  final fetchMoreMoview = ref.watch( movieRepositoryProvider ).getToRated;
  
  return MoviesNotifier(
    fechMoreMovies: fetchMoreMoview
  );
});






typedef MovieCallback = Future<List<Movie>> Function({ int page });



class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fechMoreMovies;

  MoviesNotifier({
    required this.fechMoreMovies,
  }):super([]);

  Future<void> loadNextPage() async{
    if( isLoading ) return;

    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fechMoreMovies( page: currentPage );
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

}