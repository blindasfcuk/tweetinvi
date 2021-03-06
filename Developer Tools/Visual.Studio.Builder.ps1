function Build($solutionPath, $mode)
{
	$visualStudioPath = 'C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.com'
	for ($visualStudioVersion = 14; $visualStudioVersion -gt 10; --$visualStudioVersion)
	{
		$visualStudioPath = 'C:\Program Files (x86)\Microsoft Visual Studio ' + $visualStudioVersion + '.0\Common7\IDE\devenv.com'
		
		if (Test-Path $visualStudioPath)
		{
			break;
		}
	}

	Write-Host ''
    Write-Host 'Building' $solutionPath 'in' $mode;
    $rebuildModeParameter = "/Rebuild " + $mode;

    $p = Start-Process -FilePath $visualStudioPath -ArgumentList $solutionPath,$rebuildModeParameter -PassThru -NoNewWindow
    $null = $p.WaitForExit(-1)
	Write-Host ''
    Write-Host 'Build completed!'
	Write-Host ''
}