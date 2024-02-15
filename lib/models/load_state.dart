import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_state.freezed.dart';

@freezed
class LoadState with _$LoadState {
  const factory LoadState.none() = None;
  const factory LoadState.notLoading({ required bool endOfPaginationReached }) = NotLoading;
  const factory LoadState.loading() = Loading;
  const factory LoadState.err({ required Exception error }) = Err;
}