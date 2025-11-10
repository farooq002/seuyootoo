// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundManager {
  SoundManager._();
  static final SoundManager instance = SoundManager._();

  final Soundpool _pool = Soundpool(streamType: StreamType.notification);

  // Cache to store already-loaded sounds
  final Map<String, int> _loadedSounds = {};

  int? _currentStreamId;
  Future<void> play(String fileName) async {
    final fullPath = fileName;

    int soundId;

    // Stop previous sound if still playing
    if (_currentStreamId != null) {
      await _pool.stop(_currentStreamId!);
      _currentStreamId = null;
    }

    // If sound already loaded → use from cache
    if (_loadedSounds.containsKey(fullPath)) {
      soundId = _loadedSounds[fullPath]!;
    } else {
      // Load sound and store in cache
      final soundData = await rootBundle.load(fullPath);
      soundId = await _pool.load(soundData);
      _loadedSounds[fullPath] = soundId;
    }

    // Play and store the new stream ID
    _currentStreamId = await _pool.play(soundId);
  }
}
