// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeerUser _$SeerUserFromJson(Map<String, dynamic> json) => _SeerUser(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String?,
  username: json['username'] as String?,
  displayName: json['displayName'] as String?,
  permissions: (json['permissions'] as num?)?.toInt() ?? 0,
  avatar: json['avatar'] as String?,
  requestCount: (json['requestCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SeerUserToJson(_SeerUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'username': instance.username,
  'displayName': instance.displayName,
  'permissions': instance.permissions,
  'avatar': instance.avatar,
  'requestCount': instance.requestCount,
};

_SeerRequestUser _$SeerRequestUserFromJson(Map<String, dynamic> json) =>
    _SeerRequestUser(
      id: (json['id'] as num).toInt(),
      displayName: json['displayName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$SeerRequestUserToJson(_SeerRequestUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'avatar': instance.avatar,
    };

_SeerSeasonRequest _$SeerSeasonRequestFromJson(Map<String, dynamic> json) =>
    _SeerSeasonRequest(
      id: (json['id'] as num?)?.toInt(),
      seasonNumber: (json['seasonNumber'] as num).toInt(),
      status: (json['status'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$SeerSeasonRequestToJson(_SeerSeasonRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seasonNumber': instance.seasonNumber,
      'status': instance.status,
    };

_SeerMediaInfoSeason _$SeerMediaInfoSeasonFromJson(Map<String, dynamic> json) =>
    _SeerMediaInfoSeason(
      id: (json['id'] as num?)?.toInt(),
      seasonNumber: (json['seasonNumber'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SeerMediaInfoSeasonToJson(
  _SeerMediaInfoSeason instance,
) => <String, dynamic>{
  'id': instance.id,
  'seasonNumber': instance.seasonNumber,
  'status': instance.status,
};

_SeerMediaInfo _$SeerMediaInfoFromJson(Map<String, dynamic> json) =>
    _SeerMediaInfo(
      id: (json['id'] as num).toInt(),
      mediaType: json['mediaType'] as String?,
      tmdbId: (json['tmdbId'] as num?)?.toInt(),
      tvdbId: (json['tvdbId'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      status4k: (json['status4k'] as num?)?.toInt(),
      mediaAddedAt: json['mediaAddedAt'] as String?,
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeerMediaInfoSeason.fromJson(e as Map<String, dynamic>))
          .toList(),
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => SeerRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      name: json['name'] as String?,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
      releaseDate: json['releaseDate'] as String?,
      firstAirDate: json['firstAirDate'] as String?,
      jellyfinMediaId: json['jellyfinMediaId'] as String?,
      jellyfinMediaId4k: json['jellyfinMediaId4k'] as String?,
    );

Map<String, dynamic> _$SeerMediaInfoToJson(_SeerMediaInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaType': instance.mediaType,
      'tmdbId': instance.tmdbId,
      'tvdbId': instance.tvdbId,
      'status': instance.status,
      'status4k': instance.status4k,
      'mediaAddedAt': instance.mediaAddedAt,
      'seasons': instance.seasons?.map((e) => e.toJson()).toList(),
      'requests': instance.requests?.map((e) => e.toJson()).toList(),
      'title': instance.title,
      'name': instance.name,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'releaseDate': instance.releaseDate,
      'firstAirDate': instance.firstAirDate,
      'jellyfinMediaId': instance.jellyfinMediaId,
      'jellyfinMediaId4k': instance.jellyfinMediaId4k,
    };

_SeerRequest _$SeerRequestFromJson(Map<String, dynamic> json) => _SeerRequest(
  id: (json['id'] as num).toInt(),
  status: (json['status'] as num?)?.toInt() ?? 1,
  media: _parseMediaInfo(json['media']),
  requestedBy: json['requestedBy'] == null
      ? null
      : SeerRequestUser.fromJson(json['requestedBy'] as Map<String, dynamic>),
  modifiedBy: json['modifiedBy'] == null
      ? null
      : SeerRequestUser.fromJson(json['modifiedBy'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  seasons: (json['seasons'] as List<dynamic>?)
      ?.map((e) => SeerSeasonRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  is4k: json['is4k'] as bool? ?? false,
  serverId: (json['serverId'] as num?)?.toInt(),
  profileId: (json['profileId'] as num?)?.toInt(),
  rootFolder: json['rootFolder'] as String?,
);

Map<String, dynamic> _$SeerRequestToJson(_SeerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'media': instance.media?.toJson(),
      'requestedBy': instance.requestedBy?.toJson(),
      'modifiedBy': instance.modifiedBy?.toJson(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'seasons': instance.seasons?.map((e) => e.toJson()).toList(),
      'is4k': instance.is4k,
      'serverId': instance.serverId,
      'profileId': instance.profileId,
      'rootFolder': instance.rootFolder,
    };

_SeerSearchResultItem _$SeerSearchResultItemFromJson(
  Map<String, dynamic> json,
) => _SeerSearchResultItem(
  id: (json['id'] as num).toInt(),
  mediaType: json['mediaType'] as String?,
  title: json['title'] as String?,
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  posterPath: json['posterPath'] as String?,
  backdropPath: json['backdropPath'] as String?,
  releaseDate: json['releaseDate'] as String?,
  firstAirDate: json['firstAirDate'] as String?,
  voteAverage: (json['voteAverage'] as num?)?.toDouble(),
  genreIds: (json['genreIds'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  mediaInfo: json['mediaInfo'] == null
      ? null
      : SeerMediaInfo.fromJson(json['mediaInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SeerSearchResultItemToJson(
  _SeerSearchResultItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'mediaType': instance.mediaType,
  'title': instance.title,
  'name': instance.name,
  'overview': instance.overview,
  'posterPath': instance.posterPath,
  'backdropPath': instance.backdropPath,
  'releaseDate': instance.releaseDate,
  'firstAirDate': instance.firstAirDate,
  'voteAverage': instance.voteAverage,
  'genreIds': instance.genreIds,
  'mediaInfo': instance.mediaInfo?.toJson(),
};

_SeerSearchResponse _$SeerSearchResponseFromJson(Map<String, dynamic> json) =>
    _SeerSearchResponse(
      page: (json['page'] as num?)?.toInt() ?? 1,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
      totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
      results:
          (json['results'] as List<dynamic>?)
              ?.map(
                (e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SeerSearchResponseToJson(_SeerSearchResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_SeerRequestsResponse _$SeerRequestsResponseFromJson(
  Map<String, dynamic> json,
) => _SeerRequestsResponse(
  page: (json['page'] as num?)?.toInt() ?? 1,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
  totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => SeerRequest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SeerRequestsResponseToJson(
  _SeerRequestsResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'totalPages': instance.totalPages,
  'totalResults': instance.totalResults,
  'results': instance.results.map((e) => e.toJson()).toList(),
};

_SeerSeason _$SeerSeasonFromJson(Map<String, dynamic> json) => _SeerSeason(
  id: (json['id'] as num).toInt(),
  seasonNumber: (json['seasonNumber'] as num).toInt(),
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  episodeCount: (json['episodeCount'] as num?)?.toInt() ?? 0,
  airDate: json['airDate'] as String?,
  posterPath: json['posterPath'] as String?,
);

Map<String, dynamic> _$SeerSeasonToJson(_SeerSeason instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seasonNumber': instance.seasonNumber,
      'name': instance.name,
      'overview': instance.overview,
      'episodeCount': instance.episodeCount,
      'airDate': instance.airDate,
      'posterPath': instance.posterPath,
    };

_SeerMediaDetails _$SeerMediaDetailsFromJson(Map<String, dynamic> json) =>
    _SeerMediaDetails(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
      numberOfSeasons: (json['numberOfSeasons'] as num?)?.toInt(),
      numberOfEpisodes: (json['numberOfEpisodes'] as num?)?.toInt(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeerSeason.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      mediaInfo: json['mediaInfo'] == null
          ? null
          : SeerMediaInfo.fromJson(json['mediaInfo'] as Map<String, dynamic>),
      tagline: json['tagline'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      originalLanguage: json['originalLanguage'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => SeerGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['releaseDate'] as String?,
      firstAirDate: json['firstAirDate'] as String?,
    );

Map<String, dynamic> _$SeerMediaDetailsToJson(_SeerMediaDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'numberOfSeasons': instance.numberOfSeasons,
      'numberOfEpisodes': instance.numberOfEpisodes,
      'seasons': instance.seasons?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'voteAverage': instance.voteAverage,
      'mediaInfo': instance.mediaInfo?.toJson(),
      'tagline': instance.tagline,
      'runtime': instance.runtime,
      'originalLanguage': instance.originalLanguage,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'releaseDate': instance.releaseDate,
      'firstAirDate': instance.firstAirDate,
    };

_SeerGenre _$SeerGenreFromJson(Map<String, dynamic> json) =>
    _SeerGenre(id: (json['id'] as num).toInt(), name: json['name'] as String?);

Map<String, dynamic> _$SeerGenreToJson(_SeerGenre instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_SeerTrendingResponse _$SeerTrendingResponseFromJson(
  Map<String, dynamic> json,
) => _SeerTrendingResponse(
  page: (json['page'] as num?)?.toInt() ?? 1,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
  totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SeerTrendingResponseToJson(
  _SeerTrendingResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'totalPages': instance.totalPages,
  'totalResults': instance.totalResults,
  'results': instance.results.map((e) => e.toJson()).toList(),
};

_SeerServiceSettings _$SeerServiceSettingsFromJson(Map<String, dynamic> json) =>
    _SeerServiceSettings(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      is4k: json['is4k'] as bool? ?? false,
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$SeerServiceSettingsToJson(
  _SeerServiceSettings instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'is4k': instance.is4k,
  'isDefault': instance.isDefault,
};

_SeerCreateRequestBody _$SeerCreateRequestBodyFromJson(
  Map<String, dynamic> json,
) => _SeerCreateRequestBody(
  mediaType: json['mediaType'] as String,
  mediaId: (json['mediaId'] as num).toInt(),
  seasons: (json['seasons'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  is4k: json['is4k'] as bool? ?? false,
  serverId: (json['serverId'] as num?)?.toInt(),
  profileId: (json['profileId'] as num?)?.toInt(),
  rootFolder: json['rootFolder'] as String?,
);

Map<String, dynamic> _$SeerCreateRequestBodyToJson(
  _SeerCreateRequestBody instance,
) => <String, dynamic>{
  'mediaType': instance.mediaType,
  'mediaId': instance.mediaId,
  'seasons': instance.seasons,
  'is4k': instance.is4k,
  'serverId': instance.serverId,
  'profileId': instance.profileId,
  'rootFolder': instance.rootFolder,
};

_SeerLoginRequest _$SeerLoginRequestFromJson(Map<String, dynamic> json) =>
    _SeerLoginRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SeerLoginRequestToJson(_SeerLoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

_SeerJellyfinLoginRequest _$SeerJellyfinLoginRequestFromJson(
  Map<String, dynamic> json,
) => _SeerJellyfinLoginRequest(
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$SeerJellyfinLoginRequestToJson(
  _SeerJellyfinLoginRequest instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
};

_SeerGenreSliderItem _$SeerGenreSliderItemFromJson(Map<String, dynamic> json) =>
    _SeerGenreSliderItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      backdrops: (json['backdrops'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SeerGenreSliderItemToJson(
  _SeerGenreSliderItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'backdrops': instance.backdrops,
};
