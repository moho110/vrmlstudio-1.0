dnl config.m4 for extension vrmlstudio

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

PHP_ARG_WITH([vrmlstudio],
[for vrmlstudio support],
[AS_HELP_STRING([--with-vrmlstudio],
[Include vrmlstudio support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([vrmlstudio],
  [whether to enable vrmlstudio support],
  [AS_HELP_STRING([--enable-vrmlstudio],
    [Enable vrmlstudio support])],
  [no])

if test "$PHP_VRMLSTUDIO" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, VRMLSTUDIO_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-vrmlstudio -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/vrmlstudio.h"  # you most likely want to change this
  dnl if test -r $PHP_VRMLSTUDIO/$SEARCH_FOR; then # path given as parameter
  dnl   VRMLSTUDIO_DIR=$PHP_VRMLSTUDIO
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for vrmlstudio files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       VRMLSTUDIO_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$VRMLSTUDIO_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the vrmlstudio distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-vrmlstudio -> add include path
  dnl PHP_ADD_INCLUDE($VRMLSTUDIO_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-vrmlstudio -> check for lib and symbol presence
  dnl LIBNAME=VRMLSTUDIO # you may want to change this
  dnl LIBSYMBOL=VRMLSTUDIO # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_VRMLSTUDIO_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your vrmlstudio library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $VRMLSTUDIO_DIR/$PHP_LIBDIR, VRMLSTUDIO_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_VRMLSTUDIO_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your vrmlstudio library.])
  dnl ],[
  dnl   -L$VRMLSTUDIO_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(VRMLSTUDIO_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_VRMLSTUDIO, 1, [ Have vrmlstudio support ])

  PHP_NEW_EXTENSION(vrmlstudio, vrmlstudio.c, $ext_shared)
fi
