import 'package:flutter/widgets.dart';
import 'transition.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/utils/hooks/useLifeStyle.dart';
import 'package:flutter_boilerplate/utils/DelayTask.dart';

class FadeOut extends StatefulHookWidget {
  final bool isEnter;
  final bool isLock;
  final Widget Function(BuildContext, bool) builder;
  final int stayStillDuration;
  final int enterDuration;
  final int leaveDuration;
  const FadeOut(
      {Key? key,
      required this.isEnter,
      required this.builder,
      this.isLock = false,
      this.stayStillDuration = 1000,
      this.enterDuration = 100,
      this.leaveDuration = 200})
      : super(key: key);

  @override
  _FadeOutState createState() => _FadeOutState();
}

class _FadeOutState extends State<FadeOut> {
  @override
  Widget build(context) {
    final delayTask = useLifeStyle(() {
      return DelayTask(widget.stayStillDuration);
    }, (DelayTask task) {
      task.cancel();
    });
    final isEnter = useState(false);
    useEffect(() {
      if (widget.isEnter) {
        delayTask?.cancel();
        isEnter.value = widget.isEnter;
      } else {
        if (!widget.isLock) {
          final _isEnter = widget.isEnter;
          delayTask?.run(() {
            isEnter.value = _isEnter;
          });
        } else delayTask?.cancel();
      }
      return () {};
    }, [widget.isEnter, widget.isLock]);
    return Transition(
        isEnter: isEnter.value,
        enterDuration: widget.enterDuration,
        leaveDuration: widget.leaveDuration,
        builder: (_, value) {
          return Opacity(
              opacity: value, child: widget.builder(context, isEnter.value));
        });
  }
}
