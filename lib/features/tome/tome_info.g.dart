// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tome_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TomeInfoImpl _$$TomeInfoImplFromJson(Map<String, dynamic> json) =>
    _$TomeInfoImpl(
      author: json['author'] as String?,
      title: json['title'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$TomeInfoImplToJson(_$TomeInfoImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'authors': instance.authors,
    };
