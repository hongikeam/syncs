#!/bin/sh

TODAY=`date +%Y-%m-%d`
CLASSNAME=$1
FILENAME=`echo "${CLASSNAME}" | tr [:upper:] [:lower:]`
DEFNAME=`echo "${CLASSNAME}" | tr [:lower:] [:upper:]`


HEADER="
#ifndef __${DEFNAME}_H__\n
#define __${DEFNAME}_H__\n
\n
/\*\*\n
 \* @class ${CLASSNAME}\n
 \* @author 정일한 <catastroph@skcomms.co.kr>, 김홍기 <toofool@skcomms.co.kr>\n
 \* @date <${TODAY}>\n
 \* @version x.0\n
 \* @brief \n
 \*/\n
\n
class ${CLASSNAME}\n
{\n
public:\n
\t${CLASSNAME}();\n
\t~${CLASSNAME}();\n
};\n
\n
#endif /\* __${DEFNAME}_H__ \*/\n
"

SOURCE="#include \"${FILENAME}.h\"\n
\n
${CLASSNAME}::${CLASSNAME}()\n
{\n
}\n
\n
${CLASSNAME}::~${CLASSNAME}()\n
{\n
}
"

echo -e ${HEADER} | sed -e 's/\\//g' | sed -e 's/^ //g' | sed -e 's/\t/    /g' | sed -e 's/^*/ */g' > "${FILENAME}.h"
echo -e ${SOURCE} | sed -e 's/\\//g' | sed -e 's/^ //g' | sed -e 's/\t/    /g' | sed -e 's/^*/ */g' > "${FILENAME}.cpp"
echo "generated ${FILENAME}.h ${FILENAME}.cpp at ${TODAY}"
