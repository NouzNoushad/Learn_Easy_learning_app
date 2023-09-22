import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/utils/colors.dart';

import '../../../data/blocs/banner_cubit/banner_cubit.dart';

class BannerImages extends StatelessWidget {
  final List banners;
  const BannerImages({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerChangedState) {
          return Column(children: [
            CarouselSlider(
              items: banners.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(i))),
                    );
                  },
                );
              }).toList(),
              carouselController: state.controller,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    context.read<BannerCubit>().onPageChanged(index);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: banners.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => state.controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : ColorPicker.primaryColor)
                            .withOpacity(
                                state.current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ]);
        }
        return Container();
      },
    );
  }
}
