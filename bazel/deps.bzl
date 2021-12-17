"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    maybe(
        git_repository,
        name = "boringssl",
        commit = "5da401d8b733b1739e97f5f7ee3fa40bd1490d27",
        remote = "https://boringssl.googlesource.com/boringssl",
        shallow_since = "1639694177 +0000",
        repo_mapping = repo_mapping,
    )

    maybe(
        new_git_repository,
        name = "com_github_chriskohlhoff_asio",
        remote = "https://github.com/chriskohlhoff/asio",
        commit = "6c054e98f3f53352d12b6cd46d63b6d404cc044b",
        shallow_since = "1634360358 +1100",
        repo_mapping = repo_mapping,
        build_file = "@com_github_3rdparty_bazel_rules_asio//:BUILD.bazel",
    )
