 ```dart
   final stream =
       Stream<int>.periodic(const Duration(seconds: 1), (count) => count)
          .take(10);
  
   final broadcastStream = stream.asBroadcastStream(
     onCancel: (controller) {
      print('Stream paused');
     controller.pause();
   },
   onListen: (controller) async {
     if (controller.isPaused) {
       print('Stream resumed');
        controller.resume();
       }
     },
   );
  
   final oddNumberStream = broadcastStream.where((event) => event.isOdd);
   final oddNumberListener = oddNumberStream.listen(
         (event) {
       print('Odd: $event');
     },
     onDone: () => print('Done'),
   );
  
   final evenNumberStream = broadcastStream.where((event) => event.isEven);
   final evenNumberListener = evenNumberStream.listen((event) {
     print('Even: $event');
   }, onDone: () => print('Done'));
  
   await Future.delayed(const Duration(milliseconds: 3500)); // 3.5 second
   // Outputs:
   // Even: 0
   // Odd: 1
   // Even: 2
   oddNumberListener.cancel(); // Nothing printed.
   evenNumberListener.cancel(); // "Stream paused"
   await Future.delayed(const Duration(seconds: 2));
   print(await broadcastStream.first); // "Stream resumed"
  /// // Outputs:
  /// // 3
```