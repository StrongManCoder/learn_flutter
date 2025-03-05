import 'package:flutter/material.dart';
import 'package:learn_flutter/util/navigator_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// H5容器
///
class HiWebview extends StatefulWidget {
  final String? Url;
  final String? StatusBarColor;
  final String? title;
  final bool? hidenAppBar;

  final bool? backForBid;

  const HiWebview(
      {super.key,
      this.Url,
      this.StatusBarColor,
      this.title,
      this.hidenAppBar,
      this.backForBid});

  @override
  State<HiWebview> createState() => _HiWebviewState();
}

class _HiWebviewState extends State<HiWebview> {
  //主页代表的URL
  final _catchUrls = [
    'm.juejin.im',
    'www.juejin.im',
    'juejin.im',
    'm.juejin.im',
    'www.juejin.im',
    'juejin.im',
    'm.juejin.im',
    'www.juejin.im',
    'juejin.im',
    'm.ctrip.com/webapp/myctrip',
  ];
  String? url;

  //late修饰延迟初始化
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String url = widget.Url ?? '';

    _initWebViewController();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.StatusBarColor ?? 'ffffff';
    Color backBtnColor;
    if (statusBarColorStr == 'ffffff') {
      backBtnColor = Colors.black;
    } else {
      backBtnColor = Colors.white;
    }
    backBtnColor = Colors.black;

    //PopScope  适配安卓物理返回键
    return PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            NavigatorUtil.pop(context);
          }
        },
        child: Scaffold(
          body: Column(
            children: <Widget>[
              _appBar(Color(int.parse('0xff$statusBarColorStr')), backBtnColor),
              Expanded(
                  child: WebViewWidget(
                controller: controller,
              ))
            ],
          ),
        ));
  }

  void _initWebViewController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(onProgress: (int progress) {
        // "onProgress $progress".log();
      }, onPageStarted: (String url) {
        // "onPageStarted $url".log();
      }, onPageFinished: (String url) {
        _handleBackForbin();
        // "onPageFinished $url".log();
      }, onWebResourceError: (WebResourceError error) {
        // "Error ${error.description}".log();
      }, onNavigationRequest: (NavigationRequest request) {
        // if (_isToMain(request.url)) {
        //   /// 返回到flutter页面
        //   NavigatorUtil.pop(context);
        //   return NavigationDecision.prevent;
        // }
        // ;

        //允许跳转到 啥啥也没
        return NavigationDecision.navigate;
      }))
      ..loadRequest(Uri.parse(widget.Url!), method: LoadRequestMethod.get);
  }

  //隐藏H5登录页的返回
  void _handleBackForbin() {
    const jsStr =
        "var element = document.querySelector('.animationComponent.rn-view'); element.style.display = 'none';";
    if (widget.backForBid ?? false) {
      controller.runJavaScript(jsStr);
    }
  }

  bool _isToMain(String? url) {
    bool contans = false;
    for (final value in _catchUrls) {
      if (url?.endsWith(value) ?? false) {
        contans = true;
        break;
      }
    }

    return contans;
  }

  _appBar(Color bgColor, Color backBtnColor) {
    double top = MediaQuery.of(context).padding.top;
    if (widget.hidenAppBar ?? false) {
      return Container(
        color: bgColor,
        height: top,
      );
    }

    return Container(
      color: bgColor,
      padding: EdgeInsets.fromLTRB(0, top, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: [
            _backBtn(bgColor),
            _title(backBtnColor),
          ],
        ),
      ),
    );
  }

  _backBtn(Color bgColor) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Icon(
          Icons.close,
          color: Colors.black,
          size: 26,
        ),
      ),
    );
  }

  _title(Color backBtnColor) {
    return Positioned(
        left: 0,
        right: 0,
        child: Center(
          child: Text(
            widget.title ?? "",
            style: TextStyle(color: backBtnColor, fontSize: 20),
          ),
        ));
  }
}
