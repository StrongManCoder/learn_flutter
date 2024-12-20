// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  List<ActivityElement> activity;
  List<Nav> navStatic;
  List<Nav> navActive;
  ExclusiveRecommend exclusiveRecommend;
  List<dynamic> hotTopic;
  Brokerinfo smartCard;
  VideoShow videoShow;
  MyProperty myProperty;
  List<Choiceness> choiceness;
  Houseknowledge houseknowledge;
  List<dynamic> rankList;
  Brokerinfo userInfo;
  Brokerinfo brokerinfo;
  PreCondition preCondition;
  String isclosecity;
  LogData logData;

  HomeModel({
    required this.activity,
    required this.navStatic,
    required this.navActive,
    required this.exclusiveRecommend,
    required this.hotTopic,
    required this.smartCard,
    required this.videoShow,
    required this.myProperty,
    required this.choiceness,
    required this.houseknowledge,
    required this.rankList,
    required this.userInfo,
    required this.brokerinfo,
    required this.preCondition,
    required this.isclosecity,
    required this.logData,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        activity: List<ActivityElement>.from(
            json["activity"].map((x) => ActivityElement.fromJson(x))),
        navStatic:
            List<Nav>.from(json["navStatic"].map((x) => Nav.fromJson(x))),
        navActive:
            List<Nav>.from(json["navActive"].map((x) => Nav.fromJson(x))),
        exclusiveRecommend:
            ExclusiveRecommend.fromJson(json["exclusiveRecommend"]),
        hotTopic: List<dynamic>.from(json["hotTopic"].map((x) => x)),
        smartCard: Brokerinfo.fromJson(json["smartCard"]),
        videoShow: VideoShow.fromJson(json["videoShow"]),
        myProperty: MyProperty.fromJson(json["myProperty"]),
        choiceness: List<Choiceness>.from(
            json["choiceness"].map((x) => Choiceness.fromJson(x))),
        houseknowledge: Houseknowledge.fromJson(json["houseknowledge"]),
        rankList: List<dynamic>.from(json["rankList"].map((x) => x)),
        userInfo: Brokerinfo.fromJson(json["userInfo"]),
        brokerinfo: Brokerinfo.fromJson(json["brokerinfo"]),
        preCondition: PreCondition.fromJson(json["preCondition"]),
        isclosecity: json["isclosecity"],
        logData: LogData.fromJson(json["logData"]),
      );

  Map<String, dynamic> toJson() => {
        "activity": List<dynamic>.from(activity.map((x) => x.toJson())),
        "navStatic": List<dynamic>.from(navStatic.map((x) => x.toJson())),
        "navActive": List<dynamic>.from(navActive.map((x) => x.toJson())),
        "exclusiveRecommend": exclusiveRecommend.toJson(),
        "hotTopic": List<dynamic>.from(hotTopic.map((x) => x)),
        "smartCard": smartCard.toJson(),
        "videoShow": videoShow.toJson(),
        "myProperty": myProperty.toJson(),
        "choiceness": List<dynamic>.from(choiceness.map((x) => x.toJson())),
        "houseknowledge": houseknowledge.toJson(),
        "rankList": List<dynamic>.from(rankList.map((x) => x)),
        "userInfo": userInfo.toJson(),
        "brokerinfo": brokerinfo.toJson(),
        "preCondition": preCondition.toJson(),
        "isclosecity": isclosecity,
        "logData": logData.toJson(),
      };
}

class ActivityElement {
  String activityId;
  String name;
  String url;
  String realUrl;
  String type;
  String turntype;
  String tag;
  String bigImg;

  ActivityElement({
    required this.activityId,
    required this.name,
    required this.url,
    required this.realUrl,
    required this.type,
    required this.turntype,
    required this.tag,
    required this.bigImg,
  });

  factory ActivityElement.fromJson(Map<String, dynamic> json) =>
      ActivityElement(
        activityId: json["activity_id"],
        name: json["name"],
        url: json["url"],
        realUrl: json["real_url"],
        type: json["type"],
        turntype: json["turntype"],
        tag: json["tag"],
        bigImg: json["big_img"],
      );

  Map<String, dynamic> toJson() => {
        "activity_id": activityId,
        "name": name,
        "url": url,
        "real_url": realUrl,
        "type": type,
        "turntype": turntype,
        "tag": tag,
        "big_img": bigImg,
      };
}

class Brokerinfo {
  Brokerinfo();

  factory Brokerinfo.fromJson(Map<String, dynamic> json) => Brokerinfo();

  Map<String, dynamic> toJson() => {};
}

class Choiceness {
  String type;
  String title;
  String moreUrl;
  String pic;
  String count;
  List<ChoicenessList> list;

  Choiceness({
    required this.type,
    required this.title,
    required this.moreUrl,
    required this.pic,
    required this.count,
    required this.list,
  });

  factory Choiceness.fromJson(Map<String, dynamic> json) => Choiceness(
        type: json["type"],
        title: json["title"],
        moreUrl: json["more_url"],
        pic: json["pic"],
        count: json["count"],
        list: List<ChoicenessList>.from(
            json["list"].map((x) => ChoicenessList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "more_url": moreUrl,
        "pic": pic,
        "count": count,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ChoicenessList {
  String cityid;
  String choiceType;
  String topicType;
  String topicContent;
  TagName tagName;
  String title;
  String subTitle;
  String imgurl;
  String hotimgurl;
  String targeturl;
  Brokerinfo condition;

  ChoicenessList({
    required this.cityid,
    required this.choiceType,
    required this.topicType,
    required this.topicContent,
    required this.tagName,
    required this.title,
    required this.subTitle,
    required this.imgurl,
    required this.hotimgurl,
    required this.targeturl,
    required this.condition,
  });

  factory ChoicenessList.fromJson(Map<String, dynamic> json) => ChoicenessList(
        cityid: json["cityid"],
        choiceType: json["choice_type"],
        topicType: json["topic_type"],
        topicContent: json["topic_content"],
        tagName: tagNameValues.map[json["tag_name"]]!,
        title: json["title"],
        subTitle: json["sub_title"],
        imgurl: json["imgurl"],
        hotimgurl: json["hotimgurl"],
        targeturl: json["targeturl"],
        condition: Brokerinfo.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "cityid": cityid,
        "choice_type": choiceType,
        "topic_type": topicType,
        "topic_content": topicContent,
        "tag_name": tagNameValues.reverse[tagName],
        "title": title,
        "sub_title": subTitle,
        "imgurl": imgurl,
        "hotimgurl": hotimgurl,
        "targeturl": targeturl,
        "condition": condition.toJson(),
      };
}

enum TagName { EMPTY, PURPLE, TAG_NAME }

final tagNameValues = EnumValues(
    {"二手精选": TagName.EMPTY, "二手": TagName.PURPLE, "租房精选": TagName.TAG_NAME});

class ExclusiveRecommend {
  List<FeedbackType> feedbackType;
  List<Salelist> salelist;

  ExclusiveRecommend({
    required this.feedbackType,
    required this.salelist,
  });

  factory ExclusiveRecommend.fromJson(Map<String, dynamic> json) =>
      ExclusiveRecommend(
        feedbackType: List<FeedbackType>.from(
            json["feedback_type"].map((x) => FeedbackType.fromJson(x))),
        salelist: List<Salelist>.from(
            json["salelist"].map((x) => Salelist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feedback_type":
            List<dynamic>.from(feedbackType.map((x) => x.toJson())),
        "salelist": List<dynamic>.from(salelist.map((x) => x.toJson())),
      };
}

class FeedbackType {
  String typeId;
  String typeName;

  FeedbackType({
    required this.typeId,
    required this.typeName,
  });

  factory FeedbackType.fromJson(Map<String, dynamic> json) => FeedbackType(
        typeId: json["typeId"],
        typeName: json["typeName"],
      );

  Map<String, dynamic> toJson() => {
        "typeId": typeId,
        "typeName": typeName,
      };
}

class Salelist {
  String housetitle;
  String othertypeid;
  String housesid;
  String imgurl;
  String communityid;
  String communityname;
  String qyname;
  String sqname;
  String price;
  String bedroom;
  String livingroom;
  String toilet;
  List<Tagwall> tagwall;
  String heading;
  String? area;
  String buildage;
  String unitprice;
  String? remark;
  Roomdesc roomdesc;
  String cityid;
  String? salelistRecommendFlag;
  Housetag housetag;
  String? housetypeid;
  String flag3D;
  String img3Durl;
  Rentmodename? rentmodename;
  Unit unit;
  String murl;
  String? buildyear;
  String recommendFlag;
  String? unittypestr;
  String? zfpriceFlag;
  String? zfpriceTotal;
  String? zfprice;
  String? yzprice;
  String? yzunitprice;
  String? buildarea;
  String? rentprice;
  Unit? rentunit;
  String? rentpricelinkunit;
  String? cutPriceText;

  Salelist({
    required this.housetitle,
    required this.othertypeid,
    required this.housesid,
    required this.imgurl,
    required this.communityid,
    required this.communityname,
    required this.qyname,
    required this.sqname,
    required this.price,
    required this.bedroom,
    required this.livingroom,
    required this.toilet,
    required this.tagwall,
    required this.heading,
    this.area,
    required this.buildage,
    required this.unitprice,
    this.remark,
    required this.roomdesc,
    required this.cityid,
    this.salelistRecommendFlag,
    required this.housetag,
    this.housetypeid,
    required this.flag3D,
    required this.img3Durl,
    this.rentmodename,
    required this.unit,
    required this.murl,
    this.buildyear,
    required this.recommendFlag,
    this.unittypestr,
    this.zfpriceFlag,
    this.zfpriceTotal,
    this.zfprice,
    this.yzprice,
    this.yzunitprice,
    this.buildarea,
    this.rentprice,
    this.rentunit,
    this.rentpricelinkunit,
    this.cutPriceText,
  });

  factory Salelist.fromJson(Map<String, dynamic> json) => Salelist(
        housetitle: json["housetitle"],
        othertypeid: json["othertypeid"],
        housesid: json["housesid"],
        imgurl: json["imgurl"],
        communityid: json["communityid"],
        communityname: json["communityname"],
        qyname: json["qyname"],
        sqname: json["sqname"],
        price: json["price"],
        bedroom: json["bedroom"],
        livingroom: json["livingroom"],
        toilet: json["toilet"],
        tagwall: List<Tagwall>.from(
            json["tagwall"].map((x) => tagwallValues.map[x]!)),
        heading: json["heading"],
        area: json["area"],
        buildage: json["buildage"],
        unitprice: json["unitprice"],
        remark: json["remark"],
        roomdesc: roomdescValues.map[json["roomdesc"]]!,
        cityid: json["cityid"],
        salelistRecommendFlag: json["recommend_flag"],
        housetag: housetagValues.map[json["housetag"]]!,
        housetypeid: json["housetypeid"],
        flag3D: json["flag3d"],
        img3Durl: json["img3durl"],
        rentmodename: rentmodenameValues.map[json["rentmodename"]]!,
        unit: unitValues.map[json["unit"]]!,
        murl: json["murl"],
        buildyear: json["buildyear"],
        recommendFlag: json["recommendFlag"],
        unittypestr: json["unittypestr"],
        zfpriceFlag: json["zfprice_flag"],
        zfpriceTotal: json["zfprice_total"],
        zfprice: json["zfprice"],
        yzprice: json["yzprice"],
        yzunitprice: json["yzunitprice"],
        buildarea: json["buildarea"],
        rentprice: json["rentprice"],
        rentpricelinkunit: json["rentpricelinkunit"],
        cutPriceText: json["cut_price_text"],
      );

  Map<String, dynamic> toJson() => {
        "housetitle": housetitle,
        "othertypeid": othertypeid,
        "housesid": housesid,
        "imgurl": imgurl,
        "communityid": communityid,
        "communityname": communityname,
        "qyname": qyname,
        "sqname": sqname,
        "price": price,
        "bedroom": bedroom,
        "livingroom": livingroom,
        "toilet": toilet,
        "tagwall":
            List<dynamic>.from(tagwall.map((x) => tagwallValues.reverse[x])),
        "heading": heading,
        "area": area,
        "buildage": buildage,
        "unitprice": unitprice,
        "remark": remark,
        "roomdesc": roomdescValues.reverse[roomdesc],
        "cityid": cityid,
        "recommend_flag": salelistRecommendFlag,
        "housetag": housetagValues.reverse[housetag],
        "housetypeid": housetypeid,
        "flag3d": flag3D,
        "img3durl": img3Durl,
        "rentmodename": rentmodenameValues.reverse[rentmodename],
        "unit": unitValues.reverse[unit],
        "murl": murl,
        "buildyear": buildyear,
        "recommendFlag": recommendFlag,
        "unittypestr": unittypestr,
        "zfprice_flag": zfpriceFlag,
        "zfprice_total": zfpriceTotal,
        "zfprice": zfprice,
        "yzprice": yzprice,
        "yzunitprice": yzunitprice,
        "buildarea": buildarea,
        "rentprice": rentprice,
        "rentunit": unitValues.reverse[rentunit],
        "rentpricelinkunit": rentpricelinkunit,
        "cut_price_text": cutPriceText,
      };
}

enum Housetag { EMPTY, HOUSETAG }

final housetagValues =
    EnumValues({"": Housetag.EMPTY, "甄选": Housetag.HOUSETAG});

enum Rentmodename { EMPTY, PURPLE, RENTMODENAME }

final rentmodenameValues = EnumValues({
  "": Rentmodename.EMPTY,
  "合租": Rentmodename.PURPLE,
  "整租": Rentmodename.RENTMODENAME
});

enum Unit { EMPTY, UNIT }

final unitValues = EnumValues({"万": Unit.EMPTY, "元/月": Unit.UNIT});

enum Roomdesc { EMPTY, THE_211, THE_221, THE_311, THE_321, THE_322, THE_422 }

final roomdescValues = EnumValues({
  "": Roomdesc.EMPTY,
  "2室1厅1卫": Roomdesc.THE_211,
  "2室2厅1卫": Roomdesc.THE_221,
  "3室1厅1卫": Roomdesc.THE_311,
  "3室2厅1卫": Roomdesc.THE_321,
  "3室2厅2卫": Roomdesc.THE_322,
  "4室2厅2卫": Roomdesc.THE_422
});

enum Tagwall {
  EMPTY,
  FLUFFY,
  HILARIOUS,
  INDECENT,
  INDIGO,
  PURPLE,
  STICKY,
  TAGWALL,
  TENTACLED
}

final tagwallValues = EnumValues({
  "满五年": Tagwall.EMPTY,
  "近地铁": Tagwall.FLUFFY,
  "业主自荐": Tagwall.HILARIOUS,
  "有电梯": Tagwall.INDECENT,
  "精装修": Tagwall.INDIGO,
  "随时看": Tagwall.PURPLE,
  "房租月付": Tagwall.STICKY,
  "近公园": Tagwall.TAGWALL,
  "满二年": Tagwall.TENTACLED
});

class Newhouse {
  String userWishlistCount;
  String roomStatus;
  String roomStatusDesc;
  String estateAddress;
  String pageViewCount;
  String totalSeeHouseCount;
  String propertyTypeChildName;
  String propertyTypeChildNames;
  String undetermined;
  String lastRoomMinPrice;
  String isJudge;
  String commentNum;
  String collaborationType;
  String collaborationTypeDesc;
  String other;
  String promotionInfo;
  String isTop;
  String cityid;
  String shareUrl;
  String businessAreaName;
  String minBuildArea;
  String estateName;
  String estateId;
  String lastAveragePrice;
  List<String> tagList;
  String coverImageName;
  String propertyTypeId;
  String estateAreaName;
  String maxBuildArea;
  String is3D;
  String showPrice;
  SaleStatusDesc saleStatusDesc;
  String isVideo;
  String showBuildArea;
  PropertyTypeName propertyTypeName;

  Newhouse({
    required this.userWishlistCount,
    required this.roomStatus,
    required this.roomStatusDesc,
    required this.estateAddress,
    required this.pageViewCount,
    required this.totalSeeHouseCount,
    required this.propertyTypeChildName,
    required this.propertyTypeChildNames,
    required this.undetermined,
    required this.lastRoomMinPrice,
    required this.isJudge,
    required this.commentNum,
    required this.collaborationType,
    required this.collaborationTypeDesc,
    required this.other,
    required this.promotionInfo,
    required this.isTop,
    required this.cityid,
    required this.shareUrl,
    required this.businessAreaName,
    required this.minBuildArea,
    required this.estateName,
    required this.estateId,
    required this.lastAveragePrice,
    required this.tagList,
    required this.coverImageName,
    required this.propertyTypeId,
    required this.estateAreaName,
    required this.maxBuildArea,
    required this.is3D,
    required this.showPrice,
    required this.saleStatusDesc,
    required this.isVideo,
    required this.showBuildArea,
    required this.propertyTypeName,
  });

  factory Newhouse.fromJson(Map<String, dynamic> json) => Newhouse(
        userWishlistCount: json["userWishlistCount"],
        roomStatus: json["roomStatus"],
        roomStatusDesc: json["roomStatus_desc"],
        estateAddress: json["estateAddress"],
        pageViewCount: json["pageViewCount"],
        totalSeeHouseCount: json["totalSeeHouseCount"],
        propertyTypeChildName: json["propertyTypeChildName"],
        propertyTypeChildNames: json["propertyTypeChildNames"],
        undetermined: json["undetermined"],
        lastRoomMinPrice: json["lastRoomMinPrice"],
        isJudge: json["isJudge"],
        commentNum: json["commentNum"],
        collaborationType: json["collaborationType"],
        collaborationTypeDesc: json["collaborationType_desc"],
        other: json["other"],
        promotionInfo: json["promotionInfo"],
        isTop: json["isTop"],
        cityid: json["cityid"],
        shareUrl: json["shareUrl"],
        businessAreaName: json["businessAreaName"],
        minBuildArea: json["minBuildArea"],
        estateName: json["estateName"],
        estateId: json["estateID"],
        lastAveragePrice: json["lastAveragePrice"],
        tagList: List<String>.from(json["tagList"].map((x) => x)),
        coverImageName: json["coverImageName"],
        propertyTypeId: json["propertyTypeID"],
        estateAreaName: json["estateAreaName"],
        maxBuildArea: json["maxBuildArea"],
        is3D: json["is3d"],
        showPrice: json["show_price"],
        saleStatusDesc: saleStatusDescValues.map[json["saleStatus_desc"]]!,
        isVideo: json["isVideo"],
        showBuildArea: json["show_BuildArea"],
        propertyTypeName: propertyTypeNameValues.map[json["propertyTypeName"]]!,
      );

  Map<String, dynamic> toJson() => {
        "userWishlistCount": userWishlistCount,
        "roomStatus": roomStatus,
        "roomStatus_desc": roomStatusDesc,
        "estateAddress": estateAddress,
        "pageViewCount": pageViewCount,
        "totalSeeHouseCount": totalSeeHouseCount,
        "propertyTypeChildName": propertyTypeChildName,
        "propertyTypeChildNames": propertyTypeChildNames,
        "undetermined": undetermined,
        "lastRoomMinPrice": lastRoomMinPrice,
        "isJudge": isJudge,
        "commentNum": commentNum,
        "collaborationType": collaborationType,
        "collaborationType_desc": collaborationTypeDesc,
        "other": other,
        "promotionInfo": promotionInfo,
        "isTop": isTop,
        "cityid": cityid,
        "shareUrl": shareUrl,
        "businessAreaName": businessAreaName,
        "minBuildArea": minBuildArea,
        "estateName": estateName,
        "estateID": estateId,
        "lastAveragePrice": lastAveragePrice,
        "tagList": List<dynamic>.from(tagList.map((x) => x)),
        "coverImageName": coverImageName,
        "propertyTypeID": propertyTypeId,
        "estateAreaName": estateAreaName,
        "maxBuildArea": maxBuildArea,
        "is3d": is3D,
        "show_price": showPrice,
        "saleStatus_desc": saleStatusDescValues.reverse[saleStatusDesc],
        "isVideo": isVideo,
        "show_BuildArea": showBuildArea,
        "propertyTypeName": propertyTypeNameValues.reverse[propertyTypeName],
      };
}

enum PropertyTypeName { EMPTY, PROPERTY_TYPE_NAME }

final propertyTypeNameValues = EnumValues({
  "普通住宅": PropertyTypeName.EMPTY,
  "别墅": PropertyTypeName.PROPERTY_TYPE_NAME
});

enum SaleStatusDesc { EMPTY }

final saleStatusDescValues = EnumValues({"在售": SaleStatusDesc.EMPTY});

class Houseknowledge {
  String moreUrl;
  List<HouseknowledgeList> list;

  Houseknowledge({
    required this.moreUrl,
    required this.list,
  });

  factory Houseknowledge.fromJson(Map<String, dynamic> json) => Houseknowledge(
        moreUrl: json["moreUrl"],
        list: List<HouseknowledgeList>.from(
            json["list"].map((x) => HouseknowledgeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "moreUrl": moreUrl,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class HouseknowledgeList {
  String wikiId;
  String title;
  String imgUrl;
  String url;
  String summary;
  String tags;

  HouseknowledgeList({
    required this.wikiId,
    required this.title,
    required this.imgUrl,
    required this.url,
    required this.summary,
    required this.tags,
  });

  factory HouseknowledgeList.fromJson(Map<String, dynamic> json) =>
      HouseknowledgeList(
        wikiId: json["wiki_id"],
        title: json["title"],
        imgUrl: json["img_url"],
        url: json["url"],
        summary: json["summary"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "wiki_id": wikiId,
        "title": title,
        "img_url": imgUrl,
        "url": url,
        "summary": summary,
        "tags": tags,
      };
}

class LogData {
  ChoicenessClass state;
  ChoicenessClass activity;
  ChoicenessClass exclusiveRecommend;
  ChoicenessClass videoShow;
  ChoicenessClass myProperty;
  ChoicenessClass choiceness;
  ChoicenessClass houseknowledge;

  LogData({
    required this.state,
    required this.activity,
    required this.exclusiveRecommend,
    required this.videoShow,
    required this.myProperty,
    required this.choiceness,
    required this.houseknowledge,
  });

  factory LogData.fromJson(Map<String, dynamic> json) => LogData(
        state: ChoicenessClass.fromJson(json["state"]),
        activity: ChoicenessClass.fromJson(json["activity"]),
        exclusiveRecommend:
            ChoicenessClass.fromJson(json["exclusiveRecommend"]),
        videoShow: ChoicenessClass.fromJson(json["videoShow"]),
        myProperty: ChoicenessClass.fromJson(json["myProperty"]),
        choiceness: ChoicenessClass.fromJson(json["choiceness"]),
        houseknowledge: ChoicenessClass.fromJson(json["houseknowledge"]),
      );

  Map<String, dynamic> toJson() => {
        "state": state.toJson(),
        "activity": activity.toJson(),
        "exclusiveRecommend": exclusiveRecommend.toJson(),
        "videoShow": videoShow.toJson(),
        "myProperty": myProperty.toJson(),
        "choiceness": choiceness.toJson(),
        "houseknowledge": houseknowledge.toJson(),
      };
}

class ChoicenessClass {
  double startTime;
  double endTime;
  String title;
  String diffTime;

  ChoicenessClass({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.diffTime,
  });

  factory ChoicenessClass.fromJson(Map<String, dynamic> json) =>
      ChoicenessClass(
        startTime: json["startTime"]?.toDouble(),
        endTime: json["endTime"]?.toDouble(),
        title: json["title"],
        diffTime: json["diffTime"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "title": title,
        "diffTime": diffTime,
      };
}

class MyProperty {
  String titleImageUrl;
  String type;
  List<dynamic> list;

  MyProperty({
    required this.titleImageUrl,
    required this.type,
    required this.list,
  });

  factory MyProperty.fromJson(Map<String, dynamic> json) => MyProperty(
        titleImageUrl: json["titleImageUrl"],
        type: json["type"],
        list: List<dynamic>.from(json["list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "titleImageUrl": titleImageUrl,
        "type": type,
        "list": List<dynamic>.from(list.map((x) => x)),
      };
}

class Nav {
  String linkname;
  String name;
  String nameDesc;
  String iconurl;
  String linkurl;
  String visible;
  String isopen;
  String schemeurl;
  int? isSkipNewCommunityCheck;

  Nav({
    required this.linkname,
    required this.name,
    required this.nameDesc,
    required this.iconurl,
    required this.linkurl,
    required this.visible,
    required this.isopen,
    required this.schemeurl,
    this.isSkipNewCommunityCheck,
  });

  factory Nav.fromJson(Map<String, dynamic> json) => Nav(
        linkname: json["linkname"],
        name: json["name"],
        nameDesc: json["nameDesc"],
        iconurl: json["iconurl"],
        linkurl: json["linkurl"],
        visible: json["visible"],
        isopen: json["isopen"],
        schemeurl: json["schemeurl"],
        isSkipNewCommunityCheck: json["isSkipNewCommunityCheck"],
      );

  Map<String, dynamic> toJson() => {
        "linkname": linkname,
        "name": name,
        "nameDesc": nameDesc,
        "iconurl": iconurl,
        "linkurl": linkurl,
        "visible": visible,
        "isopen": isopen,
        "schemeurl": schemeurl,
        "isSkipNewCommunityCheck": isSkipNewCommunityCheck,
      };
}

class PreCondition {
  FunsBlock funsBlock;

  PreCondition({
    required this.funsBlock,
  });

  factory PreCondition.fromJson(Map<String, dynamic> json) => PreCondition(
        funsBlock: FunsBlock.fromJson(json["funsBlock"]),
      );

  Map<String, dynamic> toJson() => {
        "funsBlock": funsBlock.toJson(),
      };
}

class FunsBlock {
  int isRepeat;
  List<String> listSort;

  FunsBlock({
    required this.isRepeat,
    required this.listSort,
  });

  factory FunsBlock.fromJson(Map<String, dynamic> json) => FunsBlock(
        isRepeat: json["isRepeat"],
        listSort: List<String>.from(json["listSort"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "isRepeat": isRepeat,
        "listSort": List<dynamic>.from(listSort.map((x) => x)),
      };
}

class VideoShow {
  String type;
  String titleImageUrl;
  String contentImageUrl;
  String videoUrl;
  String jumpType;
  String jumpUrl;
  String extendsDic;
  String showPlayIcon;

  VideoShow({
    required this.type,
    required this.titleImageUrl,
    required this.contentImageUrl,
    required this.videoUrl,
    required this.jumpType,
    required this.jumpUrl,
    required this.extendsDic,
    required this.showPlayIcon,
  });

  factory VideoShow.fromJson(Map<String, dynamic> json) => VideoShow(
        type: json["type"],
        titleImageUrl: json["titleImageUrl"],
        contentImageUrl: json["contentImageUrl"],
        videoUrl: json["videoUrl"],
        jumpType: json["jumpType"],
        jumpUrl: json["jumpUrl"],
        extendsDic: json["extendsDic"],
        showPlayIcon: json["showPlayIcon"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "titleImageUrl": titleImageUrl,
        "contentImageUrl": contentImageUrl,
        "videoUrl": videoUrl,
        "jumpType": jumpType,
        "jumpUrl": jumpUrl,
        "extendsDic": extendsDic,
        "showPlayIcon": showPlayIcon,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
