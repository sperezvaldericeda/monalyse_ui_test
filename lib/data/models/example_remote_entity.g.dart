// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExampleRemoteEntityImpl _$$ExampleRemoteEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ExampleRemoteEntityImpl(
      id: (json['id'] as num).toInt(),
      pk: (json['pk'] as num).toInt(),
      status: json['status'] as String,
      title: json['title'] as String,
      primaryDescription: json['primaryDescription'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ExampleRemoteEntityImplToJson(
        _$ExampleRemoteEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pk': instance.pk,
      'status': instance.status,
      'title': instance.title,
      'primaryDescription': instance.primaryDescription,
      'description': instance.description,
    };
