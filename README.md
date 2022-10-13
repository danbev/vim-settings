### Vim configuration information
This project contains my personal Vim setting and information regaring Vim.


### ctrlpvim
Allow you grep for a word using:

	CTRL+P <searchword>

Navigate using:

	CTRL+K   Down
	CTRL+J   Up
	Enter to jump to file


### NerdTree
Type 

	:NERDTree

You navigate as you normally with a [split view](#split-view-navigation) would and open a selected file using enter.

### Ag

	:Ag {pattern} [{directory}]

You can create a .vimrc in the projects directoy to specify paths that Ag
uses to search. For example:
```console
let &path.="src,deps/v8/include,lib,deps/openssl/openssl/include,deps/uv"
```

### Split view navigation
The tree is just a buffer and you navigate as you would with a split view:

	CTRL+W+k	Move to top view
	CTRL+W+j	Move to buttom view
	CTRL+W+h	Move to left view
	CTRL+W+l	Move to right view

### ctags
Will enable you to index the tags (methods, classes, variables etc) and store the output 
in a tags file.

#### install ctags

    brew install ctags

#### index a directory
 
    ctags -R .

#### using tags

    CTRL+]    jump to symbol
    CTRL+T    go back up the tree

Using ex mode:

    :tag symbolname
    :ta symbolname
    :ts

#### JavaScript
Update your `~/.ctags` file to include:

    --langdef=js
    --langmap=js:.js
    --regex-js=/([A-Za-z0-9._$]+)[ \t]*[:=][ \t]*\{/\1/,object/
    --regex-js=/([A-Za-z0-9._$()]+)[ \t]*[:=][ \t]*function[ \t]*\(/\1/,function/
    --regex-js=/function[ \t]+([A-Za-z0-9._$]+)[ \t]*\(([^)])\)/\1/,function/
    --regex-js=/([A-Za-z0-9._$]+)[ \t]*[:=][ \t]*\[/\1/,array/
    --regex-js=/([^= ]+)[ \t]*=[ \t]*[^"]'[^']*/\1/,string/
    --regex-js=/([^= ]+)[ \t]*=[ \t]*[^']"[^"]*/\1/,string/

### Math symbols
To enter math (and greek) symbols in Vi you can use digraphs to see the available symbols:

	:digraphs!

Lets say you want to display the delta symbol which in the table would look like this:

	DE ∆  8710

To get this symbol, press CTRL+k DE when in insert mode.

### Jumplists
CTRL+O  Go to next in jumplist
CTRL+I  Go to previous in jumplist

To show the jumplist
```console
:jumps
```
And to clear the list:
```
:clearjumps
```


### Misc
You can use `gf` to open the file under the cursor.
And you can use CTRL-W + CTRL-F to open the file in a new tab.
To return use CTRL+O.

You can add paths specific to you project by adding a `.vimrc` file to the 
root directory:
```console
 let &path.="deps/v8/include,"
```
And you can add this `.vimrc` to the local git exclude file(`.git/info/exclude)

File explorer:
```console
:e . 
```

wildmenu can be enabled with:
```console
: wildmenu
```
When you search for a file, for example e: src/*native<tab> you'll see a tabbed
meny with choices where you can use CTRL+N, CTRL+P to navigate and press enter
on a selection to open.

### Move a tab
To rotate a tab up/left: CTRL+W + R
To rotate a tab down/right: CTRL+W + r

### search forward/backwards
I use `*` lot to search forward for the string under the curor, but you can
also use `#` to search backwards.

### paste with indenting
`]p`


### Go to definition
`gd`

### Go to the man page
`K` will take you to the man page of the word under the cursor.

### registers
Show all registers
`:reg`

### clang-format
Can be used to help format source code. Can be run by using CTRL+K.

### visual selection
This means that you will visually (the character/line will be highlighted) and
you can navigate h/j/k/l.
* `v` select character
* `V` select row


### Show definitions/macros/functions
You can use the taglist which will show a buffer with menues with links
to get an overview and easy navigation:
```
:TlistToggle
```

### Make
Run make from with in vim:
```
:make -j8 test
```
You might have to filter the source path so that you can autmatically jump to
the file where an error is. This is what I have set up for node (.vimrc):
```console
set makeprg=make\ -j8\ 2>&1\ \\\|\ sed\ 's/\\.\\.\\/src/\\.\\/src/g'
```

This works but it will take up the entire vim session and you won't be
able to continue working until it has completed. 
You can use a tab with a new terminal:
```console
:tab terminal
```
And run the command there and you be able to continue working in the other
tabs.
You can use `CTRL-W N` to go back to tabmode and the continue working.


### Man pages
With this configuration you can open manpages from within vim:
```
:Man SSL_CTX_set_default_verify_paths
```
You can yank a function name for example and then enter:
```
:Man CTRL+R *
```
That last part will paste the function name you just yanked.


### C/C++ header commands
There are commands in `.vimrc` that allow for searching for usages of C/C++
headers. The commands are prefixed with a capitcal H. 
For example, the following will search for the usage of anything from the
limits C++ header:
```console
:Hlimits
```

### reload .vimrc without closing file
```console
:so $MYVIMRC
```

### Paste register contents in command
You put any janked text into a command. For example, if you want to search
for something, jank it and then:
```
:Ag CTRL+R 0 src
```

### Show path
You can show the name of the current file using `CTRL+G` but that does not show
the complete path. I often have a README.md file open which has the same name
in multiple repositories. You can how the complete path using `1 CTRL+G`.


### Find next/previous
```
fT
```
You can then use `;` to find the next match, and `,` to find the previous.

### Repeat last command
The `.` operator will redo the latest command from when you were in insert mode
but if we run a command in ex mode that will not redo it. Instead you can use:
```
@:
```
For example, if you indent using a range and then want to indent again.

### Navigation in vim
```
w   jump to beginning of next word
e   jump to end of next word
0   jump to beginning on line
$   jump to end of line
```

### Navigation in shell
```
ALT+f    jump forword one line
ALT+b    jump backwards one line
CTRL+A   jump to beginning on line
CTRL+E   jump to end of line
```

### Remove whitespace at end of line
I never seem to remember this
```console
1917,1966s/\s\+$//e
```
So that is the normal `/s` for search, the whitspace regex `\s` followed
one or more times `\+`, followed by the end of line anchor `$`. This replaced
with nothing `//`, and finally errors are not reported if there is no match.

### Syntactic
To add an include path one can update/add .vimrc in the projects directory:
```text
let g:syntastic_cpp_include_dirs = ['src/crypto' ]
```

### Rust analyser
In `/.vim/coc-settings.json` I've added the following configuration options:
```console
{
  "rust-analyzer.inlayHints.enable": true,
  "rust-analyzer.lens.enable": false
}
```
The first one is a type in which can be a useful when writing code and you
are not sure of the types being used.

### Disable rustfmt on save
Sometimes it useful to disable rustfmt when making a change as otherwise rustfmt
migth make other changes. This is a setting in .vimrc:
```console
let g:rustfmt_autosave = 1
``
Setting that to 0 and then sourceing .vimrc worked for me.
```console
:source ~/.vimrc
```
