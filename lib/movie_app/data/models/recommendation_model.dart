import '../../domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath:
            json['backdrop_path'] ?? '/wD2kUCX1Bb6oeIb2uz7kbdfLP6k.jpg',
        id: json['id'],
      );
}
