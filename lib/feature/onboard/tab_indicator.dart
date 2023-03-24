import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myproject/feature/onboard/onboard_model.dart';

class TabIndicator extends StatefulWidget {
  final int selectedIndex;
  const TabIndicator({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  /*Parent widget 'ta bir state değişikliği varsa bununla ilgili olarak state değişikliği yapılması 
  gereken subWidget 'lar için kullanırız. Widget aynı runtime 'da rebuilt edilir. 
  Bu metottan sonra her zaman build() metodu çağırılarak widget tekrar oluşturulur. */
  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: OnBoardModels.onBoardItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
    );
  }
}
