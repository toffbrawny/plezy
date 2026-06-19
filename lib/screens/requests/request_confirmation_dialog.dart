import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../../i18n/strings.g.dart';
import '../../models/seer/seer_models.dart';
import '../../providers/seer_provider.dart';
import '../../widgets/app_icon.dart';

class RequestConfirmationDialog extends StatefulWidget {
  final int tmdbId;
  final SeerMediaType mediaType;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final String? overview;
  final SeerMediaDetails details;
  final Future<bool> Function(List<int>? seasons, bool is4k) onRequest;

  const RequestConfirmationDialog({
    super.key,
    required this.tmdbId,
    required this.mediaType,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    this.overview,
    required this.details,
    required this.onRequest,
  });

  @override
  State<RequestConfirmationDialog> createState() => _RequestConfirmationDialogState();
}

class _RequestConfirmationDialogState extends State<RequestConfirmationDialog> {
  final _selectedSeasons = <int>{};
  bool _is4k = false;
  bool _submitting = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SeerProvider>();
    final permissions = provider.permissions;
    final isTv = widget.mediaType == SeerMediaType.tv;
    final seasonCount = widget.details.seasonCount;
    final availableSeasons = widget.details.availableSeasons;
    final alreadyRequestedSeasons = <int>[];

    // Parse already-requested seasons from mediaInfo
    for (final req in widget.details.mediaInfo?.requests ?? []) {
      for (final s in req.seasons ?? []) {
        alreadyRequestedSeasons.add(s.seasonNumber);
      }
    }

    final disabledSeasons = {...availableSeasons, ...alreadyRequestedSeasons};

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Overview
            if (widget.overview != null)
              Text(
                widget.overview!,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            const SizedBox(height: 16),

            // Season selector (TV only)
            if (isTv && seasonCount > 0) ...[
              Text(t.seer.selectSeasons, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: List.generate(seasonCount, (i) {
                  final seasonNum = i + 1;
                  final isDisabled = disabledSeasons.contains(seasonNum);
                  final isSelected = _selectedSeasons.contains(seasonNum);
                  return FilterChip(
                    label: Text('S$seasonNum'),
                    selected: isSelected,
                    onSelected: isDisabled
                        ? null
                        : (selected) {
                            setState(() {
                              if (selected) {
                                _selectedSeasons.add(seasonNum);
                              } else {
                                _selectedSeasons.remove(seasonNum);
                              }
                            });
                          },
                  );
                }),
              ),
              const SizedBox(height: 16),
            ],

            // 4K toggle
            if (permissions != null &&
                ((widget.mediaType == SeerMediaType.movie && permissions.canRequest4kMovie) ||
                    (widget.mediaType == SeerMediaType.tv && permissions.canRequest4kTv))) ...[
              SwitchListTile(
                title: Text(t.seer.is4k),
                value: _is4k,
                onChanged: (v) => setState(() => _is4k = v),
              ),
              const SizedBox(height: 16),
            ],

            // Error
            if (_error != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                ),
              ),

            const SizedBox(height: 16),

            // Submit button
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: _submitting
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                        const SizedBox(width: 8),
                        Text(t.seer.request),
                      ],
                    )
                  : Text(widget.mediaType == SeerMediaType.movie
                      ? t.seer.requestMovie
                      : t.seer.requestTv),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    setState(() {
      _submitting = true;
      _error = null;
    });

    List<int>? seasons;
    if (widget.mediaType == SeerMediaType.tv) {
      seasons = _selectedSeasons.toList();
      seasons.sort();
    }

    // If TV and no seasons selected, request all
    final finalSeasons = (widget.mediaType == SeerMediaType.tv && seasons != null && seasons.isEmpty)
        ? null
        : seasons;

    final success = await widget.onRequest(finalSeasons, _is4k);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.seer.requestConfirmed)),
      );
      Navigator.pop(context);
    } else {
      setState(() {
        _error = t.seer.requestFailed;
        _submitting = false;
      });
    }
  }
}