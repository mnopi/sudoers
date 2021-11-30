#!/usr/bin/env bash
set -euo pipefail
shopt -s inherit_errexit

ls() {
  # owner;repo;folder
  cat <<EOF
bats-core;bats-assert;share
bats-core;bats-core;share
bats-core;bats-file;share
bats-core;bats-support;share
fsaintjacques;semver-tool;share
EOF
}

add() {
  local owner repo folder
  while IFS=";" read -r owner repo folder; do
    git submodule --quiet sync "${folder}/${repo}" 2>/dev/null || \
      git submodule --quiet add "git@github.com:${owner}/${repo}.git" "${folder}/${repo}"
    git submodule --quiet sync
  done < <(ls)
}

pull() {
  add
  git submodule --quiet update --init --recursive --remote
  git submodule --quiet foreach "git checkout --quiet; git pull --quiet"
}

main() {
  local arg
  for arg do
    case "${arg}" in
      add|ls|pull) ${arg} ;;
    esac
    exit
  done
  pull
}

main "${@}"
