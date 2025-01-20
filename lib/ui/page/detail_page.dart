part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.movie, this.genre});

  final Movie? movie;
  final List<Genre>? genre;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  top: 240,
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
                      Wrap(
                        spacing: 6,
                        children: genre
                            .map(
                              (e) => Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(79, 48, 47, 47),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    e.name!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
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
                Column(
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
                    Row(
                      children: [
                        Text(
                          'Rate: ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 129, 129, 129),
                              fontSize: 14),
                        ),
                        Text(
                          widget.movie?.rating?.toStringAsFixed(1) ??
                              'No Rating',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Language: ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 129, 129, 129),
                              fontSize: 14),
                        ),
                        Text(
                          widget.movie?.language ?? 'No Language',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Genre: ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 129, 129, 129),
                              fontSize: 14),
                        ),
                        Wrap(
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
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
