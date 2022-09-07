class GameDtoUtils {
  GameDtoUtils._(); //private constructor

  static List<String?> getPlatforms(List<dynamic> list) {
    final values = <String?>[];
    for (final l in list) {
      values.add(l['name']);
    }
    return values;
  }

  static String getImage(List<dynamic> list) {
    try {
      if (list.isNotEmpty) {
        final url = list.first['url'];
        return url;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static List<String?> getGenres(List<dynamic> list) {
    final values = <String?>[];
    for (final l in list) {
      values.add(l['name']);
    }
    return values;
  }
}
