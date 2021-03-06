"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    maybe(
        new_git_repository,
        name = "com_github_chriskohlhoff_asio",
        remote = "https://github.com/chriskohlhoff/asio",
        commit = "bba12d10501418fd3789ce01c9f86a77d37df7ed",
        shallow_since = "1647386190 +1100",
        repo_mapping = repo_mapping,
        build_file = "@com_github_3rdparty_bazel_rules_asio//:BUILD.bazel",
    )
