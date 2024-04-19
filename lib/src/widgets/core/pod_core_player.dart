part of 'package:splayer/src/splayer.dart';


class _PodCoreVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerCtr;
  final double videoAspectRatio;
  final String tag;




  const _PodCoreVideoPlayer({
    required this.videoPlayerCtr,
    required this.videoAspectRatio,
    required this.tag,

  });


  @override
  State<_PodCoreVideoPlayer> createState() => _PodCoreVideoPlayerState();
}

class _PodCoreVideoPlayerState extends State<_PodCoreVideoPlayer> {
  VideoPlayerController get videoPlayerCtr=>widget.videoPlayerCtr;
  double get videoAspectRatio=>widget.videoAspectRatio;
  String get tag=>widget.tag;

  late PlayerNotifier notifier;
 /* void setBrightness(double value) {
    // Implement logic to adjust brightness on your platform (Android/iOS)
    ScreenBrightness().setScreenBrightness(value);
    print('Brightness set to $value');
  }*/

 /* void setVolume(double value) {
    // Implement logic to adjust volume on your platform (Android/iOS)

    print('Volume set to $value');
  }
  void _handleHorizontalDrag(DragUpdateDetails details) {
    final mediaQuery = MediaQuery.of(context);
    final dragWidth = mediaQuery.size.width;
    final dragPos = details.localPosition.dx;

    // Adjust brightness (left side of the screen)
    if (dragPos < dragWidth / 3) {
      _brightness += details.delta.dx / dragWidth;
      _brightness = _brightness.clamp(0.0, 1.0);
      setBrightness(_brightness);
    }

    // Adjust volume (right side of the screen)
    if (dragPos > 2 * dragWidth / 3) {
      _volume += details.delta.dx / dragWidth;
      _volume = _volume.clamp(0.0, 1.0);
      setVolume(_volume);
    }
  }*/

  TransformationController transformationController=TransformationController();

  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    print("PodController =>${podCtr.videoCtr!.value.isPlaying} & Live => ${podCtr.podPlayerConfig.isLive}");
    return Builder(
      builder: (ctrx) {

        return RawKeyboardListener(
          autofocus: true,
          focusNode:
          (podCtr.isFullScreen ? FocusNode() : podCtr.keyboardFocusWeb) ??
              FocusNode(),
          onKey: (value) => podCtr.onKeyBoardEvents(
            event: value,
            appContext: ctrx,
            tag: tag,
          ),
         child: Flexi(
           tag: tag,


             controller:FlexiController(
               transformationController: transformationController,
                 maxScale: 10,
                 zoomAndPan: true,

                 looping: podCtr.podPlayerConfig.isLooping,
                 autoPlay: podCtr.podPlayerConfig.autoPlay,
                 isLive:podCtr.podPlayerConfig.isLive,
                 autoInitialize: true,
                 showControlsOnInitialize: true,
                 customControls: CupertinoControls(tag: tag,backgroundColor: Colors.black, iconColor: Colors.white, playColor: Colors.red),
                 aspectRatio: 16/9,
                 isBrignessOptionDisplay: true,
                 allowedScreenSleep: false,
                 isVolumnOptionDisplay: true,
                 hideControlsTimer: const Duration(seconds: 3),
                 videoPlayerController: videoPlayerCtr)),

        );
      },
    );
  }
}
