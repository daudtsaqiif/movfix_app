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
    genre = widget.genre!.where((g) => widget.movie!.genre!.contains(g.id)).toList();
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
                Image.network(
                  'https://image.tmdb.org/t/p/w500/${widget.movie?.image}',
                  height: 350,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 250,
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
                              color: const Color.fromARGB(255, 161, 161, 161),
                              fontSize: 19,
                              fontWeight: FontWeight.w600)),
                      Text(
                        widget.movie?.title ?? 'No Title',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                      Wrap(
                        children: genre.map((e) => Text(e.name!, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),)).toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
