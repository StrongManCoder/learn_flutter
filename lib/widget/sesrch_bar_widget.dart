import 'package:flutter/material.dart';

///定义SesrchBar的三种样式
/// home 首页默认样式
/// homeLite 首页发生上滑的样式
/// normal 默认样式
enum SearchBarType { home, homeLite, normal }

class SesrchBarWidget extends StatefulWidget {
  ///是否隐藏返回按钮
  final bool? isHideLeft;

  ///搜索框类型
  final SearchBarType searchBarType;

  ///提示文案
  final String? hint;

  ///默认内容
  final String? defaultText;

  ///左侧按钮点击回调
  final void Function()? leftButtonClick;

  ///右侧按钮点击回调
  final void Function()? rightButtonClick;

  ///输入框回调
  final void Function()? inputBoxClick;

  ///内容变化回调
  final ValueChanged<String>? onChange;

  const SesrchBarWidget(
      {super.key,
      this.isHideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.inputBoxClick,
      this.onChange});

  @override
  State<SesrchBarWidget> createState() => _SesrchBarWidgetState();
}

class _SesrchBarWidgetState extends State<SesrchBarWidget> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  Widget get _normalSearchBar => Row(
        children: [
          //判断isHideLeft 是否为true  如果为true就返回null 否则返回下面的_warpTap
          widget.isHideLeft == true
              ? SizedBox(
                  width: 20,
                )
              : _warpTap(
                  const Padding(
                    padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
                    child: Row(
                      children: [
                        // _backBtn,
                        Text(
                          '北京',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Icon(
                          Icons.expand_more,
                          color: Colors.black,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                  widget.leftButtonClick),

          //搜索输入框
          Expanded(child: _inputBox),
          _warpTap(
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '搜索',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              widget.rightButtonClick),
        ],
      );

  get _backBtn => widget.isHideLeft ?? false
      ? null
      : Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 26,
        );

  get _inputBox {
    Color inputColor;
    //
    if (widget.searchBarType == SearchBarType.home) {
      inputColor = Colors.white;
    } else {
      inputColor = Color(0xffeddeded);
    }

    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: inputColor,
        borderRadius: BorderRadius.circular(
            widget.searchBarType == SearchBarType.normal ? 5 : 15),
      ),
      child: Row(
        children: [
          Icon(Icons.search,
              size: 20,
              color: widget.searchBarType == SearchBarType.normal
                  ? Color(0xffa9a9a9)
                  : Colors.blue),
          Expanded(
            child: Container(
              child: Text(
                widget.defaultText ?? '',
                style: TextStyle(
                    color: widget.searchBarType == SearchBarType.normal
                        ? Color(0xffa9a9a9)
                        : Colors.blue,
                    fontSize:
                        widget.searchBarType == SearchBarType.normal ? 14 : 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.defaultText != null) {
      _controller.text = widget.defaultText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _normalSearchBar;
  }

  _warpTap(Widget? child, void Function()? callback) {
    return GestureDetector(
      onTap: callback,
      child: child,
    );
  }
}
