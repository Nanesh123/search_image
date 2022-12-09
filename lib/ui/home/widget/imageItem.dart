import 'package:flutter/material.dart';
import 'package:search_image/bloc/home/home_bloc.dart';
import 'package:search_image/ui/home/widget/image_view.dart';
import 'package:search_image/ui/home/widget/loader.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.scrollController,
    required this.state,
  }) : super(key: key);

  final ScrollController scrollController;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          state.hasReachedMax ? state.images.length : state.images.length + 1,
      controller: scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index >= state.images.length) {
          return const Loader();
        }
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          height: 155,
          width: 100,
          child: InkWell(
            child: Image.network(
              state.images[index].previewUrl ?? '',
              fit: BoxFit.none,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageView(
                    src: state.images[index].previewUrl!,
                  ),
                ),
              );
            },
          ),
        );
      },
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisSpacing: 2,
      //   mainAxisSpacing: 2,
      //   crossAxisCount: 2,
      // ),
    );
  }
}
