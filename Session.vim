let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/personal/hacker_news
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/personal/hacker_news
badd +28 lib/main.dart
badd +39 lib/router.dart
badd +38 lib/router.g.dart
badd +49 lib/repositories/stories_top_list_view.dart
badd +2 __FLUTTER_DEV_LOG__
badd +20 lib/my_bottom_navigation_bar.dart
badd +1 lib/settings/setting_page.dart
badd +9 lib/setting/setting_page.dart
badd +7 lib/repositories/story_fetch.dart
badd +1 lib/stories/story_view.dart
badd +14 lib/stories/stories_top_view.dart
badd +23 lib/stories/stories_page.dart
badd +1 lib/setting
badd +16 lib/bookmarks/bookmarks_page.dart
badd +1 lib/bookmarks
badd +28 lib/more/more_page.dart
badd +27 lib/repositories/bookmarks_repository.dart
badd +472 ~/.pub-cache/hosted/pub.dev/go_router-10.0.0/lib/src/router.dart
badd +24 lib/stories/story_item.dart
badd +37 lib/stories/stories_top_list_view.dart
badd +23 lib/bookmarks/bookmarks_view.dart
badd +26 pubspec.yaml
badd +2357 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/basic.dart
badd +32 ~/.pub-cache/hosted/pub.dev/url_launcher-6.1.12/lib/src/types.dart
badd +318 ~/fvm/versions/stable/packages/flutter/lib/src/material/icon_button.dart
badd +1380 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/scroll_view.dart
badd +237 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/scroll_delegate.dart
badd +3 lib/models/story.dart
argglobal
%argdel
$argadd ~/personal/hacker_news
edit lib/more/more_page.dart
argglobal
balt lib/stories/story_item.dart
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 28 - ((27 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 28
normal! 09|
lcd ~/personal/hacker_news
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
