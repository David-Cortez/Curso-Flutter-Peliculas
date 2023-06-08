
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/provider.dart';
import '../../widgets/widgets.dart';







class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
  
  const HomeScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}





class _HomeView extends ConsumerStatefulWidget {
  
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends ConsumerState<_HomeView> {

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