set -euo pipefail

COMMIT_MSG=$1

docker compose up -d     
sleep 5
rm -rf docs     
docker compose exec jekyll bundle exec jekyll build
mv _site docs       

git status

git add docs
git commit -m $COMMIT_MSG
# git push