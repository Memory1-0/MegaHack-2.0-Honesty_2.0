import 'package:flutter/material.dart';
import 'package:user/views/quiz_play.dart';
import 'package:user/views/videodemo.dart';

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 220.0,
            height: 220.0,
            //color: widget.itemColor,
            child: VideoDemo(),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          }, // main container for function
          feedback: Container(
            width: 120.0,
            height: 120.0,
            // color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: null,
            ),
          ),
        ));
  }
}
