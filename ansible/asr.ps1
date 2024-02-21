# Create a new GPO
    $gpoName = "ASR"
    $gpo = New-GPO -Name $gpoName -Comment "GPO to configure ASR rules"

    # Define the registry path for ASR settings
    $asrRegPath = "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules"

    # ASR rule settings
    $asrRules = @{
    "56A863A9-875E-4185-98A7-B882C64B5CE5" = 1;  # Block abuse of exploited vulnerable signed drivers
    "7674BA52-37EB-4A4F-A9A1-F0F9A1619A2C" = 1;  # Block Adobe Reader from creating child processes
    "D4F940AB-401B-4EFC-AADC-AD5F3C50688A" = 1;  # Block all Office applications from creating child processes
    "9E6C4E1F-7D60-472F-BA1A-A39EF669E4B2" = 1;  # Block credential stealing from the Windows local security authority subsystem (lsass.exe)
    "BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550" = 1;  # Block executable content from email client and webmail
    "01443614-CD74-433A-B99E-2ECDC07BFC25" = 1;  # Block executable files from running unless they meet a prevalence, age, or trusted list criterion
    "5BEB7EFE-FD9A-4556-801D-275E5FFC04CC" = 1;  # Block execution of potentially obfuscated scripts
    "D3E037E1-3EB8-44C8-A917-57927947596D" = 1;  # Block JavaScript or VBScript from launching downloaded executable content
    "3B576869-A4EC-4529-8536-B80A7769E899" = 1;  # Block Office applications from creating executable content
    "75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84" = 1;  # Block Office applications from injecting code into other processes
    "26190899-1602-49E8-8B27-EB1D0A1CE869" = 1;  # Block Office communication application from creating child processes
    "E6DB77E5-3DF2-4CF1-B95A-636979351E5B" = 1;  # Block persistence through WMI event subscription
    "D1E49AAC-8F56-4280-B9BA-993A6D77406C" = 1;  # Block process creations originating from PSExec and WMI commands
    "B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4" = 1;  # Block untrusted and unsigned processes that run from USB
    "92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B" = 1;  # Block Win32 API calls from Office macros
    "C1DB55AB-C21A-4637-BB3F-A12568109D35" = 1;  # Use advanced protection against ransomware
    "A8F5898E-1DC8-49A9-9878-85004B8A61E6" = 1;  # Block Webshell creation for Servers
}

    # Apply the ASR rule settings
    foreach ($rule in $asrRules.GetEnumerator()) {
        $regKey = "$asrRegPath\$($rule.Name)"
        Set-GPRegistryValue -Name $gpoName -Key $asrRegPath -ValueName $rule.Name -Type Dword -Value $rule.Value
    }
    New-GPLink -Name $gpoName -Target "OU=Workstations,DC=sevenkingdoms,DC=local"
