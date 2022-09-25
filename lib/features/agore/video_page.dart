import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as localView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as remoteView;
import 'package:flutter/material.dart';

const APP_ID = '28e8f388feda4fdc998971a43e355b81';
String Token =
    '007eJxTYFAQ3SvwLuaC/7ntTxnybjy2nSceN9Nk9wnTd8p/Pm56E8GvwJBkbJ6UampkbpRkZmRiYGGSmGaRam5qZmCaaGmclmiZrFGhkbz0pGbymdJORkYGCATxWRiMDIwMGRgArykhZg==';
const role = ClientRole.Broadcaster;
String channelName2 = '2021';

class Call extends StatefulWidget {
  const Call({
    super.key,
    required this.uid,
    required this.token,
    required this.channelName,
  });
  final int uid;
  final String token;
  final String channelName;
  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  final users = <int>[];
  final infoStrings = <String>[];
  bool muted = false;
  bool viewPanle = false;
  late RtcEngine engine;
  @override
  void initState() {
    print('token is ${widget.token}');
    print('uid is ${widget.uid}');
    intialze();
    super.initState();
  }

  @override
  void dispose() {
    users.clear();
    engine.leaveChannel();
    engine.destroy();
    super.dispose();
  }

  Future<void> intialze() async {
    if (APP_ID.isEmpty) {
      setState(() {
        infoStrings.add('App Id is empty');
        infoStrings.add('engine not starting');
      });
      return;
    }
    engine = await RtcEngine.create(APP_ID);
    await engine.enableVideo();

    await engine.enableAudio();
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await engine.setClientRole(ClientRole.Broadcaster);
    addAgoraEventHandler();
    final configuration = VideoEncoderConfiguration();
    configuration.dimensions = const VideoDimensions(width: 1920, height: 1088);
    await engine.setVideoEncoderConfiguration(configuration);
    await engine.joinChannel(
      widget.token,
      widget.channelName,
      null,
      widget.uid,
    );
  }

  // ignore: always_declare_return_types, type_annotate_public_apis
  void addAgoraEventHandler() {
    engine.setEventHandler(
      RtcEngineEventHandler(
        error: (err) {
          setState(() {
            final info = 'Error i s $err';
            print(info);
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
    if (role == ClientRole.Broadcaster) {
      list.add(const localView.SurfaceView());
    }
    for (final i in users) {
      list.add(
        remoteView.SurfaceView(
          uid: i,
          channelId: widget.channelName,
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
