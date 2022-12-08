/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [Location] of an error
class Location {
  Location({
    this.column,
    this.line,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        column: json['column'],
        line: json['line'],
      );

  int? column;
  int? line;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'column': column,
        'line': line,
      };
}
