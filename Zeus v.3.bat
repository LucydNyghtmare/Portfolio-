::Zeus V 2
::Copyright (C) 2018  by Bryan "LucydNightmare" Miller

::This program is free software; you can redistribute it and/or
::modify it under the terms of the GNU General Public License
::as published by the Free Software Foundation; either version 2
::of the License, or (at your option) any later version.

::This program is distributed in the hope that it will be useful,
::but WITHOUT ANY WARRANTY; without even the implied warranty of
::MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::GNU General Public License for more details.

::You should have received a copy of the GNU General Public License
::along with this program; if not, write to the Free Software
::Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

::----------------------
::Closes Internet Explorer browser
taskkill /IM "iexplor.exe" /F

::---------------
::Flush DNS
ipconfig /flushdns

::------------------
::Clear Internet Explorer Cache
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

::-----------------------
::Clear Internet Explorer Cookies
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2

::----------------------
::Clear Java Cache
javaws -clearcache

::---------------
::Deletes the Java Security Exceptions list if it already exsists.

DEL /F /S /Q /A "%SystemDrive%\Users\%USERNAME%\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites"


::------------
::Creates a new Java Security Exceptions list with the Kronos websites. Co created by Alon "ChiefGyk " Ganon
(
echo https://kronoswfc.safelite.net
echo https://kronoswfc.safelite.net/wfc/navigator
) > %SystemDrive%\Users\%USERNAME%\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites 
 
::----------------------
::Opens a new Internet Explorer browser and loads the Kronos web-page
Start "" "%ProgramFiles%\Internet Explorer\iexplore.exe" "https://kronoswfc.safelite.net"