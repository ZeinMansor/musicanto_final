import 'package:get/get.dart';
import 'package:musicanto/models/song.dart';
import 'package:just_audio/just_audio.dart';

import '../models/playlist.dart';
import '../util/api.dart';
import '../widgets/seek_bar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class HomePageController extends GetxController {
  List<PlayList> playlists = [];
  AudioPlayer audioPlayer = AudioPlayer();
  List<Song> songs = [];

  Future<List<Song>> getSongs() async {
    var songsList = await ApiDataHolder.loadSongs();
    if (songsList == null) {
      return [];
    } else {
      songs = songsList;
      createPlayLists(songsList);
      return songsList;
    }
  }

  createPlayLists(List<Song> songs) {
    playlists = [
      PlayList(
        title: "Playlist 1",
        songs: songs,
        description: "Description 1",
        imageUrl: "assets/images/3.jpg",
      ),
      PlayList(
          title: "Playlist 2",
          songs: songs,
          description: "Description 2",
          imageUrl: "assets/images/3.jpg"),
      PlayList(
          title: "Playlist 3",
          songs: songs,
          description: "Description 3",
          imageUrl: "assets/images/3.jpg"),
      PlayList(
          title: "Playlist 4",
          songs: songs,
          description: "Description 4",
          imageUrl: "assets/images/3.jpg"),
    ];
    update();
  }

  playSong() {
    audioPlayer.setAudioSource(ConcatenatingAudioSource(
        children: [AudioSource.uri(Uri.parse('asset:///${songs[0].url}'))]));
    Get.toNamed("/song");
  }

  Stream<SeekBarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
            position: position, duration: duration ?? Duration.zero);
      });
}
