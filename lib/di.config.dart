// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/Api/api_manager.dart' as _i795;
import 'core/net/internet_checker.dart' as _i921;
import 'features/main_Layout/Browse/data/dataSources/local/GetMoviesBrawserLocalDs.dart'
    as _i9;
import 'features/main_Layout/Browse/data/dataSources/local/GetMoviesBrawserLocalDsImpl.dart'
    as _i912;
import 'features/main_Layout/Browse/data/dataSources/remote/getMoviesBrawserDs.dart'
    as _i695;
import 'features/main_Layout/Browse/data/dataSources/remote/GetMoviesBrawserDsImpl.dart'
    as _i720;
import 'features/main_Layout/Browse/data/repository/getMoviesBrawserRepoImpl.dart'
    as _i940;
import 'features/main_Layout/Browse/domain/repository/getMoviesBrawserRepo.dart'
    as _i157;
import 'features/main_Layout/Browse/domain/useCase/getMoviesBrawserUseCase.dart'
    as _i668;
import 'features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserBloc.dart'
    as _i1063;
import 'features/main_Layout/Home/data/DataSources/local/GetMoviesLocalDs.dart'
    as _i972;
import 'features/main_Layout/Home/data/DataSources/local/GetMoviesLocalDsImpl.dart'
    as _i1015;
import 'features/main_Layout/Home/data/DataSources/remote/GetMoviesDs.dart'
    as _i731;
import 'features/main_Layout/Home/data/DataSources/remote/GetMoviesDsImpl.dart'
    as _i557;
import 'features/main_Layout/Home/data/repository/getMoviesRepoImpl.dart'
    as _i452;
import 'features/main_Layout/Home/domain/repository/getMoviesRepo.dart'
    as _i398;
import 'features/main_Layout/Home/domain/useCase/getMoviesUseCase.dart'
    as _i950;
import 'features/main_Layout/Home/presentation/Bloc/getMoviesBloc.dart'
    as _i1026;
import 'features/main_Layout/Profile/data/local/UserLocalDs.dart' as _i197;
import 'features/main_Layout/Profile/data/local/UserLocalDsImpl.dart' as _i527;
import 'features/main_Layout/Search/data/DataRecourses/remote/SearchRemoteDs.dart'
    as _i777;
import 'features/main_Layout/Search/data/DataRecourses/remote/SearchRemoteDsImpl.dart'
    as _i812;
import 'features/main_Layout/Search/data/repository/SearchRepoImpl.dart'
    as _i862;
import 'features/main_Layout/Search/domain/repository/SearchRepo.dart' as _i261;
import 'features/main_Layout/Search/domain/UseCases/SearchUseCase.dart'
    as _i846;
import 'features/main_Layout/Search/presentation/Bloc/SearchBloc.dart' as _i146;
import 'features/moviesDetails/data/DataResourcse/local/GetMoviesDetailsLocalDs.dart'
    as _i340;
import 'features/moviesDetails/data/DataResourcse/local/GetMoviesDetailsLocalDsImpl.dart'
    as _i347;
import 'features/moviesDetails/data/DataResourcse/remote/getMoviesDetailsDs.dart'
    as _i517;
import 'features/moviesDetails/data/DataResourcse/remote/getMoviesDetailsImpl.dart'
    as _i433;
import 'features/moviesDetails/data/repository/GetMoviesDetailsRepoImpl.dart'
    as _i1064;
import 'features/moviesDetails/domain/repository/GetDetailsRepo.dart' as _i10;
import 'features/moviesDetails/domain/UseCase/GetDetailsUseCse.dart' as _i287;
import 'features/moviesDetails/domain/UseCase/GetSimilarUseCase.dart' as _i637;
import 'features/moviesDetails/presentation/Bloc/MoviesDetailsBloc.dart'
    as _i804;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i921.InternetConnectivity>(
        () => _i921.InternetConnectivity());
    gh.lazySingleton<_i795.ApiManager>(() => _i795.ApiManager());
    gh.factory<_i972.GetMoviesLocalDs>(() => _i1015.GetMoviesLocalDsImpl());
    gh.factory<_i340.GetMoviesDetailsLocalDs>(
        () => _i347.GetMoviesDetailsLocalDsImpl());
    gh.factory<_i197.UserLocalDs>(() => _i527.UserLocalDsImpl());
    gh.factory<_i9.GetMoviesBrawserLocalDs>(
        () => _i912.GetMoviesBrawserLocalDsImpl());
    gh.factory<_i731.GetMoviesDs>(
        () => _i557.GetMoviesDsImpl(gh<_i795.ApiManager>()));
    gh.factory<_i517.GetMoviesDetailsDs>(
        () => _i433.Getmoviesdetailsimpl(gh<_i795.ApiManager>()));
    gh.factory<_i398.GetMoviesRepo>(() => _i452.GetMoviesRepoImpl(
          gh<_i731.GetMoviesDs>(),
          gh<_i972.GetMoviesLocalDs>(),
          gh<_i921.InternetConnectivity>(),
        ));
    gh.factory<_i695.GetMoviesBrawserDs>(
        () => _i720.Getmoviesbrawserdsimpl(gh<_i795.ApiManager>()));
    gh.factory<_i777.Searchremoteds>(
        () => _i812.Searchremotedsimpl(gh<_i795.ApiManager>()));
    gh.factory<_i10.GetDetailsRepo>(() => _i1064.Getmoviesdetailsrepoimpl(
          gh<_i517.GetMoviesDetailsDs>(),
          gh<_i340.GetMoviesDetailsLocalDs>(),
          gh<_i921.InternetConnectivity>(),
        ));
    gh.factory<_i287.GetDetailsUseCase>(
        () => _i287.GetDetailsUseCase(gh<_i10.GetDetailsRepo>()));
    gh.factory<_i637.GetSimilarUseCase>(
        () => _i637.GetSimilarUseCase(gh<_i10.GetDetailsRepo>()));
    gh.factory<_i157.Getmoviesbrawserrepo>(() => _i940.Getmoviesbrawserrepoimpl(
          gh<_i695.GetMoviesBrawserDs>(),
          gh<_i9.GetMoviesBrawserLocalDs>(),
          gh<_i921.InternetConnectivity>(),
        ));
    gh.factory<_i950.GetMoviesUseCase>(
        () => _i950.GetMoviesUseCase(gh<_i398.GetMoviesRepo>()));
    gh.factory<_i1026.HomeBloc>(
        () => _i1026.HomeBloc(gh<_i950.GetMoviesUseCase>()));
    gh.factory<_i261.Searchrepo>(
        () => _i862.Searchrepoimpl(gh<_i777.Searchremoteds>()));
    gh.factory<_i804.Moviesdetailsbloc>(() => _i804.Moviesdetailsbloc(
          gh<_i287.GetDetailsUseCase>(),
          gh<_i637.GetSimilarUseCase>(),
        ));
    gh.factory<_i668.Getmoviesbrawserusecase>(
        () => _i668.Getmoviesbrawserusecase(gh<_i157.Getmoviesbrawserrepo>()));
    gh.factory<_i846.Searchusecase>(
        () => _i846.Searchusecase(gh<_i261.Searchrepo>()));
    gh.factory<_i146.Searchbloc>(
        () => _i146.Searchbloc(gh<_i846.Searchusecase>()));
    gh.factory<_i1063.BrawserBloc>(
        () => _i1063.BrawserBloc(gh<_i668.Getmoviesbrawserusecase>()));
    return this;
  }
}
