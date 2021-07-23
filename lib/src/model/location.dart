/// [Location] of an error
class Location {
  Location({
    this.column,
    this.line,
  });

  int? column;
  int? line;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        column: json['column'],
        line: json['line'],
      );

  Map<String, dynamic> toJson() => {
        'column': column,
        'line': line,
      };
}
