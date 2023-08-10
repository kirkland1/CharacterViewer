enum Environment { SIMPSONS, THE_WIRE }

class Constants {
  static Map<String, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.SIMPSONS:
        _config = _Config.simpsonsConstants;
        break;
      case Environment.THE_WIRE:
        _config = _Config.theWireConstants;
        break;
    }
  }

  static get DATAAPI {
    return _config?[_Config.DATA_API];
  }

  static get DUCKDUCK {
    return _config?[_Config.DUCKDUCK];
  }
}

class _Config {
  static const DATA_API = "DATA_API";
  static const DUCKDUCK = "DUCKDUCK";

  static Map<String, dynamic> simpsonsConstants = {
    DATA_API: "http://api.duckduckgo.com/?q=simpsons+characters&format=json",
    DUCKDUCK: "https://duckduckgo.com"
  };

  static Map<String, dynamic> theWireConstants = {
    DATA_API: "http://api.duckduckgo.com/?q=the+wire+characters&format=json",
    DUCKDUCK: "https://duckduckgo.com"
  };

}