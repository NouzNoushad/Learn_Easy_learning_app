import 'package:flutter/material.dart';
import 'package:learning_app/routes/routes_constant.dart';

class ChapterContent extends StatelessWidget {
  final Map chapter;
  const ChapterContent({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(RouteConstant.modules, arguments: chapter),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    chapter['image'],
                    height: size.height * 0.18,
                    width: size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        chapter['chapterName'],
                        style: const TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${chapter['chapterNo']} Chapters',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${chapter['hours']} hours',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Mentor: ${chapter['tutor']}',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
