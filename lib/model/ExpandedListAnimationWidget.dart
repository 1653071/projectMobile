import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  final Widget child;

  final bool expand;
  final bool isOwnUser;
  ExpandedSection({this.expand = false, this.child,this.isOwnUser });

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override


  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: Container(

          padding: EdgeInsets.only(bottom: 5),
          constraints: BoxConstraints(
            //minHeight: 100,
              minWidth: double.infinity,
              maxHeight: double.infinity),
          child: Padding(padding: const EdgeInsets.only(bottom: 5), child: widget.child),
        ));
  }
}