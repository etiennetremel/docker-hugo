Docker Hugo
===========

> Super slim [Hugo](https://gohugo.io) Docker container based on the scratch
image

![Docker build status][badge-build-status] ![Image size][badge-image-size]

[badge-build-status]: https://img.shields.io/docker/build/etiennetremel/hugo.svg
[badge-image-size]: https://img.shields.io/imagelayers/image-size/etiennetremel/hugo/latest.svg


## Getting started

```
# create initial content
docker run -t -v $(pwd)/src:/src \
  etiennetremel/hugo \
    new site /src

# create a post
docker run -t -v $(pwd)/src:/src \
  etiennetremel/hugo \
    --source=/src \
    new posts/my-first-post.md

# clone a theme
git clone https://github.com/spf13/hyde ./themes/hyde

# run hugo server
docker run -d \
  -v $(pwd)/src:/src \
  -v $(pwd)/themes:/themes \
  -p 1313:1313 etiennetremel/hugo \
    server \
      --buildDrafts \
      --theme=hyde \
      --source=/src \
      --themesDir=/themes \
      --bind=0.0.0.0
```
