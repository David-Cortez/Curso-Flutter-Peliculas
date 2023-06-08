
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/providers/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/movies/movie_horizontal_listview.dart';
import '../../widgets/movies/movies_slideshow.dart';
import '../../widgets/shared/custom_appbar.dart';
import '../../widgets/shared/full_screen_loader.dart';





class HomeView extends ConsumerStatefulWidget {
  
  const HomeView({ super.key });

  @override
  HomeViewState createState() => HomeViewState();
}


class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRaterMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final slideshowMovies = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider ); 
    final popularMovies = ref.watch( popularMoviesProvider ); 
    final upcomingMovies = ref.watch( upcomingMoviesProvider ); 
    final topRaterMovies = ref.watch( topRaterMoviesProvider ); 




    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: CustomAppbar(),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate( (context, index){
            return Column(
              children: [
          
                // const CustomAppbar(),
          
                MoviesSlideshow(movies: slideshowMovies),
          
                MovieHorizontalListview(
                  movies: nowPlayingMovies, 
                  title: 'Lunes', 
                  subTitle: 'Abril 30',
                  loadNextPage: (){
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
          
          
                MovieHorizontalListview(
                  movies: upcomingMovies, 
                  title: 'Proximamente', 
                  subTitle: 'En este mes',
                  loadNextPage: (){
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),
          
          
                MovieHorizontalListview(
                  movies: popularMovies, 
                  title: 'Populares', 
                  // subTitle: 'En este mes',
                  loadNextPage: (){
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
          
          
                MovieHorizontalListview(
                  movies: topRaterMovies, 
                  title: 'Mejor Calificadas', 
                  subTitle: 'Desde siempre',
                  loadNextPage: (){
                    ref.read(topRaterMoviesProvider.notifier).loadNextPage();
                  },
                ),

                const SizedBox(height: 15)

              ],
            );
          },
          childCount: 1
          )
        )

      ]
    );
  }

}