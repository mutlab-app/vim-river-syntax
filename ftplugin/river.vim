setlocal noexpandtab

autocmd BufWritePre *.river call river#fmt#Format()
