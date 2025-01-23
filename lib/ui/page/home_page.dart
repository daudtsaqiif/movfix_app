part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Genre> genreMap = [];
  Images? images;
  Cast? cast;
  DetailMove? detailMove;
  RecommendationMovie? recommendation;





  @override
  void initState() {
    context.read<PopularCubit>().getPopular();
    context.read<GenreCubit>().getGenre();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenreCubit, GenreState>(
      listener: (context, state) {
        if (state is GenreLoaded) {
          setState(() {
            genreMap = state.genres;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movfix'),
          leading: Icon(Icons.menu),
          centerTitle: true,
          actions: [
            Icon(Icons.search_rounded),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CardMovie(genre: genreMap, images: images, cast: cast, detailMove: detailMove, recommendation: recommendation,),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
