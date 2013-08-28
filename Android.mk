LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := game_shared

LOCAL_MODULE_FILENAME := libgame

LOCAL_SRC_FILES := hellocpp/main.cpp \
                   ../../Classes/AppDelegate.cpp \
                   ../../Classes/HelloWorldScene.cpp \
                   ../../Classes/framework/Animation/FWAnimation.cpp \
                   ../../Classes/framework/Animation/FWActionBase.cpp \
                   ../../Classes/framework/Animation/FWActionEffect.cpp \
                   ../../Classes/framework/Animation/FWEffectSprite.cpp \
                   ../../Classes/framework/Core/FWCommons.cpp \
                   ../../Classes/framework/Core/FWDevice.cpp \
                   ../../Classes/framework/Core/FWGame.cpp \
                   ../../Classes/framework/MVC/FWAbstractView.cpp \
                   ../../Classes/framework/MVC/FWAbstractModel.cpp \
                   ../../Classes/framework/MVC/FWAbstractViewController.cpp \
                   
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes \
					$(LOCAL_PATH)/../../Classes/framework/Animation \
					$(LOCAL_PATH)/../../Classes/framework/Core \
					$(LOCAL_PATH)/../../Classes/framework/MVC \
					$(LOCAL_PATH)/../../../external/Box2D \
					$(LOCAL_PATH)/../../../cocos2dx/support/tinyxml2 \

LOCAL_WHOLE_STATIC_LIBRARIES := cocos2dx_static cocosdenshion_static cocos_extension_static box2d_static
            
include $(BUILD_SHARED_LIBRARY)

$(call import-module,CocosDenshion/android) \
$(call import-module,cocos2dx) \
$(call import-module,extensions)
$(call import-module,external/Box2D)
