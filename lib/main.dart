import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movfix_app/cubit/cast_cubit.dart';
import 'package:movfix_app/cubit/cubit.dart';
import 'package:movfix_app/cubit/detail_movie_cubit.dart';
import 'package:movfix_app/cubit/images_cubit.dart';
import 'package:movfix_app/cubit/recomendation_cubit.dart';
import 'package:movfix_app/cubit/review_cubit.dart';
import 'package:movfix_app/cubit/video_cubit.dart';
import 'package:movfix_app/ui/page/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => PopularCubit()),
        BlocProvider(create: (BuildContext context) => GenreCubit()),
        BlocProvider(create: (BuildContext context) => ImagesCubit()),
        BlocProvider(create: (BuildContext context) => CastCubit()),
        BlocProvider(create: (BuildContext context) => DetailMovieCubit()),
        BlocProvider(create: (BuildContext context) => RecomendationCubit()),
        BlocProvider(create: (BuildContext context) => ReviewCubit()),
        BlocProvider(create: (BuildContext context) => VideoCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
