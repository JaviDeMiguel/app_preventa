// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_task_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetSyncTaskCollectionCollection on Isar {
  IsarCollection<SyncTaskCollection> get syncTaskCollections =>
      this.collection();
}

const SyncTaskCollectionSchema = CollectionSchema(
  name: r'SyncTaskCollection',
  id: 7511076349089226843,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deliveryUncertain': PropertySchema(
      id: 1,
      name: r'deliveryUncertain',
      type: IsarType.bool,
    ),
    r'endpoint': PropertySchema(
      id: 2,
      name: r'endpoint',
      type: IsarType.string,
    ),
    r'errorMessage': PropertySchema(
      id: 3,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'lastAttemptAt': PropertySchema(
      id: 4,
      name: r'lastAttemptAt',
      type: IsarType.dateTime,
    ),
    r'maxRetries': PropertySchema(
      id: 5,
      name: r'maxRetries',
      type: IsarType.long,
    ),
    r'method': PropertySchema(
      id: 6,
      name: r'method',
      type: IsarType.byte,
      enumMap: _SyncTaskCollectionmethodEnumValueMap,
    ),
    r'nextAttemptAt': PropertySchema(
      id: 7,
      name: r'nextAttemptAt',
      type: IsarType.dateTime,
    ),
    r'payloadJson': PropertySchema(
      id: 8,
      name: r'payloadJson',
      type: IsarType.string,
    ),
    r'retries': PropertySchema(
      id: 9,
      name: r'retries',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _SyncTaskCollectionstatusEnumValueMap,
    ),
    r'uuid': PropertySchema(
      id: 11,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _syncTaskCollectionEstimateSize,
  serialize: _syncTaskCollectionSerialize,
  deserialize: _syncTaskCollectionDeserialize,
  deserializeProp: _syncTaskCollectionDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'retries': IndexSchema(
      id: -1957735732699824569,
      name: r'retries',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'retries',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'nextAttemptAt': IndexSchema(
      id: -6579709235917701315,
      name: r'nextAttemptAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nextAttemptAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncTaskCollectionGetId,
  getLinks: _syncTaskCollectionGetLinks,
  attach: _syncTaskCollectionAttach,
  version: '3.4.1',
);

int _syncTaskCollectionEstimateSize(
  SyncTaskCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.endpoint.length * 3;
  {
    final value = object.errorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.payloadJson.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _syncTaskCollectionSerialize(
  SyncTaskCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeBool(offsets[1], object.deliveryUncertain);
  writer.writeString(offsets[2], object.endpoint);
  writer.writeString(offsets[3], object.errorMessage);
  writer.writeDateTime(offsets[4], object.lastAttemptAt);
  writer.writeLong(offsets[5], object.maxRetries);
  writer.writeByte(offsets[6], object.method.index);
  writer.writeDateTime(offsets[7], object.nextAttemptAt);
  writer.writeString(offsets[8], object.payloadJson);
  writer.writeLong(offsets[9], object.retries);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeString(offsets[11], object.uuid);
}

SyncTaskCollection _syncTaskCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncTaskCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.deliveryUncertain = reader.readBool(offsets[1]);
  object.endpoint = reader.readString(offsets[2]);
  object.errorMessage = reader.readStringOrNull(offsets[3]);
  object.isarId = id;
  object.lastAttemptAt = reader.readDateTimeOrNull(offsets[4]);
  object.maxRetries = reader.readLong(offsets[5]);
  object.method = _SyncTaskCollectionmethodValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      HttpMethod.get;
  object.nextAttemptAt = reader.readDateTimeOrNull(offsets[7]);
  object.payloadJson = reader.readString(offsets[8]);
  object.retries = reader.readLong(offsets[9]);
  object.status = _SyncTaskCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[10])] ??
      SyncStatus.pending;
  object.uuid = reader.readString(offsets[11]);
  return object;
}

P _syncTaskCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (_SyncTaskCollectionmethodValueEnumMap[
              reader.readByteOrNull(offset)] ??
          HttpMethod.get) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (_SyncTaskCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.pending) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SyncTaskCollectionmethodEnumValueMap = {
  'get': 0,
  'post': 1,
  'put': 2,
  'delete': 3,
  'upload': 4,
};
const _SyncTaskCollectionmethodValueEnumMap = {
  0: HttpMethod.get,
  1: HttpMethod.post,
  2: HttpMethod.put,
  3: HttpMethod.delete,
  4: HttpMethod.upload,
};
const _SyncTaskCollectionstatusEnumValueMap = {
  'pending': 0,
  'inProgress': 1,
  'completed': 2,
  'failed': 3,
  'fatalError': 4,
  'conflict': 5,
  'discarded': 6,
};
const _SyncTaskCollectionstatusValueEnumMap = {
  0: SyncStatus.pending,
  1: SyncStatus.inProgress,
  2: SyncStatus.completed,
  3: SyncStatus.failed,
  4: SyncStatus.fatalError,
  5: SyncStatus.conflict,
  6: SyncStatus.discarded,
};

Id _syncTaskCollectionGetId(SyncTaskCollection object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _syncTaskCollectionGetLinks(
    SyncTaskCollection object) {
  return [];
}

void _syncTaskCollectionAttach(
    IsarCollection<dynamic> col, Id id, SyncTaskCollection object) {
  object.isarId = id;
}

extension SyncTaskCollectionByIndex on IsarCollection<SyncTaskCollection> {
  Future<SyncTaskCollection?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  SyncTaskCollection? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<SyncTaskCollection?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<SyncTaskCollection?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(SyncTaskCollection object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(SyncTaskCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<SyncTaskCollection> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<SyncTaskCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension SyncTaskCollectionQueryWhereSort
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QWhere> {
  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhere>
      anyRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'retries'),
      );
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhere>
      anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhere>
      anyNextAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nextAttemptAt'),
      );
    });
  }
}

extension SyncTaskCollectionQueryWhere
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QWhereClause> {
  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      uuidNotEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      retriesEqualTo(int retries) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'retries',
        value: [retries],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      retriesNotEqualTo(int retries) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'retries',
              lower: [],
              upper: [retries],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'retries',
              lower: [retries],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'retries',
              lower: [retries],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'retries',
              lower: [],
              upper: [retries],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      retriesGreaterThan(
    int retries, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'retries',
        lower: [retries],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      retriesLessThan(
    int retries, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'retries',
        lower: [],
        upper: [retries],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      retriesBetween(
    int lowerRetries,
    int upperRetries, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'retries',
        lower: [lowerRetries],
        includeLower: includeLower,
        upper: [upperRetries],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      statusEqualTo(SyncStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      statusNotEqualTo(SyncStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      statusGreaterThan(
    SyncStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [status],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      statusLessThan(
    SyncStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [],
        upper: [status],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      statusBetween(
    SyncStatus lowerStatus,
    SyncStatus upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [lowerStatus],
        includeLower: includeLower,
        upper: [upperStatus],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      nextAttemptAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nextAttemptAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      nextAttemptAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextAttemptAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      nextAttemptAtEqualTo(DateTime? nextAttemptAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nextAttemptAt',
        value: [nextAttemptAt],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      nextAttemptAtNotEqualTo(DateTime? nextAttemptAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextAttemptAt',
              lower: [],
              upper: [nextAttemptAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextAttemptAt',
              lower: [nextAttemptAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextAttemptAt',
              lower: [nextAttemptAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextAttemptAt',
              lower: [],
              upper: [nextAttemptAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      nextAttemptAtGreaterThan(
    DateTime? nextAttemptAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextAttemptAt',
        lower: [nextAttemptAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      nextAttemptAtLessThan(
    DateTime? nextAttemptAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextAttemptAt',
        lower: [],
        upper: [nextAttemptAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterWhereClause>
      nextAttemptAtBetween(
    DateTime? lowerNextAttemptAt,
    DateTime? upperNextAttemptAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextAttemptAt',
        lower: [lowerNextAttemptAt],
        includeLower: includeLower,
        upper: [upperNextAttemptAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncTaskCollectionQueryFilter
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QFilterCondition> {
  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      deliveryUncertainEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryUncertain',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endpoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endpoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      endpointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      lastAttemptAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastAttemptAt',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      lastAttemptAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastAttemptAt',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      lastAttemptAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastAttemptAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      lastAttemptAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastAttemptAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      lastAttemptAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastAttemptAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      lastAttemptAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastAttemptAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      maxRetriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRetries',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      maxRetriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRetries',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      maxRetriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRetries',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      maxRetriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRetries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      methodEqualTo(HttpMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      methodGreaterThan(
    HttpMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'method',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      methodLessThan(
    HttpMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'method',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      methodBetween(
    HttpMethod lower,
    HttpMethod upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'method',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      nextAttemptAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextAttemptAt',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      nextAttemptAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextAttemptAt',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      nextAttemptAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextAttemptAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      nextAttemptAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextAttemptAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      nextAttemptAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextAttemptAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      nextAttemptAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextAttemptAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payloadJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payloadJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      payloadJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      retriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retries',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      retriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retries',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      retriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retries',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      retriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      statusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      statusGreaterThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      statusLessThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      statusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension SyncTaskCollectionQueryObject
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QFilterCondition> {}

extension SyncTaskCollectionQueryLinks
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QFilterCondition> {}

extension SyncTaskCollectionQuerySortBy
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QSortBy> {
  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByDeliveryUncertain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryUncertain', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByDeliveryUncertainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryUncertain', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByMaxRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByNextAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByNextAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retries', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retries', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension SyncTaskCollectionQuerySortThenBy
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QSortThenBy> {
  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByDeliveryUncertain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryUncertain', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByDeliveryUncertainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryUncertain', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByMaxRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByNextAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByNextAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retries', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retries', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension SyncTaskCollectionQueryWhereDistinct
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct> {
  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByDeliveryUncertain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryUncertain');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByEndpoint({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endpoint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByErrorMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAttemptAt');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRetries');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'method');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByNextAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextAttemptAt');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByPayloadJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payloadJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retries');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncTaskCollection, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension SyncTaskCollectionQueryProperty
    on QueryBuilder<SyncTaskCollection, SyncTaskCollection, QQueryProperty> {
  QueryBuilder<SyncTaskCollection, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<SyncTaskCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SyncTaskCollection, bool, QQueryOperations>
      deliveryUncertainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryUncertain');
    });
  }

  QueryBuilder<SyncTaskCollection, String, QQueryOperations>
      endpointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endpoint');
    });
  }

  QueryBuilder<SyncTaskCollection, String?, QQueryOperations>
      errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<SyncTaskCollection, DateTime?, QQueryOperations>
      lastAttemptAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAttemptAt');
    });
  }

  QueryBuilder<SyncTaskCollection, int, QQueryOperations> maxRetriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRetries');
    });
  }

  QueryBuilder<SyncTaskCollection, HttpMethod, QQueryOperations>
      methodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'method');
    });
  }

  QueryBuilder<SyncTaskCollection, DateTime?, QQueryOperations>
      nextAttemptAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextAttemptAt');
    });
  }

  QueryBuilder<SyncTaskCollection, String, QQueryOperations>
      payloadJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payloadJson');
    });
  }

  QueryBuilder<SyncTaskCollection, int, QQueryOperations> retriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retries');
    });
  }

  QueryBuilder<SyncTaskCollection, SyncStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<SyncTaskCollection, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetSyncMetadataCollectionCollection on Isar {
  IsarCollection<SyncMetadataCollection> get syncMetadataCollections =>
      this.collection();
}

const SyncMetadataCollectionSchema = CollectionSchema(
  name: r'SyncMetadataCollection',
  id: 1420381517493040414,
  properties: {
    r'entityName': PropertySchema(
      id: 0,
      name: r'entityName',
      type: IsarType.string,
    ),
    r'lastCount': PropertySchema(
      id: 1,
      name: r'lastCount',
      type: IsarType.long,
    ),
    r'lastSyncAt': PropertySchema(
      id: 2,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _syncMetadataCollectionEstimateSize,
  serialize: _syncMetadataCollectionSerialize,
  deserialize: _syncMetadataCollectionDeserialize,
  deserializeProp: _syncMetadataCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'entityName': IndexSchema(
      id: -1749110902930819992,
      name: r'entityName',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'entityName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncMetadataCollectionGetId,
  getLinks: _syncMetadataCollectionGetLinks,
  attach: _syncMetadataCollectionAttach,
  version: '3.4.1',
);

int _syncMetadataCollectionEstimateSize(
  SyncMetadataCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entityName.length * 3;
  return bytesCount;
}

void _syncMetadataCollectionSerialize(
  SyncMetadataCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.entityName);
  writer.writeLong(offsets[1], object.lastCount);
  writer.writeDateTime(offsets[2], object.lastSyncAt);
}

SyncMetadataCollection _syncMetadataCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncMetadataCollection();
  object.entityName = reader.readString(offsets[0]);
  object.id = id;
  object.lastCount = reader.readLong(offsets[1]);
  object.lastSyncAt = reader.readDateTime(offsets[2]);
  return object;
}

P _syncMetadataCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _syncMetadataCollectionGetId(SyncMetadataCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncMetadataCollectionGetLinks(
    SyncMetadataCollection object) {
  return [];
}

void _syncMetadataCollectionAttach(
    IsarCollection<dynamic> col, Id id, SyncMetadataCollection object) {
  object.id = id;
}

extension SyncMetadataCollectionByIndex
    on IsarCollection<SyncMetadataCollection> {
  Future<SyncMetadataCollection?> getByEntityName(String entityName) {
    return getByIndex(r'entityName', [entityName]);
  }

  SyncMetadataCollection? getByEntityNameSync(String entityName) {
    return getByIndexSync(r'entityName', [entityName]);
  }

  Future<bool> deleteByEntityName(String entityName) {
    return deleteByIndex(r'entityName', [entityName]);
  }

  bool deleteByEntityNameSync(String entityName) {
    return deleteByIndexSync(r'entityName', [entityName]);
  }

  Future<List<SyncMetadataCollection?>> getAllByEntityName(
      List<String> entityNameValues) {
    final values = entityNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'entityName', values);
  }

  List<SyncMetadataCollection?> getAllByEntityNameSync(
      List<String> entityNameValues) {
    final values = entityNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'entityName', values);
  }

  Future<int> deleteAllByEntityName(List<String> entityNameValues) {
    final values = entityNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'entityName', values);
  }

  int deleteAllByEntityNameSync(List<String> entityNameValues) {
    final values = entityNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'entityName', values);
  }

  Future<Id> putByEntityName(SyncMetadataCollection object) {
    return putByIndex(r'entityName', object);
  }

  Id putByEntityNameSync(SyncMetadataCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'entityName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEntityName(List<SyncMetadataCollection> objects) {
    return putAllByIndex(r'entityName', objects);
  }

  List<Id> putAllByEntityNameSync(List<SyncMetadataCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'entityName', objects, saveLinks: saveLinks);
  }
}

extension SyncMetadataCollectionQueryWhereSort
    on QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QWhere> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncMetadataCollectionQueryWhere on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QWhereClause> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> entityNameEqualTo(String entityName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'entityName',
        value: [entityName],
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> entityNameNotEqualTo(String entityName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityName',
              lower: [],
              upper: [entityName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityName',
              lower: [entityName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityName',
              lower: [entityName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityName',
              lower: [],
              upper: [entityName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SyncMetadataCollectionQueryFilter on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QFilterCondition> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
          QAfterFilterCondition>
      entityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
          QAfterFilterCondition>
      entityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityName',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityName',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastSyncAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastSyncAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastSyncAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastSyncAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncMetadataCollectionQueryObject on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QFilterCondition> {}

extension SyncMetadataCollectionQueryLinks on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QFilterCondition> {}

extension SyncMetadataCollectionQuerySortBy
    on QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QSortBy> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByEntityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByEntityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCount', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCount', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }
}

extension SyncMetadataCollectionQuerySortThenBy on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QSortThenBy> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByEntityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByEntityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCount', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCount', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }
}

extension SyncMetadataCollectionQueryWhereDistinct
    on QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByEntityName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByLastCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCount');
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }
}

extension SyncMetadataCollectionQueryProperty on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QQueryProperty> {
  QueryBuilder<SyncMetadataCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncMetadataCollection, String, QQueryOperations>
      entityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityName');
    });
  }

  QueryBuilder<SyncMetadataCollection, int, QQueryOperations>
      lastCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCount');
    });
  }

  QueryBuilder<SyncMetadataCollection, DateTime, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetClientEntityCollection on Isar {
  IsarCollection<ClientEntity> get clientEntitys => this.collection();
}

const ClientEntitySchema = CollectionSchema(
  name: r'ClientEntity',
  id: -625331908291332558,
  properties: {
    r'cifnif': PropertySchema(
      id: 0,
      name: r'cifnif',
      type: IsarType.string,
    ),
    r'ciudad': PropertySchema(
      id: 1,
      name: r'ciudad',
      type: IsarType.string,
    ),
    r'codcliente': PropertySchema(
      id: 2,
      name: r'codcliente',
      type: IsarType.string,
    ),
    r'codpostal': PropertySchema(
      id: 3,
      name: r'codpostal',
      type: IsarType.string,
    ),
    r'codtarifa': PropertySchema(
      id: 4,
      name: r'codtarifa',
      type: IsarType.string,
    ),
    r'deuda': PropertySchema(
      id: 5,
      name: r'deuda',
      type: IsarType.double,
    ),
    r'direccion': PropertySchema(
      id: 6,
      name: r'direccion',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 7,
      name: r'email',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 8,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'recargo': PropertySchema(
      id: 9,
      name: r'recargo',
      type: IsarType.bool,
    ),
    r'riesgomax': PropertySchema(
      id: 10,
      name: r'riesgomax',
      type: IsarType.double,
    ),
    r'telefono': PropertySchema(
      id: 11,
      name: r'telefono',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _clientEntityEstimateSize,
  serialize: _clientEntitySerialize,
  deserialize: _clientEntityDeserialize,
  deserializeProp: _clientEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'codcliente': IndexSchema(
      id: 330416538284371127,
      name: r'codcliente',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'codcliente',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'nombre': IndexSchema(
      id: -8239814765453414572,
      name: r'nombre',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nombre',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _clientEntityGetId,
  getLinks: _clientEntityGetLinks,
  attach: _clientEntityAttach,
  version: '3.4.1',
);

int _clientEntityEstimateSize(
  ClientEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cifnif.length * 3;
  {
    final value = object.ciudad;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.codcliente.length * 3;
  {
    final value = object.codpostal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.codtarifa;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.direccion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.telefono;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _clientEntitySerialize(
  ClientEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cifnif);
  writer.writeString(offsets[1], object.ciudad);
  writer.writeString(offsets[2], object.codcliente);
  writer.writeString(offsets[3], object.codpostal);
  writer.writeString(offsets[4], object.codtarifa);
  writer.writeDouble(offsets[5], object.deuda);
  writer.writeString(offsets[6], object.direccion);
  writer.writeString(offsets[7], object.email);
  writer.writeString(offsets[8], object.nombre);
  writer.writeBool(offsets[9], object.recargo);
  writer.writeDouble(offsets[10], object.riesgomax);
  writer.writeString(offsets[11], object.telefono);
  writer.writeDateTime(offsets[12], object.updatedAt);
}

ClientEntity _clientEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClientEntity();
  object.cifnif = reader.readString(offsets[0]);
  object.ciudad = reader.readStringOrNull(offsets[1]);
  object.codcliente = reader.readString(offsets[2]);
  object.codpostal = reader.readStringOrNull(offsets[3]);
  object.codtarifa = reader.readStringOrNull(offsets[4]);
  object.deuda = reader.readDouble(offsets[5]);
  object.direccion = reader.readStringOrNull(offsets[6]);
  object.email = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.nombre = reader.readString(offsets[8]);
  object.recargo = reader.readBool(offsets[9]);
  object.riesgomax = reader.readDouble(offsets[10]);
  object.telefono = reader.readStringOrNull(offsets[11]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[12]);
  return object;
}

P _clientEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clientEntityGetId(ClientEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clientEntityGetLinks(ClientEntity object) {
  return [];
}

void _clientEntityAttach(
    IsarCollection<dynamic> col, Id id, ClientEntity object) {
  object.id = id;
}

extension ClientEntityByIndex on IsarCollection<ClientEntity> {
  Future<ClientEntity?> getByCodcliente(String codcliente) {
    return getByIndex(r'codcliente', [codcliente]);
  }

  ClientEntity? getByCodclienteSync(String codcliente) {
    return getByIndexSync(r'codcliente', [codcliente]);
  }

  Future<bool> deleteByCodcliente(String codcliente) {
    return deleteByIndex(r'codcliente', [codcliente]);
  }

  bool deleteByCodclienteSync(String codcliente) {
    return deleteByIndexSync(r'codcliente', [codcliente]);
  }

  Future<List<ClientEntity?>> getAllByCodcliente(
      List<String> codclienteValues) {
    final values = codclienteValues.map((e) => [e]).toList();
    return getAllByIndex(r'codcliente', values);
  }

  List<ClientEntity?> getAllByCodclienteSync(List<String> codclienteValues) {
    final values = codclienteValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'codcliente', values);
  }

  Future<int> deleteAllByCodcliente(List<String> codclienteValues) {
    final values = codclienteValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'codcliente', values);
  }

  int deleteAllByCodclienteSync(List<String> codclienteValues) {
    final values = codclienteValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'codcliente', values);
  }

  Future<Id> putByCodcliente(ClientEntity object) {
    return putByIndex(r'codcliente', object);
  }

  Id putByCodclienteSync(ClientEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'codcliente', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCodcliente(List<ClientEntity> objects) {
    return putAllByIndex(r'codcliente', objects);
  }

  List<Id> putAllByCodclienteSync(List<ClientEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'codcliente', objects, saveLinks: saveLinks);
  }
}

extension ClientEntityQueryWhereSort
    on QueryBuilder<ClientEntity, ClientEntity, QWhere> {
  QueryBuilder<ClientEntity, ClientEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhere> anyNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nombre'),
      );
    });
  }
}

extension ClientEntityQueryWhere
    on QueryBuilder<ClientEntity, ClientEntity, QWhereClause> {
  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> codclienteEqualTo(
      String codcliente) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codcliente',
        value: [codcliente],
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause>
      codclienteNotEqualTo(String codcliente) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [],
              upper: [codcliente],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [codcliente],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [codcliente],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [],
              upper: [codcliente],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> nombreEqualTo(
      String nombre) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nombre',
        value: [nombre],
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> nombreNotEqualTo(
      String nombre) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [],
              upper: [nombre],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [nombre],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [nombre],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [],
              upper: [nombre],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> nombreGreaterThan(
    String nombre, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nombre',
        lower: [nombre],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> nombreLessThan(
    String nombre, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nombre',
        lower: [],
        upper: [nombre],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> nombreBetween(
    String lowerNombre,
    String upperNombre, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nombre',
        lower: [lowerNombre],
        includeLower: includeLower,
        upper: [upperNombre],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> nombreStartsWith(
      String NombrePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nombre',
        lower: [NombrePrefix],
        upper: ['$NombrePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nombre',
        value: [''],
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterWhereClause>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nombre',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nombre',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nombre',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nombre',
              upper: [''],
            ));
      }
    });
  }
}

extension ClientEntityQueryFilter
    on QueryBuilder<ClientEntity, ClientEntity, QFilterCondition> {
  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> cifnifEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cifnif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      cifnifGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cifnif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      cifnifLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cifnif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> cifnifBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cifnif',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      cifnifStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cifnif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      cifnifEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cifnif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      cifnifContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cifnif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> cifnifMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cifnif',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      cifnifIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cifnif',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      cifnifIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cifnif',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ciudad',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ciudad',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> ciudadEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> ciudadBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ciudad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> ciudadMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ciudad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ciudad',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      ciudadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ciudad',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codcliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codcliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codcliente',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codclienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codcliente',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codpostal',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codpostal',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codpostal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codpostal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codpostal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codpostal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codpostal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codpostal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codpostal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codpostal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codpostal',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codpostalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codpostal',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codtarifa',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codtarifa',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codtarifa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codtarifa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codtarifa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codtarifa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codtarifa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codtarifa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codtarifa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codtarifa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codtarifa',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      codtarifaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codtarifa',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> deudaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deuda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      deudaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deuda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> deudaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deuda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> deudaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deuda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      direccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      recargoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recargo',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      riesgomaxEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riesgomax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      riesgomaxGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'riesgomax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      riesgomaxLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'riesgomax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      riesgomaxBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'riesgomax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      telefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefono',
        value: '',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClientEntityQueryObject
    on QueryBuilder<ClientEntity, ClientEntity, QFilterCondition> {}

extension ClientEntityQueryLinks
    on QueryBuilder<ClientEntity, ClientEntity, QFilterCondition> {}

extension ClientEntityQuerySortBy
    on QueryBuilder<ClientEntity, ClientEntity, QSortBy> {
  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCifnif() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cifnif', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCifnifDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cifnif', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCodcliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy>
      sortByCodclienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCodpostal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codpostal', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCodpostalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codpostal', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCodtarifa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codtarifa', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByCodtarifaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codtarifa', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByDeuda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deuda', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByDeudaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deuda', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByRecargo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recargo', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByRecargoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recargo', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByRiesgomax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgomax', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByRiesgomaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgomax', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ClientEntityQuerySortThenBy
    on QueryBuilder<ClientEntity, ClientEntity, QSortThenBy> {
  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCifnif() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cifnif', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCifnifDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cifnif', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCodcliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy>
      thenByCodclienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCodpostal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codpostal', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCodpostalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codpostal', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCodtarifa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codtarifa', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByCodtarifaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codtarifa', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByDeuda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deuda', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByDeudaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deuda', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByRecargo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recargo', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByRecargoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recargo', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByRiesgomax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgomax', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByRiesgomaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riesgomax', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ClientEntityQueryWhereDistinct
    on QueryBuilder<ClientEntity, ClientEntity, QDistinct> {
  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByCifnif(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cifnif', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByCiudad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ciudad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByCodcliente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codcliente', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByCodpostal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codpostal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByCodtarifa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codtarifa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByDeuda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deuda');
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByDireccion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByRecargo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recargo');
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByRiesgomax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'riesgomax');
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefono', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClientEntity, ClientEntity, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ClientEntityQueryProperty
    on QueryBuilder<ClientEntity, ClientEntity, QQueryProperty> {
  QueryBuilder<ClientEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClientEntity, String, QQueryOperations> cifnifProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cifnif');
    });
  }

  QueryBuilder<ClientEntity, String?, QQueryOperations> ciudadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ciudad');
    });
  }

  QueryBuilder<ClientEntity, String, QQueryOperations> codclienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codcliente');
    });
  }

  QueryBuilder<ClientEntity, String?, QQueryOperations> codpostalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codpostal');
    });
  }

  QueryBuilder<ClientEntity, String?, QQueryOperations> codtarifaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codtarifa');
    });
  }

  QueryBuilder<ClientEntity, double, QQueryOperations> deudaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deuda');
    });
  }

  QueryBuilder<ClientEntity, String?, QQueryOperations> direccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccion');
    });
  }

  QueryBuilder<ClientEntity, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<ClientEntity, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<ClientEntity, bool, QQueryOperations> recargoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recargo');
    });
  }

  QueryBuilder<ClientEntity, double, QQueryOperations> riesgomaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'riesgomax');
    });
  }

  QueryBuilder<ClientEntity, String?, QQueryOperations> telefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefono');
    });
  }

  QueryBuilder<ClientEntity, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetProductEntityCollection on Isar {
  IsarCollection<ProductEntity> get productEntitys => this.collection();
}

const ProductEntitySchema = CollectionSchema(
  name: r'ProductEntity',
  id: 4867088266565710661,
  properties: {
    r'bloqueado': PropertySchema(
      id: 0,
      name: r'bloqueado',
      type: IsarType.bool,
    ),
    r'descripcion': PropertySchema(
      id: 1,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'iva': PropertySchema(
      id: 2,
      name: r'iva',
      type: IsarType.double,
    ),
    r'precio': PropertySchema(
      id: 3,
      name: r'precio',
      type: IsarType.double,
    ),
    r'referencia': PropertySchema(
      id: 4,
      name: r'referencia',
      type: IsarType.string,
    ),
    r'stockDisponible': PropertySchema(
      id: 5,
      name: r'stockDisponible',
      type: IsarType.long,
    ),
    r'stockFisico': PropertySchema(
      id: 6,
      name: r'stockFisico',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _productEntityEstimateSize,
  serialize: _productEntitySerialize,
  deserialize: _productEntityDeserialize,
  deserializeProp: _productEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'referencia': IndexSchema(
      id: -2567224829153491442,
      name: r'referencia',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'referencia',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'descripcion': IndexSchema(
      id: 6050674522552744632,
      name: r'descripcion',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'descripcion',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _productEntityGetId,
  getLinks: _productEntityGetLinks,
  attach: _productEntityAttach,
  version: '3.4.1',
);

int _productEntityEstimateSize(
  ProductEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descripcion.length * 3;
  bytesCount += 3 + object.referencia.length * 3;
  return bytesCount;
}

void _productEntitySerialize(
  ProductEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.bloqueado);
  writer.writeString(offsets[1], object.descripcion);
  writer.writeDouble(offsets[2], object.iva);
  writer.writeDouble(offsets[3], object.precio);
  writer.writeString(offsets[4], object.referencia);
  writer.writeLong(offsets[5], object.stockDisponible);
  writer.writeLong(offsets[6], object.stockFisico);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

ProductEntity _productEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductEntity();
  object.bloqueado = reader.readBool(offsets[0]);
  object.descripcion = reader.readString(offsets[1]);
  object.id = id;
  object.iva = reader.readDouble(offsets[2]);
  object.precio = reader.readDouble(offsets[3]);
  object.referencia = reader.readString(offsets[4]);
  object.stockDisponible = reader.readLong(offsets[5]);
  object.stockFisico = reader.readLong(offsets[6]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _productEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productEntityGetId(ProductEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productEntityGetLinks(ProductEntity object) {
  return [];
}

void _productEntityAttach(
    IsarCollection<dynamic> col, Id id, ProductEntity object) {
  object.id = id;
}

extension ProductEntityByIndex on IsarCollection<ProductEntity> {
  Future<ProductEntity?> getByReferencia(String referencia) {
    return getByIndex(r'referencia', [referencia]);
  }

  ProductEntity? getByReferenciaSync(String referencia) {
    return getByIndexSync(r'referencia', [referencia]);
  }

  Future<bool> deleteByReferencia(String referencia) {
    return deleteByIndex(r'referencia', [referencia]);
  }

  bool deleteByReferenciaSync(String referencia) {
    return deleteByIndexSync(r'referencia', [referencia]);
  }

  Future<List<ProductEntity?>> getAllByReferencia(
      List<String> referenciaValues) {
    final values = referenciaValues.map((e) => [e]).toList();
    return getAllByIndex(r'referencia', values);
  }

  List<ProductEntity?> getAllByReferenciaSync(List<String> referenciaValues) {
    final values = referenciaValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'referencia', values);
  }

  Future<int> deleteAllByReferencia(List<String> referenciaValues) {
    final values = referenciaValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'referencia', values);
  }

  int deleteAllByReferenciaSync(List<String> referenciaValues) {
    final values = referenciaValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'referencia', values);
  }

  Future<Id> putByReferencia(ProductEntity object) {
    return putByIndex(r'referencia', object);
  }

  Id putByReferenciaSync(ProductEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'referencia', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByReferencia(List<ProductEntity> objects) {
    return putAllByIndex(r'referencia', objects);
  }

  List<Id> putAllByReferenciaSync(List<ProductEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'referencia', objects, saveLinks: saveLinks);
  }
}

extension ProductEntityQueryWhereSort
    on QueryBuilder<ProductEntity, ProductEntity, QWhere> {
  QueryBuilder<ProductEntity, ProductEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhere> anyDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'descripcion'),
      );
    });
  }
}

extension ProductEntityQueryWhere
    on QueryBuilder<ProductEntity, ProductEntity, QWhereClause> {
  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      referenciaEqualTo(String referencia) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'referencia',
        value: [referencia],
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      referenciaNotEqualTo(String referencia) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'referencia',
              lower: [],
              upper: [referencia],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'referencia',
              lower: [referencia],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'referencia',
              lower: [referencia],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'referencia',
              lower: [],
              upper: [referencia],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionEqualTo(String descripcion) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descripcion',
        value: [descripcion],
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionNotEqualTo(String descripcion) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descripcion',
              lower: [],
              upper: [descripcion],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descripcion',
              lower: [descripcion],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descripcion',
              lower: [descripcion],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descripcion',
              lower: [],
              upper: [descripcion],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionGreaterThan(
    String descripcion, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descripcion',
        lower: [descripcion],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionLessThan(
    String descripcion, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descripcion',
        lower: [],
        upper: [descripcion],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionBetween(
    String lowerDescripcion,
    String upperDescripcion, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descripcion',
        lower: [lowerDescripcion],
        includeLower: includeLower,
        upper: [upperDescripcion],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionStartsWith(String DescripcionPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descripcion',
        lower: [DescripcionPrefix],
        upper: ['$DescripcionPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descripcion',
        value: [''],
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterWhereClause>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'descripcion',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'descripcion',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'descripcion',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'descripcion',
              upper: [''],
            ));
      }
    });
  }
}

extension ProductEntityQueryFilter
    on QueryBuilder<ProductEntity, ProductEntity, QFilterCondition> {
  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      bloqueadoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloqueado',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition> ivaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      ivaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition> ivaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition> ivaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iva',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      precioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      precioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      precioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      precioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referencia',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      referenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referencia',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockDisponibleEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockDisponibleGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockDisponibleLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockDisponibleBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockDisponible',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockFisicoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockFisico',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockFisicoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockFisico',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockFisicoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockFisico',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      stockFisicoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockFisico',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductEntityQueryObject
    on QueryBuilder<ProductEntity, ProductEntity, QFilterCondition> {}

extension ProductEntityQueryLinks
    on QueryBuilder<ProductEntity, ProductEntity, QFilterCondition> {}

extension ProductEntityQuerySortBy
    on QueryBuilder<ProductEntity, ProductEntity, QSortBy> {
  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByBloqueado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloqueado', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      sortByBloqueadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloqueado', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByIva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iva', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByIvaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iva', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByPrecioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByReferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referencia', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      sortByReferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referencia', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      sortByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      sortByStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByStockFisico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFisico', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      sortByStockFisicoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFisico', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ProductEntityQuerySortThenBy
    on QueryBuilder<ProductEntity, ProductEntity, QSortThenBy> {
  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByBloqueado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloqueado', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      thenByBloqueadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloqueado', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByIva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iva', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByIvaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iva', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByPrecioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByReferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referencia', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      thenByReferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referencia', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      thenByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      thenByStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByStockFisico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFisico', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      thenByStockFisicoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFisico', Sort.desc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ProductEntityQueryWhereDistinct
    on QueryBuilder<ProductEntity, ProductEntity, QDistinct> {
  QueryBuilder<ProductEntity, ProductEntity, QDistinct> distinctByBloqueado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bloqueado');
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QDistinct> distinctByIva() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iva');
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QDistinct> distinctByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precio');
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QDistinct> distinctByReferencia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referencia', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QDistinct>
      distinctByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockDisponible');
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QDistinct>
      distinctByStockFisico() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockFisico');
    });
  }

  QueryBuilder<ProductEntity, ProductEntity, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ProductEntityQueryProperty
    on QueryBuilder<ProductEntity, ProductEntity, QQueryProperty> {
  QueryBuilder<ProductEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductEntity, bool, QQueryOperations> bloqueadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bloqueado');
    });
  }

  QueryBuilder<ProductEntity, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<ProductEntity, double, QQueryOperations> ivaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iva');
    });
  }

  QueryBuilder<ProductEntity, double, QQueryOperations> precioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precio');
    });
  }

  QueryBuilder<ProductEntity, String, QQueryOperations> referenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referencia');
    });
  }

  QueryBuilder<ProductEntity, int, QQueryOperations> stockDisponibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockDisponible');
    });
  }

  QueryBuilder<ProductEntity, int, QQueryOperations> stockFisicoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockFisico');
    });
  }

  QueryBuilder<ProductEntity, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetOrderEntityCollection on Isar {
  IsarCollection<OrderEntity> get orderEntitys => this.collection();
}

const OrderEntitySchema = CollectionSchema(
  name: r'OrderEntity',
  id: 4301709931984059335,
  properties: {
    r'codcliente': PropertySchema(
      id: 0,
      name: r'codcliente',
      type: IsarType.string,
    ),
    r'documentType': PropertySchema(
      id: 1,
      name: r'documentType',
      type: IsarType.byte,
      enumMap: _OrderEntitydocumentTypeEnumValueMap,
    ),
    r'erpId': PropertySchema(
      id: 2,
      name: r'erpId',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 3,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'firmaSvg': PropertySchema(
      id: 4,
      name: r'firmaSvg',
      type: IsarType.string,
    ),
    r'firmanteDni': PropertySchema(
      id: 5,
      name: r'firmanteDni',
      type: IsarType.string,
    ),
    r'firmanteNombre': PropertySchema(
      id: 6,
      name: r'firmanteNombre',
      type: IsarType.string,
    ),
    r'isPaid': PropertySchema(
      id: 7,
      name: r'isPaid',
      type: IsarType.bool,
    ),
    r'lineas': PropertySchema(
      id: 8,
      name: r'lineas',
      type: IsarType.objectList,
      target: r'OrderLineEmbedded',
    ),
    r'localId': PropertySchema(
      id: 9,
      name: r'localId',
      type: IsarType.string,
    ),
    r'nombreCliente': PropertySchema(
      id: 10,
      name: r'nombreCliente',
      type: IsarType.string,
    ),
    r'paidAmount': PropertySchema(
      id: 11,
      name: r'paidAmount',
      type: IsarType.double,
    ),
    r'paymentMethod': PropertySchema(
      id: 12,
      name: r'paymentMethod',
      type: IsarType.byte,
      enumMap: _OrderEntitypaymentMethodEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 13,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _OrderEntitysyncStatusEnumValueMap,
    ),
    r'syncTaskId': PropertySchema(
      id: 14,
      name: r'syncTaskId',
      type: IsarType.string,
    ),
    r'totalFinal': PropertySchema(
      id: 15,
      name: r'totalFinal',
      type: IsarType.double,
    ),
    r'totalIva': PropertySchema(
      id: 16,
      name: r'totalIva',
      type: IsarType.double,
    ),
    r'totalNeto': PropertySchema(
      id: 17,
      name: r'totalNeto',
      type: IsarType.double,
    )
  },
  estimateSize: _orderEntityEstimateSize,
  serialize: _orderEntitySerialize,
  deserialize: _orderEntityDeserialize,
  deserializeProp: _orderEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'localId': IndexSchema(
      id: 1199848425898359622,
      name: r'localId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'localId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'codcliente': IndexSchema(
      id: 330416538284371127,
      name: r'codcliente',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'codcliente',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'syncStatus': IndexSchema(
      id: 8239539375045684509,
      name: r'syncStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncStatus',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'OrderLineEmbedded': OrderLineEmbeddedSchema},
  getId: _orderEntityGetId,
  getLinks: _orderEntityGetLinks,
  attach: _orderEntityAttach,
  version: '3.4.1',
);

int _orderEntityEstimateSize(
  OrderEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.codcliente.length * 3;
  {
    final value = object.erpId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firmaSvg;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firmanteDni;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firmanteNombre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.lineas.length * 3;
  {
    final offsets = allOffsets[OrderLineEmbedded]!;
    for (var i = 0; i < object.lineas.length; i++) {
      final value = object.lineas[i];
      bytesCount +=
          OrderLineEmbeddedSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  bytesCount += 3 + object.nombreCliente.length * 3;
  {
    final value = object.syncTaskId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _orderEntitySerialize(
  OrderEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.codcliente);
  writer.writeByte(offsets[1], object.documentType.index);
  writer.writeString(offsets[2], object.erpId);
  writer.writeDateTime(offsets[3], object.fecha);
  writer.writeString(offsets[4], object.firmaSvg);
  writer.writeString(offsets[5], object.firmanteDni);
  writer.writeString(offsets[6], object.firmanteNombre);
  writer.writeBool(offsets[7], object.isPaid);
  writer.writeObjectList<OrderLineEmbedded>(
    offsets[8],
    allOffsets,
    OrderLineEmbeddedSchema.serialize,
    object.lineas,
  );
  writer.writeString(offsets[9], object.localId);
  writer.writeString(offsets[10], object.nombreCliente);
  writer.writeDouble(offsets[11], object.paidAmount);
  writer.writeByte(offsets[12], object.paymentMethod.index);
  writer.writeByte(offsets[13], object.syncStatus.index);
  writer.writeString(offsets[14], object.syncTaskId);
  writer.writeDouble(offsets[15], object.totalFinal);
  writer.writeDouble(offsets[16], object.totalIva);
  writer.writeDouble(offsets[17], object.totalNeto);
}

OrderEntity _orderEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderEntity();
  object.codcliente = reader.readString(offsets[0]);
  object.documentType =
      _OrderEntitydocumentTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          DocumentType.pedido;
  object.erpId = reader.readStringOrNull(offsets[2]);
  object.fecha = reader.readDateTime(offsets[3]);
  object.firmaSvg = reader.readStringOrNull(offsets[4]);
  object.firmanteDni = reader.readStringOrNull(offsets[5]);
  object.firmanteNombre = reader.readStringOrNull(offsets[6]);
  object.isPaid = reader.readBool(offsets[7]);
  object.isarId = id;
  object.lineas = reader.readObjectList<OrderLineEmbedded>(
        offsets[8],
        OrderLineEmbeddedSchema.deserialize,
        allOffsets,
        OrderLineEmbedded(),
      ) ??
      [];
  object.localId = reader.readString(offsets[9]);
  object.nombreCliente = reader.readString(offsets[10]);
  object.paidAmount = reader.readDouble(offsets[11]);
  object.paymentMethod = _OrderEntitypaymentMethodValueEnumMap[
          reader.readByteOrNull(offsets[12])] ??
      PaymentMethod.efectivo;
  object.syncStatus =
      _OrderEntitysyncStatusValueEnumMap[reader.readByteOrNull(offsets[13])] ??
          SyncStatus.pending;
  object.syncTaskId = reader.readStringOrNull(offsets[14]);
  object.totalFinal = reader.readDouble(offsets[15]);
  object.totalIva = reader.readDouble(offsets[16]);
  object.totalNeto = reader.readDouble(offsets[17]);
  return object;
}

P _orderEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_OrderEntitydocumentTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DocumentType.pedido) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readObjectList<OrderLineEmbedded>(
            offset,
            OrderLineEmbeddedSchema.deserialize,
            allOffsets,
            OrderLineEmbedded(),
          ) ??
          []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (_OrderEntitypaymentMethodValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PaymentMethod.efectivo) as P;
    case 13:
      return (_OrderEntitysyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.pending) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OrderEntitydocumentTypeEnumValueMap = {
  'pedido': 0,
  'albaran': 1,
};
const _OrderEntitydocumentTypeValueEnumMap = {
  0: DocumentType.pedido,
  1: DocumentType.albaran,
};
const _OrderEntitypaymentMethodEnumValueMap = {
  'efectivo': 0,
  'tarjeta': 1,
  'transferencia': 2,
  'pendiente': 3,
};
const _OrderEntitypaymentMethodValueEnumMap = {
  0: PaymentMethod.efectivo,
  1: PaymentMethod.tarjeta,
  2: PaymentMethod.transferencia,
  3: PaymentMethod.pendiente,
};
const _OrderEntitysyncStatusEnumValueMap = {
  'pending': 0,
  'inProgress': 1,
  'completed': 2,
  'failed': 3,
  'fatalError': 4,
  'conflict': 5,
  'discarded': 6,
};
const _OrderEntitysyncStatusValueEnumMap = {
  0: SyncStatus.pending,
  1: SyncStatus.inProgress,
  2: SyncStatus.completed,
  3: SyncStatus.failed,
  4: SyncStatus.fatalError,
  5: SyncStatus.conflict,
  6: SyncStatus.discarded,
};

Id _orderEntityGetId(OrderEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _orderEntityGetLinks(OrderEntity object) {
  return [];
}

void _orderEntityAttach(
    IsarCollection<dynamic> col, Id id, OrderEntity object) {
  object.isarId = id;
}

extension OrderEntityByIndex on IsarCollection<OrderEntity> {
  Future<OrderEntity?> getByLocalId(String localId) {
    return getByIndex(r'localId', [localId]);
  }

  OrderEntity? getByLocalIdSync(String localId) {
    return getByIndexSync(r'localId', [localId]);
  }

  Future<bool> deleteByLocalId(String localId) {
    return deleteByIndex(r'localId', [localId]);
  }

  bool deleteByLocalIdSync(String localId) {
    return deleteByIndexSync(r'localId', [localId]);
  }

  Future<List<OrderEntity?>> getAllByLocalId(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'localId', values);
  }

  List<OrderEntity?> getAllByLocalIdSync(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'localId', values);
  }

  Future<int> deleteAllByLocalId(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'localId', values);
  }

  int deleteAllByLocalIdSync(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'localId', values);
  }

  Future<Id> putByLocalId(OrderEntity object) {
    return putByIndex(r'localId', object);
  }

  Id putByLocalIdSync(OrderEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'localId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLocalId(List<OrderEntity> objects) {
    return putAllByIndex(r'localId', objects);
  }

  List<Id> putAllByLocalIdSync(List<OrderEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'localId', objects, saveLinks: saveLinks);
  }
}

extension OrderEntityQueryWhereSort
    on QueryBuilder<OrderEntity, OrderEntity, QWhere> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhere> anySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncStatus'),
      );
    });
  }
}

extension OrderEntityQueryWhere
    on QueryBuilder<OrderEntity, OrderEntity, QWhereClause> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> localIdEqualTo(
      String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'localId',
        value: [localId],
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> localIdNotEqualTo(
      String localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localId',
              lower: [],
              upper: [localId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localId',
              lower: [localId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localId',
              lower: [localId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localId',
              lower: [],
              upper: [localId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> codclienteEqualTo(
      String codcliente) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codcliente',
        value: [codcliente],
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause>
      codclienteNotEqualTo(String codcliente) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [],
              upper: [codcliente],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [codcliente],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [codcliente],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codcliente',
              lower: [],
              upper: [codcliente],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> syncStatusEqualTo(
      SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncStatus',
        value: [syncStatus],
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause>
      syncStatusNotEqualTo(SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [],
              upper: [syncStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [syncStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [syncStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncStatus',
              lower: [],
              upper: [syncStatus],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause>
      syncStatusGreaterThan(
    SyncStatus syncStatus, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncStatus',
        lower: [syncStatus],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> syncStatusLessThan(
    SyncStatus syncStatus, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncStatus',
        lower: [],
        upper: [syncStatus],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterWhereClause> syncStatusBetween(
    SyncStatus lowerSyncStatus,
    SyncStatus upperSyncStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncStatus',
        lower: [lowerSyncStatus],
        includeLower: includeLower,
        upper: [upperSyncStatus],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OrderEntityQueryFilter
    on QueryBuilder<OrderEntity, OrderEntity, QFilterCondition> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codcliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codcliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codcliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codcliente',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      codclienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codcliente',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      documentTypeEqualTo(DocumentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentType',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      documentTypeGreaterThan(
    DocumentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentType',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      documentTypeLessThan(
    DocumentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentType',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      documentTypeBetween(
    DocumentType lower,
    DocumentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'erpId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      erpIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'erpId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'erpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      erpIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'erpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'erpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'erpId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'erpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'erpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'erpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'erpId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> erpIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'erpId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      erpIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'erpId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> fechaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      fechaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> fechaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> fechaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fecha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firmaSvg',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firmaSvg',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> firmaSvgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmaSvg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firmaSvg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firmaSvg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> firmaSvgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firmaSvg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firmaSvg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firmaSvg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firmaSvg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> firmaSvgMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firmaSvg',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmaSvg',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmaSvgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firmaSvg',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firmanteDni',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firmanteDni',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmanteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firmanteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firmanteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firmanteDni',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firmanteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firmanteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firmanteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firmanteDni',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmanteDni',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteDniIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firmanteDni',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firmanteNombre',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firmanteNombre',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firmanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firmanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firmanteNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firmanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firmanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firmanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firmanteNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmanteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      firmanteNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firmanteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> isPaidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lineasLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineas',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lineasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineas',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lineasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineas',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lineasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineas',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lineasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineas',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      lineasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lineas',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> localIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      localIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> localIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> localIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      localIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> localIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> localIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> localIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreCliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreCliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      nombreClienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paidAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paidAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paidAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paidAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paymentMethodEqualTo(PaymentMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paymentMethodGreaterThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paymentMethodLessThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      paymentMethodBetween(
    PaymentMethod lower,
    PaymentMethod upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncStatusGreaterThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncStatusLessThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncTaskId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncTaskId',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncTaskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncTaskId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncTaskId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      syncTaskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncTaskId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalFinalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalFinalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalFinalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalFinalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> totalIvaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalIva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalIvaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalIva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalIvaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalIva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> totalIvaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalIva',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalNetoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalNeto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalNetoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalNeto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalNetoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalNeto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition>
      totalNetoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalNeto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension OrderEntityQueryObject
    on QueryBuilder<OrderEntity, OrderEntity, QFilterCondition> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterFilterCondition> lineasElement(
      FilterQuery<OrderLineEmbedded> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'lineas');
    });
  }
}

extension OrderEntityQueryLinks
    on QueryBuilder<OrderEntity, OrderEntity, QFilterCondition> {}

extension OrderEntityQuerySortBy
    on QueryBuilder<OrderEntity, OrderEntity, QSortBy> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByCodcliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByCodclienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      sortByDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByErpId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'erpId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByErpIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'erpId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFirmaSvg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmaSvg', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFirmaSvgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmaSvg', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFirmanteDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteDni', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFirmanteDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteDni', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByFirmanteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteNombre', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      sortByFirmanteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteNombre', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByNombreCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      sortByNombreClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortBySyncTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTaskId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortBySyncTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTaskId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFinal', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFinal', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalIva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIva', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalIvaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIva', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalNeto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalNeto', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> sortByTotalNetoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalNeto', Sort.desc);
    });
  }
}

extension OrderEntityQuerySortThenBy
    on QueryBuilder<OrderEntity, OrderEntity, QSortThenBy> {
  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByCodcliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByCodclienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codcliente', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      thenByDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByErpId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'erpId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByErpIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'erpId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFirmaSvg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmaSvg', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFirmaSvgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmaSvg', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFirmanteDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteDni', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFirmanteDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteDni', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByFirmanteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteNombre', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      thenByFirmanteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmanteNombre', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByNombreCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      thenByNombreClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenBySyncTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTaskId', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenBySyncTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTaskId', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFinal', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFinal', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalIva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIva', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalIvaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIva', Sort.desc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalNeto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalNeto', Sort.asc);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QAfterSortBy> thenByTotalNetoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalNeto', Sort.desc);
    });
  }
}

extension OrderEntityQueryWhereDistinct
    on QueryBuilder<OrderEntity, OrderEntity, QDistinct> {
  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByCodcliente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codcliente', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentType');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByErpId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'erpId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByFirmaSvg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firmaSvg', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByFirmanteDni(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firmanteDni', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByFirmanteNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firmanteNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPaid');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByLocalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByNombreCliente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreCliente',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAmount');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctBySyncTaskId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncTaskId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByTotalFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFinal');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByTotalIva() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalIva');
    });
  }

  QueryBuilder<OrderEntity, OrderEntity, QDistinct> distinctByTotalNeto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalNeto');
    });
  }
}

extension OrderEntityQueryProperty
    on QueryBuilder<OrderEntity, OrderEntity, QQueryProperty> {
  QueryBuilder<OrderEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<OrderEntity, String, QQueryOperations> codclienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codcliente');
    });
  }

  QueryBuilder<OrderEntity, DocumentType, QQueryOperations>
      documentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentType');
    });
  }

  QueryBuilder<OrderEntity, String?, QQueryOperations> erpIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'erpId');
    });
  }

  QueryBuilder<OrderEntity, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<OrderEntity, String?, QQueryOperations> firmaSvgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firmaSvg');
    });
  }

  QueryBuilder<OrderEntity, String?, QQueryOperations> firmanteDniProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firmanteDni');
    });
  }

  QueryBuilder<OrderEntity, String?, QQueryOperations>
      firmanteNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firmanteNombre');
    });
  }

  QueryBuilder<OrderEntity, bool, QQueryOperations> isPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPaid');
    });
  }

  QueryBuilder<OrderEntity, List<OrderLineEmbedded>, QQueryOperations>
      lineasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineas');
    });
  }

  QueryBuilder<OrderEntity, String, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<OrderEntity, String, QQueryOperations> nombreClienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreCliente');
    });
  }

  QueryBuilder<OrderEntity, double, QQueryOperations> paidAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAmount');
    });
  }

  QueryBuilder<OrderEntity, PaymentMethod, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<OrderEntity, SyncStatus, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<OrderEntity, String?, QQueryOperations> syncTaskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncTaskId');
    });
  }

  QueryBuilder<OrderEntity, double, QQueryOperations> totalFinalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFinal');
    });
  }

  QueryBuilder<OrderEntity, double, QQueryOperations> totalIvaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalIva');
    });
  }

  QueryBuilder<OrderEntity, double, QQueryOperations> totalNetoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalNeto');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetAppSettingsEntityCollection on Isar {
  IsarCollection<AppSettingsEntity> get appSettingsEntitys => this.collection();
}

const AppSettingsEntitySchema = CollectionSchema(
  name: r'AppSettingsEntity',
  id: 5506238605616873742,
  properties: {
    r'key': PropertySchema(
      id: 0,
      name: r'key',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _appSettingsEntityEstimateSize,
  serialize: _appSettingsEntitySerialize,
  deserialize: _appSettingsEntityDeserialize,
  deserializeProp: _appSettingsEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'key': IndexSchema(
      id: -4906094122524121629,
      name: r'key',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'key',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _appSettingsEntityGetId,
  getLinks: _appSettingsEntityGetLinks,
  attach: _appSettingsEntityAttach,
  version: '3.4.1',
);

int _appSettingsEntityEstimateSize(
  AppSettingsEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.value.length * 3;
  return bytesCount;
}

void _appSettingsEntitySerialize(
  AppSettingsEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.key);
  writer.writeString(offsets[1], object.value);
}

AppSettingsEntity _appSettingsEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppSettingsEntity();
  object.id = id;
  object.key = reader.readString(offsets[0]);
  object.value = reader.readString(offsets[1]);
  return object;
}

P _appSettingsEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appSettingsEntityGetId(AppSettingsEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appSettingsEntityGetLinks(
    AppSettingsEntity object) {
  return [];
}

void _appSettingsEntityAttach(
    IsarCollection<dynamic> col, Id id, AppSettingsEntity object) {
  object.id = id;
}

extension AppSettingsEntityByIndex on IsarCollection<AppSettingsEntity> {
  Future<AppSettingsEntity?> getByKey(String key) {
    return getByIndex(r'key', [key]);
  }

  AppSettingsEntity? getByKeySync(String key) {
    return getByIndexSync(r'key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex(r'key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync(r'key', [key]);
  }

  Future<List<AppSettingsEntity?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex(r'key', values);
  }

  List<AppSettingsEntity?> getAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'key', values);
  }

  Future<int> deleteAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'key', values);
  }

  int deleteAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'key', values);
  }

  Future<Id> putByKey(AppSettingsEntity object) {
    return putByIndex(r'key', object);
  }

  Id putByKeySync(AppSettingsEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'key', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKey(List<AppSettingsEntity> objects) {
    return putAllByIndex(r'key', objects);
  }

  List<Id> putAllByKeySync(List<AppSettingsEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'key', objects, saveLinks: saveLinks);
  }
}

extension AppSettingsEntityQueryWhereSort
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QWhere> {
  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppSettingsEntityQueryWhere
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QWhereClause> {
  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhereClause>
      keyEqualTo(String key) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'key',
        value: [key],
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterWhereClause>
      keyNotEqualTo(String key) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [],
              upper: [key],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [key],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [key],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [],
              upper: [key],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AppSettingsEntityQueryFilter
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QFilterCondition> {
  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension AppSettingsEntityQueryObject
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QFilterCondition> {}

extension AppSettingsEntityQueryLinks
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QFilterCondition> {}

extension AppSettingsEntityQuerySortBy
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QSortBy> {
  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy> sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy>
      sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy>
      sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension AppSettingsEntityQuerySortThenBy
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QSortThenBy> {
  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy>
      thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy>
      thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension AppSettingsEntityQueryWhereDistinct
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QDistinct> {
  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppSettingsEntity, AppSettingsEntity, QDistinct> distinctByValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value', caseSensitive: caseSensitive);
    });
  }
}

extension AppSettingsEntityQueryProperty
    on QueryBuilder<AppSettingsEntity, AppSettingsEntity, QQueryProperty> {
  QueryBuilder<AppSettingsEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppSettingsEntity, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<AppSettingsEntity, String, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

const OrderLineEmbeddedSchema = Schema(
  name: r'OrderLineEmbedded',
  id: -4537344426535307610,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'descripcion': PropertySchema(
      id: 1,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'dsc': PropertySchema(
      id: 2,
      name: r'dsc',
      type: IsarType.double,
    ),
    r'iva': PropertySchema(
      id: 3,
      name: r'iva',
      type: IsarType.double,
    ),
    r'pvptotal': PropertySchema(
      id: 4,
      name: r'pvptotal',
      type: IsarType.double,
    ),
    r'pvpunitario': PropertySchema(
      id: 5,
      name: r'pvpunitario',
      type: IsarType.double,
    ),
    r'referencia': PropertySchema(
      id: 6,
      name: r'referencia',
      type: IsarType.string,
    )
  },
  estimateSize: _orderLineEmbeddedEstimateSize,
  serialize: _orderLineEmbeddedSerialize,
  deserialize: _orderLineEmbeddedDeserialize,
  deserializeProp: _orderLineEmbeddedDeserializeProp,
);

int _orderLineEmbeddedEstimateSize(
  OrderLineEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.referencia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _orderLineEmbeddedSerialize(
  OrderLineEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeString(offsets[1], object.descripcion);
  writer.writeDouble(offsets[2], object.dsc);
  writer.writeDouble(offsets[3], object.iva);
  writer.writeDouble(offsets[4], object.pvptotal);
  writer.writeDouble(offsets[5], object.pvpunitario);
  writer.writeString(offsets[6], object.referencia);
}

OrderLineEmbedded _orderLineEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderLineEmbedded();
  object.cantidad = reader.readLong(offsets[0]);
  object.descripcion = reader.readStringOrNull(offsets[1]);
  object.dsc = reader.readDouble(offsets[2]);
  object.iva = reader.readDouble(offsets[3]);
  object.pvptotal = reader.readDouble(offsets[4]);
  object.pvpunitario = reader.readDouble(offsets[5]);
  object.referencia = reader.readStringOrNull(offsets[6]);
  return object;
}

P _orderLineEmbeddedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OrderLineEmbeddedQueryFilter
    on QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QFilterCondition> {
  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      cantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      cantidadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      cantidadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      cantidadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      dscEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dsc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      dscGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dsc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      dscLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dsc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      dscBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dsc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      ivaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      ivaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      ivaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iva',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      ivaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iva',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvptotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pvptotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvptotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pvptotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvptotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pvptotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvptotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pvptotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvpunitarioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pvpunitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvpunitarioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pvpunitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvpunitarioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pvpunitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      pvpunitarioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pvpunitario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referencia',
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referencia',
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referencia',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QAfterFilterCondition>
      referenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referencia',
        value: '',
      ));
    });
  }
}

extension OrderLineEmbeddedQueryObject
    on QueryBuilder<OrderLineEmbedded, OrderLineEmbedded, QFilterCondition> {}
