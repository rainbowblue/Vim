/**
* @file       `Filename('', 'name')`.${1:<suffix>}
*
* @brief      ${2:<comment>}
* @author     ${3:`g:snips_author`}
* @version    [${4:major}.${5:minor}.${6:bugfix}]
*
* @date       ${7:: `strftime("%B %d, %Y")`}
* @Last Modified: ${8: `strftime("%d/%m/%y %H:%M:%S")`}
*/${0}


augroup templates
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r $VIM/vimfiles/templates/skeleton.'.expand("<afile>:e")
    " parse special text in the templates after the read
    autocmd BufNewFile * silent! %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END

/*!
 * \file      [:VIM_EVAL:]expand('%:t')[:END_EVAL:]
 * \brief
 * \copyright Copyright ? OOZIC Inc. All rights reserved.
 */
#ifndef [:VIM_EVAL:]toupper(expand('%:t:r'))[:END_EVAL:]_H
#define [:VIM_EVAL:]toupper(expand('%:t:r'))[:END_EVAL:]_H
#endif /* [:VIM_EVAL:]toupper(expand('%:t:r'))[:END_EVAL:]_H */

#ifndef XX_H
#define XX_H


/**
* Includes and external references
*/


/**
* Externs
*/


/**
* Definitions
*/


/**
* Variables
*/


/**
* Prototypes
*/

#endif /*!< END XX_H  */
