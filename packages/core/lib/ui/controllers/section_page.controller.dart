import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:async/async.dart';

import 'package:fastyle_core/fastyle_core.dart';

class FastSectionPageController extends StatefulWidget {
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder loadedBuilder;
  final WidgetBuilder? errorBuilder;
  final Future<bool>? loadingFuture;
  final Duration? loadingTimeout;

  FastSectionPageController({
    Key? key,
    required this.loadedBuilder,
    this.loadingBuilder,
    this.loadingTimeout,
    this.loadingFuture,
    this.errorBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSectionPageControllerState();
}

class _FastSectionPageControllerState extends State<FastSectionPageController> {
  final PublishSubject<SectionPageLoadEvent> eventController =
      PublishSubject<SectionPageLoadEvent>();

  CancelableOperation<bool>? _cancellableLoadingOperation;
  Future<bool>? loadingFuture;
  bool hasError = false;
  late bool isLoading;
  bool? isLoaded;

  @override
  void initState() {
    super.initState();

    isLoading = widget.loadingFuture != null;
    isLoaded = !isLoading;
    _listenToLoadEvents();
    _listenToLoadingFutureIfNeeded();
  }

  @override
  void didUpdateWidget(FastSectionPageController oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.loadingFuture != widget.loadingFuture) {
      isLoading = widget.loadingFuture != null;
      isLoaded = !isLoading;
      _listenToLoadingFutureIfNeeded();
    }
  }

  @override
  void dispose() {
    eventController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: isLoading
          ? _buildLoadingWidget()
          : hasError
              ? _buildErrorWidget()
              : widget.loadedBuilder,
    );
  }

  WidgetBuilder _buildLoadingWidget() {
    return widget.loadingBuilder ??
        ((BuildContext context) => FastThreeBounceIndicator());
  }

  WidgetBuilder _buildErrorWidget() {
    return widget.errorBuilder ?? ((BuildContext context) => Container());
  }

  void _listenToLoadingFutureIfNeeded() {
    if (widget.loadingFuture != null) {
      if (_cancellableLoadingOperation != null) {
        _cancellableLoadingOperation!.cancel();
      }

      loadingFuture = widget.loadingTimeout != null
          ? widget.loadingFuture!.timeout(widget.loadingTimeout!)
          : widget.loadingFuture;

      _cancellableLoadingOperation = CancelableOperation<bool>.fromFuture(
        loadingFuture!,
      );

      _cancellableLoadingOperation!.value
          .then((bool isLoaded) => _dispatchLoadEvent(hasError: !isLoaded))
          .catchError((_) => _dispatchLoadEvent(hasError: true));
    }
  }

  void _dispatchLoadEvent({bool hasError = false}) {
    if (!eventController.isClosed) {
      eventController.sink.add(
        hasError ? SectionPageLoadEvent.error : SectionPageLoadEvent.loaded,
      );
    }
  }

  void _listenToLoadEvents() {
    eventController.listen((SectionPageLoadEvent event) {
      if (event == SectionPageLoadEvent.error) {
        setState(() {
          isLoading = false;
          isLoaded = false;
          hasError = true;
        });
      } else {
        setState(() {
          isLoading = false;
          isLoaded = true;
          hasError = false;
        });
      }
    });
  }
}
