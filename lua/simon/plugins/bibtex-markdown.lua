-- TODO: what is this?
return {
  'drgo/lookernvim',
  event = 'BufRead',
  ft = { 'markdown' },
  opts = {
    bib = {
      search_file = '/Users/drgo/local/writing/refs/vdec.bib',
      close_on_selection = true
    }
  },
}
