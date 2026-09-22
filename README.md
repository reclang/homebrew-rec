# Homebrew tap for the Recreational Programming Language

```sh
brew install reclang/rec/reclang
```

That one command taps `reclang/rec` and trusts this formula, nothing else in
the tap. Or trust the whole tap and use the short name:

```sh
brew tap reclang/rec
brew trust reclang/rec
brew install reclang
```

Either way, `brew upgrade reclang` follows releases.

The formula builds `reclang` from the release source tarball with ldc, which
Homebrew installs for the build together with LLVM. Works on macOS and Linux.

`brew install reclang` alone is refused: Homebrew loads a formula from a
non-official tap only under its full name, or after `brew trust`.

The compiler, its issues and its releases live at
<https://github.com/reclang/rec>. The release workflow there updates the
formula in this tap.
