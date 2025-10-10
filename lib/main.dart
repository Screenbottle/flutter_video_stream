import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const VideoStreamApp());
}

class VideoStreamApp extends StatelessWidget {
  const VideoStreamApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Video Stream',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const StreamPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}

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

  final _rtmpUrl = 'rtmp://10.0.2.2:1935/stream';

  @override
  void initState() {
    super.initState();
    _initCamera();
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
      await _controller.startStreaming(streamKey: "abc", url: _rtmpUrl);
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

