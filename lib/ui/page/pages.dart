import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movfix_app/cubit/cast_cubit.dart';
import 'package:movfix_app/cubit/cubit.dart';
import 'package:movfix_app/cubit/detail_movie_cubit.dart';
import 'package:movfix_app/cubit/images_cubit.dart';
import 'package:movfix_app/cubit/recomendation_cubit.dart';
import 'package:movfix_app/cubit/review_cubit.dart';
import 'package:movfix_app/cubit/video_cubit.dart';
import 'package:movfix_app/helper/helper.dart';
import 'package:movfix_app/main.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/ui/widget/card_movie.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

part 'home_page.dart';
part 'detail_page.dart';
part 'review_page.dart';

