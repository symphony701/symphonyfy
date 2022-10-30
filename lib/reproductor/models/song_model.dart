class Song {
  String? _name;
  String? _author;
  String? _source;
  String? _cover;

  Song(
      {required String name,
      required String author,
      required String source,
      required String cover}) {
    _name = name;
    _author = author;
    _source = source;
    _cover = cover;
  }

  String get name => _name!;
  String get author => _author!;
  String get source => _source!;
  String get cover => _cover!;
}
