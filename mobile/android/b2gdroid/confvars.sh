# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

MOZ_APP_BASENAME=B2GDroid
MOZ_APP_VENDOR=Mozilla

MOZ_B2GDROID=1
MOZ_B2G=1

MOZ_APP_VERSION=$FIREFOX_VERSION
MOZ_APP_UA_NAME=Firefox

MOZ_UA_OS_AGNOSTIC=1

MOZ_B2G_VERSION=2.6.0.0-prerelease
MOZ_B2G_OS_NAME=Boot2Gecko

MOZ_BRANDING_DIRECTORY=mobile/android/b2gdroid/branding/unofficial
MOZ_OFFICIAL_BRANDING_DIRECTORY=mobile/android/b2gdroid/branding/official
# MOZ_APP_DISPLAYNAME is set by branding/configure.sh

# We support Android SDK version 14 and up by default.
# See the --enable-android-min-sdk and --enable-android-max-sdk arguments in configure.in.
MOZ_ANDROID_MIN_SDK_VERSION=14

# There are several entry points into the Firefox application.  These are the names of some of the classes that are
# listed in the Android manifest.  They are specified in here to avoid hard-coding them in source code files.
MOZ_ANDROID_APPLICATION_CLASS=org.mozilla.gecko.GeckoApplication
MOZ_ANDROID_BROWSER_INTENT_CLASS=org.mozilla.gecko.BrowserApp
MOZ_ANDROID_SEARCH_INTENT_CLASS=org.mozilla.search.SearchActivity

MOZ_SAFE_BROWSING=1

MOZ_NO_SMART_CARDS=1

# Enable getUserMedia
MOZ_MEDIA_NAVIGATOR=1

# Enable NFC permission
MOZ_ANDROID_BEAM=1

MOZ_XULRUNNER=

MOZ_CAPTURE=1
MOZ_RAW=1
MOZ_PLACES=
MOZ_SOCIAL=
MOZ_ANDROID_HISTORY=1
MOZ_DISABLE_EXPORT_JS=1

# use custom widget for html:select
MOZ_USE_NATIVE_POPUP_WINDOWS=1

MOZ_APP_ID={f7b06d8d-139c-459a-85fa-46bc6c52e2b7}

MOZ_APP_STATIC_INI=1

# Enable on-demand decompression.  This requires a host compile toolchain to
# build szip to use during packaging.
if test "$COMPILE_ENVIRONMENT"; then
MOZ_ENABLE_SZIP=1
fi

# Enable navigator.mozPay
MOZ_PAY=1

# Enable UI for healthreporter
MOZ_SERVICES_HEALTHREPORT=1

# Enable runtime locale switching.
MOZ_LOCALE_SWITCHER=1

# Enable second screen and casting support for external devices.
MOZ_DEVICES=1

# Enable second screen using native Android libraries, provided we're
# not resource constrained.
if test -z "$MOZ_ANDROID_RESOURCE_CONSTRAINED"; then
  MOZ_NATIVE_DEVICES=1
fi

# Enable install tracking SDK if we have Google Play support; MOZ_NATIVE_DEVICES
# is a proxy flag for that support.
if test "$RELEASE_BUILD"; then
if test "$MOZ_NATIVE_DEVICES"; then
  MOZ_INSTALL_TRACKING=1
fi
fi

# Mark as WebGL conformant
MOZ_WEBGL_CONFORMANT=1

# Enable Tab Queue
if test "$NIGHTLY_BUILD"; then
  MOZ_ANDROID_TAB_QUEUE=1
fi

# Use the low-memory GC tuning.
export JS_GC_SMALL_CHUNK_SIZE=1

# Enable checking that add-ons are signed by the trusted root
MOZ_ADDON_SIGNING=1
if test "$MOZ_OFFICIAL_BRANDING"; then
  if test "$MOZ_UPDATE_CHANNEL" = "beta" -o \
          "$MOZ_UPDATE_CHANNEL" = "release"; then
    MOZ_REQUIRE_SIGNING=1
  fi
fi

MOZ_JSDOWNLOADS=1
MOZ_TIME_MANAGER=1
MOZ_WEBSMS_BACKEND=1
