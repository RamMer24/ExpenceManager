import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoSaver(),
    );
  }
}

class VideoSaver extends StatefulWidget {
  @override
  _VideoSaverState createState() => _VideoSaverState();
}

class _VideoSaverState extends State<VideoSaver> {
  final picker = ImagePicker();
  XFile? videoFile; // Change PickedFile to XFile
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset("assets/sample_video.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery); // Use pickVideo instead of getVideo

    setState(() {
      videoFile = pickedVideo;
      if (videoFile != null) {
        videoController?.dispose();
        videoController = VideoPlayerController.file(File(videoFile!.path))
          ..initialize().then((_) {
            setState(() {});
          });
      }
    });
  }

  Future<void> _saveVideo() async {
    if (videoFile != null) {
      final result = await GallerySaver.saveVideo(videoFile!.path);

      if (result != null && result) {
        // Video saved successfully
        print('Video saved to gallery');
      } else {
        // Error saving video
        print('Error saving video');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Saver'),
      ),
      body: Center(
        child: Container(
          height: 700,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (videoController != null && videoController!.value.isInitialized)
                AspectRatio(
                  aspectRatio: videoController!.value.aspectRatio,
                  child: VideoPlayer(videoController!),
                )
              else
                Text('No video selected'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickVideo,
                child: Text('Select Video'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveVideo,
                child: Text('Save Video to Gallery'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
