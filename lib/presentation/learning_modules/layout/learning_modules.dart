import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/data/blocs/video_bloc/video_bloc.dart';
import 'package:learning_app/presentation/learning_modules/modules/module_info.dart';
import 'package:learning_app/presentation/learning_modules/modules/module_video_list.dart';
import 'package:learning_app/utils/colors.dart';

class LearningModules extends StatefulWidget {
  final Map chapter;
  const LearningModules({super.key, required this.chapter});

  @override
  State<LearningModules> createState() => _LearningModulesState();
}

class _LearningModulesState extends State<LearningModules> {
  @override
  void initState() {
    context
        .read<VideoBloc>()
        .add(VideoLoadedEvent(widget.chapter['videos'].first['videoLink'], 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideoLoadedState) {
            return SafeArea(
              child: Column(children: [
                Stack(
                  children: [
                    FutureBuilder(
                        future: state.initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                                aspectRatio: 16 / 9, child: state.playerWidget);
                          }
                          return const AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }),
                    Positioned(
                        child: Material(
                      color: Colors.white24,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: ColorPicker.backgroundColor,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.chapter['videos'][state.selectedIndex]
                                ['videoName'],
                            style: const TextStyle(
                                color: ColorPicker.backgroundColor),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                ModuleInfo(
                  chapter: widget.chapter,
                ),
                Expanded(
                  child: ModuleVideoList(
                    chapter: widget.chapter,
                    selectedIndex: state.selectedIndex,
                  ),
                )
              ]),
            );
          }
          return Container();
        },
      ),
    );
  }
}
