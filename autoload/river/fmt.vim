function! river#fmt#Format() abort
  " Save the view.
  let cur_view = winsaveview()

  " Make a fake change so that the undo point is river.
  normal! ix
  normal! "_x

  " Execute `riverfmt`, redirecting stderror to a temporary file.
  let tmpfile = tempname()
  let shellredir_save = &shellredir
  let &shellredir = '>%s 2>' . tmpfile
  silent execute '%!riverfmt'
  let &shellredir = shellredir_save

  " If there was an error, undo any changes and show stderr.
  if v:shell_error != 0
    silent undo
    let output = readfile(tmpfile)
    echo "riverfmt failed: " . join(output, '\n')
  endif

  " Delete the temporary file and restore the view.
  call delete(tmpfile)
  call winrestview(cur_view)
endfunction
