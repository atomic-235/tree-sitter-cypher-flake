{
  lib,
  tree-sitter,
  fetchFromGitHub,
}:

# openCypher grammar — highlights .cypher files and Cypher injected into
# Python strings (see the nvim after/queries/python/injections.scm).
tree-sitter.buildGrammar {
  language = "cypher";
  version = "2026-10-15";

  src = fetchFromGitHub {
    owner = "simplificare-org";
    repo = "tree-sitter-cypher";
    rev = "775717a2de6ca76a5a75e8076b411dbc1ae4c281";
    hash = "sha256-kO6pryiKKCNxg7Gx1neUf4Zw+i7J6OsJkCTi0o9MZZw=";
  };

  meta = with lib; {
    description = "openCypher grammar for tree-sitter";
    homepage = "https://github.com/simplificare-org/tree-sitter-cypher";
    license = licenses.asl20;
  };
}
