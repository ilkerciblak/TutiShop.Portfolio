import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductDetailHeaderContent extends StatefulWidget {
  final List<String> imgUrl;
  const ProductDetailHeaderContent({
    super.key,
    required this.imgUrl,
  });

  @override
  State<ProductDetailHeaderContent> createState() =>
      _ProductDetailHeaderContentState();
}

class _ProductDetailHeaderContentState extends State<ProductDetailHeaderContent>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          allowImplicitScrolling: false,
          itemCount: widget.imgUrl.length,
          controller: _pageController,
          onPageChanged: (value) {
            _pageController.animateToPage(
              value,
              duration: Durations.long2,
              curve: Easing.legacyDecelerate,
            );
            setState(() {
              counter = value;
            });
          },
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: widget.imgUrl[index],
              fadeInCurve: Easing.linear,
              fit: BoxFit.contain,
            );
          },
        ),
        Positioned(
          bottom: 16.0,
          width: MediaQuery.of(context).size.width,
          // left: MediaQuery.of(context).size.center(Offset.zero).dx,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              widget.imgUrl.length,
              (index) => AnimatedContainer(
                duration: Durations.long1,
                height: 7,
                width: counter == index ? 14 : 7,
                margin: const EdgeInsets.only(right: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: counter == index
                      ? AppColors.primaryBlack
                      : AppColors.primaryGrey.withOpacity(0.5),
                  // shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          top: 16.0,
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primaryBlack,
              )),
        ),
      ],
    );
  }
}
