import 'dart:async';
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final _controller = ApiVideoLiveStreamController(
    initialAudioConfig: AudioConfig(),
    initialVideoConfig: VideoConfig(
      bitrate: 2000 * 1000, // 2 Mbps
      resolution: Resolution.RESOLUTION_720,
      fps: 30,
    ),
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

  // loads the url from shared preferences
  Future<void> _loadRtmpUrl() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rtmpUrl = prefs.getString('rtmp_url') ?? 'rtmp://10.0.2.2:1935/live';
    });
  }

  // requests permissions and initializes the camera
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('RTMP URL is not set!')));
        }
        return;
      } else {
        await _controller.startStreaming(streamKey: "index", url: _rtmpUrl!);
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Stream'),
        actions: [
          if (_isStreaming)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  const Icon(Icons.circle, color: Colors.red, size: 12),
                  const SizedBox(width: 6),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.red.withValues(alpha: 0.9),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: !_isReady
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // Camera preview
                ApiVideoCameraPreview(controller: _controller),

                // Control overlay
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surface.withValues(alpha: 0.75),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: colorScheme.outlineVariant.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _isStreaming
                                    ? 'Streaming to: $_rtmpUrl'
                                    : 'Ready to start streaming',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              FilledButton.icon(
                                icon: Icon(
                                  _isStreaming ? Icons.stop : Icons.videocam,
                                ),
                                label: Text(
                                  _isStreaming
                                      ? 'Stop Streaming'
                                      : 'Start Streaming',
                                ),
                                style: FilledButton.styleFrom(
                                  backgroundColor: _isStreaming
                                      ? Colors.red
                                      : colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(52),
                                ),
                                onPressed: _toggleStream,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
