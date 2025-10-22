import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _ipController = TextEditingController();
  final _streamKeyController = TextEditingController();
  String _selectedIPOption = 'Custom';
  bool _isTesting = false;

  // The IP address needs to be formatted differently based on the environment, the Outside Network option should work universally (no i am not uploading my real IP address to GitHub)
  final List<Map<String, String>> _presets = [
    {'label': 'Local Emulator (Android)', 'value': 'rtmp://10.0.2.2:1935/live'},
    {'label': 'Local Emulator (iOS)', 'value': 'rtmp://127.0.0.1:1935/live'},
    {'label': 'Local Network', 'value': 'rtmp://192.168.0.30:1935/live'},
    {'label': 'Outside Network', 'value': 'rtmp://your-ip-address:1935/live'},
    {'label': 'Custom', 'value': ''},
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedUrl();
    _loadSavedStreamKey();
  }

  Future<void> _loadSavedUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUrl = prefs.getString('rtmp_url') ?? 'rtmp://10.0.2.2:1935/live';
    _ipController.text = savedUrl;

    final matchedPreset = _presets.firstWhere(
      (preset) => preset['value'] == savedUrl,
      orElse: () => {'label': 'Custom', 'value': ''},
    );
    setState(() => _selectedIPOption = matchedPreset['label']!);
  }

  Future<void> _saveUrl() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('rtmp_url', _ipController.text);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('RTMP URL saved successfully!')),
    );
  }

  void _onPresetChanged(String? newValue) {
    if (newValue == null) return;

    setState(() {
      _selectedIPOption = newValue;
      final selectedPreset = _presets.firstWhere(
        (preset) => preset['label'] == newValue,
      );
      _ipController.text = selectedPreset['value'] ?? '';
    });
  }

  // test connection to the server, lets the user easily test the connection without having to start the stream
  Future<void> _testConnection() async {
    final url = _ipController.text.trim();
    if (!url.startsWith('rtmp://')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid RTMP URL.')),
      );
      return;
    }

    final uri = Uri.tryParse(url);
    if (uri == null || uri.host.isEmpty || uri.port == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid RTMP URL format.')));
      return;
    }

    setState(() => _isTesting = true);

    try {
      final socket = await Socket.connect(
        uri.host,
        uri.port,
        timeout: const Duration(seconds: 3),
      );
      socket.destroy();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('RTMP server is reachable!'),
          backgroundColor: Colors.green,
        ),
      );
    } on SocketException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to connect to RTMP server.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isTesting = false);
    }
  }

  // Handling for custom streamkeys
  Future<void> _loadSavedStreamKey() async {
    final prefs = await SharedPreferences.getInstance();
    final savedStreamKey = prefs.getString('rtmp_stream_key') ?? 'index';
    _streamKeyController.text = savedStreamKey;
  }

  Future<void> _saveStreamKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('rtmp_stream_key', _streamKeyController.text);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('RTMP Stream Key saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'RTMP Server Configuration',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _selectedIPOption,
              decoration: const InputDecoration(
                labelText: 'Select a Preset',
                border: OutlineInputBorder(),
              ),
              items: _presets
                  .map(
                    (preset) => DropdownMenuItem(
                      value: preset['label'],
                      child: Text(preset['label']!),
                    ),
                  )
                  .toList(),
              onChanged: _onPresetChanged,
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _ipController,
              decoration: const InputDecoration(
                labelText: 'RTMP Server URL',
                hintText: 'e.g. rtmp://your-server-ip:1935/live',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.link),
              ),
              enabled: _selectedIPOption == 'Custom',
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _saveUrl,
                    icon: const Icon(Icons.save),
                    label: const Text('Save Settings'),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _isTesting ? null : _testConnection,
                    icon: const Icon(Icons.wifi_tethering),
                    label: _isTesting
                        ? const Text('Testing...')
                        : const Text('Test Connection'),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            TextField(
              controller: _streamKeyController,
              decoration: const InputDecoration(
                labelText: 'RTMP Stream Key',
                hintText: 'e.g. index',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.vpn_key),
              ),
            ),

            const SizedBox(height: 30),

            FilledButton.icon(
              onPressed: _saveStreamKey,
              icon: const Icon(Icons.save),
              label: const Text('Save Stream Key'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
