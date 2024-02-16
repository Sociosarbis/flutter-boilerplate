import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/load_state.dart';
import 'package:flutter_boilerplate/theme/bgm.dart';

class LoadMore extends StatefulWidget {
  final Future<bool> Function()? onLoad;

  final Widget child;

  final bool isAutoLoadMore;

  final bool isAllowLoading;

  const LoadMore(
      {super.key,
      this.onLoad,
      required this.child,
      this.isAllowLoading = true,
      this.isAutoLoadMore = true});

  @override
  State<StatefulWidget> createState() {
    return LoadMoreState();
  }
}

class LoadMoreState extends State<LoadMore> {
  late LoadState _loadState;

  var _extentAfter = double.infinity;

  @override
  void initState() {
    super.initState();
    _loadState = const LoadState.notLoading(endOfPaginationReached: false);
  }

  Future<void> _loadAction() async {
    if (!widget.isAutoLoadMore || !widget.isAllowLoading) {
      return;
    }
    if (_loadState.whenOrNull(notLoading: (endOfPaginationReached) {
          return !endOfPaginationReached;
        }) ??
        false) {
      await _invokeLoadMore();
    }
  }

  Future<void> _invokeLoadMore() async {
    try {
      setState(() {
        _loadState = const LoadState.loading();
      });
      final hasMore = await widget.onLoad?.call();
      setState(() {
        _loadState =
            LoadState.notLoading(endOfPaginationReached: hasMore ?? false);
      });
    } catch (e) {
      setState(() {
        _loadState = LoadState.err(error: e is Exception ? e : Exception());
      });
    }
  }

  Widget _buildLoadCompleteView() {
    final bgmTheme = Theme.of(context).extension<BgmThemeExtension>();
    return Text(
      "没有更多数据",
      style: TextStyle(color: bgmTheme?.darkerGrey),
    );
  }

  Widget _buildNotLoadingView() {
    final bgmTheme = Theme.of(context).extension<BgmThemeExtension>();
    return TextButton(
      onPressed: _invokeLoadMore,
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          textStyle: TextStyle(color: bgmTheme?.darkerGrey)),
      child: const Text("点击加载更多"),
    );
  }

  Widget _buildLoadFailView() {
    return TextButton(
      onPressed: _invokeLoadMore,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: const Text("加载失败，点击重试"),
    );
  }

  Widget _buildLoadingView() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(right: 4),
            child: SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                ))),
        Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "加载中...",
              style: TextStyle(fontSize: 14),
            ))
      ],
    );
  }

  Widget _buildLoadMoreView() {
    final theme = Theme.of(context);
    final bgmTheme = Theme.of(context).extension<BgmThemeExtension>();
    return Container(
        height: 40,
        alignment: Alignment.center,
        child: Theme(
            data: theme.copyWith(
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        minimumSize: Size.infinite,
                        foregroundColor: bgmTheme?.primary)),
                progressIndicatorTheme: theme.progressIndicatorTheme
                    .copyWith(color: bgmTheme?.primary)),
            child: _loadState.when(
                none: () {
                  return const SizedBox.shrink();
                },
                notLoading: (endOfPaginationReached) {
                  return endOfPaginationReached
                      ? _buildLoadCompleteView()
                      : _buildNotLoadingView();
                },
                loading: _buildLoadingView,
                err: (_) {
                  return _buildLoadFailView();
                })));
  }

  Widget? _buildListView() {
    final listView = widget.child;
    if (listView is! ListView) {
      return null;
    }
    final delegate = listView.childrenDelegate;
    if (delegate is SliverChildBuilderDelegate) {
      final viewCount = (delegate.estimatedChildCount ?? 0) + 1;
      return ListView.builder(
        itemBuilder: (context, index) {
          if (index == viewCount - 1) {
            return _buildLoadMoreView();
          }
          return delegate.builder(context, index);
        },
        addAutomaticKeepAlives: delegate.addAutomaticKeepAlives,
        addRepaintBoundaries: delegate.addRepaintBoundaries,
        addSemanticIndexes: delegate.addSemanticIndexes,
        dragStartBehavior: listView.dragStartBehavior,
        semanticChildCount: listView.semanticChildCount,
        itemCount: viewCount,
        cacheExtent: listView.cacheExtent,
        controller: listView.controller,
        itemExtent: listView.itemExtent,
        key: listView.key,
        padding: listView.padding,
        physics: listView.physics,
        primary: listView.primary,
        reverse: listView.reverse,
        scrollDirection: listView.scrollDirection,
        shrinkWrap: listView.shrinkWrap,
      );
    } else if (delegate is SliverChildListDelegate) {
      return ListView(
        children: [...delegate.children, _buildLoadMoreView()],
        addAutomaticKeepAlives: delegate.addAutomaticKeepAlives,
        addRepaintBoundaries: delegate.addRepaintBoundaries,
        cacheExtent: listView.cacheExtent,
        controller: listView.controller,
        itemExtent: listView.itemExtent,
        key: listView.key,
        padding: listView.padding,
        physics: listView.physics,
        primary: listView.primary,
        reverse: listView.reverse,
        scrollDirection: listView.scrollDirection,
        shrinkWrap: listView.shrinkWrap,
        addSemanticIndexes: delegate.addSemanticIndexes,
        dragStartBehavior: listView.dragStartBehavior,
        semanticChildCount: listView.semanticChildCount,
      );
    }
    return listView;
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (_extentAfter >= 40 && notification.metrics.extentAfter < 40) {
      _loadAction();
    }

    _extentAfter = notification.metrics.extentAfter;

    return false;
  }

  Widget? _buildCustomScrollView() {
    final listView = widget.child;
    if (listView is! CustomScrollView) {
      return null;
    }
    return CustomScrollView(
      physics: listView.physics,
      controller: listView.controller,
      slivers: [
        ...listView.slivers,
        SliverToBoxAdapter(
          child: _buildLoadMoreView(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: _buildListView() ??
            _buildCustomScrollView() ??
            const SizedBox.shrink());
  }
}
