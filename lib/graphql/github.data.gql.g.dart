// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFollowersData> _$gFollowersDataSerializer =
    new _$GFollowersDataSerializer();
Serializer<GFollowersData_user> _$gFollowersDataUserSerializer =
    new _$GFollowersData_userSerializer();
Serializer<GFollowersData_user_followers>
    _$gFollowersDataUserFollowersSerializer =
    new _$GFollowersData_user_followersSerializer();
Serializer<GFollowersData_user_followers_pageInfo>
    _$gFollowersDataUserFollowersPageInfoSerializer =
    new _$GFollowersData_user_followers_pageInfoSerializer();
Serializer<GFollowersData_user_followers_nodes>
    _$gFollowersDataUserFollowersNodesSerializer =
    new _$GFollowersData_user_followers_nodesSerializer();
Serializer<GFollowingData> _$gFollowingDataSerializer =
    new _$GFollowingDataSerializer();
Serializer<GFollowingData_user> _$gFollowingDataUserSerializer =
    new _$GFollowingData_userSerializer();
Serializer<GFollowingData_user_following>
    _$gFollowingDataUserFollowingSerializer =
    new _$GFollowingData_user_followingSerializer();
Serializer<GFollowingData_user_following_pageInfo>
    _$gFollowingDataUserFollowingPageInfoSerializer =
    new _$GFollowingData_user_following_pageInfoSerializer();
Serializer<GFollowingData_user_following_nodes>
    _$gFollowingDataUserFollowingNodesSerializer =
    new _$GFollowingData_user_following_nodesSerializer();
Serializer<GPageInfoPartsData> _$gPageInfoPartsDataSerializer =
    new _$GPageInfoPartsDataSerializer();
Serializer<GUserItemData> _$gUserItemDataSerializer =
    new _$GUserItemDataSerializer();

class _$GFollowersDataSerializer
    implements StructuredSerializer<GFollowersData> {
  @override
  final Iterable<Type> types = const [GFollowersData, _$GFollowersData];
  @override
  final String wireName = 'GFollowersData';

  @override
  Iterable<Object> serialize(Serializers serializers, GFollowersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(GFollowersData_user)));
    }
    return result;
  }

  @override
  GFollowersData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowersDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFollowersData_user))
              as GFollowersData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowersData_userSerializer
    implements StructuredSerializer<GFollowersData_user> {
  @override
  final Iterable<Type> types = const [
    GFollowersData_user,
    _$GFollowersData_user
  ];
  @override
  final String wireName = 'GFollowersData_user';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowersData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'followers',
      serializers.serialize(object.followers,
          specifiedType: const FullType(GFollowersData_user_followers)),
    ];

    return result;
  }

  @override
  GFollowersData_user deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowersData_userBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFollowersData_user_followers))
              as GFollowersData_user_followers);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowersData_user_followersSerializer
    implements StructuredSerializer<GFollowersData_user_followers> {
  @override
  final Iterable<Type> types = const [
    GFollowersData_user_followers,
    _$GFollowersData_user_followers
  ];
  @override
  final String wireName = 'GFollowersData_user_followers';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowersData_user_followers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pageInfo',
      serializers.serialize(object.pageInfo,
          specifiedType:
              const FullType(GFollowersData_user_followers_pageInfo)),
    ];
    if (object.nodes != null) {
      result
        ..add('nodes')
        ..add(serializers.serialize(object.nodes,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFollowersData_user_followers_nodes)])));
    }
    return result;
  }

  @override
  GFollowersData_user_followers deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowersData_user_followersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pageInfo':
          result.pageInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFollowersData_user_followers_pageInfo))
              as GFollowersData_user_followers_pageInfo);
          break;
        case 'nodes':
          result.nodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFollowersData_user_followers_nodes)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowersData_user_followers_pageInfoSerializer
    implements StructuredSerializer<GFollowersData_user_followers_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GFollowersData_user_followers_pageInfo,
    _$GFollowersData_user_followers_pageInfo
  ];
  @override
  final String wireName = 'GFollowersData_user_followers_pageInfo';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowersData_user_followers_pageInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hasNextPage',
      serializers.serialize(object.hasNextPage,
          specifiedType: const FullType(bool)),
    ];
    if (object.endCursor != null) {
      result
        ..add('endCursor')
        ..add(serializers.serialize(object.endCursor,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFollowersData_user_followers_pageInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowersData_user_followers_pageInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hasNextPage':
          result.hasNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'endCursor':
          result.endCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowersData_user_followers_nodesSerializer
    implements StructuredSerializer<GFollowersData_user_followers_nodes> {
  @override
  final Iterable<Type> types = const [
    GFollowersData_user_followers_nodes,
    _$GFollowersData_user_followers_nodes
  ];
  @override
  final String wireName = 'GFollowersData_user_followers_nodes';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowersData_user_followers_nodes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatarUrl',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(_i2.GURI)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDateTime)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.company != null) {
      result
        ..add('company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFollowersData_user_followers_nodes deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowersData_user_followers_nodesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarUrl':
          result.avatarUrl.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GURI)) as _i2.GURI);
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime)) as _i2.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowingDataSerializer
    implements StructuredSerializer<GFollowingData> {
  @override
  final Iterable<Type> types = const [GFollowingData, _$GFollowingData];
  @override
  final String wireName = 'GFollowingData';

  @override
  Iterable<Object> serialize(Serializers serializers, GFollowingData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(GFollowingData_user)));
    }
    return result;
  }

  @override
  GFollowingData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowingDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFollowingData_user))
              as GFollowingData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowingData_userSerializer
    implements StructuredSerializer<GFollowingData_user> {
  @override
  final Iterable<Type> types = const [
    GFollowingData_user,
    _$GFollowingData_user
  ];
  @override
  final String wireName = 'GFollowingData_user';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowingData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'following',
      serializers.serialize(object.following,
          specifiedType: const FullType(GFollowingData_user_following)),
    ];

    return result;
  }

  @override
  GFollowingData_user deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowingData_userBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFollowingData_user_following))
              as GFollowingData_user_following);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowingData_user_followingSerializer
    implements StructuredSerializer<GFollowingData_user_following> {
  @override
  final Iterable<Type> types = const [
    GFollowingData_user_following,
    _$GFollowingData_user_following
  ];
  @override
  final String wireName = 'GFollowingData_user_following';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowingData_user_following object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pageInfo',
      serializers.serialize(object.pageInfo,
          specifiedType:
              const FullType(GFollowingData_user_following_pageInfo)),
    ];
    if (object.nodes != null) {
      result
        ..add('nodes')
        ..add(serializers.serialize(object.nodes,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFollowingData_user_following_nodes)])));
    }
    return result;
  }

  @override
  GFollowingData_user_following deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowingData_user_followingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pageInfo':
          result.pageInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFollowingData_user_following_pageInfo))
              as GFollowingData_user_following_pageInfo);
          break;
        case 'nodes':
          result.nodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFollowingData_user_following_nodes)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowingData_user_following_pageInfoSerializer
    implements StructuredSerializer<GFollowingData_user_following_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GFollowingData_user_following_pageInfo,
    _$GFollowingData_user_following_pageInfo
  ];
  @override
  final String wireName = 'GFollowingData_user_following_pageInfo';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowingData_user_following_pageInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hasNextPage',
      serializers.serialize(object.hasNextPage,
          specifiedType: const FullType(bool)),
    ];
    if (object.endCursor != null) {
      result
        ..add('endCursor')
        ..add(serializers.serialize(object.endCursor,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFollowingData_user_following_pageInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowingData_user_following_pageInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hasNextPage':
          result.hasNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'endCursor':
          result.endCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowingData_user_following_nodesSerializer
    implements StructuredSerializer<GFollowingData_user_following_nodes> {
  @override
  final Iterable<Type> types = const [
    GFollowingData_user_following_nodes,
    _$GFollowingData_user_following_nodes
  ];
  @override
  final String wireName = 'GFollowingData_user_following_nodes';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GFollowingData_user_following_nodes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatarUrl',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(_i2.GURI)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDateTime)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.company != null) {
      result
        ..add('company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFollowingData_user_following_nodes deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowingData_user_following_nodesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarUrl':
          result.avatarUrl.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GURI)) as _i2.GURI);
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime)) as _i2.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GPageInfoPartsDataSerializer
    implements StructuredSerializer<GPageInfoPartsData> {
  @override
  final Iterable<Type> types = const [GPageInfoPartsData, _$GPageInfoPartsData];
  @override
  final String wireName = 'GPageInfoPartsData';

  @override
  Iterable<Object> serialize(Serializers serializers, GPageInfoPartsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hasNextPage',
      serializers.serialize(object.hasNextPage,
          specifiedType: const FullType(bool)),
    ];
    if (object.endCursor != null) {
      result
        ..add('endCursor')
        ..add(serializers.serialize(object.endCursor,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPageInfoPartsData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPageInfoPartsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hasNextPage':
          result.hasNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'endCursor':
          result.endCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserItemDataSerializer implements StructuredSerializer<GUserItemData> {
  @override
  final Iterable<Type> types = const [GUserItemData, _$GUserItemData];
  @override
  final String wireName = 'GUserItemData';

  @override
  Iterable<Object> serialize(Serializers serializers, GUserItemData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatarUrl',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(_i2.GURI)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDateTime)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.company != null) {
      result
        ..add('company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUserItemData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserItemDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarUrl':
          result.avatarUrl.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GURI)) as _i2.GURI);
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime)) as _i2.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowersData extends GFollowersData {
  @override
  final String G__typename;
  @override
  final GFollowersData_user user;

  factory _$GFollowersData([void Function(GFollowersDataBuilder) updates]) =>
      (new GFollowersDataBuilder()..update(updates)).build();

  _$GFollowersData._({this.G__typename, this.user}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GFollowersData', 'G__typename');
    }
  }

  @override
  GFollowersData rebuild(void Function(GFollowersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowersDataBuilder toBuilder() =>
      new GFollowersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowersData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowersData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GFollowersDataBuilder
    implements Builder<GFollowersData, GFollowersDataBuilder> {
  _$GFollowersData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GFollowersData_userBuilder _user;
  GFollowersData_userBuilder get user =>
      _$this._user ??= new GFollowersData_userBuilder();
  set user(GFollowersData_userBuilder user) => _$this._user = user;

  GFollowersDataBuilder() {
    GFollowersData._initializeBuilder(this);
  }

  GFollowersDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowersData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowersData;
  }

  @override
  void update(void Function(GFollowersDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowersData build() {
    _$GFollowersData _$result;
    try {
      _$result = _$v ??
          new _$GFollowersData._(
              G__typename: G__typename, user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowersData_user extends GFollowersData_user {
  @override
  final String G__typename;
  @override
  final GFollowersData_user_followers followers;

  factory _$GFollowersData_user(
          [void Function(GFollowersData_userBuilder) updates]) =>
      (new GFollowersData_userBuilder()..update(updates)).build();

  _$GFollowersData_user._({this.G__typename, this.followers}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GFollowersData_user', 'G__typename');
    }
    if (followers == null) {
      throw new BuiltValueNullFieldError('GFollowersData_user', 'followers');
    }
  }

  @override
  GFollowersData_user rebuild(
          void Function(GFollowersData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowersData_userBuilder toBuilder() =>
      new GFollowersData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowersData_user &&
        G__typename == other.G__typename &&
        followers == other.followers;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), followers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowersData_user')
          ..add('G__typename', G__typename)
          ..add('followers', followers))
        .toString();
  }
}

class GFollowersData_userBuilder
    implements Builder<GFollowersData_user, GFollowersData_userBuilder> {
  _$GFollowersData_user _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GFollowersData_user_followersBuilder _followers;
  GFollowersData_user_followersBuilder get followers =>
      _$this._followers ??= new GFollowersData_user_followersBuilder();
  set followers(GFollowersData_user_followersBuilder followers) =>
      _$this._followers = followers;

  GFollowersData_userBuilder() {
    GFollowersData_user._initializeBuilder(this);
  }

  GFollowersData_userBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _followers = _$v.followers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowersData_user other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowersData_user;
  }

  @override
  void update(void Function(GFollowersData_userBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowersData_user build() {
    _$GFollowersData_user _$result;
    try {
      _$result = _$v ??
          new _$GFollowersData_user._(
              G__typename: G__typename, followers: followers.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'followers';
        followers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowersData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowersData_user_followers extends GFollowersData_user_followers {
  @override
  final String G__typename;
  @override
  final GFollowersData_user_followers_pageInfo pageInfo;
  @override
  final BuiltList<GFollowersData_user_followers_nodes> nodes;

  factory _$GFollowersData_user_followers(
          [void Function(GFollowersData_user_followersBuilder) updates]) =>
      (new GFollowersData_user_followersBuilder()..update(updates)).build();

  _$GFollowersData_user_followers._(
      {this.G__typename, this.pageInfo, this.nodes})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers', 'G__typename');
    }
    if (pageInfo == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers', 'pageInfo');
    }
  }

  @override
  GFollowersData_user_followers rebuild(
          void Function(GFollowersData_user_followersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowersData_user_followersBuilder toBuilder() =>
      new GFollowersData_user_followersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowersData_user_followers &&
        G__typename == other.G__typename &&
        pageInfo == other.pageInfo &&
        nodes == other.nodes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), pageInfo.hashCode), nodes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowersData_user_followers')
          ..add('G__typename', G__typename)
          ..add('pageInfo', pageInfo)
          ..add('nodes', nodes))
        .toString();
  }
}

class GFollowersData_user_followersBuilder
    implements
        Builder<GFollowersData_user_followers,
            GFollowersData_user_followersBuilder> {
  _$GFollowersData_user_followers _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GFollowersData_user_followers_pageInfoBuilder _pageInfo;
  GFollowersData_user_followers_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??= new GFollowersData_user_followers_pageInfoBuilder();
  set pageInfo(GFollowersData_user_followers_pageInfoBuilder pageInfo) =>
      _$this._pageInfo = pageInfo;

  ListBuilder<GFollowersData_user_followers_nodes> _nodes;
  ListBuilder<GFollowersData_user_followers_nodes> get nodes =>
      _$this._nodes ??= new ListBuilder<GFollowersData_user_followers_nodes>();
  set nodes(ListBuilder<GFollowersData_user_followers_nodes> nodes) =>
      _$this._nodes = nodes;

  GFollowersData_user_followersBuilder() {
    GFollowersData_user_followers._initializeBuilder(this);
  }

  GFollowersData_user_followersBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _pageInfo = _$v.pageInfo?.toBuilder();
      _nodes = _$v.nodes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowersData_user_followers other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowersData_user_followers;
  }

  @override
  void update(void Function(GFollowersData_user_followersBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowersData_user_followers build() {
    _$GFollowersData_user_followers _$result;
    try {
      _$result = _$v ??
          new _$GFollowersData_user_followers._(
              G__typename: G__typename,
              pageInfo: pageInfo.build(),
              nodes: _nodes?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pageInfo';
        pageInfo.build();
        _$failedField = 'nodes';
        _nodes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowersData_user_followers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowersData_user_followers_pageInfo
    extends GFollowersData_user_followers_pageInfo {
  @override
  final String G__typename;
  @override
  final bool hasNextPage;
  @override
  final String endCursor;

  factory _$GFollowersData_user_followers_pageInfo(
          [void Function(GFollowersData_user_followers_pageInfoBuilder)
              updates]) =>
      (new GFollowersData_user_followers_pageInfoBuilder()..update(updates))
          .build();

  _$GFollowersData_user_followers_pageInfo._(
      {this.G__typename, this.hasNextPage, this.endCursor})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers_pageInfo', 'G__typename');
    }
    if (hasNextPage == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers_pageInfo', 'hasNextPage');
    }
  }

  @override
  GFollowersData_user_followers_pageInfo rebuild(
          void Function(GFollowersData_user_followers_pageInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowersData_user_followers_pageInfoBuilder toBuilder() =>
      new GFollowersData_user_followers_pageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowersData_user_followers_pageInfo &&
        G__typename == other.G__typename &&
        hasNextPage == other.hasNextPage &&
        endCursor == other.endCursor;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), hasNextPage.hashCode),
        endCursor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GFollowersData_user_followers_pageInfo')
          ..add('G__typename', G__typename)
          ..add('hasNextPage', hasNextPage)
          ..add('endCursor', endCursor))
        .toString();
  }
}

class GFollowersData_user_followers_pageInfoBuilder
    implements
        Builder<GFollowersData_user_followers_pageInfo,
            GFollowersData_user_followers_pageInfoBuilder> {
  _$GFollowersData_user_followers_pageInfo _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  bool _hasNextPage;
  bool get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool hasNextPage) => _$this._hasNextPage = hasNextPage;

  String _endCursor;
  String get endCursor => _$this._endCursor;
  set endCursor(String endCursor) => _$this._endCursor = endCursor;

  GFollowersData_user_followers_pageInfoBuilder() {
    GFollowersData_user_followers_pageInfo._initializeBuilder(this);
  }

  GFollowersData_user_followers_pageInfoBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _hasNextPage = _$v.hasNextPage;
      _endCursor = _$v.endCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowersData_user_followers_pageInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowersData_user_followers_pageInfo;
  }

  @override
  void update(
      void Function(GFollowersData_user_followers_pageInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowersData_user_followers_pageInfo build() {
    final _$result = _$v ??
        new _$GFollowersData_user_followers_pageInfo._(
            G__typename: G__typename,
            hasNextPage: hasNextPage,
            endCursor: endCursor);
    replace(_$result);
    return _$result;
  }
}

class _$GFollowersData_user_followers_nodes
    extends GFollowersData_user_followers_nodes {
  @override
  final String G__typename;
  @override
  final String login;
  @override
  final String name;
  @override
  final _i2.GURI avatarUrl;
  @override
  final String company;
  @override
  final String location;
  @override
  final _i2.GDateTime createdAt;

  factory _$GFollowersData_user_followers_nodes(
          [void Function(GFollowersData_user_followers_nodesBuilder)
              updates]) =>
      (new GFollowersData_user_followers_nodesBuilder()..update(updates))
          .build();

  _$GFollowersData_user_followers_nodes._(
      {this.G__typename,
      this.login,
      this.name,
      this.avatarUrl,
      this.company,
      this.location,
      this.createdAt})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers_nodes', 'G__typename');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers_nodes', 'login');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers_nodes', 'avatarUrl');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError(
          'GFollowersData_user_followers_nodes', 'createdAt');
    }
  }

  @override
  GFollowersData_user_followers_nodes rebuild(
          void Function(GFollowersData_user_followers_nodesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowersData_user_followers_nodesBuilder toBuilder() =>
      new GFollowersData_user_followers_nodesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowersData_user_followers_nodes &&
        G__typename == other.G__typename &&
        login == other.login &&
        name == other.name &&
        avatarUrl == other.avatarUrl &&
        company == other.company &&
        location == other.location &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), login.hashCode),
                        name.hashCode),
                    avatarUrl.hashCode),
                company.hashCode),
            location.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowersData_user_followers_nodes')
          ..add('G__typename', G__typename)
          ..add('login', login)
          ..add('name', name)
          ..add('avatarUrl', avatarUrl)
          ..add('company', company)
          ..add('location', location)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFollowersData_user_followers_nodesBuilder
    implements
        Builder<GFollowersData_user_followers_nodes,
            GFollowersData_user_followers_nodesBuilder> {
  _$GFollowersData_user_followers_nodes _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  _i2.GURIBuilder _avatarUrl;
  _i2.GURIBuilder get avatarUrl => _$this._avatarUrl ??= new _i2.GURIBuilder();
  set avatarUrl(_i2.GURIBuilder avatarUrl) => _$this._avatarUrl = avatarUrl;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  _i2.GDateTimeBuilder _createdAt;
  _i2.GDateTimeBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateTimeBuilder();
  set createdAt(_i2.GDateTimeBuilder createdAt) =>
      _$this._createdAt = createdAt;

  GFollowersData_user_followers_nodesBuilder() {
    GFollowersData_user_followers_nodes._initializeBuilder(this);
  }

  GFollowersData_user_followers_nodesBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _login = _$v.login;
      _name = _$v.name;
      _avatarUrl = _$v.avatarUrl?.toBuilder();
      _company = _$v.company;
      _location = _$v.location;
      _createdAt = _$v.createdAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowersData_user_followers_nodes other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowersData_user_followers_nodes;
  }

  @override
  void update(
      void Function(GFollowersData_user_followers_nodesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowersData_user_followers_nodes build() {
    _$GFollowersData_user_followers_nodes _$result;
    try {
      _$result = _$v ??
          new _$GFollowersData_user_followers_nodes._(
              G__typename: G__typename,
              login: login,
              name: name,
              avatarUrl: avatarUrl.build(),
              company: company,
              location: location,
              createdAt: createdAt.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'avatarUrl';
        avatarUrl.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowersData_user_followers_nodes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowingData extends GFollowingData {
  @override
  final String G__typename;
  @override
  final GFollowingData_user user;

  factory _$GFollowingData([void Function(GFollowingDataBuilder) updates]) =>
      (new GFollowingDataBuilder()..update(updates)).build();

  _$GFollowingData._({this.G__typename, this.user}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GFollowingData', 'G__typename');
    }
  }

  @override
  GFollowingData rebuild(void Function(GFollowingDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowingDataBuilder toBuilder() =>
      new GFollowingDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowingData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowingData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GFollowingDataBuilder
    implements Builder<GFollowingData, GFollowingDataBuilder> {
  _$GFollowingData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GFollowingData_userBuilder _user;
  GFollowingData_userBuilder get user =>
      _$this._user ??= new GFollowingData_userBuilder();
  set user(GFollowingData_userBuilder user) => _$this._user = user;

  GFollowingDataBuilder() {
    GFollowingData._initializeBuilder(this);
  }

  GFollowingDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowingData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowingData;
  }

  @override
  void update(void Function(GFollowingDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowingData build() {
    _$GFollowingData _$result;
    try {
      _$result = _$v ??
          new _$GFollowingData._(
              G__typename: G__typename, user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowingData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowingData_user extends GFollowingData_user {
  @override
  final String G__typename;
  @override
  final GFollowingData_user_following following;

  factory _$GFollowingData_user(
          [void Function(GFollowingData_userBuilder) updates]) =>
      (new GFollowingData_userBuilder()..update(updates)).build();

  _$GFollowingData_user._({this.G__typename, this.following}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GFollowingData_user', 'G__typename');
    }
    if (following == null) {
      throw new BuiltValueNullFieldError('GFollowingData_user', 'following');
    }
  }

  @override
  GFollowingData_user rebuild(
          void Function(GFollowingData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowingData_userBuilder toBuilder() =>
      new GFollowingData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowingData_user &&
        G__typename == other.G__typename &&
        following == other.following;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), following.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowingData_user')
          ..add('G__typename', G__typename)
          ..add('following', following))
        .toString();
  }
}

class GFollowingData_userBuilder
    implements Builder<GFollowingData_user, GFollowingData_userBuilder> {
  _$GFollowingData_user _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GFollowingData_user_followingBuilder _following;
  GFollowingData_user_followingBuilder get following =>
      _$this._following ??= new GFollowingData_user_followingBuilder();
  set following(GFollowingData_user_followingBuilder following) =>
      _$this._following = following;

  GFollowingData_userBuilder() {
    GFollowingData_user._initializeBuilder(this);
  }

  GFollowingData_userBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _following = _$v.following?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowingData_user other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowingData_user;
  }

  @override
  void update(void Function(GFollowingData_userBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowingData_user build() {
    _$GFollowingData_user _$result;
    try {
      _$result = _$v ??
          new _$GFollowingData_user._(
              G__typename: G__typename, following: following.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'following';
        following.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowingData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowingData_user_following extends GFollowingData_user_following {
  @override
  final String G__typename;
  @override
  final GFollowingData_user_following_pageInfo pageInfo;
  @override
  final BuiltList<GFollowingData_user_following_nodes> nodes;

  factory _$GFollowingData_user_following(
          [void Function(GFollowingData_user_followingBuilder) updates]) =>
      (new GFollowingData_user_followingBuilder()..update(updates)).build();

  _$GFollowingData_user_following._(
      {this.G__typename, this.pageInfo, this.nodes})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following', 'G__typename');
    }
    if (pageInfo == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following', 'pageInfo');
    }
  }

  @override
  GFollowingData_user_following rebuild(
          void Function(GFollowingData_user_followingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowingData_user_followingBuilder toBuilder() =>
      new GFollowingData_user_followingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowingData_user_following &&
        G__typename == other.G__typename &&
        pageInfo == other.pageInfo &&
        nodes == other.nodes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), pageInfo.hashCode), nodes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowingData_user_following')
          ..add('G__typename', G__typename)
          ..add('pageInfo', pageInfo)
          ..add('nodes', nodes))
        .toString();
  }
}

class GFollowingData_user_followingBuilder
    implements
        Builder<GFollowingData_user_following,
            GFollowingData_user_followingBuilder> {
  _$GFollowingData_user_following _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GFollowingData_user_following_pageInfoBuilder _pageInfo;
  GFollowingData_user_following_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??= new GFollowingData_user_following_pageInfoBuilder();
  set pageInfo(GFollowingData_user_following_pageInfoBuilder pageInfo) =>
      _$this._pageInfo = pageInfo;

  ListBuilder<GFollowingData_user_following_nodes> _nodes;
  ListBuilder<GFollowingData_user_following_nodes> get nodes =>
      _$this._nodes ??= new ListBuilder<GFollowingData_user_following_nodes>();
  set nodes(ListBuilder<GFollowingData_user_following_nodes> nodes) =>
      _$this._nodes = nodes;

  GFollowingData_user_followingBuilder() {
    GFollowingData_user_following._initializeBuilder(this);
  }

  GFollowingData_user_followingBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _pageInfo = _$v.pageInfo?.toBuilder();
      _nodes = _$v.nodes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowingData_user_following other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowingData_user_following;
  }

  @override
  void update(void Function(GFollowingData_user_followingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowingData_user_following build() {
    _$GFollowingData_user_following _$result;
    try {
      _$result = _$v ??
          new _$GFollowingData_user_following._(
              G__typename: G__typename,
              pageInfo: pageInfo.build(),
              nodes: _nodes?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pageInfo';
        pageInfo.build();
        _$failedField = 'nodes';
        _nodes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowingData_user_following', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowingData_user_following_pageInfo
    extends GFollowingData_user_following_pageInfo {
  @override
  final String G__typename;
  @override
  final bool hasNextPage;
  @override
  final String endCursor;

  factory _$GFollowingData_user_following_pageInfo(
          [void Function(GFollowingData_user_following_pageInfoBuilder)
              updates]) =>
      (new GFollowingData_user_following_pageInfoBuilder()..update(updates))
          .build();

  _$GFollowingData_user_following_pageInfo._(
      {this.G__typename, this.hasNextPage, this.endCursor})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following_pageInfo', 'G__typename');
    }
    if (hasNextPage == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following_pageInfo', 'hasNextPage');
    }
  }

  @override
  GFollowingData_user_following_pageInfo rebuild(
          void Function(GFollowingData_user_following_pageInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowingData_user_following_pageInfoBuilder toBuilder() =>
      new GFollowingData_user_following_pageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowingData_user_following_pageInfo &&
        G__typename == other.G__typename &&
        hasNextPage == other.hasNextPage &&
        endCursor == other.endCursor;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), hasNextPage.hashCode),
        endCursor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GFollowingData_user_following_pageInfo')
          ..add('G__typename', G__typename)
          ..add('hasNextPage', hasNextPage)
          ..add('endCursor', endCursor))
        .toString();
  }
}

class GFollowingData_user_following_pageInfoBuilder
    implements
        Builder<GFollowingData_user_following_pageInfo,
            GFollowingData_user_following_pageInfoBuilder> {
  _$GFollowingData_user_following_pageInfo _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  bool _hasNextPage;
  bool get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool hasNextPage) => _$this._hasNextPage = hasNextPage;

  String _endCursor;
  String get endCursor => _$this._endCursor;
  set endCursor(String endCursor) => _$this._endCursor = endCursor;

  GFollowingData_user_following_pageInfoBuilder() {
    GFollowingData_user_following_pageInfo._initializeBuilder(this);
  }

  GFollowingData_user_following_pageInfoBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _hasNextPage = _$v.hasNextPage;
      _endCursor = _$v.endCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowingData_user_following_pageInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowingData_user_following_pageInfo;
  }

  @override
  void update(
      void Function(GFollowingData_user_following_pageInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowingData_user_following_pageInfo build() {
    final _$result = _$v ??
        new _$GFollowingData_user_following_pageInfo._(
            G__typename: G__typename,
            hasNextPage: hasNextPage,
            endCursor: endCursor);
    replace(_$result);
    return _$result;
  }
}

class _$GFollowingData_user_following_nodes
    extends GFollowingData_user_following_nodes {
  @override
  final String G__typename;
  @override
  final String login;
  @override
  final String name;
  @override
  final _i2.GURI avatarUrl;
  @override
  final String company;
  @override
  final String location;
  @override
  final _i2.GDateTime createdAt;

  factory _$GFollowingData_user_following_nodes(
          [void Function(GFollowingData_user_following_nodesBuilder)
              updates]) =>
      (new GFollowingData_user_following_nodesBuilder()..update(updates))
          .build();

  _$GFollowingData_user_following_nodes._(
      {this.G__typename,
      this.login,
      this.name,
      this.avatarUrl,
      this.company,
      this.location,
      this.createdAt})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following_nodes', 'G__typename');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following_nodes', 'login');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following_nodes', 'avatarUrl');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError(
          'GFollowingData_user_following_nodes', 'createdAt');
    }
  }

  @override
  GFollowingData_user_following_nodes rebuild(
          void Function(GFollowingData_user_following_nodesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowingData_user_following_nodesBuilder toBuilder() =>
      new GFollowingData_user_following_nodesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowingData_user_following_nodes &&
        G__typename == other.G__typename &&
        login == other.login &&
        name == other.name &&
        avatarUrl == other.avatarUrl &&
        company == other.company &&
        location == other.location &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), login.hashCode),
                        name.hashCode),
                    avatarUrl.hashCode),
                company.hashCode),
            location.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowingData_user_following_nodes')
          ..add('G__typename', G__typename)
          ..add('login', login)
          ..add('name', name)
          ..add('avatarUrl', avatarUrl)
          ..add('company', company)
          ..add('location', location)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GFollowingData_user_following_nodesBuilder
    implements
        Builder<GFollowingData_user_following_nodes,
            GFollowingData_user_following_nodesBuilder> {
  _$GFollowingData_user_following_nodes _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  _i2.GURIBuilder _avatarUrl;
  _i2.GURIBuilder get avatarUrl => _$this._avatarUrl ??= new _i2.GURIBuilder();
  set avatarUrl(_i2.GURIBuilder avatarUrl) => _$this._avatarUrl = avatarUrl;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  _i2.GDateTimeBuilder _createdAt;
  _i2.GDateTimeBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateTimeBuilder();
  set createdAt(_i2.GDateTimeBuilder createdAt) =>
      _$this._createdAt = createdAt;

  GFollowingData_user_following_nodesBuilder() {
    GFollowingData_user_following_nodes._initializeBuilder(this);
  }

  GFollowingData_user_following_nodesBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _login = _$v.login;
      _name = _$v.name;
      _avatarUrl = _$v.avatarUrl?.toBuilder();
      _company = _$v.company;
      _location = _$v.location;
      _createdAt = _$v.createdAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowingData_user_following_nodes other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowingData_user_following_nodes;
  }

  @override
  void update(
      void Function(GFollowingData_user_following_nodesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowingData_user_following_nodes build() {
    _$GFollowingData_user_following_nodes _$result;
    try {
      _$result = _$v ??
          new _$GFollowingData_user_following_nodes._(
              G__typename: G__typename,
              login: login,
              name: name,
              avatarUrl: avatarUrl.build(),
              company: company,
              location: location,
              createdAt: createdAt.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'avatarUrl';
        avatarUrl.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFollowingData_user_following_nodes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPageInfoPartsData extends GPageInfoPartsData {
  @override
  final String G__typename;
  @override
  final bool hasNextPage;
  @override
  final String endCursor;

  factory _$GPageInfoPartsData(
          [void Function(GPageInfoPartsDataBuilder) updates]) =>
      (new GPageInfoPartsDataBuilder()..update(updates)).build();

  _$GPageInfoPartsData._({this.G__typename, this.hasNextPage, this.endCursor})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GPageInfoPartsData', 'G__typename');
    }
    if (hasNextPage == null) {
      throw new BuiltValueNullFieldError('GPageInfoPartsData', 'hasNextPage');
    }
  }

  @override
  GPageInfoPartsData rebuild(
          void Function(GPageInfoPartsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPageInfoPartsDataBuilder toBuilder() =>
      new GPageInfoPartsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPageInfoPartsData &&
        G__typename == other.G__typename &&
        hasNextPage == other.hasNextPage &&
        endCursor == other.endCursor;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), hasNextPage.hashCode),
        endCursor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPageInfoPartsData')
          ..add('G__typename', G__typename)
          ..add('hasNextPage', hasNextPage)
          ..add('endCursor', endCursor))
        .toString();
  }
}

class GPageInfoPartsDataBuilder
    implements Builder<GPageInfoPartsData, GPageInfoPartsDataBuilder> {
  _$GPageInfoPartsData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  bool _hasNextPage;
  bool get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool hasNextPage) => _$this._hasNextPage = hasNextPage;

  String _endCursor;
  String get endCursor => _$this._endCursor;
  set endCursor(String endCursor) => _$this._endCursor = endCursor;

  GPageInfoPartsDataBuilder() {
    GPageInfoPartsData._initializeBuilder(this);
  }

  GPageInfoPartsDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _hasNextPage = _$v.hasNextPage;
      _endCursor = _$v.endCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPageInfoPartsData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPageInfoPartsData;
  }

  @override
  void update(void Function(GPageInfoPartsDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPageInfoPartsData build() {
    final _$result = _$v ??
        new _$GPageInfoPartsData._(
            G__typename: G__typename,
            hasNextPage: hasNextPage,
            endCursor: endCursor);
    replace(_$result);
    return _$result;
  }
}

class _$GUserItemData extends GUserItemData {
  @override
  final String G__typename;
  @override
  final String login;
  @override
  final String name;
  @override
  final _i2.GURI avatarUrl;
  @override
  final String company;
  @override
  final String location;
  @override
  final _i2.GDateTime createdAt;

  factory _$GUserItemData([void Function(GUserItemDataBuilder) updates]) =>
      (new GUserItemDataBuilder()..update(updates)).build();

  _$GUserItemData._(
      {this.G__typename,
      this.login,
      this.name,
      this.avatarUrl,
      this.company,
      this.location,
      this.createdAt})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GUserItemData', 'G__typename');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('GUserItemData', 'login');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('GUserItemData', 'avatarUrl');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('GUserItemData', 'createdAt');
    }
  }

  @override
  GUserItemData rebuild(void Function(GUserItemDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserItemDataBuilder toBuilder() => new GUserItemDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserItemData &&
        G__typename == other.G__typename &&
        login == other.login &&
        name == other.name &&
        avatarUrl == other.avatarUrl &&
        company == other.company &&
        location == other.location &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), login.hashCode),
                        name.hashCode),
                    avatarUrl.hashCode),
                company.hashCode),
            location.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserItemData')
          ..add('G__typename', G__typename)
          ..add('login', login)
          ..add('name', name)
          ..add('avatarUrl', avatarUrl)
          ..add('company', company)
          ..add('location', location)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GUserItemDataBuilder
    implements Builder<GUserItemData, GUserItemDataBuilder> {
  _$GUserItemData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  _i2.GURIBuilder _avatarUrl;
  _i2.GURIBuilder get avatarUrl => _$this._avatarUrl ??= new _i2.GURIBuilder();
  set avatarUrl(_i2.GURIBuilder avatarUrl) => _$this._avatarUrl = avatarUrl;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  _i2.GDateTimeBuilder _createdAt;
  _i2.GDateTimeBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateTimeBuilder();
  set createdAt(_i2.GDateTimeBuilder createdAt) =>
      _$this._createdAt = createdAt;

  GUserItemDataBuilder() {
    GUserItemData._initializeBuilder(this);
  }

  GUserItemDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _login = _$v.login;
      _name = _$v.name;
      _avatarUrl = _$v.avatarUrl?.toBuilder();
      _company = _$v.company;
      _location = _$v.location;
      _createdAt = _$v.createdAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserItemData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUserItemData;
  }

  @override
  void update(void Function(GUserItemDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserItemData build() {
    _$GUserItemData _$result;
    try {
      _$result = _$v ??
          new _$GUserItemData._(
              G__typename: G__typename,
              login: login,
              name: name,
              avatarUrl: avatarUrl.build(),
              company: company,
              location: location,
              createdAt: createdAt.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'avatarUrl';
        avatarUrl.build();

        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUserItemData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
