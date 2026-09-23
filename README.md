# Homebrew tap for the Recreational Programming Language

```sh
brew install reclang/rec/reclang
```

That one command taps `reclang/rec` and trusts this formula, nothing else in
the tap. You can trust the whole tap and use the short name:

```sh
brew tap reclang/rec
brew trust reclang/rec
brew install reclang
```

Either way, `brew upgrade reclang` follows releases.

`brew install` installs prebuilt `reclang` binaries on Apple Silicon
Macs on macOS 26 or newer and x86_64 Linux.
On other platforms, the formula builds `reclang` from the release source tarball
with ldc, which Homebrew installs together with LLVM.

The compiler, its issues and its releases live at
<https://github.com/reclang/rec>. The release workflow there opens a pull
request here for each new version; `brew test-bot` builds its bottles, and the
`brew pr-pull` workflow publishes them and merges it.
