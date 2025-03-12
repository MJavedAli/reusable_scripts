TOKEN=""
OWNER="MJavedAli"
REPO="MJavedAli"

RUN_IDS=$(curl -s -H "Authorization: Bearer $TOKEN" \
  "https://api.github.com/repos/$OWNER/$REPO/actions/runs?status=failure" | jq -r '.workflow_runs[].id')

for ID in $RUN_IDS; do
  echo "Deleting failed workflow run: $ID"
  curl -X DELETE -H "Authorization: Bearer $TOKEN" \
    "https://api.github.com/repos/$OWNER/$REPO/actions/runs/$ID"
done
