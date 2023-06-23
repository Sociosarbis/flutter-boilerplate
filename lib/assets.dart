import 'dart:ui';

class AssetsPath {
  static const _shaders = "shaders";

  static const uiShader = "$_shaders/ui_glitch.frag";
}

typedef FragmentPrograms = ({FragmentProgram ui});

Future<FragmentPrograms> loadFragmentPrograms() async {
  return Future.wait([AssetsPath.uiShader].map((p) => _loadFragmentProgram(p)))
      .then((programs) => (ui: programs[0]));
}

Future<FragmentProgram> _loadFragmentProgram(String path) {
  return FragmentProgram.fromAsset(path);
}
