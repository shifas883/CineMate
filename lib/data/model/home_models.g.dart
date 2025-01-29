// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) =>
    HomeDataModel(
      section4data: json['section4'] == null
          ? null
          : SectionData.fromJson(json['section4'] as Map<String, dynamic>),
      section1data: json['section1'] == null
          ? null
          : SectionData.fromJson(json['section1'] as Map<String, dynamic>),
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
          .toList(),
      menus: (json['menus'] as List<dynamic>?)
          ?.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
      notifcationCount: json['notifcationCount'],
      section2data: json['section2'] == null
          ? null
          : SectionData.fromJson(json['section2'] as Map<String, dynamic>),
      section3data: json['section3'] == null
          ? null
          : SectionData.fromJson(json['section3'] as Map<String, dynamic>),
      section5data: (json['section5'] as List<dynamic>?)
          !.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
      sectionTitles: (json['sectionTitles'] as List<dynamic>?)
          ?.map((e) => SectionTitleList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'menus': instance.menus,
      'sectionTitles': instance.sectionTitles,
      'section1': instance.section1data,
      'section2': instance.section2data,
      'section3': instance.section3data,
      'section4': instance.section4data,
      'section5': instance.section5data,
      'category': instance.category,
      'notifcationCount': instance.notifcationCount,
    };

BannerList _$BannerListFromJson(Map<String, dynamic> json) => BannerList(
      id: json['id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      page: json['page'] as String?,
      subTitle: json['subTitle'] as String?,
      imageField: json['imageField'] as String?,
      isEnabled: json['isEnabled'] as bool? ?? false,
      status: json['status'] as String?,
      type: json['type'] as String?,
      link: json['link'] as String?,
      media: json['media'] as String?,
      mediaField: json['mediaField'] as String?,
      mediaType: json['media_type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BannerListToJson(BannerList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'imageField': instance.imageField,
      'type': instance.type,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'page': instance.page,
      'media': instance.media,
      'mediaField': instance.mediaField,
      'name': instance.name,
      'media_type': instance.mediaType,
      'link': instance.link,
      'isEnabled': instance.isEnabled,
      'status': instance.status,
    };

SectionTitleList _$SectionTitleListFromJson(Map<String, dynamic> json) =>
    SectionTitleList(
      id: json['id'] as String?,
      section2Name: json['section2Name'] as String?,
      section1Name: json['section1Name'] as String?,
      section3Name: json['section3Name'] as String?,
      section4Name: json['section4Name'] as String?,
      section5Name: json['section5Name'] as String?,
    );

Map<String, dynamic> _$SectionTitleListToJson(SectionTitleList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section1Name': instance.section1Name,
      'section2Name': instance.section2Name,
      'section3Name': instance.section3Name,
      'section4Name': instance.section4Name,
      'section5Name': instance.section5Name,
    };

SectionData _$SectionDataFromJson(Map<String, dynamic> json) => SectionData(
      title: json['title'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionDataToJson(SectionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'data': instance.data,
    };

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) => CategoryList(
      id: json['id'] as String?,
      name: json['name'] as String?,
      isEnabled: json['isEnabled'] as bool? ?? false,
      field: json['field'] as String?,
      industry: json['industry'] as String?,
      isDisplayHome: json['isDisplayHome'] as bool? ?? false,
    );

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'industry': instance.industry,
      'field': instance.field,
      'isEnabled': instance.isEnabled,
      'isDisplayHome': instance.isDisplayHome,
    };
