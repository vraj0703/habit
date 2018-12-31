import 'package:flutter/material.dart';
import 'package:habit/a_ui/_parent.dart';
import 'package:habit/utils/widgets/backdrop.dart';
import 'package:vector_math/vector_math_64.dart';
import 'dart:math';

class PageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PageHomeState();
}

class PageHomeState extends ParentPageState<PageHome> {
  final frontPanelVisible = ValueNotifier<bool>(true);

  get frontLayer => new Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      );

  get frontHeader => FrontPanelHeader();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Backdrop(
          panelVisible: frontPanelVisible,
          frontLayer: frontLayer,
          backLayer: BackPanel(frontPanelOpen: frontPanelVisible),
          frontHeader: frontHeader,
          frontPanelOpenHeight: 80,
          frontHeaderHeight: 24,
          frontHeaderVisibleClosed: true),
    );
  }
}

/*---------------------------------------------------------- back panel classes ------------------------------------------------*/
class BackPanel extends StatefulWidget {
  final ValueNotifier<bool> frontPanelOpen;

  BackPanel({@required this.frontPanelOpen});

  @override
  createState() => _BackPanelState();
}

class _BackPanelState extends ParentPageState<BackPanel> {
  bool panelOpen;
  Widget backPanelWidget;

  @override
  initState() {
    super.initState();
    panelOpen = widget.frontPanelOpen.value;
    widget.frontPanelOpen.addListener(_subscribeToValueNotifier);
  }

  @override
  void didChangeDependencies() {
    backPanelWidget = backPanelAdd();
    super.didChangeDependencies();
  }

  void _subscribeToValueNotifier() =>
      setState(() => panelOpen = widget.frontPanelOpen.value);

  /// Required for resubscribing when hot reload occurs
  @override
  void didUpdateWidget(BackPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.frontPanelOpen.removeListener(_subscribeToValueNotifier);
    widget.frontPanelOpen.addListener(_subscribeToValueNotifier);
  }

  Widget get appBar => Row(
        children: [
          Text(
            theme.strings.appName,
            style: Theme.of(context).textTheme.headline,
          ),
          Icon(
            Icons.settings,
            size: Theme.of(context).iconTheme.size,
            color: Theme.of(context).iconTheme.color,
          )
        ],
      );

  void changePanel(Widget panel) async {
    backPanelWidget = panel;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 100));
    if (widget.frontPanelOpen.value) {
      toggleFrontPanel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                changePanel(backPanelAdd());
              },
              icon: Icon(
                Icons.add,
                size: Theme.of(context).iconTheme.size,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                changePanel(backPanelGraph());
              },
              icon: Icon(
                Icons.show_chart,
                size: Theme.of(context).iconTheme.size,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                changePanel(backPanelSettings());
              },
              icon: Icon(
                Icons.settings,
                size: Theme.of(context).iconTheme.size,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
        title: Text(
          theme.strings.appName,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: new Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [backPanelWidget]),
      ),
    );
  }

  void toggleFrontPanel() {
    widget.frontPanelOpen.value = !widget.frontPanelOpen.value;
    setState(() {});
  }

  Widget backPanelSettings() {
    return new Container(
      child: new Text("settings"),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget backPanelAdd() {
    return new Container(
      child: new Text("add"),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget backPanelGraph() {
    return new Container(
      child: new Text("graph"),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

/*----------------------------------------------------------front panel classes--------------------------------------------------*/
class FrontPanelHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.keyboard_arrow_up)],
        ),
      ),
    );
  }
}
