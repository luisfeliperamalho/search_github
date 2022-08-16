import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_app/modules/search/domain/entities/result_search.dart';
import 'package:meu_app/modules/search/domain/errors/errors.dart';
import 'package:meu_app/modules/search/domain/repositories/search_repository.dart';
import 'package:meu_app/modules/search/domain/usecases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(''))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));
    final result = await usecase("luis");
    expect(result, isA<List<ResultSearch>>());
  });

  test('deve retornar um exception caso o texto seja invalido', () async {
    when(repository.search(''))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));
    var result = await usecase("");

    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
