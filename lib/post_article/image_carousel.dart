// Example: ImageCarousel.dart
import 'package:flutter/material.dart';
import 'package:it4788/model/post_response.dart';
import 'package:it4788/service/post_sevice.dart';

class ImageCarousel extends StatefulWidget {
  // final List<String> imageUrls;
  final List<PostImage?> images;
  final int initialPage;
  final Function(int, String) onImageRemoved;
  final String? type;
  ImageCarousel(
      {
      // required this.imageUrls,
      required this.images,
      required this.initialPage,
      required this.onImageRemoved,
      this.type});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late String? type;
  late PageController _pageController;

  void _onImageRemoved(removedIndex) {
    widget.onImageRemoved(removedIndex, widget.images[removedIndex]!.id);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.images.map((image) => image!.url).toList().length,
          itemBuilder: (context, index) {
            return Image.network(
                widget.images.map((image) => image!.url).toList()[index]);
          },
        ),
        type == 'edit'
            ? Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    _onImageRemoved(_pageController.page!.toInt());
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
