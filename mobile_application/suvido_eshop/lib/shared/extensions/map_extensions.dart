extension MapX<T, K> on Map<T, K> {
  Map<T, K> insert({
    Map<T, K>? other = const {},
    bool override = true,
  }) {
    if (other != null) {
      if (override) {
        addAll(other);
      } else {
        other.forEach((key, value) {
          if (!containsKey(key)) {
            addAll({key: value});
          }
        });
      }
    }

    return this;
  }
}
