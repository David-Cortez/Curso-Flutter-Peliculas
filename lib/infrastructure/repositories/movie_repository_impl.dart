
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';






class MovieReposityImpl extends MoviesRepository {


  final MoviesDatasource datasource;
  MovieReposityImpl(this.datasource);


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  


  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
  


  @override
  Future<List<Movie>> getToRated({int page = 1}) {
    return datasource.getToRated(page: page);
  }
  

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
  
  @override
  Future<List<Movie>> searchMovie(String query) {
    return datasource.searchMovie(query);
  }


}