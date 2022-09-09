import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/models/Explore/inheriteddataprovider.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:food_app/my_flutter_app_icons1.dart';
import 'package:ternav_icons/ternav_icons.dart';

class BottomBar extends StatefulWidget {
  Widget child;
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
  late TabController tabController;
  ScrollController bottomScrollcontroller = ScrollController();
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isScrollingDown = false;
  bool isOnTop = true;
  @override
  void initState() {
    scroll();
    super.initState();
    tabController = TabController(length: 4, vsync: this);
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
    return Scaffold(
      body: Stack(
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
                          color: Theme.of(context).primaryColor,
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            icon: Icon(
                              Icons.arrow_upward,
                              color: Theme.of(context).backgroundColor,
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
                          child: DefaultTabController(
                            length: 4,
                            initialIndex: 0,
                            child: TabBar(
                              controller: tabController,
                              splashBorderRadius: BorderRadius.circular(20),
                              onTap: ((value) {
                                setState(() {
                                  tabController.index = value;
                                  widget.bottomtabcontroller.index =
                                      tabController.index;
                                });
                              }),
                              indicatorWeight: 10,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    width: 4,
                                    color: widget.bottomtabcontroller.index == 0
                                        ? widget.selectedColor
                                        : widget.bottomtabcontroller.index == 1
                                            ? widget.selectedColor
                                            : widget.bottomtabcontroller
                                                        .index ==
                                                    2
                                                ? widget.selectedColor
                                                : widget.bottomtabcontroller
                                                            .index ==
                                                        3
                                                    ? widget.selectedColor
                                                    : widget.unselectedColor),
                              ),
                              tabs: [
                                Tab(
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      TernavIcons.light.home,
                                      color:
                                           widget.unselectedColor,
                                    ),
                                  ),
                                ),
                                Tab(
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      TernavIcons.bold.heart,
                                      color:
                                           widget.unselectedColor,
                                    ),
                                  ),
                                ),
                                Tab(
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      TernavIcons.bold.cart,
                                      color: widget.unselectedColor
                                          
                                    ),
                                  ),
                                ),
                                Tab(
                                  iconMargin: EdgeInsets.only(bottom: 0),
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      TernavIcons.bold.wallet,
                                      color: widget.unselectedColor
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )))
        ],
      ),
    );
  }
}
