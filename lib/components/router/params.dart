class AppParams {
  final Map<String, _ParamValue> _params;
  AppParams({Map<String, _ParamValue>? params})
      : _params = params ?? <String, _ParamValue>{};

  List<String> get keys => _params.keys.toList();

  _ParamValue? operator [](String key) => _params[key];

  void addAll(Map<String, String> other) => _params
      .addAll(other.map((key, value) => MapEntry(key, _ParamValue(value))));
  
  Map<String, String> asStringMap() {
    return _params.map((key, value) => MapEntry(key, value.toString()));
  }

  AppParams copyWith() => AppParams(params: Map.from(_params));
  void updateParams(AppParams newParams) {
    final newKeys = newParams.keys;
    final keys = this.keys;
    for (final key in keys) {
      if (!newKeys.contains(key)) {
        _params.remove(key);
      }
    }
    for (final key in newKeys) {
      if (keys.contains(key)) {
        _params[key] = _params[key]!.copyWith(value: newParams[key]!.value);
      } else {
        _params[key] = newParams[key]!;
      }
    }
  }
}

class _ParamValue {
  final Object? _value;
  _ParamValue(this._value);

  Object? get value => _value;

  _ParamValue copyWith({Object? value}) {
    return _ParamValue(value ?? _value);
  }

  @override
  String toString() {
    return _value?.toString() ?? 'null';
  }
}
