<#
    sc-helpkit.ps1 - Automates numerous help checks and provides multiple bugfixes at the push of a button.
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

using assembly System.Windows.Forms
using namespace System.Windows.Forms
using assembly System.Drawing
using namespace System.Drawing

# UI Constants
class Constants
{
    static [Size]$FormSize = [Size]::new( 480, 150 )
    static [Size]$RowSize  = [Size]::new( 370,  20 )
    static [Size]$Border   = [Size]::new(  20,  20 )
    static [Size]$Buffer   = [Size]::new(  10,   5 )

    static [Size]$LabelSize =  [Size]::new( 240, [Constants]::RowSize.Height )
    static [Size]$ButtonSize = [Size]::new(  80, [Constants]::RowSize.Height )
    static [Size]$OutputSize = [Size]::new( 300, [Constants]::RowSize.Height )

    static [Int]$ButtonOffsetY =  4
    static [Int]$OutputOffsetX = 12
}

# UI Actions
class Activity
{
    [Label] $Label
    [Label] $Output
    [Button] $Button
    [ScriptBlock] $Begin
    [ScriptBlock] $Process
    [Int] $Index
    Activity( [string]$sLabel, [string]$sBtnText, [ScriptBlock]$fBegin, [ScriptBlock]$fProcess, [Int]$iIndex, [ref]$pRef )
    {
        $this.Index = $iIndex
        $this.Label = [Label]::new()
        $this.Label.Text = $sLabel
        $this.Label.Location = $pRef.Value
        $this.Label.Size = [Constants]::LabelSize

        $pRef.Value.X += ( [Constants]::LabelSize.Width + [Constants]::Buffer.Width )
        $pRef.Value.Y -= ( [Constants]::ButtonOffsetY)

        $this.Button = [Button]::new()
        $this.Button.Text = $sBtnText
        $this.Button.Size = [Constants]::ButtonSize
        $this.Button.Location = $pRef.Value
       
        $pRef.Value.X  = ( [Constants]::OutputOffsetX + [Constants]::Border.Width )
        $pRef.Value.Y += ( [Constants]::ButtonOffsetY + [Constants]::RowSize.Height + [Constants]::Buffer.Height )

        $this.Output = [Label]::new()
        $this.Output.Text = ''
        $this.Output.Size = [Constants]::OutputSize
        $this.Output.Location = $pRef.Value

        $pRef.Value.X  = ( [Constants]::Border.Width )
        $pRef.Value.Y += ( [Constants]::RowSize.Height + [Constants]::Buffer.Height )

        $this.Begin = $fBegin
        $this.Process = $fProcess

		# Assign a temp variable for $this, otherwise $this will reference the Button on click event.
		# Using temp function because [PSMethod] does not convert directly to [ScriptBlock], even though the reverse is somewhat true. 
		# Using GetNewClosure() otherwise our temp variable is not kept in scope on click event (and $this still gets clobbered).
        $cSelfDelegate = $this
		$this.Button.Add_Click({$cSelfDelegate.Click()}.GetNewClosure())

		# Run any init code.
        & $this.Begin
		
		# Prefix activity number to the activity label.
        $this.Enumerate()
    }
    Click()
    {
        & $this.Process
        $this.Enumerate()
    }
    Enumerate()
    {
        $enum = (''+$this.Index+'. ').PadLeft(5)
        if ( -1 -eq $this.Label.Text.Substring(0,5).indexOf( $enum ) )
        {
            $this.Label.Text = $enum + $this.Label.Text
        }    
    }
}

# Windows Form Control
class App
{
    Hidden [Point] $_Cursor
    [Activity[]] $Activities
    [Form] $Form
    App( [string] $sTitle )
    {
        $this._Cursor  = [Point]::new([Constants]::Border.Width, [Constants]::Border.Height)
        $Activities     = @()
        $this.Form      = [Form]::new()
        $this.Form.Size = [Constants]::FormSize
        $this.Form.Text = $sTitle
        $this.Form.StartPosition = 'CenterScreen'
    }
    AddActivity( [string]$sLabel, [string]$sBtnText, [ScriptBlock]$fBegin, [ScriptBlock]$fProcess )
    {
        [Activity] $cActivity = [Activity]::new( $sLabel, $sBtnText, $fBegin, $fProcess, $this.Activities.Count + 1, $this._Cursor )
        $this.Activities += $cActivity
        
        $this.Form.Controls.Add( $cActivity.Label  )
        $this.Form.Controls.Add( $cActivity.Button )
        $this.Form.Controls.Add( $cActivity.Output )
    }
    Show()
    {
        $this.Form.ShowDialog()
    }
}