class Pair<F, S> {
  final F _first;
  final S _second;
  const Pair(this._first, this._second);

  F getFirst() {
    return this._first;
  }

  S getSecond() {
    return this._second;
  }

  @override
  String toString() {
    return 'Pair($_first, $_second)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pair &&
        (other.getFirst() == this._first &&
            other.getSecond() == this.getSecond());
  }

  @override
  int get hashCode {
    return this._first.hashCode + this._second.hashCode;
  }
}
