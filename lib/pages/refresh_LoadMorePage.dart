import 'package:flutter/material.dart';

class RefreshLoadMorePage extends StatefulWidget {
  const RefreshLoadMorePage({super.key});

  @override
  State<RefreshLoadMorePage> createState() => _RefreshLoadMorePageState();
}

class _RefreshLoadMorePageState extends State<RefreshLoadMorePage> {
  final _controller = ScrollController();

  List<String> cityNames = [
    '北京',
    '上海',
    '广州',
    '深圳',
    '苏州',
    '成都',
    '武汉',
    '郑州',
    '洛阳',
    '厦门',
    '海南',
    '拉萨',
    '西藏',
  ];

  //页面完成加载的时候
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      //_controller是我们初始化的ScrollController对象，通过监听我们可以判断现在的位置是否是最大的下滑位置来判断是否下滑到了底部。
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        //加载更多
        print("加载更多");
        _loadData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//移除监听 避免内存泄露
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const title = '高级列表的下拉刷新上拉加载';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      //下拉刷新实现
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: _renderRow,
          //这里+1 是为了给后面加个加载更多
          itemCount: cityNames.length + 1,
          controller: _controller,
        ),
        // child: ListView(
        //   controller: _controller,
        //   children: _buildList(),
        // ),
      ),
    );
  }

  Widget? _renderRow(BuildContext context, int index) {
    if (index < cityNames.length) {
      return _item(cityNames[index]);
    } else {
      return _getMoreWidget();
      ;
    }
  }

  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...     ',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Future<void> _onRefresh() async {
    //模拟下拉刷新请求接口
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      //数组翻转一下  前变后
      cityNames = cityNames.reversed.toList();
    });
  }

  Widget _item(String city) {
    return Container(
      //文本居中对齐
      alignment: Alignment.center,
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.amber),
      child: Text(
        city,
        style: TextStyle(color: Colors.black54, fontSize: 24),
      ),
    );
  }

  void _loadData() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      cityNames.addAll([
        "北京",
        "上海",
        "广州",
        "深圳",
        "苏州",
        "成都",
        "武汉",
        "郑州",
        "洛阳",
        "厦门",
        "海南",
        "拉萨",
        "西藏"
      ]);
    });
  }
}
