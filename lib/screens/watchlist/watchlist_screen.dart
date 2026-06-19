import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../../database/app_database.dart';
import '../../i18n/strings.g.dart';
import '../../media/media_item.dart';
import '../../media/media_backend.dart';
import '../../media/media_kind.dart';
import '../../mixins/tab_navigation_mixin.dart';
import '../../mixins/refreshable.dart';
import '../../providers/watchlist_provider.dart';
import '../../utils/platform_detector.dart';
import '../../utils/grid_size_calculator.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/focusable_media_card.dart';
import '../../widgets/media_grid_delegate.dart';
import '../../focus/focusable_button.dart';
import '../libraries/state_messages.dart';
import '../media_detail_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => WatchlistScreenState();
}

class WatchlistScreenState extends State<WatchlistScreen>
    with TickerProviderStateMixin, TabNavigationMixin, FocusableTab {
  final _scrollController = ScrollController();
  final _firstItemFocusNode = FocusNode(debugLabel: 'watchlist_first_item');

  @override
  void initState() {
    super.initState();
    suppressAutoFocus = true;
    initTabNavigation();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _firstItemFocusNode.dispose();
    disposeTabNavigation();
    super.dispose();
  }

  @override
  List<FocusNode> get tabChipFocusNodes => [];

  @override
  void focusActiveTabIfReady() {
    // No tab chips on this screen
  }

  void _navigateToDetail(WatchlistItem item) {
    final media = _watchlistItemToMediaItem(item);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MediaDetailScreen(metadata: media, isOffline: false),
      ),
    );
  }

  MediaItem _watchlistItemToMediaItem(WatchlistItem item) {
    final backend =
        item.backend == 'plex' ? MediaBackend.plex : MediaBackend.jellyfin;
    final kind = MediaKind.values.firstWhere(
      (k) => k.name == item.kind,
      orElse: () => MediaKind.movie,
    );

    return MediaItem(
      id: item.ratingKey,
      backend: backend,
      kind: kind,
      title: item.title,
      titleSort: item.titleSort,
      summary: item.summary,
      year: item.year,
      thumbPath: item.thumbPath,
      artPath: item.artPath,
      parentId: item.parentRatingKey,
      grandparentId: item.grandparentRatingKey,
      parentTitle: item.parentTitle,
      grandparentTitle: item.grandparentTitle,
      parentIndex: item.parentIndex,
      index: item.index,
      libraryId: item.libraryId,
      libraryTitle: item.libraryTitle,
      serverId: item.serverId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WatchlistProvider>(
      builder: (context, provider, _) {
        final items = provider.items;

        if (items.isEmpty) {
          return _buildEmptyState(context);
        }

        // Group items by kind — inspired by AFinity's grouped sections
        final movies = items.where((i) => i.kind == 'movie').toList();
        final shows = items.where((i) => i.kind == 'show').toList();
        final seasons = items.where((i) => i.kind == 'season').toList();
        final episodes = items.where((i) => i.kind == 'episode').toList();
        final other = items
            .where((i) =>
                i.kind != 'movie' &&
                i.kind != 'show' &&
                i.kind != 'season' &&
                i.kind != 'episode')
            .toList();

        final sections = <_WatchlistSection>[
          if (movies.isNotEmpty)
            _WatchlistSection(label: t.watchlist.movies, items: movies),
          if (shows.isNotEmpty)
            _WatchlistSection(label: t.watchlist.shows, items: shows),
          if (seasons.isNotEmpty)
            _WatchlistSection(label: t.watchlist.seasons, items: seasons),
          if (episodes.isNotEmpty)
            _WatchlistSection(label: t.watchlist.episodes, items: episodes),
          if (other.isNotEmpty)
            _WatchlistSection(label: 'Other', items: other),
        ];

        return _buildSectionsView(context, sections, provider);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Scaffold(
      body: StateMessageWidget(
        icon: Symbols.bookmark_rounded,
        message: t.watchlist.empty,
        subtitle: t.watchlist.emptyDescription,
      ),
    );
  }

  Widget _buildSectionsView(
    BuildContext context,
    List<_WatchlistSection> sections,
    WatchlistProvider provider,
  ) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: Text(t.watchlist.title),
            pinned: false,
            floating: true,
            actions: [
              IconButton(
                icon: const AppIcon(Symbols.playlist_remove_rounded),
                tooltip: t.watchlist.clearAll,
                onPressed: () => _confirmClearAll(context, provider),
              ),
            ],
          ),
          for (final section in sections) ...[
            _buildSectionHeader(section.label, section.items.length),
            _buildSectionGrid(section.items),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
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

  Widget _buildSectionGrid(List<WatchlistItem> items) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: MediaGridDelegate.createDelegate(
          context: context,
          density: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = items[index];
            final mediaItem = _watchlistItemToMediaItem(item);
            return FocusableMediaCard(
              item: mediaItem,
              focusNode: index == 0 ? _firstItemFocusNode : null,
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }

  void _confirmClearAll(BuildContext context, WatchlistProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.watchlist.clearAll),
        content: Text(t.watchlist.clearAllConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () {
              provider.clearAll();
              Navigator.pop(context);
            },
            child: Text(t.watchlist.clearAll),
          ),
        ],
      ),
    );
  }
}

class _WatchlistSection {
  final String label;
  final List<WatchlistItem> items;

  const _WatchlistSection({required this.label, required this.items});
}