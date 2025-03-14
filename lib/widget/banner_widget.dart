import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/Model/home_model.dart';
import 'package:learn_flutter/util/navigator_util.dart';
import 'package:learn_flutter/util/screen_adapter_helper.dart';

//封装轮播组件Widget
class BannerWidget extends StatefulWidget {
  final List<ActivityElement> bannerList;

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
          items: widget.bannerList
              .map((model) => _tabImage(model, width))
              .toList(),
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

  Widget _tabImage(ActivityElement model, width) {
    return GestureDetector(
      onTap: () {
        //点击跳转内置WebViewPage页面并传入参数model.url

        NavigatorUtil.jumpH5(
            url: "${model.url}?cityid=1", title: model.name, hideAppBar: false);
        // NavigatorUtil.push(context, WebViewPage(url: model.url));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => WebViewPage(
        //         //model.url 拼接上city=1
        //         url: "${model.url}?cityid=1",
        //         // url: model.url,
        //         title: model.name,
        //       ),
        //     ));

        //TODO  NavigatorUtil
      },
      child: Image.network(
        model.realUrl,
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
