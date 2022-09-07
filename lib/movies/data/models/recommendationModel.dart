import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({ super.backDropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String,dynamic>json)=>RecommendationModel(
      backDropPath: json['backdrop_path']??'/poec6RqOKY9iSiIUmfyfPfiLtvB.jpg',
      id: json['id']);
}
