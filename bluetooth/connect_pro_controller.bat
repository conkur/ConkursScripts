@ECHO OFF
btpair.exe -u -n "Pro Controller"
@ECHO ON
echo Pro Controller disconnected. Now searching for Pro Controller for reconnection.
@ECHO OFF
btpair.exe -p -n "Pro Controller"
