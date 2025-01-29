
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_models.g.dart';

@JsonSerializable()
class HomeDataModel extends Equatable {

  @JsonKey(name: 'banners')
  final List<BannerList>? banners;
  @JsonKey(name: 'menus')
  final List<BannerList>? menus;
  @JsonKey(name: 'sectionTitles')
  final List<SectionTitleList>? sectionTitles;
  @JsonKey(name: 'section1')
  final SectionData? section1data;
  @JsonKey(name: 'section2')
  final SectionData? section2data;
  @JsonKey(name: 'section3')
  final SectionData? section3data;
  @JsonKey(name: 'section4')
  final SectionData? section4data;
  @JsonKey(name: 'section5')
  final List<BannerList>? section5data;
  @JsonKey(name: 'category')
  final List<CategoryList>? category;
  final dynamic? notifcationCount;
  HomeDataModel( {
    this.section4data,
    this.section1data,
    this.banners,
    this.category,
    this.menus,
    this.notifcationCount,
    this.section2data,
    this.section3data,
    this.section5data,
    this.sectionTitles,


  });

  @override
  List<Object> get props => [];

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}


@JsonSerializable()
class BannerList extends Equatable {

  final String? id;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'imageField')
  final String? imageField;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'subTitle')
  final String? subTitle;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'page')
  final String? page;
  @JsonKey(name: 'media')
  final String? media;
  @JsonKey(name: 'mediaField')
  final String? mediaField;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'isEnabled',defaultValue: false)
  final bool? isEnabled;
  @JsonKey(name: 'status')
  final String? status;


  BannerList( {
    this.id,
    this.image,
    this.title,
    this.description,
    this.page,
    this.subTitle,
    this.imageField,
    this.isEnabled,
    this.status,
    this.type,
    this.link,
    this.media,
    this.mediaField,
    this.mediaType,
    this.name,
  });

  @override
  List<Object> get props => [];

  factory BannerList.fromJson(Map<String, dynamic> json) => _$BannerListFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListToJson(this);
}

@JsonSerializable()
class SectionTitleList extends Equatable {

  final String? id;
  @JsonKey(name: 'section1Name')
  final String? section1Name;
  @JsonKey(name: 'section2Name')
  final String? section2Name;
  @JsonKey(name: 'section3Name')
  final String? section3Name;
  @JsonKey(name: 'section4Name')
  final String? section4Name;
  @JsonKey(name: 'section5Name')
  final String? section5Name;


  SectionTitleList( {
    this.id,
    this.section2Name,
    this.section1Name,
    this.section3Name,
    this.section4Name,
    this.section5Name,
  });

  @override
  List<Object> get props => [];

  factory SectionTitleList.fromJson(Map<String, dynamic> json) => _$SectionTitleListFromJson(json);

  Map<String, dynamic> toJson() => _$SectionTitleListToJson(this);
}

@JsonSerializable()
class SectionData extends Equatable {

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'data')
  final List<BannerList>? data;


  SectionData( {
    this.title,
    this.data,
  });

  @override
  List<Object> get props => [];

  factory SectionData.fromJson(Map<String, dynamic> json) => _$SectionDataFromJson(json);

  Map<String, dynamic> toJson() => _$SectionDataToJson(this);
}


@JsonSerializable()
class CategoryList extends Equatable {

  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'industry')
  final String? industry;
  @JsonKey(name: 'field')
  final String? field;
  @JsonKey(name: 'isEnabled',defaultValue: false)
  final bool? isEnabled;
  @JsonKey(name: 'isDisplayHome',defaultValue: false)
  final bool? isDisplayHome;


  CategoryList( {
    this.id,
    this.name,
    this.isEnabled,
    this.field,
    this.industry,
    this.isDisplayHome,
  });

  @override
  List<Object> get props => [];

  factory CategoryList.fromJson(Map<String, dynamic> json) => _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
