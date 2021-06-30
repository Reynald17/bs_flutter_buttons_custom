import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
import 'package:flutter/material.dart';

/// Class to handle all overlay of [BsDropdownMenu]
class BsOverlay {
  /// define overlay entry of [BsDropdownMenu]
  static List<BsOverlayEntry> overlays = [];

  /// add overlay entry when selectbox opened
  static BsOverlayEntry add(OverlayEntry overlayEntry, VoidCallback close) {
    BsOverlayEntry bsOverlayEntry =
    BsOverlayEntry(overlays.length, close, overlayEntry);
    overlays.add(bsOverlayEntry);

    return bsOverlayEntry;
  }

  /// get spesific data overlay
  static BsOverlayEntry get(int index) {
    return overlays[index];
  }

  /// remove all opened overlay in context
  static void removeAll() {
    overlays.map((overlay) {
      overlay.overlayEntry.remove();
      overlay.close();
    }).toList();
    overlays.clear();
  }
}

/// Class overlay entry of [BsDropdownMenu]
class BsOverlayEntry {
  /// Constructor [BsOverlayEntry]
  const BsOverlayEntry(this.index, VoidCallback close, this.overlayEntry)
      : _close = close;

  /// index position of overlay entry
  final int index;

  final VoidCallback _close;

  /// overlay entry of context
  final OverlayEntry overlayEntry;

  /// Close callback
  void close() => _close();
}