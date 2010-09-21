" Provides extra :Tabularize commands

  if !exists(':Tabularize')
    finish " Give up here; the Tabular plugin musn't have been loaded
  endif

  " Make line wrapping possible by resetting the 'cpo' option, first saving it
  let s:save_cpo = &cpo
  set cpo&vim

  " Line up the first colons
  AddTabularPattern! colon /:/l1r0
  AddTabularPattern! first_colon /^[^:]*\zs:/l1r0
  AddTabularPattern! hash_rocket /=>/
  AddTabularPattern! equals /=/
  AddTabularPattern! bar /|/l1r1
  AddTabularPattern! first_single_quote /^[^']*\zs'/l1c0
  AddTabularPattern! first_double_quote /^[^"]*\zs"/l1c0
  AddTabularPattern! first_left_stash /^[^{]*\zs{/l0r1
  AddTabularPattern! first_right_stash /^[^}]*\zs}/l1r0
  AddTabularPattern! json /^[^:]*:\zs/l1r0

  " Restore the saved value of 'cpo'
  let &cpo = s:save_cpo
  unlet s:save_cpo
