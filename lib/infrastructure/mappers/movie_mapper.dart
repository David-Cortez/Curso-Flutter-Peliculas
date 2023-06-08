
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';
import '../../domain/entities/movie.dart';
import '../models/moviedb/movie_details.dart';





class MovieMapper {


  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult, 
    backdropPath: (movieDB.backdropPath != '')
                  ? 'https://image.tmdb.org/t/p/w500/${ movieDB.backdropPath}'
                  : 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg', 
    genreIds: movieDB.genreIds.map( (e) => e.toString()).toList(), 
    id: movieDB.id, 
    originalLanguage: movieDB.originalLanguage, 
    originalTitle: movieDB.originalTitle, 
    overview: movieDB.overview, 
    popularity: movieDB.popularity, 
    posterPath: (movieDB.posterPath != '')
              ? 'https://image.tmdb.org/t/p/w500/${ movieDB.posterPath}'
              : 'https://viterbi-web.usc.edu/~zexunyao/itp301/Assignment_07/img.jpeg', 
    releaseDate: (movieDB.releaseDate != null) ? movieDB.releaseDate! : DateTime.now(), 
    title: movieDB.title, 
    video: movieDB.video, 
    voteAverage: movieDB.voteAverage, 
    voteCount: movieDB.voteCount
  );


  static Movie movieDetailsToEntity( MovieDetails movieDB ) => Movie(
    adult: movieDB.adult, 
    backdropPath: (movieDB.backdropPath != '')
                  ? 'https://image.tmdb.org/t/p/w500/${ movieDB.backdropPath}'
                  : 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg', 
    genreIds: movieDB.genres.map( (e) => e.name).toList(), 
    id: movieDB.id, 
    originalLanguage: movieDB.originalLanguage, 
    originalTitle: movieDB.originalTitle, 
    overview: movieDB.overview, 
    popularity: movieDB.popularity, 
    posterPath: (movieDB.posterPath != '')
              ? 'https://image.tmdb.org/t/p/w500/${ movieDB.posterPath}'
              : 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg', 
    releaseDate: movieDB.releaseDate, 
    title: movieDB.title, 
    video: movieDB.video, 
    voteAverage: movieDB.voteAverage, 
    voteCount: movieDB.voteCount
  );

}