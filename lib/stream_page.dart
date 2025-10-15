import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final _controller = ApiVideoLiveStreamController(
    initialAudioConfig: AudioConfig(),
    initialVideoConfig: VideoConfig.withDefaultBitrate(),
  );
  bool _isStreaming = false;
  bool _isReady = false;

  String? _rtmpUrl;

  @override
  void initState() {
    super.initState();
    _loadRtmpUrl();
    _initCamera();
  }

  Future<void> _loadRtmpUrl() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rtmpUrl = prefs.getString('rtmp_url') ?? 'rtmp://10.0.2.2:1935/stream';
    });
  }

  Future<void> _initCamera() async {
    await [Permission.camera, Permission.microphone].request();
    await _controller.initialize();
    setState(() => _isReady = true);
  }

  Future<void> _toggleStream() async {
    if (_isStreaming) {
      await _controller.stopStreaming();
    } else {
      if (_rtmpUrl == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('RTMP URL is not set!')),
          );
        }
        return;
      }
      else {
        await _controller.startStreaming(streamKey: "abc", url: _rtmpUrl!);
      }
    }
    setState(() => _isStreaming = !_isStreaming);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Live Stream')),
      body: !_isReady
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                ApiVideoCameraPreview(controller: _controller),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton.extended(
                      onPressed: _toggleStream,
                      label: Text(
                        _isStreaming ? 'Stop Streaming' : 'Start Streaming',
                      ),
                      icon: Icon(_isStreaming ? Icons.stop : Icons.videocam),
                      backgroundColor: _isStreaming ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}