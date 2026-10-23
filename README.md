# tree-sitter-cypher-flake

The [openCypher](https://opencypher.org) grammar for tree-sitter, built with
`tree-sitter.buildGrammar` from a pinned upstream revision
([simplificare-org/tree-sitter-cypher](https://github.com/simplificare-org/tree-sitter-cypher)).

Highlights `.cypher` files and Cypher embedded in other languages (for example
inside Python strings via an injection query).

## Usage

```nix
{
  inputs.tree-sitter-cypher-flake.url = "github:atomic-235/tree-sitter-cypher-flake";
  inputs.tree-sitter-cypher-flake.inputs.nixpkgs.follows = "nixpkgs";
}
```

```nix
nixpkgs.overlays = [ inputs.tree-sitter-cypher-flake.overlays.default ];
# pkgs.tree-sitter-cypher
```

The package exposes the compiled grammar as `$out/parser`. With home-manager:

```nix
xdg.dataFile."nvim/site/parser/cypher.so".source = "${pkgs.tree-sitter-cypher}/parser";
```

## Updating

Upstream is tracked by a pinned `rev` and `hash` in `package.nix`; there is no
CI. Bump them by editing both fields, e.g.:

```sh
nix store prefetch-file --json --hash-type sha256 \
  "https://github.com/simplificare-org/tree-sitter-cypher/archive/<rev>.tar.gz"
```

and set `rev` to the commit and `hash` to the reported SRI hash.
