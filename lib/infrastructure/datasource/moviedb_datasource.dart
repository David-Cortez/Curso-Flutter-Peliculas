
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

import '../../domain/datasources/movies_datasource.dart';
import '../models/moviedb/movie_details.dart';





class MoviedbDatasource extends MoviesDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'es-CO'
    }

  ));


  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromMap(json);
    
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();


    return movies;
  }



  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  



  @override
  Future<List<Movie>> getPopular({int page = 1}) async{

    final response = await dio.get('/movie/popular', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }


  
  
  @override
  Future<List<Movie>> getToRated({int page = 1}) async{
     final response = await dio.get('/movie/top_rated', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }



  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response = await dio.get('/movie/upcoming', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  





  @override
  Future<Movie> getMovieById(String id) async {

    final response = await dio.get('/movie/$id');
    if( response.statusCode != 200 ) throw Exception('Movie with id: $id not found');

    final movieDB = MovieDetails.fromJson( response.data );
    final Movie movie  = MovieMapper.movieDetailsToEntity(movieDB);

    return movie;
    
  }
  



  @override
  Future<List<Movie>> searchMovie(String query) async {

    if( query.isEmpty ) return [];
    
    final response = await dio.get('/search/movie', 
      queryParameters: {
        'query': query
      }
    );

    return _jsonToMovies(response.data);
  }





}