import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:symphonyfy/reproductor/models/song_model.dart';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration? _duration = const Duration(seconds: 0);
  Duration? _position = const Duration(seconds: 0);
  Song? _actualSong;

  final List<Song> _playlist = [
    Song(
        name: 'Quedate que la noche sin ti duele',
        author: 'Quevedo',
        source: 'testmusica.mp3',
        cover:
            'https://elgeneracionalpost.com/wp-content/uploads/2022/07/FXzkSsaUEAAnAw7.jpg'),
    Song(
        name: 'Get Lucky',
        author: 'Daft Punk',
        source: 'getlucky.mp3',
        cover:
            'https://pics.filmaffinity.com/daft_punk_feat_pharrell_williams_get_lucky-767851657-large.jpg')
  ];

  bool get isPlaying => _isPlaying;
  Duration get position => _position!;
  Song get actualSong => _actualSong!;
  Duration get duration => _duration!;
  String get durationString =>
      '${_duration!.inMinutes}:${_duration!.inSeconds % 60}';
  String get positionString =>
      '${_position!.inMinutes}:${_position!.inSeconds % 60}';

  AudioPlayerProvider() {
    _actualSong = _playlist[0];
    setMusicInPlayer();
    //Si hay problemas al reproducir capaz sea esto xd y deba colocarlo donde de click al iniciar reproduccion
    _audioPlayer.onPositionChanged.listen((position) {
      _position = position;
      notifyListeners();
    });
  }

  Future<void> changePlaying() async {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  Future<void> setMusicInPlayer() async {
    await _audioPlayer.setSource(AssetSource(_actualSong!.source));
    _duration = await _audioPlayer.getDuration();
    notifyListeners();
  }

  Future<void> seekPlayer(int position) async {
    final _position = Duration(seconds: position);
    await _audioPlayer.seek(_position);
    notifyListeners();
  }

  Future<void> playClick() async {
    _isPlaying ? await _audioPlayer.pause() : await _audioPlayer.resume();
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  Future<void> nextSong() async {
    await _audioPlayer.stop();
    _actualSong = _playlist[1];
    await _audioPlayer.setSource(AssetSource(_actualSong!.source));
    _duration = await _audioPlayer.getDuration();
    _position = const Duration(seconds: 0);
    _isPlaying = true;
    notifyListeners();
    await _audioPlayer.resume();
  }

  Future<void> prevSong() async {
    await _audioPlayer.stop();
    _actualSong = _playlist[0];
    await _audioPlayer.setSource(AssetSource(_actualSong!.source));
    _duration = await _audioPlayer.getDuration();
    _position = const Duration(seconds: 0);
    _isPlaying = true;
    notifyListeners();
    await _audioPlayer.resume();
  }
}
