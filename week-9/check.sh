#!/usr/bin/env bash
set -eu
export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"
export KUBECONFIG="${KUBECONFIG:-$HOME/.kube/config}"

pass() { echo "PASS: $*"; }
fail() { echo "FAIL: $*" >&2; exit 1; }

kubectl get nodes >/dev/null 2>&1 || fail "cluster is not reachable"
pass "cluster is reachable"

kubectl wait --for=condition=Ready pod -l app=db --timeout=30s >/dev/null 2>&1 \
  || fail "database pod is not ready"
pass "database pod is ready"

kubectl wait --for=condition=Ready pod -l app=db-exporter --timeout=30s >/dev/null 2>&1 \
  || fail "database exporter pod is not ready"
pass "database exporter pod is ready"

latest="$(ls -1t "$HOME"/backups/db-*.dump 2>/dev/null | head -n 1 || true)"
[ -n "$latest" ] && [ -s "$latest" ] || fail "no usable database backup found"
pass "database backup exists"

"$(dirname "$0")/sql.sh" | grep -qv '^(no tables)$' \
  || fail "database has no tables"
pass "database has tables"

echo "All checks passed."
