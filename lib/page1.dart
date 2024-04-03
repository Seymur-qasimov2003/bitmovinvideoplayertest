import 'package:bitmovin_player/bitmovin_player.dart';
import 'package:flutter/material.dart';


class BasicPlayback extends StatefulWidget {
  const BasicPlayback({super.key});

  @override
  State<BasicPlayback> createState() => _BasicPlaybackState();
}

class _BasicPlaybackState extends State<BasicPlayback> {
  final _sourceConfig = const SourceConfig(
    url: 'https://assets.metaflix.az/MetaFlix/filmler/Istintaq/master.m3u8',
    type: SourceType.hls,
    title: 'Metaflix',
    analyticsSourceMetadata: SourceMetadata(
      videoId: 'flutter-wizard-Metaflix-1710842113200',
      title: 'Test Video',
      isLive: false,
    ),
  );
  final _player = Player(
    config: const PlayerConfig(
      // Bitmovin player license key
      key: '1fe06b86-5588-434c-a5e8-0b8c118d0cbb',
      analyticsConfig: AnalyticsConfig(
        // Bitmovin analytics key from the Analytics Dashboard
        licenseKey: '57452c16-f2b5-4d21-b008-e682cf608220',
      ),
    ),
  );

  @override
  void initState() {
    _player.loadSourceConfig(_sourceConfig);
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Playback'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: PlayerView(
              player: _player,
            ),
          ),
          ///play button
          ElevatedButton(
            onPressed: () {
              _player.play();
            },
            child: const Text('Play'),
          ),
          ///pause button
          ElevatedButton(
            onPressed: () {
              _player.pause();
            },
            child: const Text('Pause'),
          ),
        ],
      ),
    );
  }
}
