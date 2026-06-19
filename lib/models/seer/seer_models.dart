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
}

@freezed
sealed class SeerRequest with _$SeerRequest {
  const factory SeerRequest({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'status') @Default(1) int status,
    @JsonKey(name: 'media') SeerMediaInfo? media,
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