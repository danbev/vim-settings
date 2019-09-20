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

	:digraphs

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


### clang-format
Can be used to help format source code. Can be run by using CTRL+K.


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
