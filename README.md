# Bazel build rules for [asio](https://github.com/chriskohlhoff/asio)

Follows a "repos/deps" pattern (in order to help with recursive dependencies). To use:

1. Copy `bazel/repos.bzl` into your repository at `3rdparty/bazel-rules-asio/repos.bzl` and add an empty `BUILD` (or `BUILD.bazel`) to `3rdparty/bazel-rules-asio` as well.

2. Copy all of the directories from `3rdparty` that you ***don't*** already have in ***your*** repository's `3rdparty` directory.

3. Either ... add the following to your `WORKSPACE` (or `WORKSPACE.bazel`):

```bazel
load("//3rdparty/bazel-rules-asio:repos.bzl", asio_repos="repos")
asio_repos()

load("@com_github_3rdparty_bazel_rules_asio//bazel:deps.bzl", asio_deps="deps")
asio_deps()
```

Or ... to simplify others depending on ***your*** repository, add the following to your `repos.bzl`:

```bazel
load("//3rdparty/bazel-rules-asio:repos.bzl", asio_repos="repos")

def repos():
    asio_repos()
```

And the following to your `deps.bzl`:

```bazel
load("@com_github_3rdparty_bazel_rules_asio//bazel:deps.bzl", asio_deps="deps")

def deps():
    asio_deps()
```

4. You can then use `@com_github_chriskohlhoff_asio//:asio` in your target's `deps`.

5. Repeat the steps starting at (1) at the desired version of this repository that you want to use:

| asio | Copy `bazel/repos.bzl` from: |
| :---: | :--------------------------: |
| 1.20.0 | [859bff1](https://github.com/3rdparty/bazel-rules-asio/tree/859bff134da5d28bd1e421085ca5bbfef25f9929) |