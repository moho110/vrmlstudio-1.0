/* vrmlstudio extension for PHP */

#ifndef PHP_VRMLSTUDIO_H
# define PHP_VRMLSTUDIO_H

extern zend_module_entry vrmlstudio_module_entry;
# define phpext_vrmlstudio_ptr &vrmlstudio_module_entry

# define PHP_VRMLSTUDIO_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_VRMLSTUDIO)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_VRMLSTUDIO_H */
