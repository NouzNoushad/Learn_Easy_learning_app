import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/data/blocs/banner_cubit/banner_cubit.dart';

import '../../repositories/video_player.dart';
import '../video_bloc/video_bloc.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => VideoPlayerRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BannerCubit()..onPageChanged(0),
          ),
          BlocProvider(
            create: (context) => VideoBloc(videoPlayerRepository: RepositoryProvider.of<VideoPlayerRepository>(context)),
          ),
        ],
        child: child,
      ),
    );
  }
}
