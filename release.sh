# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=ppouliot
# image name
IMAGE=Puppetfile

# Ensure the repo is up to date
git pull

# Bump Version
docker run --rm -v "$PWD":/app treeder/bump patch
VERSION=`cat VERSION`
set -x
echo "version: $VERSION"

# tag it
git add -A
git commit -m "version $VERSION"
git tag -a "$VERSION" -m "version $VERSION"
git push
git push --tags
