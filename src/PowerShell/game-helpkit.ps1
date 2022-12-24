<#
    sc-helpkit.ps1 - Automates common troubleshooting and tuning steps.
     Copyright (C) 2022  jtoxification

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#>

# If you want to run this in PowerShell IDE, run the below command in the shell portion, first, then select "yes".
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

using assembly System.Windows.Forms
using namespace System.Windows.Forms
using assembly System.Drawing
using namespace System.Drawing

# Keep the classes separate or we get an error outside of the ISE
. .\classes.ps1

# Make Our Window Pretty
[Application]::EnableVisualStyles()

$app = [App]::new( "Star Citizen Community Help Kit" )

$app.AddActivity(
    'Clear the Star Citizen Shader Cache',
    'Clear Cache',
    {
        $this.Label.Text = cmd.exe /q /C "dir `"%localappdata%`"\`"Star Citizen`"\sc-alpha-* /AD /B 2> nul 1> nul && echo Shader cache(s) found. Delete?"
        if (!$this.Label.Text)
        {
            $this.Label.Text = 'No shader caches found.'
            $this.Button.Enabled = $False
        }
    },
    {    
        $this.Label.Text = cmd.exe /q /C "(for /f `"delims=`" %i in ('dir `"%localappdata%`"\`"Star Citizen`"\sc-alpha-* /AD /B')  do (rd /S /Q `"%localappdata%`"\`"Star Citizen`"\`"%i`" )) 2> nul && echo Shader cache(s) deleted. || echo No shader caches found." 
        $this.Button.Enabled = $False
    }
)

$app.Show()