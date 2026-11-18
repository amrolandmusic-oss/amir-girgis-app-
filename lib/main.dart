
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const AmirGirgisApp());
}

class AmirGirgisApp extends StatelessWidget {
  const AmirGirgisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amir Girgis',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101010),
        colorScheme: const ColorScheme.dark(
          primary: Colors.redAccent,
        ),
      ),
      home: const MusicHome(),
    );
  }
}

class MusicHome extends StatefulWidget {
  const MusicHome({super.key});

  @override
  State<MusicHome> createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> {
  final player = AudioPlayer();

  final songs = [
    'ألقيت بألواني وحبري',
    'شوفلي حل - أمير جرجس',
  ];

  int current = 0;
  bool playing = false;

  Future<void> playSong(int index) async {
    final files = [
      'assets/music/ألقيت بألواني وحبري.mp3',
      'assets/music/شوفلي حل.mp3',
    ];

    try {
      await player.setAsset(files[index]);
      await player.play();
      setState(() {
        current = index;
        playing = true;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تعذر تشغيل الأغنية'),
        ),
      );
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AMIR GIRGIS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 85,
            backgroundColor: Colors.white10,
            child: Icon(
              Icons.music_note,
              size: 85,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'OFFICIAL MUSIC',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Music by Amir Girgis',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 35),
          const Divider(color: Colors.white24),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'MY SONGS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.music_note,
                    color: Colors.redAccent,
                  ),
                  title: Text(songs[index]),
                  trailing: IconButton(
                    icon: Icon(
                      current == index && playing
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      size: 35,
                      color: Colors.redAccent,
                    ),
                    onPressed: () async {
                      if (current == index && playing) {
                        await player.pause();
                        setState(() => playing = false);
                      } else {
                        await playSong(index);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
