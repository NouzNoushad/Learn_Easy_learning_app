import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/video_bloc/video_bloc.dart';
import '../../../utils/colors.dart';

class ModuleVideoList extends StatelessWidget {
  final Map chapter;
  const ModuleVideoList({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: chapter['videos'].length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        itemBuilder: (context, index) {
          final video = chapter['videos'][index];
          return GestureDetector(
            onTap: () {
              context
                  .read<VideoBloc>()
                  .add(VideoLoadedEvent(video['videoLink']));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 1.5, color: ColorPicker.primaryColor)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      video['videoName'],
                    ),
                    const CircleAvatar(
                      backgroundColor: ColorPicker.primaryColor,
                      child: Icon(
                        Icons.play_arrow,
                        color: ColorPicker.backgroundColor,
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
