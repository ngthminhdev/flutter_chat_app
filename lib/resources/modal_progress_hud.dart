library modal_progress_hud;

import 'package:flutter/material.dart';
import 'package:mc_application/core/widgets/loading/loading_widget.dart';

///
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [inAsyncCall]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The progress indicator can be positioned using [offset] otherwise it is
/// centered
///
/// The modal barrier can be dismissed using [dismissible]
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
/// HUD=Heads Up Display
///
class ModalProgressHUD extends StatefulWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Offset? offset;
  final bool dismissible;
  final Widget child;
  final Widget? progressIndicator;
  ModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator,
    this.offset,
    this.dismissible = false,
    required this.child,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        super(key: key);

  @override
  _ModalProgressHUDState createState() => _ModalProgressHUDState();
}

class _ModalProgressHUDState extends State<ModalProgressHUD> {
  Widget _progressIndicator = Loading();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(widget.child);
    if (widget.inAsyncCall) {
      Widget layOutProgressIndicator;
      if (widget.offset == null)
        layOutProgressIndicator = Center(
            child: (widget.progressIndicator != null)
                ? widget.progressIndicator!
                : _progressIndicator);
      else {
        layOutProgressIndicator = Positioned(
          child: (widget.progressIndicator != null)
              ? widget.progressIndicator!
              : _progressIndicator,
          left: widget.offset!.dx,
          top: widget.offset!.dy,
        );
      }
      final modal = [
        new Opacity(
          child: new ModalBarrier(
              dismissible: widget.dismissible, color: widget.color),
          opacity: widget.opacity,
        ),
        layOutProgressIndicator
      ];
      widgetList += modal;
    }
    return new Stack(
      children: widgetList,
    );
  }
}
