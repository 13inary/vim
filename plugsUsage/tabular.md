##  tabular
[github](https://github.com/godlygeek/tabular/blob/master/doc/Tabular.txt) 

###   tab format
```shell
:Tabularize /<key>[/format][count of space before next part]
```

* format
they can appear together
|--------|--------|
| format | tips   |
|--------|--------|
| l      | left   |
|--------|--------|
| c      | center |
|--------|--------|
| r      | right  |
|--------|--------|



###   reusing
1. `:AddTabularPattern first_comma /<key>[/format]`
2. `:Tabularize first_comma`
