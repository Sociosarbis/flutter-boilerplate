enum EnvironmentFlavor {
  development,
  production
}

Environment? get env => _env;
Environment? _env;

class Environment {
  final bool isProd;
  final EnvironmentFlavor env;
  Environment.init({required this.env }): isProd = env == EnvironmentFlavor.production {
    _env = this;
  }
  String get grpcBaseUrl => isProd ? 'https://sociosarbis-media-player.netlify.app' : 'http://192.168.43.195:8003';
}