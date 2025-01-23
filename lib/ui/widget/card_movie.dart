import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movfix_app/cubit/cubit.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/ui/page/pages.dart';

class CardMovie extends StatefulWidget {
  const CardMovie({super.key, this.popular, this.genre, this.images, this.cast, this.detailMove, this.recommendation});

  final PopularMovie? popular;
  final List<Genre>? genre;
  final Images? images;
  final Cast? cast;
  final DetailMove? detailMove;
  final RecommendationMovie? recommendation;


  @override
  State<CardMovie> createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  
  @override
  void initState() {
    context.read<PopularCubit>().getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularInitial) {
          return Center(child: CircularProgressIndicator()); // Loading state
        } else if (state is PopularLoaded) {
          final populars = state.populars;
          return ListView.builder(
            shrinkWrap: true, // Membatasi tinggi ListView agar sesuai ukuran
            itemCount: populars.length ?? 0,
            itemBuilder: (context, index) {
              final movie = populars[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        movie: movie,
                        genre: widget.genre,
                        recommendation: widget.recommendation,

                      ),
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Left side: Image with rank
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              Image.network( 'https://image.tmdb.org/t/p/w500/${movie.image}',
                                width: 130,
                                height: 100,
                                fit: BoxFit.cover,),
                              // Rank (position) on top-right corner
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '#${index + 1}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        // Right side: Movie title, rating, genre, release date
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.only(right: 10, top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Movie title
                                Text(
                                  movie.title ?? 'No Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                // Rating with Icon
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_rounded,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          movie.release ?? 'No Release Date',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          movie.rating?.toStringAsFixed(1) ??
                                              '0.0',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is PopularLoadingFailed) {
          return Center(child: Text('Error: ${state.massage}')); // Error state
        } else {
          return Center(child: Text('No data available.'));
        }
      },
    );
  }
}
