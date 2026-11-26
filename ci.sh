#!/usr/bin/env bash
# CI for this repo, run from its root by .github/workflows/ci.yml:
#   bash ci.sh build python
# Optional env (set in the workflow): SETUP, PYTHON_RUN_SCRIPTS
set -uo pipefail
mode=$1; shift
TMP=${RUNNER_TEMP:-$(mktemp -d)}
group() { [ -n "${GITHUB_ACTIONS:-}" ] && echo "::group::$1" || echo "== $1"; }
endgroup() { [ -n "${GITHUB_ACTIONS:-}" ] && echo "::endgroup::" || true; }
fail() { echo "${GITHUB_ACTIONS:+::error::}$1 failed"; status=1; }
status=0
# Python tools and test requirements go into a private venv: works on CI and on machines that block global pip
py() { [ -x "$TMP/venv/bin/python" ] || python3 -m venv "$TMP/venv"; "$TMP/venv/bin/python" "$@"; }
pytool() { [ -x "$TMP/venv/bin/$1" ] || py -m pip install -q "$1==$2"; "$TMP/venv/bin/$1" "${@:3}"; }

if [ -n "${SETUP:-}" ] && [ "$mode" = build ]; then RUNNER_TEMP=$TMP bash -ec "$SETUP" || exit 1; fi

for kind in "$@"; do case "$mode:$kind" in
build:python)
  py -m compileall -q . || fail "compileall"
  pytool ruff 0.17.2 check . --select E9,F63,F7,F82 || fail "ruff check"
  django=$(find . -name manage.py -not -path "*/.venv/*" | xargs -r -n1 dirname | sort -u)
  for dir in $django; do
    group "$dir"
    (cd "$dir" && python3 -m venv .venv && .venv/bin/pip install -q -r requirements.txt \
      && .venv/bin/python manage.py makemigrations --check --dry-run && .venv/bin/python manage.py test) || fail "$dir"
    endgroup
  done
  roots=$(find . \( -name .venv -o -name .git -o -name __pycache__ \) -prune -o -name "*test*.py" -print | while read -r f; do
    d=$(dirname "$f"); if [ -f "$d/__init__.py" ] && [ ! -f "$d/manage.py" ]; then d=$(dirname "$d"); fi; echo "$d"; done | sort -u)
  for d in $roots; do
    for dj in $django; do case "$d/" in "$dj"/*) continue 2;; esac; done
    group "$d"
    if [ -f "$d/requirements.txt" ]; then py -m pip install -q -r "$d/requirements.txt"; fi
    (cd "$d" && py -m unittest discover -p "*test*.py") || fail "$d"
    endgroup
  done
  if [ "${PYTHON_RUN_SCRIPTS:-}" = true ]; then
    for f in $(git ls-files '*.py'); do
      (cd "$(dirname "$f")" && py -c "import runpy, sys; sys.path.insert(0, '.'); runpy.run_path(sys.argv[1])" "$(basename "$f")" < /dev/null) || fail "$f"
    done
  fi ;;
*) echo "unknown $mode kind: $kind" >&2; exit 2 ;;
esac; done
exit $status
