# Copyright (C) 2017 The UOS Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifneq ($(TARGET_ARCH),x86)
LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := UCamera
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_OVERRIDES_PACKAGES := Snap Camera2
LOCAL_JNI_SHARED_LIBRARIES := libimageprocess_jni libmosaic_jni
LOCAL_MULTILIB := 32

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libimageprocess_jni
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := armeabi/$(LOCAL_MODULE).so
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_ARM_MODE := armeabi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libmosaic_jni
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := armeabi/$(LOCAL_MODULE).so
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_ARM_MODE := armeabi
include $(BUILD_PREBUILT)
endif
