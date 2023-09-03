<#
=============================================================================================
Name = Cengiz YILMAZ
Microsoft Certified Trainer (MCT) - Microsoft MVP
Date = 18.08.2022
www.cengizyilmaz.com.tr
365gurusu.com
www.cozumpark.com/author/cengizyilmaz
============================================================================================
#>
Function Display-Menu {
    param (
        [string]$Title = 'TLS Configuration Menu'
    )
    Clear-Host
    Write-Host "=============== $Title ================" -ForegroundColor Cyan
    Write-Host '1: Enable TLS 1.2' -ForegroundColor Green
    Write-Host '2: Disable Other TLS Versions' -ForegroundColor Yellow
    Write-Host '3: Exit' -ForegroundColor Red
}

Function Enable-TLS12 {
    $RegPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server'
    $Net45Path = 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319'
    $Net45Path_WOW64 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v4.0.30319'
    $Net35Path_WOW64 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v2.0.50727'
    $Net35Path = 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v2.0.50727'
    $StrongCrypto = 'SchUseStrongCrypto'
    $DefaultTlsVersion = 'SystemDefaultTlsVersions'

    # Enable strong crypto on .NET Framework 4.5
    Set-ItemProperty -Path $Net45Path -Name $StrongCrypto -Value '1'
    Set-ItemProperty -Path $Net45Path_WOW64 -Name $StrongCrypto -Value '1'

    # Enable strong crypto on .NET Framework 3.5
    Set-ItemProperty -Path $Net35Path_WOW64 -Name $StrongCrypto -Value '1'
    Set-ItemProperty -Path $Net35Path -Name $StrongCrypto -Value '1'
    
    # Set system default TLS versions for both 4.5 and 3.5
    Set-ItemProperty -Path $RegPath -Name $DefaultTlsVersion -Value '1'
    
    # Enable TLS 1.2
    New-ItemProperty -Path $RegPath -Name 'Enabled' -Value '1' -PropertyType 'DWord' -Force
    Write-Host "TLS 1.2 Enabled" -ForegroundColor Green
}

Function Disable-OtherTLSVersions {
    $TLS10Server = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server'
    $TLS11Server = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server'

    # Disable TLS 1.0
    New-ItemProperty -Path $TLS10Server -Name 'Enabled' -Value '0' -PropertyType 'DWord' -Force

    # Disable TLS 1.1
    New-ItemProperty -Path $TLS11Server -Name 'Enabled' -Value '0' -PropertyType 'DWord' -Force
    
    Write-Host "Other TLS versions have been disabled" -ForegroundColor Yellow
}

$exitLoop = $false

while ($exitLoop -eq $false) {
    Display-Menu
    $choice = Read-Host "Please make a selection"
    
    switch ($choice) {
        '1' {
            Enable-TLS12
        }
        '2' {
            Disable-OtherTLSVersions
        }
        '3' {
            Write-Host "Exiting..." -ForegroundColor Red
            $exitLoop = $true
            break
        }
    }
    
    if ($exitLoop -eq $false) {
        Write-Host 'Press any key to continue ...' -ForegroundColor Magenta
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}
