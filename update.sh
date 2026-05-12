set -euo pipefail

COMMIT_MSG=$1

docker compose up -d     
sleep 5
docker compose exec jekyll bundle exec jekyll build
rm -rf docs     
cp -r _site docs       

git add docs
git commit -m $COMMIT_MSG
# git push