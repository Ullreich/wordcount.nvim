# wordcount.nvim

### !!!WIP!!!

A simple nvim plugin that counts the words in a markdown file.

### Requirements
* TODO: which version of nvim is required?
* [pandoc](https://pandoc.org/) for markdown wordcounting
* [texcount](https://app.uio.no/ifi/texcount/intro.html) for LaTeX wordcounting 

### Installation

using Lazy:

```lua
{
    "Ullreich/wordcount.nvim"
},
```

### Usage

1. Save the file you are working on (e.g. with `:w`)
2. run `:Wordcount`

### Roadmap
At the moment this is just a quick and dirty plugin written out of nescessity.
I have no (current) plans to add wordcounters for other languages. However, if
you are interested in a wordcounter for a different language, let me know.

I have not tested yet how accurate and reliable the counter is. The markdown
counter does not always show the same wordcount as Zettl. The LaTeX counter should
be rather accurate, it is the same that Overleaf uses.

I would like to reduce the dependencies in the future. However, I am not planning
on writing an AST for LaTeX or Markdown in Lua.
