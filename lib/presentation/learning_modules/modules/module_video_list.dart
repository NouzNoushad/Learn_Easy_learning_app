import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/video_bloc/video_bloc.dart';
import '../../../utils/colors.dart';

class ModuleVideoList extends StatelessWidget {
  final Map chapter;
  final int selectedIndex;
  const ModuleVideoList(
      {super.key, required this.chapter, required this.selectedIndex});

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
                  .add(VideoLoadedEvent(video['videoLink'], index));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? ColorPicker.primaryColor
                      : ColorPicker.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 1.5, color: ColorPicker.primaryColor)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      video['videoName'],
                      style: TextStyle(
                          color: selectedIndex == index
                              ? ColorPicker.backgroundColor
                              : ColorPicker.primaryDarkColor),
                    ),
                    CircleAvatar(
                      backgroundColor: selectedIndex == index
                          ? ColorPicker.backgroundColor
                          : ColorPicker.primaryColor,
                      child: Icon(
                        Icons.play_arrow,
                        color: selectedIndex == index
                            ? ColorPicker.primaryColor
                            : ColorPicker.backgroundColor,
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
