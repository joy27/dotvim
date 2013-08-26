import os
import ycm_core
from clang_helpers import PrepareClangFlags
 
# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''
 
# These are the compilation flags that will be used in case there's no
# compilation database set.
flags = [
'-Wall',
'-Wextra',
'-Werror',
'-Wc++98-compat',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
'-DUSE_CLANG_COMPLETER',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
#'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',
'-isystem',
'../BoostParts',
'-isystem',
# This path will only work on OS X, but extra paths that don't exist are not
# harmful
'/System/Library/Frameworks/Python.framework/Headers',
'-isystem',
'../llvm/include',
'-isystem',
'../llvm/tools/clang/include',
'-I',
'.',
'-I',
'./ClangCompleter',
'-isystem',
'./tests/gmock/gtest',
'-isystem',
'./tests/gmock/gtest/include',
'-isystem',
'./tests/gmock',
'-isystem',
'./tests/gmock/include',

#add c++ lib
'-isystem','/usr/lib/c++/v1',


##include My path
#ndk-r8c
#'-isystem','/opt/local/android-ndk-r8c/platforms/android-14/arch-arm/usr/include/android/log.h'
#'-I','/opt/local/android-ndk-r8c/platforms/android-14/arch-arm/usr/include'
#'-L','/opt/local/android-ndk-r8c/platforms/android-14/arch-arm/usr/lib'
#'-isystem','/Users/peng/.vim/tags/cocos2d-x/ndk_include',
'-D','CC_TARGET_OS_IPHONE',

#ios framework
'-isystem','/Users/peng/.vim/tags/Frameworks/OpenGLES.framework',
'-isystem','/Users/peng/.vim/tags/Frameworks/QuartzCore.framework/Headers',
'-isystem','/Users/peng/.vim/tags/Frameworks/OpenAL.framework/Headers',
'-isystem','/Users/peng/.vim/tags/Frameworks/AudioToolbox.framework/Headers',
'-isystem','/Users/peng/.vim/tags/Frameworks/AVFoundation.framework/Headers',
'-isystem','/Users/peng/.vim/tags/Frameworks/UIKit.framework/Headers',
'-isystem','/Users/peng/.vim/tags/Frameworks/Foundation.framework/Headers',
'-isystem','/Users/peng/.vim/tags/Frameworks/CoreGraphics.framework/Headers',


#cocos2dx
#only ios
'-isystem','/Users/peng/.vim/tags/cocos2d-x/CocosDenshion/include',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/CocosDenshion/ios',

'-isystem','/Users/peng/.vim/tags/cocos2d-x/external',

'-isystem','/Users/peng/.vim/tags/cocos2d-x/external/chipmunk/src',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/external/chipmunk/src/constraints',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/external/chipmunk/include/chipmunk',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/external/chipmunk/include/chipmunk/constraints',

'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/actions',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/base_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/cocoa',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/draw_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/effects',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/include',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/kazmath/include',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/kazmath/src',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/kazmath/src/GL',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/keypad_dispatcher',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/label_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/layers_scenes_transitions_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/menu_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/misc_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/particle_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/platform',
#only add android
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/platform/ios',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/script_support',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/shaders',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/sprite_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/support',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/support/component',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/support/data_support',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/support/image_support',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/support/tinyxml2',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/support/user_default',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/support/zip_support',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/text_input_node',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/textures',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/tilemap_parallax_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/cocos2dx/touch_dispatcher',

'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/AssetsManager',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/animation',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/datas',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/display',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/external_tool',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/external_tool/Json',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/external_tool/Json/lib_json',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/physics',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCArmature/utils',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/CCBReader',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/Components',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/GUI/CCControlExtension',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/GUI/CCEditBox',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/GUI/CCScrollView',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/LocalStorage',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/network',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/physics_nodes',
'-isystem','/Users/peng/.vim/tags/cocos2d-x/extensions/spine',


#fw_game_client
'-isystem','/Users/peng/workspace/fw_game_client/fw_game_client/Classes/Framework/Animation',
'-isystem','/Users/peng/workspace/fw_game_client/fw_game_client/Classes/Framework/Core',
'-isystem','/Users/peng/workspace/fw_game_client/fw_game_client/Classes/Framework/MVC',
'-isystem','/Users/peng/workspace/fw_game_client/fw_game_client/Classes/Sample/MainGame',
'-isystem','/Users/peng/workspace/fw_game_client/fw_game_client/Classes/TestClasses/SceneTest'
]
 
if compilation_database_folder:
    database = ycm_core.CompilationDatabase(compilation_database_folder)
else:
    database = None
 
 
def DirectoryOfThisScript():
    return os.path.dirname(os.path.abspath(__file__))
 
 
def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return flags
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']
    for flag in flags:
        new_flag = flag
 
        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)
 
        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break
 
            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break
 
        if new_flag:
            new_flags.append(new_flag)
    return new_flags
 
 
def FlagsForFile(filename):
    if database:
        # Bear in mind that compilation_info.compiler_flags_ does NOT return a
        # python list, but a "list-like" StringVec object
        compilation_info = database.GetCompilationInfoForFile(filename)
        final_flags = PrepareClangFlags(
            MakeRelativePathsInFlagsAbsolute(
                compilation_info.compiler_flags_,
                compilation_info.compiler_working_dir_),
            filename)
    else:
        relative_to = DirectoryOfThisScript()
        final_flags = MakeRelativePathsInFlagsAbsolute(flags, relative_to)
 
    return {
        'flags': final_flags,
        'do_cache': True}
