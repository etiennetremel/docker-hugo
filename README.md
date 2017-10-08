Docker Hugo
===========

> Super slim Hugo Docker container based on the scratch image


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
