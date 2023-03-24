import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myproject/feature/onboard/onboard_model.dart';
import 'package:myproject/feature/onboard/tab_indicator.dart';
import 'package:myproject/feature/product/widget/onBoard_card.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTile = "Skip";
  int _selectedIndex = 0;
  final String _start = "Start";
  final String _next = "Next";
  bool get _isLastPage =>
      _selectedIndex == OnBoardModels.onBoardItems.length - 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _incrementAndChange() {
    if (_isLastPage) {
      return;
    }
    _incrementSelectedPage();
  }

  void _incrementSelectedPage() {
    setState(() {
      _selectedIndex++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          TextButton(
            onPressed: (() {}),
            child: Text(_skipTile),
          ),
        ],
        leading: IconButton(
          onPressed: (() {}),
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.grey,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Expanded(
            child: _pageViewItem(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabIndicator(selectedIndex: _selectedIndex),
              _nextButton()
            ],
          )
        ],
      ),
    );
  }

  FloatingActionButton _nextButton() {
    return FloatingActionButton(
      onPressed: () {
        _incrementAndChange();
      },
      child: Text(_isLastPage ? _start : _next),
    );
  }
}

class _pageViewItem extends StatelessWidget {
  const _pageViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
      itemCount: OnBoardModels.onBoardItems.length,
    );
  }
}
