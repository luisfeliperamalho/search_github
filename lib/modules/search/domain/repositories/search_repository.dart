import 'package:dartz/dartz.dart';
import 'package:meu_app/modules/search/domain/entities/result_search.dart';
import '../errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
