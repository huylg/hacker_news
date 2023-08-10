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
badd +34 lib/main.dart
badd +10 lib/router.dart
badd +32 lib/router.g.dart
badd +49 lib/repositories/stories_top_list_view.dart
badd +1 __FLUTTER_DEV_LOG__
badd +37 lib/my_bottom_navigation_bar.dart
badd +1 lib/settings/setting_page.dart
badd +9 lib/setting/setting_page.dart
badd +1 lib/stories/story_view.dart
badd +11 lib/stories/stories_top_view.dart
badd +36 lib/stories/stories_page.dart
badd +1 lib/setting
badd +11 lib/bookmarks/bookmarks_page.dart
badd +1 lib/bookmarks
badd +73 lib/more/more_page.dart
badd +33 lib/repositories/bookmarks_repository.dart
badd +472 ~/.pub-cache/hosted/pub.dev/go_router-10.0.0/lib/src/router.dart
badd +1 lib/stories/story_item.dart
badd +14 lib/bookmarks/bookmarks_view.dart
badd +39 pubspec.yaml
badd +2357 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/basic.dart
badd +32 ~/.pub-cache/hosted/pub.dev/url_launcher-6.1.12/lib/src/types.dart
badd +318 ~/fvm/versions/stable/packages/flutter/lib/src/material/icon_button.dart
badd +1205 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/scroll_view.dart
badd +237 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/scroll_delegate.dart
badd +12 lib/models/story.dart
badd +1 lib/more
badd +9 lib/brightness_change_notifier.dart
badd +107 ~/.pub-cache/hosted/pub.dev/provider-6.0.5/lib/src/change_notifier_provider.dart
badd +351 ~/fvm/versions/stable/packages/flutter/lib/src/material/text_theme.dart
badd +174 ~/fvm/versions/stable/packages/flutter/lib/src/material/list_tile_theme.dart
badd +1 linux/main.cc
badd +1 ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png
badd +33 lib/bookmarks/bookmark_list_view.dart
badd +12 lib/story/story_page.dart
badd +12 lib/timeago.dart
badd +1 lib/story
badd +1 lib/models
badd +16 lib/models/comment.dart
badd +7 lib/comments/comments_repository.dart
badd +53 lib/comments/comment_item.dart
badd +16 lib/repositories/comments_repository.dart
badd +12 lib/models/comment.g.dart
badd +1 lib/comments
badd +38 lib/comments/comments_list_view.dart
badd +73 ~/.pub-cache/hosted/pub.dev/flutter_html-3.0.0-beta.2/lib/flutter_html.dart
badd +232 ~/fvm/versions/stable/packages/flutter/lib/src/widgets/async.dart
badd +1 lib/repositories
badd +11 lib/repositories/show_story_repository.dart
badd +64 lib/repositories/story_repostitory.dart
badd +1 lib/repositories/new_story_repository.dart
badd +9 lib/stories/stories_new_view.dart
badd +1 lib/stories
badd +9 lib/stories/stories_ask_view.dart
badd +25 lib/stories/stories_list_view.dart
badd +10 lib/stories/stories_show_view.dart
badd +1 lib/repositories/top_story_repository.dart
badd +1 https://hacker-news.firebaseio.com/v0/showstories.json
badd +4 lib/repositories/ask_story_repository.dart
badd +14 lib/stories/stories_jobs_view.dart
badd +1 lib
badd +9 lib/repositories/job_story_repository.dart
badd +1 https://hacker-news.firebaseio.com/v0/jobstories.json
badd +6 android/build.gradle
badd +1 android
badd +61 android/app/build.gradle
badd +24 README.md
badd +501 ~/fvm/versions/stable/packages/flutter/lib/src/material/progress_indicator.dart
badd +22 lib/stories/stories_view.dart
badd +1 assets/icon.png
badd +288 ~/fvm/versions/stable/packages/flutter/lib/src/material/divider.dart
badd +1009 ~/fvm/versions/stable/packages/flutter/lib/src/material/list_tile.dart
argglobal
%argdel
$argadd ~/personal/hacker_news
edit lib/comments/comments_list_view.dart
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
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
let s:l = 42 - ((41 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 42
normal! 034|
lcd ~/personal/hacker_news
wincmd w
argglobal
if bufexists(fnamemodify("~/personal/hacker_news/lib/repositories/story_repostitory.dart", ":p")) | buffer ~/personal/hacker_news/lib/repositories/story_repostitory.dart | else | edit ~/personal/hacker_news/lib/repositories/story_repostitory.dart | endif
if &buftype ==# 'terminal'
  silent file ~/personal/hacker_news/lib/repositories/story_repostitory.dart
endif
balt ~/personal/hacker_news/lib/story/story_page.dart
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
let s:l = 37 - ((36 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
normal! 08|
lcd ~/personal/hacker_news
wincmd w
wincmd =
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
