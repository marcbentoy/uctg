// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTimetableCollection on Isar {
  IsarCollection<Timetable> get timetables => this.collection();
}

const TimetableSchema = CollectionSchema(
  name: r'Timetable',
  id: 6380985727860081250,
  properties: {
    r'fittestIndividual': PropertySchema(
      id: 0,
      name: r'fittestIndividual',
      type: IsarType.object,
      target: r'Individual',
    ),
    r'generationCount': PropertySchema(
      id: 1,
      name: r'generationCount',
      type: IsarType.long,
    ),
    r'generationHistory': PropertySchema(
      id: 2,
      name: r'generationHistory',
      type: IsarType.objectList,
      target: r'GenerationHistory',
    ),
    r'instructors': PropertySchema(
      id: 3,
      name: r'instructors',
      type: IsarType.objectList,
      target: r'Instructor',
    ),
    r'isInitialized': PropertySchema(
      id: 4,
      name: r'isInitialized',
      type: IsarType.bool,
    ),
    r'mutationRate': PropertySchema(
      id: 5,
      name: r'mutationRate',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'population': PropertySchema(
      id: 7,
      name: r'population',
      type: IsarType.objectList,
      target: r'Individual',
    ),
    r'populationSize': PropertySchema(
      id: 8,
      name: r'populationSize',
      type: IsarType.long,
    ),
    r'rooms': PropertySchema(
      id: 9,
      name: r'rooms',
      type: IsarType.objectList,
      target: r'Room',
    ),
    r'sections': PropertySchema(
      id: 10,
      name: r'sections',
      type: IsarType.objectList,
      target: r'Section',
    ),
    r'subjects': PropertySchema(
      id: 11,
      name: r'subjects',
      type: IsarType.objectList,
      target: r'Subject',
    ),
    r'tags': PropertySchema(
      id: 12,
      name: r'tags',
      type: IsarType.stringList,
    )
  },
  estimateSize: _timetableEstimateSize,
  serialize: _timetableSerialize,
  deserialize: _timetableDeserialize,
  deserializeProp: _timetableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Section': SectionSchema,
    r'Subject': SubjectSchema,
    r'Timeslot': TimeslotSchema,
    r'Instructor': InstructorSchema,
    r'Room': RoomSchema,
    r'Individual': IndividualSchema,
    r'Schedule': ScheduleSchema,
    r'GenerationHistory': GenerationHistorySchema
  },
  getId: _timetableGetId,
  getLinks: _timetableGetLinks,
  attach: _timetableAttach,
  version: '3.1.0+1',
);

int _timetableEstimateSize(
  Timetable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      IndividualSchema.estimateSize(
          object.fittestIndividual, allOffsets[Individual]!, allOffsets);
  bytesCount += 3 + object.generationHistory.length * 3;
  {
    final offsets = allOffsets[GenerationHistory]!;
    for (var i = 0; i < object.generationHistory.length; i++) {
      final value = object.generationHistory[i];
      bytesCount +=
          GenerationHistorySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.instructors.length * 3;
  {
    final offsets = allOffsets[Instructor]!;
    for (var i = 0; i < object.instructors.length; i++) {
      final value = object.instructors[i];
      bytesCount += InstructorSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.population.length * 3;
  {
    final offsets = allOffsets[Individual]!;
    for (var i = 0; i < object.population.length; i++) {
      final value = object.population[i];
      bytesCount += IndividualSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.rooms.length * 3;
  {
    final offsets = allOffsets[Room]!;
    for (var i = 0; i < object.rooms.length; i++) {
      final value = object.rooms[i];
      bytesCount += RoomSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.sections.length * 3;
  {
    final offsets = allOffsets[Section]!;
    for (var i = 0; i < object.sections.length; i++) {
      final value = object.sections[i];
      bytesCount += SectionSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.subjects.length * 3;
  {
    final offsets = allOffsets[Subject]!;
    for (var i = 0; i < object.subjects.length; i++) {
      final value = object.subjects[i];
      bytesCount += SubjectSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _timetableSerialize(
  Timetable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Individual>(
    offsets[0],
    allOffsets,
    IndividualSchema.serialize,
    object.fittestIndividual,
  );
  writer.writeLong(offsets[1], object.generationCount);
  writer.writeObjectList<GenerationHistory>(
    offsets[2],
    allOffsets,
    GenerationHistorySchema.serialize,
    object.generationHistory,
  );
  writer.writeObjectList<Instructor>(
    offsets[3],
    allOffsets,
    InstructorSchema.serialize,
    object.instructors,
  );
  writer.writeBool(offsets[4], object.isInitialized);
  writer.writeDouble(offsets[5], object.mutationRate);
  writer.writeString(offsets[6], object.name);
  writer.writeObjectList<Individual>(
    offsets[7],
    allOffsets,
    IndividualSchema.serialize,
    object.population,
  );
  writer.writeLong(offsets[8], object.populationSize);
  writer.writeObjectList<Room>(
    offsets[9],
    allOffsets,
    RoomSchema.serialize,
    object.rooms,
  );
  writer.writeObjectList<Section>(
    offsets[10],
    allOffsets,
    SectionSchema.serialize,
    object.sections,
  );
  writer.writeObjectList<Subject>(
    offsets[11],
    allOffsets,
    SubjectSchema.serialize,
    object.subjects,
  );
  writer.writeStringList(offsets[12], object.tags);
}

Timetable _timetableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Timetable();
  object.fittestIndividual = reader.readObjectOrNull<Individual>(
        offsets[0],
        IndividualSchema.deserialize,
        allOffsets,
      ) ??
      Individual();
  object.generationCount = reader.readLong(offsets[1]);
  object.generationHistory = reader.readObjectList<GenerationHistory>(
        offsets[2],
        GenerationHistorySchema.deserialize,
        allOffsets,
        GenerationHistory(),
      ) ??
      [];
  object.id = id;
  object.instructors = reader.readObjectList<Instructor>(
        offsets[3],
        InstructorSchema.deserialize,
        allOffsets,
        Instructor(),
      ) ??
      [];
  object.isInitialized = reader.readBool(offsets[4]);
  object.mutationRate = reader.readDouble(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.population = reader.readObjectList<Individual>(
        offsets[7],
        IndividualSchema.deserialize,
        allOffsets,
        Individual(),
      ) ??
      [];
  object.populationSize = reader.readLong(offsets[8]);
  object.rooms = reader.readObjectList<Room>(
        offsets[9],
        RoomSchema.deserialize,
        allOffsets,
        Room(),
      ) ??
      [];
  object.sections = reader.readObjectList<Section>(
        offsets[10],
        SectionSchema.deserialize,
        allOffsets,
        Section(),
      ) ??
      [];
  object.subjects = reader.readObjectList<Subject>(
        offsets[11],
        SubjectSchema.deserialize,
        allOffsets,
        Subject(),
      ) ??
      [];
  object.tags = reader.readStringList(offsets[12]) ?? [];
  return object;
}

P _timetableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Individual>(
            offset,
            IndividualSchema.deserialize,
            allOffsets,
          ) ??
          Individual()) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectList<GenerationHistory>(
            offset,
            GenerationHistorySchema.deserialize,
            allOffsets,
            GenerationHistory(),
          ) ??
          []) as P;
    case 3:
      return (reader.readObjectList<Instructor>(
            offset,
            InstructorSchema.deserialize,
            allOffsets,
            Instructor(),
          ) ??
          []) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectList<Individual>(
            offset,
            IndividualSchema.deserialize,
            allOffsets,
            Individual(),
          ) ??
          []) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readObjectList<Room>(
            offset,
            RoomSchema.deserialize,
            allOffsets,
            Room(),
          ) ??
          []) as P;
    case 10:
      return (reader.readObjectList<Section>(
            offset,
            SectionSchema.deserialize,
            allOffsets,
            Section(),
          ) ??
          []) as P;
    case 11:
      return (reader.readObjectList<Subject>(
            offset,
            SubjectSchema.deserialize,
            allOffsets,
            Subject(),
          ) ??
          []) as P;
    case 12:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _timetableGetId(Timetable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _timetableGetLinks(Timetable object) {
  return [];
}

void _timetableAttach(IsarCollection<dynamic> col, Id id, Timetable object) {
  object.id = id;
}

extension TimetableQueryWhereSort
    on QueryBuilder<Timetable, Timetable, QWhere> {
  QueryBuilder<Timetable, Timetable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TimetableQueryWhere
    on QueryBuilder<Timetable, Timetable, QWhereClause> {
  QueryBuilder<Timetable, Timetable, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Timetable, Timetable, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterWhereClause> idBetween(
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
}

extension TimetableQueryFilter
    on QueryBuilder<Timetable, Timetable, QFilterCondition> {
  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generationCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generationCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generationCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generationCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'generationHistory',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'generationHistory',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'generationHistory',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationHistoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'generationHistory',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationHistoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'generationHistory',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'generationHistory',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      instructorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      instructorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      instructorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      instructorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      instructorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      instructorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      isInitializedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInitialized',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> mutationRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mutationRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      mutationRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mutationRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      mutationRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mutationRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> mutationRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mutationRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'population',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'population',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'population',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'population',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'population',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'population',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'populationSize',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'populationSize',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'populationSize',
        value: value,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      populationSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'populationSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> roomsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rooms',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> roomsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rooms',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> roomsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rooms',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> roomsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rooms',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      roomsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rooms',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> roomsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rooms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      sectionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> sectionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      sectionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      sectionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      sectionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      sectionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      subjectsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> subjectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      subjectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      subjectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      subjectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      subjectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TimetableQueryObject
    on QueryBuilder<Timetable, Timetable, QFilterCondition> {
  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> fittestIndividual(
      FilterQuery<Individual> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fittestIndividual');
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition>
      generationHistoryElement(FilterQuery<GenerationHistory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationHistory');
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> instructorsElement(
      FilterQuery<Instructor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'instructors');
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> populationElement(
      FilterQuery<Individual> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'population');
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> roomsElement(
      FilterQuery<Room> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'rooms');
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> sectionsElement(
      FilterQuery<Section> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sections');
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterFilterCondition> subjectsElement(
      FilterQuery<Subject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'subjects');
    });
  }
}

extension TimetableQueryLinks
    on QueryBuilder<Timetable, Timetable, QFilterCondition> {}

extension TimetableQuerySortBy on QueryBuilder<Timetable, Timetable, QSortBy> {
  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByGenerationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationCount', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByGenerationCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationCount', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByIsInitialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInitialized', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByIsInitializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInitialized', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByMutationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationRate', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByMutationRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationRate', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByPopulationSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populationSize', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> sortByPopulationSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populationSize', Sort.desc);
    });
  }
}

extension TimetableQuerySortThenBy
    on QueryBuilder<Timetable, Timetable, QSortThenBy> {
  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByGenerationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationCount', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByGenerationCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationCount', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByIsInitialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInitialized', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByIsInitializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInitialized', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByMutationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationRate', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByMutationRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationRate', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByPopulationSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populationSize', Sort.asc);
    });
  }

  QueryBuilder<Timetable, Timetable, QAfterSortBy> thenByPopulationSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populationSize', Sort.desc);
    });
  }
}

extension TimetableQueryWhereDistinct
    on QueryBuilder<Timetable, Timetable, QDistinct> {
  QueryBuilder<Timetable, Timetable, QDistinct> distinctByGenerationCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generationCount');
    });
  }

  QueryBuilder<Timetable, Timetable, QDistinct> distinctByIsInitialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInitialized');
    });
  }

  QueryBuilder<Timetable, Timetable, QDistinct> distinctByMutationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mutationRate');
    });
  }

  QueryBuilder<Timetable, Timetable, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Timetable, Timetable, QDistinct> distinctByPopulationSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'populationSize');
    });
  }

  QueryBuilder<Timetable, Timetable, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }
}

extension TimetableQueryProperty
    on QueryBuilder<Timetable, Timetable, QQueryProperty> {
  QueryBuilder<Timetable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Timetable, Individual, QQueryOperations>
      fittestIndividualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fittestIndividual');
    });
  }

  QueryBuilder<Timetable, int, QQueryOperations> generationCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generationCount');
    });
  }

  QueryBuilder<Timetable, List<GenerationHistory>, QQueryOperations>
      generationHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generationHistory');
    });
  }

  QueryBuilder<Timetable, List<Instructor>, QQueryOperations>
      instructorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructors');
    });
  }

  QueryBuilder<Timetable, bool, QQueryOperations> isInitializedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInitialized');
    });
  }

  QueryBuilder<Timetable, double, QQueryOperations> mutationRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mutationRate');
    });
  }

  QueryBuilder<Timetable, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Timetable, List<Individual>, QQueryOperations>
      populationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'population');
    });
  }

  QueryBuilder<Timetable, int, QQueryOperations> populationSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'populationSize');
    });
  }

  QueryBuilder<Timetable, List<Room>, QQueryOperations> roomsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rooms');
    });
  }

  QueryBuilder<Timetable, List<Section>, QQueryOperations> sectionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sections');
    });
  }

  QueryBuilder<Timetable, List<Subject>, QQueryOperations> subjectsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subjects');
    });
  }

  QueryBuilder<Timetable, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RoomSchema = Schema(
  name: r'Room',
  id: -1093513927825131211,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.string,
      enumMap: _RoomtypeEnumValueMap,
    )
  },
  estimateSize: _roomEstimateSize,
  serialize: _roomSerialize,
  deserialize: _roomDeserialize,
  deserializeProp: _roomDeserializeProp,
);

int _roomEstimateSize(
  Room object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _roomSerialize(
  Room object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.type.name);
}

Room _roomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Room();
  object.name = reader.readString(offsets[0]);
  object.type = _RoomtypeValueEnumMap[reader.readStringOrNull(offsets[1])] ??
      SubjectType.lecture;
  return object;
}

P _roomDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_RoomtypeValueEnumMap[reader.readStringOrNull(offset)] ??
          SubjectType.lecture) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoomtypeEnumValueMap = {
  r'lecture': r'lecture',
  r'lab': r'lab',
};
const _RoomtypeValueEnumMap = {
  r'lecture': SubjectType.lecture,
  r'lab': SubjectType.lab,
};

extension RoomQueryFilter on QueryBuilder<Room, Room, QFilterCondition> {
  QueryBuilder<Room, Room, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeEqualTo(
    SubjectType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeGreaterThan(
    SubjectType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeLessThan(
    SubjectType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeBetween(
    SubjectType lower,
    SubjectType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Room, Room, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension RoomQueryObject on QueryBuilder<Room, Room, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const InstructorSchema = Schema(
  name: r'Instructor',
  id: -7617761873767822429,
  properties: {
    r'college': PropertySchema(
      id: 0,
      name: r'college',
      type: IsarType.string,
    ),
    r'department': PropertySchema(
      id: 1,
      name: r'department',
      type: IsarType.string,
    ),
    r'expertise': PropertySchema(
      id: 2,
      name: r'expertise',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'timePreferences': PropertySchema(
      id: 4,
      name: r'timePreferences',
      type: IsarType.objectList,
      target: r'Timeslot',
    )
  },
  estimateSize: _instructorEstimateSize,
  serialize: _instructorSerialize,
  deserialize: _instructorDeserialize,
  deserializeProp: _instructorDeserializeProp,
);

int _instructorEstimateSize(
  Instructor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.college.length * 3;
  bytesCount += 3 + object.department.length * 3;
  bytesCount += 3 + object.expertise.length * 3;
  {
    for (var i = 0; i < object.expertise.length; i++) {
      final value = object.expertise[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.timePreferences.length * 3;
  {
    final offsets = allOffsets[Timeslot]!;
    for (var i = 0; i < object.timePreferences.length; i++) {
      final value = object.timePreferences[i];
      bytesCount += TimeslotSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _instructorSerialize(
  Instructor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.college);
  writer.writeString(offsets[1], object.department);
  writer.writeStringList(offsets[2], object.expertise);
  writer.writeString(offsets[3], object.name);
  writer.writeObjectList<Timeslot>(
    offsets[4],
    allOffsets,
    TimeslotSchema.serialize,
    object.timePreferences,
  );
}

Instructor _instructorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Instructor();
  object.college = reader.readString(offsets[0]);
  object.department = reader.readString(offsets[1]);
  object.expertise = reader.readStringList(offsets[2]) ?? [];
  object.name = reader.readString(offsets[3]);
  object.timePreferences = reader.readObjectList<Timeslot>(
        offsets[4],
        TimeslotSchema.deserialize,
        allOffsets,
        Timeslot(),
      ) ??
      [];
  return object;
}

P _instructorDeserializeProp<P>(
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
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readObjectList<Timeslot>(
            offset,
            TimeslotSchema.deserialize,
            allOffsets,
            Timeslot(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension InstructorQueryFilter
    on QueryBuilder<Instructor, Instructor, QFilterCondition> {
  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'college',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      collegeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'college',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'college',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'college',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'college',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'college',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'college',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'college',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> collegeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'college',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      collegeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'college',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> departmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      departmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      departmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> departmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'department',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      departmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      departmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> departmentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expertise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expertise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expertise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expertise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expertise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expertise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expertise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expertise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expertise',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expertise',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expertise',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expertise',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expertise',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expertise',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expertise',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      expertiseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expertise',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      timePreferencesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timePreferences',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      timePreferencesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timePreferences',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      timePreferencesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timePreferences',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      timePreferencesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timePreferences',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      timePreferencesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timePreferences',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      timePreferencesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timePreferences',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension InstructorQueryObject
    on QueryBuilder<Instructor, Instructor, QFilterCondition> {
  QueryBuilder<Instructor, Instructor, QAfterFilterCondition>
      timePreferencesElement(FilterQuery<Timeslot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'timePreferences');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SectionSchema = Schema(
  name: r'Section',
  id: 7698308494449530003,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'shift': PropertySchema(
      id: 1,
      name: r'shift',
      type: IsarType.string,
    ),
    r'subjects': PropertySchema(
      id: 2,
      name: r'subjects',
      type: IsarType.objectList,
      target: r'Subject',
    ),
    r'timeslots': PropertySchema(
      id: 3,
      name: r'timeslots',
      type: IsarType.objectList,
      target: r'Timeslot',
    )
  },
  estimateSize: _sectionEstimateSize,
  serialize: _sectionSerialize,
  deserialize: _sectionDeserialize,
  deserializeProp: _sectionDeserializeProp,
);

int _sectionEstimateSize(
  Section object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.shift.length * 3;
  bytesCount += 3 + object.subjects.length * 3;
  {
    final offsets = allOffsets[Subject]!;
    for (var i = 0; i < object.subjects.length; i++) {
      final value = object.subjects[i];
      bytesCount += SubjectSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.timeslots.length * 3;
  {
    final offsets = allOffsets[Timeslot]!;
    for (var i = 0; i < object.timeslots.length; i++) {
      final value = object.timeslots[i];
      bytesCount += TimeslotSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _sectionSerialize(
  Section object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.shift);
  writer.writeObjectList<Subject>(
    offsets[2],
    allOffsets,
    SubjectSchema.serialize,
    object.subjects,
  );
  writer.writeObjectList<Timeslot>(
    offsets[3],
    allOffsets,
    TimeslotSchema.serialize,
    object.timeslots,
  );
}

Section _sectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Section();
  object.name = reader.readString(offsets[0]);
  object.shift = reader.readString(offsets[1]);
  object.subjects = reader.readObjectList<Subject>(
        offsets[2],
        SubjectSchema.deserialize,
        allOffsets,
        Subject(),
      ) ??
      [];
  object.timeslots = reader.readObjectList<Timeslot>(
        offsets[3],
        TimeslotSchema.deserialize,
        allOffsets,
        Timeslot(),
      ) ??
      [];
  return object;
}

P _sectionDeserializeProp<P>(
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
    case 2:
      return (reader.readObjectList<Subject>(
            offset,
            SubjectSchema.deserialize,
            allOffsets,
            Subject(),
          ) ??
          []) as P;
    case 3:
      return (reader.readObjectList<Timeslot>(
            offset,
            TimeslotSchema.deserialize,
            allOffsets,
            Timeslot(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SectionQueryFilter
    on QueryBuilder<Section, Section, QFilterCondition> {
  QueryBuilder<Section, Section, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shift',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shift',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shift',
        value: '',
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> shiftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shift',
        value: '',
      ));
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> subjectsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> subjectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> subjectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> subjectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition>
      subjectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> subjectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> timeslotsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeslots',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> timeslotsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeslots',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> timeslotsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeslots',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> timeslotsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeslots',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition>
      timeslotsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeslots',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> timeslotsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeslots',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SectionQueryObject
    on QueryBuilder<Section, Section, QFilterCondition> {
  QueryBuilder<Section, Section, QAfterFilterCondition> subjectsElement(
      FilterQuery<Subject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'subjects');
    });
  }

  QueryBuilder<Section, Section, QAfterFilterCondition> timeslotsElement(
      FilterQuery<Timeslot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'timeslots');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SubjectSchema = Schema(
  name: r'Subject',
  id: 7648000959054204885,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 1,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.string,
      enumMap: _SubjecttypeEnumValueMap,
    ),
    r'units': PropertySchema(
      id: 3,
      name: r'units',
      type: IsarType.long,
    )
  },
  estimateSize: _subjectEstimateSize,
  serialize: _subjectSerialize,
  deserialize: _subjectDeserialize,
  deserializeProp: _subjectDeserializeProp,
);

int _subjectEstimateSize(
  Subject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _subjectSerialize(
  Subject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeStringList(offsets[1], object.tags);
  writer.writeString(offsets[2], object.type.name);
  writer.writeLong(offsets[3], object.units);
}

Subject _subjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Subject();
  object.name = reader.readString(offsets[0]);
  object.tags = reader.readStringList(offsets[1]) ?? [];
  object.type = _SubjecttypeValueEnumMap[reader.readStringOrNull(offsets[2])] ??
      SubjectType.lecture;
  object.units = reader.readLong(offsets[3]);
  return object;
}

P _subjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (_SubjecttypeValueEnumMap[reader.readStringOrNull(offset)] ??
          SubjectType.lecture) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SubjecttypeEnumValueMap = {
  r'lecture': r'lecture',
  r'lab': r'lab',
};
const _SubjecttypeValueEnumMap = {
  r'lecture': SubjectType.lecture,
  r'lab': SubjectType.lab,
};

extension SubjectQueryFilter
    on QueryBuilder<Subject, Subject, QFilterCondition> {
  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeEqualTo(
    SubjectType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeGreaterThan(
    SubjectType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeLessThan(
    SubjectType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeBetween(
    SubjectType lower,
    SubjectType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> unitsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'units',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> unitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'units',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> unitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'units',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> unitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'units',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SubjectQueryObject
    on QueryBuilder<Subject, Subject, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TimeslotSchema = Schema(
  name: r'Timeslot',
  id: -6987915875331615644,
  properties: {
    r'endTime': PropertySchema(
      id: 0,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'startTime': PropertySchema(
      id: 1,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'timeCode': PropertySchema(
      id: 2,
      name: r'timeCode',
      type: IsarType.string,
    )
  },
  estimateSize: _timeslotEstimateSize,
  serialize: _timeslotSerialize,
  deserialize: _timeslotDeserialize,
  deserializeProp: _timeslotDeserializeProp,
);

int _timeslotEstimateSize(
  Timeslot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.timeCode.length * 3;
  return bytesCount;
}

void _timeslotSerialize(
  Timeslot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endTime);
  writer.writeDateTime(offsets[1], object.startTime);
  writer.writeString(offsets[2], object.timeCode);
}

Timeslot _timeslotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Timeslot();
  object.endTime = reader.readDateTime(offsets[0]);
  object.startTime = reader.readDateTime(offsets[1]);
  object.timeCode = reader.readString(offsets[2]);
  return object;
}

P _timeslotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TimeslotQueryFilter
    on QueryBuilder<Timeslot, Timeslot, QFilterCondition> {
  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> endTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> startTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Timeslot, Timeslot, QAfterFilterCondition> timeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeCode',
        value: '',
      ));
    });
  }
}

extension TimeslotQueryObject
    on QueryBuilder<Timeslot, Timeslot, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IndividualSchema = Schema(
  name: r'Individual',
  id: -3820777818301949646,
  properties: {
    r'schedules': PropertySchema(
      id: 0,
      name: r'schedules',
      type: IsarType.objectList,
      target: r'Schedule',
    ),
    r'score': PropertySchema(
      id: 1,
      name: r'score',
      type: IsarType.long,
    ),
    r'tags': PropertySchema(
      id: 2,
      name: r'tags',
      type: IsarType.stringList,
    )
  },
  estimateSize: _individualEstimateSize,
  serialize: _individualSerialize,
  deserialize: _individualDeserialize,
  deserializeProp: _individualDeserializeProp,
);

int _individualEstimateSize(
  Individual object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.schedules.length * 3;
  {
    final offsets = allOffsets[Schedule]!;
    for (var i = 0; i < object.schedules.length; i++) {
      final value = object.schedules[i];
      bytesCount += ScheduleSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _individualSerialize(
  Individual object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Schedule>(
    offsets[0],
    allOffsets,
    ScheduleSchema.serialize,
    object.schedules,
  );
  writer.writeLong(offsets[1], object.score);
  writer.writeStringList(offsets[2], object.tags);
}

Individual _individualDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Individual();
  object.schedules = reader.readObjectList<Schedule>(
        offsets[0],
        ScheduleSchema.deserialize,
        allOffsets,
        Schedule(),
      ) ??
      [];
  object.score = reader.readLong(offsets[1]);
  object.tags = reader.readStringList(offsets[2]) ?? [];
  return object;
}

P _individualDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Schedule>(
            offset,
            ScheduleSchema.deserialize,
            allOffsets,
            Schedule(),
          ) ??
          []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IndividualQueryFilter
    on QueryBuilder<Individual, Individual, QFilterCondition> {
  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      schedulesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schedules',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      schedulesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schedules',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      schedulesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schedules',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      schedulesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schedules',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      schedulesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schedules',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      schedulesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'schedules',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> scoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Individual, Individual, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IndividualQueryObject
    on QueryBuilder<Individual, Individual, QFilterCondition> {
  QueryBuilder<Individual, Individual, QAfterFilterCondition> schedulesElement(
      FilterQuery<Schedule> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'schedules');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ScheduleSchema = Schema(
  name: r'Schedule',
  id: 6369058706800408146,
  properties: {
    r'instructor': PropertySchema(
      id: 0,
      name: r'instructor',
      type: IsarType.object,
      target: r'Instructor',
    ),
    r'room': PropertySchema(
      id: 1,
      name: r'room',
      type: IsarType.object,
      target: r'Room',
    ),
    r'section': PropertySchema(
      id: 2,
      name: r'section',
      type: IsarType.object,
      target: r'Section',
    ),
    r'subject': PropertySchema(
      id: 3,
      name: r'subject',
      type: IsarType.object,
      target: r'Subject',
    ),
    r'timeslot': PropertySchema(
      id: 4,
      name: r'timeslot',
      type: IsarType.object,
      target: r'Timeslot',
    )
  },
  estimateSize: _scheduleEstimateSize,
  serialize: _scheduleSerialize,
  deserialize: _scheduleDeserialize,
  deserializeProp: _scheduleDeserializeProp,
);

int _scheduleEstimateSize(
  Schedule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      InstructorSchema.estimateSize(
          object.instructor, allOffsets[Instructor]!, allOffsets);
  bytesCount +=
      3 + RoomSchema.estimateSize(object.room, allOffsets[Room]!, allOffsets);
  bytesCount += 3 +
      SectionSchema.estimateSize(
          object.section, allOffsets[Section]!, allOffsets);
  bytesCount += 3 +
      SubjectSchema.estimateSize(
          object.subject, allOffsets[Subject]!, allOffsets);
  bytesCount += 3 +
      TimeslotSchema.estimateSize(
          object.timeslot, allOffsets[Timeslot]!, allOffsets);
  return bytesCount;
}

void _scheduleSerialize(
  Schedule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Instructor>(
    offsets[0],
    allOffsets,
    InstructorSchema.serialize,
    object.instructor,
  );
  writer.writeObject<Room>(
    offsets[1],
    allOffsets,
    RoomSchema.serialize,
    object.room,
  );
  writer.writeObject<Section>(
    offsets[2],
    allOffsets,
    SectionSchema.serialize,
    object.section,
  );
  writer.writeObject<Subject>(
    offsets[3],
    allOffsets,
    SubjectSchema.serialize,
    object.subject,
  );
  writer.writeObject<Timeslot>(
    offsets[4],
    allOffsets,
    TimeslotSchema.serialize,
    object.timeslot,
  );
}

Schedule _scheduleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Schedule();
  object.instructor = reader.readObjectOrNull<Instructor>(
        offsets[0],
        InstructorSchema.deserialize,
        allOffsets,
      ) ??
      Instructor();
  object.room = reader.readObjectOrNull<Room>(
        offsets[1],
        RoomSchema.deserialize,
        allOffsets,
      ) ??
      Room();
  object.section = reader.readObjectOrNull<Section>(
        offsets[2],
        SectionSchema.deserialize,
        allOffsets,
      ) ??
      Section();
  object.subject = reader.readObjectOrNull<Subject>(
        offsets[3],
        SubjectSchema.deserialize,
        allOffsets,
      ) ??
      Subject();
  object.timeslot = reader.readObjectOrNull<Timeslot>(
        offsets[4],
        TimeslotSchema.deserialize,
        allOffsets,
      ) ??
      Timeslot();
  return object;
}

P _scheduleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Instructor>(
            offset,
            InstructorSchema.deserialize,
            allOffsets,
          ) ??
          Instructor()) as P;
    case 1:
      return (reader.readObjectOrNull<Room>(
            offset,
            RoomSchema.deserialize,
            allOffsets,
          ) ??
          Room()) as P;
    case 2:
      return (reader.readObjectOrNull<Section>(
            offset,
            SectionSchema.deserialize,
            allOffsets,
          ) ??
          Section()) as P;
    case 3:
      return (reader.readObjectOrNull<Subject>(
            offset,
            SubjectSchema.deserialize,
            allOffsets,
          ) ??
          Subject()) as P;
    case 4:
      return (reader.readObjectOrNull<Timeslot>(
            offset,
            TimeslotSchema.deserialize,
            allOffsets,
          ) ??
          Timeslot()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ScheduleQueryFilter
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {}

extension ScheduleQueryObject
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {
  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> instructor(
      FilterQuery<Instructor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'instructor');
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> room(
      FilterQuery<Room> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'room');
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> section(
      FilterQuery<Section> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'section');
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> subject(
      FilterQuery<Subject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'subject');
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> timeslot(
      FilterQuery<Timeslot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'timeslot');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GenerationHistorySchema = Schema(
  name: r'GenerationHistory',
  id: 2819045967218917890,
  properties: {
    r'generation': PropertySchema(
      id: 0,
      name: r'generation',
      type: IsarType.long,
    ),
    r'individualScores': PropertySchema(
      id: 1,
      name: r'individualScores',
      type: IsarType.longList,
    )
  },
  estimateSize: _generationHistoryEstimateSize,
  serialize: _generationHistorySerialize,
  deserialize: _generationHistoryDeserialize,
  deserializeProp: _generationHistoryDeserializeProp,
);

int _generationHistoryEstimateSize(
  GenerationHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.individualScores.length * 8;
  return bytesCount;
}

void _generationHistorySerialize(
  GenerationHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.generation);
  writer.writeLongList(offsets[1], object.individualScores);
}

GenerationHistory _generationHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GenerationHistory();
  object.generation = reader.readLong(offsets[0]);
  object.individualScores = reader.readLongList(offsets[1]) ?? [];
  return object;
}

P _generationHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GenerationHistoryQueryFilter
    on QueryBuilder<GenerationHistory, GenerationHistory, QFilterCondition> {
  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      generationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generation',
        value: value,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      generationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generation',
        value: value,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      generationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generation',
        value: value,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      generationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'individualScores',
        value: value,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'individualScores',
        value: value,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'individualScores',
        value: value,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'individualScores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'individualScores',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'individualScores',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'individualScores',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'individualScores',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'individualScores',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GenerationHistory, GenerationHistory, QAfterFilterCondition>
      individualScoresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'individualScores',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension GenerationHistoryQueryObject
    on QueryBuilder<GenerationHistory, GenerationHistory, QFilterCondition> {}
