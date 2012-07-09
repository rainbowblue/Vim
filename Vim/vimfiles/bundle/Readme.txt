ShowFunc 可能有问题
autoproto 待测
AlignMaps.vim         AlignPlugin.vim的一些按键映射
AlignPlugin.vim        按照一定格式对齐文本
Decho.vim        某些插件用到的一个debug工具
DoxygenToolkit.vim    添加doxygen注释
DrawItPlugin.vim    在vim里画图
LargeFile.vim        让大文件打开快一点
NERD_commenter.vim    代码注释
NERD_tree.vim        tree explorer for vim
a.vim            .c与.h之间快速切换
cecutil.vim        一些插件用到的一些库函数
cscope_maps.vim        cscope的映射
fencview.vim        mbbill的编码识别插件
fuzzyfinder.vim        快速定位你想要的文件
genutils.vim        一些插件依赖的库函数
lookupfile.vim        快速定位你想要的文件
manpageview.vim        在vim里查看man
mark.vim        同时高亮多个单词
matchit.vim        %的增强版
multiselect.vim        同时选择多个区域
multvals.vim        array操作库函数，multiselect依赖它
netrwPlugin.vim        vim自带的文件浏览器
netrwclean.vim        netrw清理工具，经常升级netrw的话，用来删除老版本
parenquote.vim        \", \>等映射快速添加括号
project.vim        自制的工程管理插件
qfixtoggle.vim        快速打开关闭quickfix window
selectbuf.vim        提供快速的buffer选择
snippetsEmu.vim        功能强大的缩写扩展，vim版的TextMate
taglist.vim        代码浏览，生成函数列表
vis.vim            提供visual block范围的ex操作支持(vim的ex仅支持以行为单位)
visincr.vim        生成递增或者递减的数字
visincrPlugin.vim    vimincr.vim的公共接口
rainbow_parentheses 函数体内变色
fix_arrows.vim 是把left right up down重新map了，目前，left 和 right我屏蔽掉了

简单介绍下NERD Commenter的常用键绑定，以C/C++文件为例，详析的使用方法，请:h NERDCommenter。在Normal或者Visual 模式下：

,ca在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
,cc注释当前行
,c切换注释/非注释状态
,cs以”性感”的方式注释
,cA在当前行尾添加注释符，并进入Insert模式
,cu取消注释
Normal模式下，几乎所有命令前面都可以指定行数
Visual模式下执行命令，会对选中的特定区块进行注释/反注释



Rainbow 说明：
neocomplcache
neocomplcache-snippets-complete
snipMate
snippets
supertab
缺一不可构成补全
