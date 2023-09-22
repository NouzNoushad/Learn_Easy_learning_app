import 'package:flutter/material.dart';
import 'package:learning_app/utils/colors.dart';

class ModuleInfo extends StatelessWidget {
  final Map chapter;
  const ModuleInfo({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.14,
      // color: Colors.yellow,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapter['chapterName'],
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${chapter['chapterNo']} Chapters | ${chapter['hours']} hours',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Mentor: ${chapter['tutor']}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ]),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: ColorPicker.primaryColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download,
                    color: ColorPicker.primaryColor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
