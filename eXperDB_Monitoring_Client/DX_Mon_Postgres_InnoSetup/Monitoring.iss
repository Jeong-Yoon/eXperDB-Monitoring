﻿; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "eXperDB Monitoring"
#define MyAppVersion "1.1.1.10"
#define MyAppVersionDir "1_1_1_10"
#define MyAppPublisher "K4M"
#define MyAppURL "http://www.k4m.com"
#define MyAppExeName "eXperDB.Monitoring.exe"
#define MyPgName "eXperDB.Monitoring"
;#define SourcePath "D:\01.Project\K4M\DX-Monitoring\dxmon\DX-Monitoring_client"
#define SourcePath ".."

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B86082BE-01BD-4ED5-A9C0-D6CF3CF7D86F}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}  
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyPgName}\Monitoring
DefaultGroupName={#MyPgName}
LicenseFile=Korean_License.rtf
SetupIconFile=ico-source2.ico
Compression=lzma2
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
DisableWelcomePage=no
OutputBaseFilename=eXperDB.Monitoring_{#MyAppVersionDir}
ChangesEnvironment=true

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Types]
Name: "full"; Description: "전체 설치"
Name: "win32"; Description: "Windows x86(32bit)"
Name: "win64"; Description: "Windows x64(64bit)"; Check: IsWin64
Name: "custom"; Description: "사용자 정의 설치"; Flags: iscustom

[Components]
Name: "prg"; Description: "프로그램 파일"; Types: full win32 win64 custom; Flags: fixed
Name: "postgre"; Description: "PostgreSQL"; Types: full
Name: "postgre\win32"; Description: "ODBC for x86(32bit)"; Types: full win32
Name: "postgre\win64"; Description: "ODBC for x64(64bit)"; Types: full win64; Check: IsWin64

[Files]
; IDast Program File
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\bin\Application Files\{#MyPgName}_{#MyAppVersionDir}\{#MyPgName}.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\bin\Application Files\{#MyPgName}_{#MyAppVersionDir}\image\*.*"; DestDir: "{app}\image"; Flags: ignoreversion
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\bin\Application Files\{#MyPgName}_{#MyAppVersionDir}\language\*.*"; DestDir: "{app}\language"; Flags: ignoreversion
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\bin\Application Files\{#MyPgName}_{#MyAppVersionDir}\Sounds\*.*"; DestDir: "{app}\Sounds"; Flags: ignoreversion
; iDast DLL File
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\bin\Application Files\{#MyPgName}_{#MyAppVersionDir}\*.DLL"; DestDir: "{app}"; Flags: ignoreversion

; Log Configuration File
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\bin\Application Files\{#MyPgName}_{#MyAppVersionDir}\*.xml"; DestDir: "{app}"; Flags: ignoreversion

; ODBC Driver Postgres
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\stage\ODBC Drivers\Postgres_ODBC\win32\*"; DestDir: "{app}\Shared\Lib\Postgres\win32\"; Flags: ignoreversion; Components: postgre\win32
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\stage\ODBC Drivers\Postgres_ODBC\win64\*"; DestDir: "{app}\Shared\Lib\Postgres\win64\"; Flags: ignoreversion; Components: postgre\win64; Check: IsWin64

;Framework 
Source: "{#SourcePath}\DX_Mon_Postgres_InnoSetup\stage\Framework\dotNetFx40_Full_x86_X64.exe"; DestDir: "{tmp}"; Check : not IsRequiredDotNetDetected; 

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyPgName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\uninstall"; Filename: "{uninstallexe}"
 
Name: "{commondesktop}\{#MyPgName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{tmp}\dotNetFx40_Full_x86_X64.exe"; Parameters: "/q" ; Check : not IsRequiredDotNetDetected; StatusMsg: "Microsoft Framework 4.0 is being Installed. Please wait..." 
                                                                                                                                                                                
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"
;Postgres ODBC Install
Filename: "{app}\Shared\Lib\Postgres\win32\ODBCRun.bat"; Flags: runhidden; Components: postgre\win32
Filename: "{app}\Shared\Lib\Postgres\win64\ODBCRun.bat"; Flags: runhidden; Components: postgre\win64; Check: IsWin64

[Dirs]
Name: {app}; Permissions: users-full

[UninstallDelete]
Type: files; Name: "{app}\config.ini"

[Code]
function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1.4322'     .NET Framework 1.1
//    'v2.0.50727'    .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//    'v4.5'          .NET Framework 4.5
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
    key: string;
    install, release, serviceCount: cardinal;
    check45, success: boolean;
var reqNetVer : string;
begin
    // .NET 4.5 installs as update to .NET 4.0 Full
    if version = 'v4.5' then begin
        version := 'v4\Full';
        check45 := true;
    end else
        check45 := false;

    // installation key group for all .NET versions
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + version;

    // .NET 3.0 uses value InstallSuccess in subkey Setup
    if Pos('v3.0', version) = 1 then begin
        success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
    end else begin
        success := RegQueryDWordValue(HKLM, key, 'Install', install);
    end;

    // .NET 4.0/4.5 uses value Servicing instead of SP
    if Pos('v4', version) = 1 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
    end else begin
        success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
    end;

    // .NET 4.5 uses additional value Release
    if check45 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Release', release);
        success := success and (release >= 378389);
    end;

    result := success and (install = 1) and (serviceCount >= service);
end;

function IsRequiredDotNetDetected(): Boolean;  
begin
    result := IsDotNetDetected('v4\Full', 0);
end;

function InitializeSetup(): Boolean;
begin
    if not IsDotNetDetected('v4\Full', 0) then begin
        MsgBox('{#MyAppName} 은 Mivrosoft .NET Framework 4.0 Client Profile의 설치를 필요합니다.'#13#13'본 프로그램은 Microsoft .NET Framework 4.0 Clicnt Profile의 설치를 포함하고 있습니다', mbInformation, MB_OK);        
    end;
    
    result := true;
end; 
