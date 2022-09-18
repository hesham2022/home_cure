import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as localView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as remoteView;
import 'package:flutter/material.dart';

const appId = '28e8f388feda4fdc998971a43e355b81';
const appCertificate = 'c18579944eae4eff9fa5319efa391c38';

class VideoPage extends StatefulWidget {
  const VideoPage({
    super.key,
    this.channelName,
    this.role = ClientRole.Broadcaster,
    required this.token,
  });
  final String? channelName;
  final ClientRole? role;
  final String token;
  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final users = <int>[];
  final infoStrings = <String>[];
  bool muted = false;
  bool viewPanle = false;
  late RtcEngine engine;
  @override
  void initState() {
    intialze();
    super.initState();
  }

  @override
  void dispose() {
    users.clear();
    engine
      ..leaveChannel()
      ..destroy();
    super.dispose();
  }

  Future<void> intialze() async {
    if (appId.isEmpty) {
      setState(() {
        infoStrings
          ..add('App Id is empty')
          ..add('engine not starting');
      });
      return;
    }
    engine = await RtcEngine.create(appId);
    await engine.enableVideo();

    await engine.enableAudio();
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await engine.setClientRole(widget.role!);
    addAgoraEventHandler();
    final configuration = VideoEncoderConfiguration()
      ..dimensions = const VideoDimensions(width: 1920, height: 1088);
    await engine.setVideoEncoderConfiguration(configuration);
    await engine.joinChannel(widget.token, widget.channelName!, null, 0);
  }

  void addAgoraEventHandler() {
    engine.setEventHandler(
      RtcEngineEventHandler(
        error: (err) {
          setState(() {
            final info = 'Error i s $err';
            infoStrings.add(info);
          });
        },
        joinChannelSuccess: (channel, uid, elapsed) {
          setState(() {
            final info = 'success to join channel $channel uid $uid';
            infoStrings.add(info);
          });
        },
        leaveChannel: (stats) {
          setState(() {
            const info = 'leave channel';
            users.clear();
            infoStrings.add(info);
          });
        },
        userJoined: (uid, elapsed) {
          setState(() {
            const info = 'User Joined';
            infoStrings.add(info);
            users.add(uid);
          });
        },
        userOffline: (uid, reason) {
          setState(() {
            final info = 'User offlie $uid';
            infoStrings.add(info);
            users.remove(uid);
          });
        },
      ),
    );
  }

  Widget rowViews() {
    final list = <StatefulWidget>[];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(const localView.SurfaceView());
    }
    for (final i in users) {
      list.add(
        remoteView.SurfaceView(
          uid: i,
          channelId: widget.channelName!,
        ),
      );
    }
    final views = list;
    return Column(
      children: List.generate(
        views.length,
        (index) => Expanded(
          child: list[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora'),
        centerTitle: true,
      ),
      body: rowViews(),
    );
  }
}
