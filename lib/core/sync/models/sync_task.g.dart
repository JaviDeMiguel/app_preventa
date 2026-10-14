// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncTaskImpl _$$SyncTaskImplFromJson(Map<String, dynamic> json) =>
    _$SyncTaskImpl(
      id: json['id'] as String,
      endpoint: json['endpoint'] as String,
      method: $enumDecode(_$HttpMethodEnumMap, json['method']),
      payload: json['payload'] as Map<String, dynamic>,
      retries: (json['retries'] as num?)?.toInt() ?? 0,
      maxRetries: (json['maxRetries'] as num?)?.toInt() ?? 3,
      status: $enumDecodeNullable(_$SyncStatusEnumMap, json['status']) ??
          SyncStatus.pending,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastAttemptAt: json['lastAttemptAt'] == null
          ? null
          : DateTime.parse(json['lastAttemptAt'] as String),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$SyncTaskImplToJson(_$SyncTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint,
      'method': _$HttpMethodEnumMap[instance.method]!,
      'payload': instance.payload,
      'retries': instance.retries,
      'maxRetries': instance.maxRetries,
      'status': _$SyncStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastAttemptAt': instance.lastAttemptAt?.toIso8601String(),
      'errorMessage': instance.errorMessage,
    };

const _$HttpMethodEnumMap = {
  HttpMethod.get: 'get',
  HttpMethod.post: 'post',
  HttpMethod.put: 'put',
  HttpMethod.delete: 'delete',
};

const _$SyncStatusEnumMap = {
  SyncStatus.pending: 'pending',
  SyncStatus.inProgress: 'inProgress',
  SyncStatus.completed: 'completed',
  SyncStatus.failed: 'failed',
  SyncStatus.fatalError: 'fatalError',
};
