[Setup]
AppName=DNSRLED
AppVerName=DNSRLED v1.1
PrivilegesRequired=admin
DefaultDirName=C:\DNSREDIR
AppCopyright=© 2006 JPElectron.com
AllowCancelDuringInstall=false
AllowUNCPath=false
ShowLanguageDialog=no
AppPublisher=JPElectron.com
AppPublisherURL=http://www.jpelectron.com
AppVersion=1.1
UninstallDisplayIcon={app}\count.exe
VersionInfoVersion=1.1
VersionInfoCompany=JPElectron.com
VersionInfoDescription=DNSRLED Setup
VersionInfoCopyright=(c) 2006 JPElectron.com
EnableDirDoesntExistWarning=false
DirExistsWarning=no
AppendDefaultGroupName=false
[Files]
Source: stdole2.tlb; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regtypelib
Source: msvbvm60.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: oleaut32.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: olepro32.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: asycfilt.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile
Source: comcat.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: MSCOMM32.OCX; DestDir: {sys}; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: countJoin.bat; DestDir: {app}; Flags: promptifolder
Source: countLeave.bat; DestDir: {app}; Flags: promptifolder
Source: count.dat; DestDir: {app}; Flags: promptifolder
Source: count.ini; DestDir: {app}; Flags: promptifolder
Source: count.exe; DestDir: {app}; Flags: promptifolder
[Messages]
FinishedLabel=Setup has finished installing DNSRLED. In count.ini the first line is the COM port the K8063 is connected to, second line is how many K8063 digits are connected.
FinishedLabelNoIcons=Setup has finished installing DNSRLED. In count.ini the first line is the COM port the K8063 is connected to, second line is how many K8063 digits are connected.
FinishedHeadingLabel=DNSRLED Setup Complete
WelcomeLabel1=DNSRLED v1.1
WelcomeLabel2=...an LED display driver for use with Velleman K8063 hardware and DNS Redirector software.
SelectDirDesc=DNSRLED should be installed to the same folder as DNS Redirector...
