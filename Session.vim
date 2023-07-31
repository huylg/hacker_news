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
badd +27 lib/main.dart
badd +39 lib/router.dart
badd +38 lib/router.g.dart
badd +49 lib/repositories/stories_top_list_view.dart
badd +26 __FLUTTER_DEV_LOG__
badd +1 lib/my_bottom_navigation_bar.dart
badd +1 lib/settings/setting_page.dart
badd +9 lib/setting/setting_page.dart
badd +15 lib/repositories/story_fetch.dart
badd +1 lib/stories/story_view.dart
badd +16 lib/stories/stories_top_view.dart
badd +28 lib/stories/stories_page.dart
badd +1 lib/setting
badd +11 lib/bookmarks/bookmarks_page.dart
badd +1 lib/bookmarks
badd +46 lib/more/more_page.dart
badd +13 lib/repositories/bookmarks_repository.dart
badd +472 ~/.pub-cache/hosted/pub.dev/go_router-10.0.0/lib/src/router.dart
badd +32 lib/stories/story_item.dart
badd +50 lib/stories/stories_top_list_view.dart
badd +14 lib/bookmarks/bookmarks_view.dart
badd +26 pubspec.yaml
badd +2357 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/basic.dart
badd +32 ~/.pub-cache/hosted/pub.dev/url_launcher-6.1.12/lib/src/types.dart
badd +318 ~/fvm/versions/stable/packages/flutter/lib/src/material/icon_button.dart
badd +1205 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/scroll_view.dart
badd +237 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/scroll_delegate.dart
badd +21 lib/models/story.dart
badd +7 lib/repositories/stories_top_repository.dart
badd +1 lib/more
badd +9 lib/brightness_change_notifier.dart
badd +107 ~/.pub-cache/hosted/pub.dev/provider-6.0.5/lib/src/change_notifier_provider.dart
badd +351 ~/fvm/versions/stable/packages/flutter/lib/src/material/text_theme.dart
badd +174 ~/fvm/versions/stable/packages/flutter/lib/src/material/list_tile_theme.dart
badd +1 linux/main.cc
badd +1 ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png
badd +33 lib/bookmarks/bookmark_list_view.dart
badd +47 lib/story/story_page.dart
badd +1 lib/stories
badd +17 lib/timeago.dart
argglobal
%argdel
$argadd ~/personal/hacker_news
edit lib/more/more_page.dart
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt __FLUTTER_DEV_LOG__
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
let s:l = 64 - ((21 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 64
normal! 010|
lcd ~/personal/hacker_news
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
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
