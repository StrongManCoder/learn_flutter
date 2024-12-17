import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/util/screen_adapter_helper.dart';

//封装轮播组件Widget
class BannerWidget extends StatefulWidget {
  final List<String> bannerList;

  const BannerWidget({super.key, required this.bannerList});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarouselSlider(
          items: widget.bannerList.map((url) => _tabImage(url, width)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              height: 160.px,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        //bannner指示器 小点点
        Positioned(
          bottom: 10.px,
          left: 0,
          right: 0,
          child: _indicator(),
        )
      ],
    );
  }

  Widget _tabImage(String imageUrl, width) {
    return GestureDetector(
      onTap: () {
        //点击跳转导航
        //TODO  NavigatorUtil
      },
      child: Image.network(
        imageUrl,
        width: width,
        //fit 图片显示方式
        fit: BoxFit.cover,
      ),
    );
  }

  _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.bannerList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 6,
            height: 6,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Colors.blue)
                    .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
