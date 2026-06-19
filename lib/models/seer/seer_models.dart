import 'package:freezed_annotation/freezed_annotation.dart';

part 'seer_models.freezed.dart';
part 'seer_models.g.dart';

/// Media type for Seer requests.
enum SeerMediaType { movie, tv }

extension SeerMediaTypeX on SeerMediaType {
  String get apiString => switch (this) {
        SeerMediaType.movie => 'movie',
        SeerMediaType.tv => 'tv',
      };

  static SeerMediaType fromApiString(String s) => switch (s) {
        'movie' => SeerMediaType.movie,
        'tv' => SeerMediaType.tv,
        _ => SeerMediaType.movie,
      };
}

/// Request status (from Seer API).
enum SeerRequestStatus {
  pending(1),
  approved(2),
  declined(3),
  available(4),
  partiallyAvailable(5);

  final int value;
  const SeerRequestStatus(this.value);

  static SeerRequestStatus fromValue(int? v) => switch (v) {
        1 => SeerRequestStatus.pending,
        2 => SeerRequestStatus.approved,
        3 => SeerRequestStatus.declined,
        4 => SeerRequestStatus.available,
        5 => SeerRequestStatus.partiallyAvailable,
        _ => SeerRequestStatus.pending,
      };
}

/// Media status (from Seer API).
enum SeerMediaStatus {
  unknown(1),
  pending(2),
  processing(3),
  partiallyAvailable(4),
  available(5),
  deleted(6);

  final int value;
  const SeerMediaStatus(this.value);

  static SeerMediaStatus fromValue(int? v) => switch (v) {
        1 => SeerMediaStatus.unknown,
        2 => SeerMediaStatus.pending,
        3 => SeerMediaStatus.processing,
        4 => SeerMediaStatus.partiallyAvailable,
        5 => SeerMediaStatus.available,
        6 => SeerMediaStatus.deleted,
        _ => SeerMediaStatus.unknown,
      };

  String get label => switch (this) {
        SeerMediaStatus.unknown => 'Unknown',
        SeerMediaStatus.pending => 'Pending',
        SeerMediaStatus.processing => 'Processing',
        SeerMediaStatus.partiallyAvailable => 'Partially Available',
        SeerMediaStatus.available => 'Available',
        SeerMediaStatus.deleted => 'Deleted',
      };
}

/// Seer permission bit flags.
class SeerPermissions {
  static const int request4k = 1 << 0;
  static const int request4kMovie = 1 << 1;
  static const int request4kTv = 1 << 2;
  static const int requestAdvanced = 1 << 3;
  static const int manageRequests = 1 << 4;
  static const int admin = 1 << 5;

  final int value;
  const SeerPermissions(this.value);

  bool get canRequest4k => (value & request4k) != 0 || (value & admin) != 0;
  bool get canRequest4kMovie =>
      (value & request4kMovie) != 0 || (value & request4k) != 0 || (value & admin) != 0;
  bool get canRequest4kTv =>
      (value & request4kTv) != 0 || (value & request4k) != 0 || (value & admin) != 0;
  bool get canUseAdvanced => (value & requestAdvanced) != 0 || (value & manageRequests) != 0 || (value & admin) != 0;
  bool get canManageRequests => (value & manageRequests) != 0 || (value & admin) != 0;
  bool get isAdmin => (value & admin) != 0;
}

@freezed
sealed class SeerUser with _$SeerUser {
  const factory SeerUser({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'permissions') @Default(0) int permissions,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'requestCount') @Default(0) int requestCount,
  }) = _SeerUser;

  factory SeerUser.fromJson(Map<String, dynamic> json) => _$SeerUserFromJson(json);
}

@freezed
sealed class SeerRequestUser with _$SeerRequestUser {
  const factory SeerRequestUser({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'avatar') String? avatar,
  }) = _SeerRequestUser;

  factory SeerRequestUser.fromJson(Map<String, dynamic> json) => _$SeerRequestUserFromJson(json);
}

@freezed
sealed class SeerSeasonRequest with _$SeerSeasonRequest {
  const factory SeerSeasonRequest({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'seasonNumber') required int seasonNumber,
    @JsonKey(name: 'status') @Default(1) int status,
  }) = _SeerSeasonRequest;

  factory SeerSeasonRequest.fromJson(Map<String, dynamic> json) => _$SeerSeasonRequestFromJson(json);
}

@freezed
sealed class SeerMediaInfoSeason with _$SeerMediaInfoSeason {
  const factory SeerMediaInfoSeason({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'seasonNumber') int? seasonNumber,
    @JsonKey(name: 'status') int? status,
  }) = _SeerMediaInfoSeason;

  factory SeerMediaInfoSeason.fromJson(Map<String, dynamic> json) => _$SeerMediaInfoSeasonFromJson(json);
}

@freezed
sealed class SeerMediaInfo with _$SeerMediaInfo {
  const factory SeerMediaInfo({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'mediaType') String? mediaType,
    @JsonKey(name: 'tmdbId') int? tmdbId,
    @JsonKey(name: 'tvdbId') int? tvdbId,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'status4k') int? status4k,
    @JsonKey(name: 'mediaAddedAt') String? mediaAddedAt,
    @JsonKey(name: 'seasons') List<SeerMediaInfoSeason>? seasons,
    @JsonKey(name: 'requests') List<SeerRequest>? requests,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'posterPath') String? posterPath,
    @JsonKey(name: 'backdropPath') String? backdropPath,
    @JsonKey(name: 'releaseDate') String? releaseDate,
    @JsonKey(name: 'firstAirDate') String? firstAirDate,
    @JsonKey(name: 'jellyfinMediaId') String? jellyfinMediaId,
    @JsonKey(name: 'jellyfinMediaId4k') String? jellyfinMediaId4k,
  }) = _SeerMediaInfo;

  factory SeerMediaInfo.fromJson(Map<String, dynamic> json) => _$SeerMediaInfoFromJson(json);

  const SeerMediaInfo._();

  String get displayTitle => title ?? name ?? '';
  String get displayPoster =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w500$posterPath' : '';
  String get displayBackdrop =>
      backdropPath != null ? 'https://image.tmdb.org/t/p/w1280$backdropPath' : '';
}

@freezed
sealed class SeerRequest with _$SeerRequest {
  const factory SeerRequest({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'status') @Default(1) int status,
    @JsonKey(name: 'media', fromJson: _parseMediaInfo) SeerMediaInfo? media,
    @JsonKey(name: 'requestedBy') SeerRequestUser? requestedBy,
    @JsonKey(name: 'modifiedBy') SeerRequestUser? modifiedBy,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'seasons') List<SeerSeasonRequest>? seasons,
    @JsonKey(name: 'is4k') @Default(false) bool is4k,
    @JsonKey(name: 'serverId') int? serverId,
    @JsonKey(name: 'profileId') int? profileId,
    @JsonKey(name: 'rootFolder') String? rootFolder,
  }) = _SeerRequest;

  factory SeerRequest.fromJson(Map<String, dynamic> json) => _$SeerRequestFromJson(json);
}

/// Jellyseerr sometimes returns 'media' as a bare integer (mediaId) instead
/// of an object. This converter handles both cases.
SeerMediaInfo? _parseMediaInfo(dynamic json) {
  if (json == null) return null;
  if (json is int) return SeerMediaInfo(id: json);
  return SeerMediaInfo.fromJson(json as Map<String, dynamic>);
}

@freezed
sealed class SeerSearchResultItem with _$SeerSearchResultItem {
  const factory SeerSearchResultItem({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'mediaType') String? mediaType,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'posterPath') String? posterPath,
    @JsonKey(name: 'backdropPath') String? backdropPath,
    @JsonKey(name: 'releaseDate') String? releaseDate,
    @JsonKey(name: 'firstAirDate') String? firstAirDate,
    @JsonKey(name: 'voteAverage') double? voteAverage,
    @JsonKey(name: 'genreIds') List<int>? genreIds,
    @JsonKey(name: 'mediaInfo') SeerMediaInfo? mediaInfo,
  }) = _SeerSearchResultItem;

  factory SeerSearchResultItem.fromJson(Map<String, dynamic> json) => _$SeerSearchResultItemFromJson(json);

  const SeerSearchResultItem._();

  String get displayTitle => title ?? name ?? 'Unknown';
  String get displayPoster => posterPath != null ? 'https://image.tmdb.org/t/p/w500$posterPath' : '';
  String get displayBackdrop =>
      backdropPath != null ? 'https://image.tmdb.org/t/p/w1280$backdropPath' : '';
  SeerMediaType? get mediaTypeEnum {
    if (mediaType == 'movie') return SeerMediaType.movie;
    if (mediaType == 'tv') return SeerMediaType.tv;
    return null;
  }
  bool get hasExistingRequest =>
      mediaInfo != null && mediaInfo!.status != null && mediaInfo!.status! != 1;
  SeerMediaStatus get displayStatus => SeerMediaStatus.fromValue(mediaInfo?.status);
}

@freezed
sealed class SeerSearchResponse with _$SeerSearchResponse {
  const factory SeerSearchResponse({
    @JsonKey(name: 'page') @Default(1) int page,
    @JsonKey(name: 'totalPages') @Default(1) int totalPages,
    @JsonKey(name: 'totalResults') @Default(0) int totalResults,
    @JsonKey(name: 'results') @Default([]) List<SeerSearchResultItem> results,
  }) = _SeerSearchResponse;

  factory SeerSearchResponse.fromJson(Map<String, dynamic> json) => _$SeerSearchResponseFromJson(json);
}

@freezed
sealed class SeerRequestsResponse with _$SeerRequestsResponse {
  const factory SeerRequestsResponse({
    @JsonKey(name: 'page') @Default(1) int page,
    @JsonKey(name: 'totalPages') @Default(1) int totalPages,
    @JsonKey(name: 'totalResults') @Default(0) int totalResults,
    @JsonKey(name: 'results') @Default([]) List<SeerRequest> results,
  }) = _SeerRequestsResponse;

  factory SeerRequestsResponse.fromJson(Map<String, dynamic> json) => _$SeerRequestsResponseFromJson(json);
}

@freezed
sealed class SeerSeason with _$SeerSeason {
  const factory SeerSeason({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'seasonNumber') required int seasonNumber,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'episodeCount') @Default(0) int episodeCount,
    @JsonKey(name: 'airDate') String? airDate,
    @JsonKey(name: 'posterPath') String? posterPath,
  }) = _SeerSeason;

  factory SeerSeason.fromJson(Map<String, dynamic> json) => _$SeerSeasonFromJson(json);
}

@freezed
sealed class SeerMediaDetails with _$SeerMediaDetails {
  const factory SeerMediaDetails({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'posterPath') String? posterPath,
    @JsonKey(name: 'backdropPath') String? backdropPath,
    @JsonKey(name: 'numberOfSeasons') int? numberOfSeasons,
    @JsonKey(name: 'numberOfEpisodes') int? numberOfEpisodes,
    @JsonKey(name: 'seasons') List<SeerSeason>? seasons,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'voteAverage') double? voteAverage,
    @JsonKey(name: 'mediaInfo') SeerMediaInfo? mediaInfo,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'originalLanguage') String? originalLanguage,
    @JsonKey(name: 'genres') List<SeerGenre>? genres,
    @JsonKey(name: 'releaseDate') String? releaseDate,
    @JsonKey(name: 'firstAirDate') String? firstAirDate,
  }) = _SeerMediaDetails;

  factory SeerMediaDetails.fromJson(Map<String, dynamic> json) => _$SeerMediaDetailsFromJson(json);

  const SeerMediaDetails._();

  String get displayTitle => title ?? name ?? 'Unknown';
  int get seasonCount =>
      seasons?.where((s) => s.seasonNumber > 0).length ?? numberOfSeasons ?? 0;
  List<int> get availableSeasons =>
      mediaInfo?.seasons?.where((s) => s.status == 5).map((s) => s.seasonNumber ?? 0).toList() ?? [];
}

@freezed
sealed class SeerGenre with _$SeerGenre {
  const factory SeerGenre({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') String? name,
  }) = _SeerGenre;

  factory SeerGenre.fromJson(Map<String, dynamic> json) => _$SeerGenreFromJson(json);
}

@freezed
sealed class SeerTrendingResponse with _$SeerTrendingResponse {
  const factory SeerTrendingResponse({
    @JsonKey(name: 'page') @Default(1) int page,
    @JsonKey(name: 'totalPages') @Default(1) int totalPages,
    @JsonKey(name: 'totalResults') @Default(0) int totalResults,
    @JsonKey(name: 'results') @Default([]) List<SeerSearchResultItem> results,
  }) = _SeerTrendingResponse;

  factory SeerTrendingResponse.fromJson(Map<String, dynamic> json) => _$SeerTrendingResponseFromJson(json);
}

@freezed
sealed class SeerServiceSettings with _$SeerServiceSettings {
  const factory SeerServiceSettings({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'is4k') @Default(false) bool is4k,
    @JsonKey(name: 'isDefault') @Default(false) bool isDefault,
  }) = _SeerServiceSettings;

  factory SeerServiceSettings.fromJson(Map<String, dynamic> json) => _$SeerServiceSettingsFromJson(json);
}

@freezed
sealed class SeerCreateRequestBody with _$SeerCreateRequestBody {
  const factory SeerCreateRequestBody({
    @JsonKey(name: 'mediaType') required String mediaType,
    @JsonKey(name: 'mediaId') required int mediaId,
    @JsonKey(name: 'seasons') List<int>? seasons,
    @JsonKey(name: 'is4k') @Default(false) bool is4k,
    @JsonKey(name: 'serverId') int? serverId,
    @JsonKey(name: 'profileId') int? profileId,
    @JsonKey(name: 'rootFolder') String? rootFolder,
  }) = _SeerCreateRequestBody;

  factory SeerCreateRequestBody.fromJson(Map<String, dynamic> json) => _$SeerCreateRequestBodyFromJson(json);
}

@freezed
sealed class SeerLoginRequest with _$SeerLoginRequest {
  const factory SeerLoginRequest({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'password') required String password,
  }) = _SeerLoginRequest;

  factory SeerLoginRequest.fromJson(Map<String, dynamic> json) => _$SeerLoginRequestFromJson(json);
}

@freezed
sealed class SeerJellyfinLoginRequest with _$SeerJellyfinLoginRequest {
  const factory SeerJellyfinLoginRequest({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'password') required String password,
  }) = _SeerJellyfinLoginRequest;

  factory SeerJellyfinLoginRequest.fromJson(Map<String, dynamic> json) => _$SeerJellyfinLoginRequestFromJson(json);
}

/// Genre slider item — from GET /api/v1/discover/genreslider/movie|tv
/// Includes backdrop image paths for visual display.
@freezed
sealed class SeerGenreSliderItem with _$SeerGenreSliderItem {
  const factory SeerGenreSliderItem({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'backdrops') List<String>? backdrops,
  }) = _SeerGenreSliderItem;

  factory SeerGenreSliderItem.fromJson(Map<String, dynamic> json) => _$SeerGenreSliderItemFromJson(json);

  const SeerGenreSliderItem._();

  String get displayTitle => name ?? 'Unknown';
  String? get backdropUrl => backdrops != null && backdrops!.isNotEmpty
      ? 'https://image.tmdb.org/t/p/w780${backdrops!.first}'
      : null;
}

/// Hardcoded popular studios (from AFinity's Studio.kt).
/// TMDB studio IDs — used as `studio=` query param on discover/movies.
class SeerStudio {
  final int id;
  final String name;
  final String? logoPath;

  const SeerStudio({required this.id, required this.name, this.logoPath});

  String get logoUrl => logoPath != null
      ? 'https://image.tmdb.org/t/p/w780_filter(duotone,ffffff,bababa)$logoPath'
      : '';

  static const popular = [
    SeerStudio(id: 2, name: 'Disney', logoPath: '/wdrCwmRnLFJhEoH8GSfymY85KHT.png'),
    SeerStudio(id: 127928, name: '20th Century', logoPath: '/hUFXos3VSUrc1JxTpsZoPdW4qhm.png'),
    SeerStudio(id: 34, name: 'Sony Pictures', logoPath: '/tG29rwQrLrJrAgC4g6Wk4P8mQr.png'),
    SeerStudio(id: 4, name: 'Paramount', logoPath: '/gz66EfNhYPgbE3WUhOKlP7GbyaL.png'),
    SeerStudio(id: 420, name: 'Marvel Studios', logoPath: '/8aWJxh6TgC9xZqMqWg3pXhW3pKp.png'),
    SeerStudio(id: 9993, name: 'DC', logoPath: '/c9dTf3P5J5K9pQmFqMjvR2gTjK.png'),
    SeerStudio(id: 3, name: 'Pixar', logoPath: '/1T2Xt3Y2mK9jRjWqRcC2xKpRkW.png'),
    SeerStudio(id: 174, name: 'Warner Bros.', logoPath: '/aJZbLkLmD9xQKxMqLpPpWqRkK.png'),
    SeerStudio(id: 33, name: 'Universal', logoPath: '/8aWJxh6TgC9xZqMqWg3pXhW4qhm.png'),
    SeerStudio(id: 7, name: 'DreamWorks', logoPath: '/nNe8z3GqRrJrGg6Wk4P8mQrRkW.png'),
    SeerStudio(id: 41077, name: 'A24', logoPath: '/b9Wz3VrQcMxMzLpPpWqRkKxKp.png'),
  ];
}

/// Hardcoded popular networks (from AFinity's Network.kt).
/// TMDB network IDs — used as `network=` query param on discover/tv.
class SeerNetwork {
  final int id;
  final String name;
  final String? logoPath;

  const SeerNetwork({required this.id, required this.name, this.logoPath});

  String get logoUrl => logoPath != null
      ? 'https://image.tmdb.org/t/p/w780_filter(duotone,ffffff,bababa)$logoPath'
      : '';

  static const popular = [
    SeerNetwork(id: 213, name: 'Netflix', logoPath: '/wwemzKWzjKYJFfCeiB57q3rA1RV.png'),
    SeerNetwork(id: 1024, name: 'Prime Video', logoPath: '/dQa3pYrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 49, name: 'HBO', logoPath: '/aJZbLkLmD9xQKxMqLpPpWqRkK.png'),
    SeerNetwork(id: 2739, name: 'Disney+', logoPath: '/wdrCwmRnLFJhEoH8GSfymY85KHT.png'),
    SeerNetwork(id: 2552, name: 'Apple TV+', logoPath: '/4ZyJpVxQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 453, name: 'Hulu', logoPath: '/b9Wz3VrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 80, name: 'BBC One', logoPath: '/m9Wz3VrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 9, name: 'ABC', logoPath: '/c9dTf3P5J5K9pQmFqMjvR2gTjK.png'),
    SeerNetwork(id: 2, name: 'CBS', logoPath: '/aJZbLkLmD9xQKxMqLpPpWqRkK.png'),
    SeerNetwork(id: 16, name: 'AMC', logoPath: '/nNe8z3GqRrJrGg6Wk4P8mQrRkW.png'),
    SeerNetwork(id: 67, name: 'Showtime', logoPath: '/b9Wz3VrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 318, name: 'Sky One', logoPath: '/4ZyJpVxQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 45, name: 'FX', logoPath: '/dQa3pYrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 35, name: 'BBC America', logoPath: '/m9Wz3VrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 71, name: 'Fox', logoPath: '/aJZbLkLmD9xQKxMqLpPpWqRkK.png'),
    SeerNetwork(id: 174, name: 'AMC+', logoPath: '/nNe8z3GqRrJrGg6Wk4P8mQrRkW.png'),
    SeerNetwork(id: 3353, name: 'Peacock', logoPath: '/c9dTf3P5J5K9pQmFqMjvR2gTjK.png'),
    SeerNetwork(id: 287, name: 'Crunchyroll', logoPath: '/b9Wz3VrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 144, name: 'MTV', logoPath: '/4ZyJpVxQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 363, name: 'TNT', logoPath: '/m9Wz3VrQcMxMzLpPpWqRkKxKp.png'),
    SeerNetwork(id: 107, name: 'BBC Two', logoPath: '/aJZbLkLmD9xQKxMqLpPpWqRkK.png'),
  ];
}