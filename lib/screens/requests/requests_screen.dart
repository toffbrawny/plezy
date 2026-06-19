import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../../i18n/strings.g.dart';
import '../../models/seer/seer_models.dart';
import '../../providers/seer_provider.dart';
import '../../utils/platform_detector.dart';
import '../../widgets/app_icon.dart';
import '../libraries/state_messages.dart';
import 'request_confirmation_dialog.dart';
import 'seer_login_sheet.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => RequestsScreenState();
}

class RequestsScreenState extends State<RequestsScreen> {
  final _searchController = TextEditingController();
  bool _showSearch = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showLoginSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SeerLoginSheet(),
    );
  }

  void _showRequestDialog(SeerSearchResultItem item) async {
    final provider = context.read<SeerProvider>();
    final mediaType = item.mediaTypeEnum;
    if (mediaType == null) return;

    final details = await provider.getMediaDetails(item.id, mediaType);
    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => RequestConfirmationDialog(
        tmdbId: item.id,
        mediaType: mediaType,
        title: item.displayTitle,
        posterUrl: item.displayPoster,
        backdropUrl: item.displayBackdrop,
        overview: item.overview,
        details: details,
        onRequest: (seasons, is4k) async {
          final result = await provider.createRequest(
            mediaId: item.id,
            mediaType: mediaType,
            seasons: seasons,
            is4k: is4k,
          );
          return result != null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeerProvider>(
      builder: (context, provider, _) {
        if (!provider.isAuthenticated) {
          return _buildNotConnected(context, provider);
        }

        return _buildContent(context, provider);
      },
    );
  }

  Widget _buildNotConnected(BuildContext context, SeerProvider provider) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppIcon(Symbols.movie_rounded, size: 64),
              const SizedBox(height: 16),
              Text(
                t.seer.notConnected,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                t.seer.notConnectedDescription,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _showLoginSheet,
                icon: const AppIcon(Symbols.link_rounded),
                label: Text(t.seer.connect),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, SeerProvider provider) {
    if (provider.loadState == SeerLoadState.loading && provider.trending.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (provider.loadState == SeerLoadState.error && provider.trending.isEmpty) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppIcon(Symbols.error_outline_rounded, size: 64),
                const SizedBox(height: 16),
                Text(
                  provider.error ?? 'Error',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (provider.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SelectableText(
                      provider.error!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => provider.refresh(),
                  icon: const AppIcon(Symbols.refresh_rounded),
                  label: Text(t.seer.retry),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => _showLoginSheet(),
                  child: Text(t.seer.connect),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(t.seer.title),
            pinned: false,
            floating: true,
            actions: [
              IconButton(
                icon: AppIcon(_showSearch ? Symbols.close_rounded : Symbols.search_rounded),
                onPressed: () {
                  setState(() {
                    _showSearch = !_showSearch;
                    if (!_showSearch) {
                      _searchController.clear();
                      provider.clearSearch();
                    }
                  });
                },
              ),
              IconButton(
                icon: const AppIcon(Symbols.logout_rounded),
                onPressed: () => _confirmLogout(context, provider),
              ),
            ],
          ),

          // Search bar
          if (_showSearch)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: t.seer.search,
                    prefixIcon: const AppIcon(Symbols.search_rounded),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) => provider.search(value),
                ),
              ),
            ),

          // Search results
          if (_showSearch && provider.searchResults.isNotEmpty)
            _buildSection(t.seer.search, provider.searchResults, provider)
          else if (_showSearch && provider.isSearching)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              ),
            )
          else if (_showSearch && provider.searchResults.isEmpty && !provider.isSearching)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Text(
                    t.seer.search,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
              ),
            ),

          // My Requests
          if (!_showSearch && provider.requests.isNotEmpty) ...[
            _buildSectionHeader(t.seer.myRequests, provider.requests.length),
            _buildRequestsList(provider.requests, provider),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Trending
          if (!_showSearch && provider.trending.isNotEmpty) ...[
            _buildSectionHeader(t.seer.trending, provider.trending.length),
            _buildHorizontalList(provider.trending, provider),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Popular Movies
          if (!_showSearch && provider.discoverMovies.isNotEmpty) ...[
            _buildSectionHeader(t.seer.discoverMovies, provider.discoverMovies.length),
            _buildHorizontalList(provider.discoverMovies, provider),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Movie Genres
          if (!_showSearch && provider.movieGenres.isNotEmpty) ...[
            _buildSectionHeader(t.seer.movieGenres, provider.movieGenres.length),
            _buildGenreList(provider.movieGenres, provider, isMovie: true),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Upcoming Movies
          if (!_showSearch && provider.upcomingMovies.isNotEmpty) ...[
            _buildSectionHeader(t.seer.upcomingMovies, provider.upcomingMovies.length),
            _buildHorizontalList(provider.upcomingMovies, provider),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Studios
          if (!_showSearch && provider.studios.isNotEmpty) ...[
            _buildSectionHeader(t.seer.studios, provider.studios.length),
            _buildStudioNetworkList(provider.studios.map((s) => (id: s.id, name: s.name, imageUrl: s.logoUrl)).toList(), provider, isStudio: true),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Popular TV
          if (!_showSearch && provider.discoverTv.isNotEmpty) ...[
            _buildSectionHeader(t.seer.discoverTv, provider.discoverTv.length),
            _buildHorizontalList(provider.discoverTv, provider),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // TV Genres
          if (!_showSearch && provider.tvGenres.isNotEmpty) ...[
            _buildSectionHeader(t.seer.tvGenres, provider.tvGenres.length),
            _buildGenreList(provider.tvGenres, provider, isMovie: false),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Upcoming TV
          if (!_showSearch && provider.upcomingTv.isNotEmpty) ...[
            _buildSectionHeader(t.seer.upcomingTv, provider.upcomingTv.length),
            _buildHorizontalList(provider.upcomingTv, provider),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],

          // Networks
          if (!_showSearch && provider.networks.isNotEmpty) ...[
            _buildSectionHeader(t.seer.networks, provider.networks.length),
            _buildStudioNetworkList(provider.networks.map((n) => (id: n.id, name: n.name, imageUrl: n.logoUrl)).toList(), provider, isStudio: false),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],

          if (!_showSearch && provider.requests.isEmpty && provider.trending.isEmpty)
            SliverToBoxAdapter(
              child: StateMessageWidget(
                icon: Symbols.movie_rounded,
                message: t.seer.noRequests,
                subtitle: t.seer.noRequestsDescription,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String label, int count) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 8),
            Text(
              '$count',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalList(
      List<SeerSearchResultItem> items, SeerProvider provider) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildDiscoverCard(item, provider);
          },
        ),
      ),
    );
  }

  Widget _buildGenreList(List<SeerGenreSliderItem> genres, SeerProvider provider, {required bool isMovie}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: genres.length,
          itemBuilder: (context, index) {
            final genre = genres[index];
            return _buildGenreCard(genre, provider, isMovie: isMovie);
          },
        ),
      ),
    );
  }

  Widget _buildGenreCard(SeerGenreSliderItem genre, SeerProvider provider, {required bool isMovie}) {
    final backdropUrl = genre.backdropUrl;
    return GestureDetector(
      onTap: () {
        provider.loadFilteredMedia(SeerFilterParams(
          type: isMovie ? SeerFilterType.genreMovie : SeerFilterType.genreTv,
          id: genre.id,
          name: genre.displayTitle,
        ));
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _FilteredMediaScreen(
              title: genre.displayTitle,
              params: SeerFilterParams(
                type: isMovie ? SeerFilterType.genreMovie : SeerFilterType.genreTv,
                id: genre.id,
                name: genre.displayTitle,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: backdropUrl != null
              ? DecorationImage(
                  image: NetworkImage(backdropUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.4),
                    BlendMode.darken,
                  ),
                )
              : null,
          color: backdropUrl == null ? Theme.of(context).colorScheme.surfaceContainerHighest : null,
        ),
        child: Center(
          child: Text(
            genre.displayTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStudioNetworkList(
      List<({int id, String name, String imageUrl})> items, SeerProvider provider,
      {required bool isStudio}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildStudioNetworkCard(item, provider, isStudio: isStudio);
          },
        ),
      ),
    );
  }

  Widget _buildStudioNetworkCard(
      ({int id, String name, String imageUrl}) item, SeerProvider provider,
      {required bool isStudio}) {
    return GestureDetector(
      onTap: () {
        provider.loadFilteredMedia(SeerFilterParams(
          type: isStudio ? SeerFilterType.studio : SeerFilterType.network,
          id: item.id,
          name: item.name,
        ));
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _FilteredMediaScreen(
              title: item.name,
              params: SeerFilterParams(
                type: isStudio ? SeerFilterType.studio : SeerFilterType.network,
                id: item.id,
                name: item.name,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: item.imageUrl.isNotEmpty
              ? Center(
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Center(
                      child: Text(item.name, style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              : Center(
                  child: Text(item.name, style: const TextStyle(color: Colors.white)),
                ),
        ),
      ),
    );
  }

  Widget _buildDiscoverCard(SeerSearchResultItem item, SeerProvider provider) {
    final status = item.displayStatus;
    final isAvailable = status == SeerMediaStatus.available;
    final hasRequest = item.hasExistingRequest;

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          // Navigate to media detail (if jellyfinMediaId is available)
          // For now, show the request dialog
          _showRequestDialog(item);
        } else {
          _showRequestDialog(item);
        }
      },
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 2 / 3,
                    child: item.displayPoster.isNotEmpty
                        ? Image.network(
                            item.displayPoster,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest,
                              child: const Center(child: AppIcon(Symbols.movie_rounded, size: 32)),
                            ),
                          )
                        : Container(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            child: const Center(child: AppIcon(Symbols.movie_rounded, size: 32)),
                          ),
                  ),
                  if (hasRequest || isAvailable)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: _statusColor(status),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          status.label,
                          style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.displayTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsList(List<SeerRequest> requests, SeerProvider provider) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final req = requests[index];
            return _buildRequestCard(req, provider);
          },
        ),
      ),
    );
  }

  Widget _buildRequestCard(SeerRequest req, SeerProvider provider) {
    final status = SeerRequestStatus.fromValue(req.status);
    final mediaStatus = SeerMediaStatus.fromValue(req.media?.status);
    final canManage = provider.permissions?.canManageRequests ?? false;

    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: (req.media?.posterPath != null)
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w500${req.media!.posterPath}',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            child: const Center(child: AppIcon(Symbols.movie_rounded, size: 32)),
                          ),
                        )
                      : Container(
                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                          child: const Center(child: AppIcon(Symbols.movie_rounded, size: 32)),
                        ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: _requestStatusColor(status, mediaStatus),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _requestStatusLabel(status, mediaStatus),
                      style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            req.media?.title ?? req.media?.name ?? 'Unknown',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          if (canManage && status == SeerRequestStatus.pending) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                IconButton(
                  icon: const AppIcon(Symbols.check_circle_rounded, size: 20),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => provider.approveRequest(req.id),
                  tooltip: t.seer.approve,
                ),
                IconButton(
                  icon: const AppIcon(Symbols.cancel_rounded, size: 20),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => provider.declineRequest(req.id),
                  tooltip: t.seer.declineRequest,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSection(String label, List<SeerSearchResultItem> items, SeerProvider provider) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            );
          }
          final item = items[index - 1];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: 40,
                height: 60,
                child: item.displayPoster.isNotEmpty
                    ? Image.network(item.displayPoster, fit: BoxFit.cover)
                    : Container(color: Theme.of(context).colorScheme.surfaceContainerHighest),
              ),
            ),
            title: Text(item.displayTitle, maxLines: 1),
            subtitle: Text(
              item.displayStatus.label,
              style: TextStyle(color: _statusColor(item.displayStatus)),
            ),
            onTap: () => _showRequestDialog(item),
          );
        },
        childCount: items.length + 1,
      ),
    );
  }

  Color _statusColor(SeerMediaStatus status) => switch (status) {
        SeerMediaStatus.available => Colors.green,
        SeerMediaStatus.processing => Colors.blue,
        SeerMediaStatus.pending => Colors.orange,
        SeerMediaStatus.partiallyAvailable => Colors.teal,
        SeerMediaStatus.deleted => Colors.red,
        SeerMediaStatus.unknown => Colors.grey,
      };

  Color _requestStatusColor(SeerRequestStatus status, SeerMediaStatus mediaStatus) {
    if (status == SeerRequestStatus.declined) return Colors.red;
    if (mediaStatus == SeerMediaStatus.available) return Colors.green;
    if (mediaStatus == SeerMediaStatus.partiallyAvailable) return Colors.teal;
    if (status == SeerRequestStatus.approved) return Colors.blue;
    return Colors.orange;
  }

  String _requestStatusLabel(SeerRequestStatus status, SeerMediaStatus mediaStatus) {
    if (status == SeerRequestStatus.declined) return t.seer.declined;
    if (mediaStatus == SeerMediaStatus.available) return t.seer.availableStatus;
    if (mediaStatus == SeerMediaStatus.partiallyAvailable) return t.seer.partiallyAvailable;
    if (mediaStatus == SeerMediaStatus.processing) return t.seer.processing;
    if (status == SeerRequestStatus.approved) return t.seer.processing;
    return t.seer.pending;
  }

  void _confirmLogout(BuildContext context, SeerProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.seer.logout),
        content: Text(t.seer.notConnectedDescription),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(t.common.cancel)),
          TextButton(
            onPressed: () {
              provider.logout();
              Navigator.pop(context);
            },
            child: Text(t.seer.logout),
          ),
        ],
      ),
    );
  }
}
/// Screen for filtered media (by genre, studio, network, or discover type).
class _FilteredMediaScreen extends StatefulWidget {
  final String title;
  final SeerFilterParams params;

  const _FilteredMediaScreen({super.key, required this.title, required this.params});

  @override
  State<_FilteredMediaScreen> createState() => _FilteredMediaScreenState();
}

class _FilteredMediaScreenState extends State<_FilteredMediaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SeerProvider>().loadFilteredMedia(widget.params);
    });
  }

  void _showRequestDialog(SeerSearchResultItem item) async {
    final provider = context.read<SeerProvider>();
    final mediaType = item.mediaTypeEnum;
    if (mediaType == null) return;

    final details = await provider.getMediaDetails(item.id, mediaType);
    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => RequestConfirmationDialog(
        tmdbId: item.id,
        mediaType: mediaType,
        title: item.displayTitle,
        posterUrl: item.displayPoster,
        backdropUrl: item.displayBackdrop,
        overview: item.overview,
        details: details,
        onRequest: (seasons, is4k) async {
          final result = await provider.createRequest(
            mediaId: item.id,
            mediaType: mediaType,
            seasons: seasons,
            is4k: is4k,
          );
          return result != null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeerProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: provider.isLoadingFiltered
              ? const Center(child: CircularProgressIndicator())
              : provider.filteredResults.isEmpty
                  ? Center(
                      child: Text(
                        provider.error ?? 'No results found',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 130,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: provider.filteredResults.length,
                      itemBuilder: (context, index) {
                        final item = provider.filteredResults[index];
                        return GestureDetector(
                          onTap: () => _showRequestDialog(item),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: item.displayPoster.isNotEmpty
                                      ? Image.network(
                                          item.displayPoster,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) => Container(
                                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                            child: const Center(child: AppIcon(Symbols.movie_rounded, size: 32)),
                                          ),
                                        )
                                      : Container(
                                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                          child: const Center(child: AppIcon(Symbols.movie_rounded, size: 32)),
                                        ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.displayTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
