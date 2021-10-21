/* vrmlstudio extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_vrmlstudio.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif

/* {{{ void vrmlstudio_test1()
 */
PHP_FUNCTION(vrmlstudio_test1)
{
	ZEND_PARSE_PARAMETERS_NONE();

	php_printf("The extension %s is loaded and working!\r\n", "vrmlstudio");
}
/* }}} */

/* {{{ string vrmlstudio_test2( [ string $var ] )
 */
PHP_FUNCTION(vrmlstudio_test2)
{
	char *var = "World";
	size_t var_len = sizeof("World") - 1;
	zend_string *retval;

	ZEND_PARSE_PARAMETERS_START(0, 1)
		Z_PARAM_OPTIONAL
		Z_PARAM_STRING(var, var_len)
	ZEND_PARSE_PARAMETERS_END();

	retval = strpprintf(0, "Hello %s", var);

	RETURN_STR(retval);
}
/* }}}*/

/* {{{ PHP_RINIT_FUNCTION
 */
PHP_RINIT_FUNCTION(vrmlstudio)
{
#if defined(ZTS) && defined(COMPILE_DL_VRMLSTUDIO)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION
 */
PHP_MINFO_FUNCTION(vrmlstudio)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "vrmlstudio support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ arginfo
 */
ZEND_BEGIN_ARG_INFO(arginfo_vrmlstudio_test1, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO(arginfo_vrmlstudio_test2, 0)
	ZEND_ARG_INFO(0, str)
ZEND_END_ARG_INFO()
/* }}} */

/* {{{ vrmlstudio_functions[]
 */
static const zend_function_entry vrmlstudio_functions[] = {
	PHP_FE(vrmlstudio_test1,		arginfo_vrmlstudio_test1)
	PHP_FE(vrmlstudio_test2,		arginfo_vrmlstudio_test2)
	PHP_FE_END
};
/* }}} */

/* {{{ vrmlstudio_module_entry
 */
zend_module_entry vrmlstudio_module_entry = {
	STANDARD_MODULE_HEADER,
	"vrmlstudio",					/* Extension name */
	vrmlstudio_functions,			/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(vrmlstudio),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(vrmlstudio),			/* PHP_MINFO - Module info */
	PHP_VRMLSTUDIO_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_VRMLSTUDIO
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(vrmlstudio)
#endif
