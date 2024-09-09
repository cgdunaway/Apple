#!/bin/bash

EULATEXT="Access to and use of this UCAR computer system is limited to authorized use by UCAR Policies 1-7 and 3-6 and all applicable federal laws, executive orders, policies and directives. UCAR computer systems are subject to monitoring at all times to ensure proper functioning of equipment and systems including security devices to prevent unauthorized use and violations of statutes and security regulations, to deter criminal activity and for other similar purposes. Users should be aware that information placed in the system is subject to monitoring and is not subject to any expectation of privacy. Unauthorized use or abuse will be dealt with according to UCAR Policy up to and including criminal or civil penalties as warranted. By logging in, you are agreeing to these terms."
EULADIR=$4

echo "$EULATEXT" >> $EULADIR

#Set permissions on EULA file
chmod 755 $EULADIR

exit 0
