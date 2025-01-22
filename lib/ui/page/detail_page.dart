part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    this.movie,
    this.genre,
    this.images,
    this.cast,
    this.detailMove,
  });

  final Movie? movie;
  final List<Genre>? genre;
  final Images? images;
  final Cast? cast;
  final DetailMove? detailMove;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List genre;

  @override
  void initState() {
    genre = widget.genre!
        .where((g) => widget.movie!.genre!.contains(g.id))
        .toList();
    context.read<ImagesCubit>().getImages(widget.movie!.id);
    context.read<CastCubit>().getCast(widget.movie!.id);
    context.read<DetailMovieCubit>().getDetailMovie(widget.movie!.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Stack(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds),
                  blendMode: BlendMode.darken,
                  child: Container(
                    width: double.infinity,
                    height: 355,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${widget.movie?.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.movie?.release != null
                              ? DateFormat('yyyy').format(
                                  DateTime.parse(widget.movie!.release!))
                              : 'No Year',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500)),
                      Text(
                        widget.movie?.title ?? 'No Title',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                      BlocBuilder<DetailMovieCubit, DetailMovieState>(
                          builder: (context, state) {
                        if (state is DetailMovieLoaded) {
                          DetailMove detailMove = state.detail;
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(150, 48, 47, 47),
                                  Color.fromARGB(255, 24, 23, 23),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                width: 0.8,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              child: Text(
                                detailMove.tagline ?? "No Tagline Available",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (state is DetailMovieLoadingFailed) {
                          return Text('Error ${state.massage}');
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Colors.grey,
                thickness: 0.7,
              ),
            ),
            //rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            color: Colors.grey.shade800,
                            width: 1.0), // Garis pemisah
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.movie?.rating?.toStringAsFixed(1) ?? '0.0',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                          ],
                        ),
                        Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Section 2 - Metascore
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          widget.movie?.language ?? 'No Language',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Colors.grey,
                thickness: 0.7,
              ),
            ),
            const SizedBox(height: 20),
            //poster
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${widget.movie?.poster}'),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Title: ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 129, 129, 129),
                                fontSize: 14),
                          ),
                          Text(
                            widget.movie?.title ?? 'No Title',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Release Date: ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 129, 129, 129),
                                fontSize: 14),
                          ),
                          Text(
                            widget.movie?.release ?? 'No Release Date',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      BlocBuilder<DetailMovieCubit, DetailMovieState>(
                          builder: (context, state) {
                        if (state is DetailMovieLoaded) {
                          DetailMove detailMove = state.detail;
                          return Row(
                            children: [
                              Text(
                                'Runtime: ',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 129, 129, 129),
                                    fontSize: 14),
                              ),
                              Text(
                                '${detailMove.runtime} minutes',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          );
                        } else if (state is DetailMovieLoadingFailed) {
                          return Text('Error ${state.massage}');
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Genre: ',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 129, 129, 129),
                                fontSize: 14),
                          ),
                          Expanded(
                            child: Wrap(
                              spacing: 3,
                              children: genre
                                  .map(
                                    (e) => Text(
                                      e.name!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<DetailMovieCubit, DetailMovieState>(
                          builder: (context, state) {
                        if (state is DetailMovieLoaded) {
                          DetailMove detailMove = state.detail;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spoken Language: ',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 129, 129, 129),
                                    fontSize: 14),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Wrap(
                                    spacing: 3,
                                    children: detailMove.spokenLanguage!
                                        .map(
                                          (e) => Text(
                                            e.lang!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (state is DetailMovieLoadingFailed) {
                          return Text('Error ${state.massage}');
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            //pict
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Picture',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<ImagesCubit, ImagesState>(
                  builder: (context, state) {
                    if (state is ImagesLoaded) {
                      List<Images> images = state.images;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: images
                                .take(10)
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 240,
                                        height: 135,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w500/${e.images}"))),
                                      ),
                                    ))
                                .toList()),
                      );
                    } else if (state is ImagesLoadingFailed) {
                      return Text('Error: ${state.massage}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            //overview
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Overview',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ReadMoreText(
                    widget.movie?.overview ?? 'No Overview',
                    trimLines: 3,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            //cast
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Cast',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<CastCubit, CastState>(
                  builder: (context, state) {
                    if (state is CastLoaded) {
                      List<Cast> cast = state.casts;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: cast
                              .map((e) => Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500/${e.pict}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              e.name ?? 'No Name',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              e.character ?? 'No Char',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                      );
                    } else if (state is CastLoadingFailed) {
                      return Text('Error: ${state.massage}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            //Product Company
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Product Company',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<DetailMovieCubit, DetailMovieState>(
                    builder: (context, state) {
                  if (state is DetailMovieLoaded) {
                    DetailMove detailMove = state.detail;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: detailMove.productionCompanies!
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 120,
                                    height: 125,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.8),
                                        width: 0.8,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 73,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500/${e.logo}",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            e.name ?? 'No Name',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    );
                  } else if (state is DetailMovieLoadingFailed) {
                    return Text('Error ${state.massage}');
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
              ],
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
