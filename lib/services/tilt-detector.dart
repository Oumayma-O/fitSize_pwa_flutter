import 'dart:async';
import 'dart:html';

import '../pages/ScanEtape9Page.dart';


class TiltDetector {
  late Accelerometer accelerometer;
  late PhonePosition _currentPhonePosition;
  late Function(PhonePosition) onPhonePositionChanged;

  TiltDetector({required void Function(PhonePosition) this.onPhonePositionChanged}) {
    _initAccelerometer();
  }

  void _initAccelerometer() {
    try {
      accelerometer = Accelerometer();
      accelerometer
        ..addEventListener('reading', _handleAccelerometerReading)
        ..start();
    } catch (e) {
      print('Accelerometer not supported on this device.');
    }
  }

  void _handleAccelerometerReading(Event event) {
    num x = (event.target as Accelerometer).x ?? 0.0;
    num y = (event.target as Accelerometer).y ?? 0.0;
    num z = (event.target as Accelerometer).z ?? 0.0;

    _updatePhonePosition(x.toDouble(), y.toDouble(), z.toDouble());
  }

  void _updatePhonePosition(double x, double y, double z) {
    const tiltThreshold = 9.0; // Adjust this threshold as needed

    if (y > tiltThreshold) {
      _setCurrentPhonePosition(PhonePosition.TiltedTop);
    } else if (y < -tiltThreshold) {
      _setCurrentPhonePosition(PhonePosition.TiltedBottom);
    } else {
      _setCurrentPhonePosition(PhonePosition.WellPositioned);
    }
  }

  void _setCurrentPhonePosition(PhonePosition newPhonePosition) {
    if (_currentPhonePosition != newPhonePosition) {
      _currentPhonePosition = newPhonePosition;
      onPhonePositionChanged(_currentPhonePosition);

      // Print the phone position to the console
      print('Phone Position: $_currentPhonePosition');
    }
  }

  void dispose() {
    accelerometer.stop();
  }
}
