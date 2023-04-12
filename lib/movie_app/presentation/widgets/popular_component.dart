import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utality/request_state.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utality/constance.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) => previous.popularMovieState !=current.popularMovieState,
      builder: (context, state) {
      switch (state.popularMovieState) {
        case RequestState.loading:
          return const SizedBox(
            height: 350,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case RequestState.loaded:
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 350.0,
              
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.nowPlayingMovie.length,
                itemBuilder: (context, index) {
                  final movie = state.nowPlayingMovie[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 200.0,
                          fit: BoxFit.cover,
                          imageUrl: AppConstance.getImage(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            //highlightColor: Colors.grey[800]!,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );

        case RequestState.error:
          return Text(state.msg);
      }
    });
  }
}
