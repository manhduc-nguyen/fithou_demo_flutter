import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  final String? name;
  final String? token;

  LoginData(this.name, this.token);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);

  @override
  List<Object?> get props => [
        name,
        token,
      ];
}
