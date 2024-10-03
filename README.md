# anbeda-web
Website https://www.anbeda.ch

Betrieben auf deplo.io mit dem Command

```
nctl create app anbeda-web \
        --dockerfile \
        --port=80 \
        --replicas=2 \
        --size=micro \
        --git-url=https://github.com/thomhug/anbeda-web \
        --git-revision="main" \
        --hosts=anbeda.ch,www.anbeda.ch
```
