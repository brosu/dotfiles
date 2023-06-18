set -e
# docker run -it $(docker build -f test/Dockerfile_init -q .);

docker images | grep "br/dotfiles_test" > /dev/null || \
docker build --file test/Dockerfile_init --quiet --tag br/dotfiles_test .

docker run -it $(docker build -f test/Dockerfile -q .);
export container_id=$(docker container ls -a --format '{{json .}}' | jq ".ID" | head -1 | sed 's/"//g')
docker commit ${container_id} br/dotfiles_test