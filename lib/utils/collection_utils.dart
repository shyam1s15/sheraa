class CollectionUtil {
  static bool nonNullNonEmpty<T>(Iterable<T>? collection) {
    return collection != null && collection.isNotEmpty;
  }
  static bool nullOrEmpty<T>(Iterable<T>? collection) {
		return collection == null || collection.isEmpty;
	}
}
