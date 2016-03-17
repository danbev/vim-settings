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


### Math symbols
To enter math (and greek) symbols in Vi you can use digraphs to see the available symbols:

	:digraphs

Lets say you want to display the delta symbol which in the table would look like this:

	DE ∆  8710

To get this symbol, press CTRL+k DE when in insert mode.


