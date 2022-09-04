import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/models/Explore/inheriteddataprovider.dart';
import 'package:food_app/my_flutter_app_icons1.dart';

class BottomBar extends StatefulWidget {
  final Widget child;
  final double end;
  final double start;
  TabController bottomtabcontroller;
  int currentPage;
  final Color barcolor;
  final Color unselectedColor;
  final Color selectedColor;
  BottomBar(
      {Key? key,
      required this.child,
      required this.end,
      required this.start,
      required this.currentPage,
      required this.bottomtabcontroller,
      required this.barcolor,
      required this.unselectedColor,
      required this.selectedColor})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  ScrollController bottomScrollcontroller = ScrollController();
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isScrollingDown = false;
  bool isOnTop = true;
  @override
  void initState() {
    scroll();
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0, widget.end), end: Offset.zero)
            .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn))
          ..addListener(() {
            if (mounted) {
              setState(() {});
            }
          });
    _controller.forward();
  }

  void showBottomBar() {
    if (mounted) {
      setState(() {
        _controller.forward();
      });
    }
  }

  void hideBottomBar() {
    if (mounted) {
      setState(() {
        _controller.reverse();
      });
    }
  }

  Future<void> scroll() async {
    bottomScrollcontroller.addListener(() {
      if (bottomScrollcontroller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          isOnTop = false;
          hideBottomBar();
        }
      }
      if (bottomScrollcontroller.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          isOnTop = true;
          showBottomBar();
        }
      }
    });
  }

  @override
  void dispose() {
    bottomScrollcontroller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          InheritedDataProvider(
              child: widget.child,
              InheritedScrollcontroller: bottomScrollcontroller),
          Positioned(
              bottom: widget.start,
              child: AnimatedContainer(
                  width: isOnTop == true ? 0 : 60,
                  height: isOnTop == true ? 0 : 60,
                  curve: Curves.easeIn,
                  duration: Duration(
                    milliseconds: 200,
                  ),
                  child: ClipOval(
                    child: Material(
                        color: Colors.transparent,
                        child: Container(
                          color: Theme.of(context).primaryColorLight,
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            icon: Icon(
                              Icons.arrow_upward,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              bottomScrollcontroller
                                  .animateTo(
                                      bottomScrollcontroller
                                          .position.minScrollExtent,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn)
                                  .then(
                                (value) {
                                  if (mounted) {
                                    setState(() {
                                      isOnTop = true;
                                      isScrollingDown = false;
                                    });
                                  }
                                  showBottomBar();
                                },
                              );
                            },
                          )),
                        )),
                  ))),
          Positioned(
              bottom: widget.start,
              child: SlideTransition(
                  position: _offsetAnimation,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(500)),
                      child: Material(
                          color: widget.barcolor,
                          child: TabBar(
                            onTap: (value) {
                              setState(() {
                                widget.bottomtabcontroller.index = value;
                              });
                            },
                            indicatorWeight: 10,
                            indicatorPadding:
                                const EdgeInsets.fromLTRB(6, 0, 6, 0),
                            controller: widget.bottomtabcontroller,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(2)),
                            indicatorColor: widget.bottomtabcontroller.index ==
                                    widget.currentPage
                                ? widget.selectedColor
                                : widget.unselectedColor,
                            tabs: [
                              SizedBox(
                                height: 45,
                                width: 30,
                                child: Icon(
                                  MyFlutterApp1.account_balance_wallet,
                                  color: widget.bottomtabcontroller.index == 0
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                width: 30,
                                child: Icon(
                                  MyFlutterApp1.account_balance_wallet,
                                  color: widget.bottomtabcontroller.index == 1
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                width: 30,
                                child: Icon(
                                  MyFlutterApp1.account_balance_wallet,
                                  color: widget.bottomtabcontroller.index == 2
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                width: 30,
                                child: Icon(
                                  MyFlutterApp1.account_balance_wallet,
                                  color: widget.bottomtabcontroller.index == 3
                                      ? widget.selectedColor
                                      : widget.unselectedColor,
                                ),
                              ),
                            ],
                          )),
                    ),
                  )))
        ],
      ),
    );
  }
}
