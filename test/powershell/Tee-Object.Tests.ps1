Describe "Tee-Object" {

    Context "Validate Tee-Object is correctly forking output" {

	$testfile = Join-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath assets) -ChildPath testfile.txt

	It "Should return the output to the screen and to the variable" {
	    $teefile = $testfile
	    echo teeobjecttest1 | Tee-Object -variable teeresults
	    $teeresults         | Should Be "teeobjecttest1"
	    Remove-Item $teefile -ErrorAction SilentlyContinue
	}

	It "Should tee the output to a file" {
	    $teefile = $testfile
	    echo teeobjecttest3  | Tee-Object $teefile
	    Get-Content $teefile | Should Be "teeobjecttest3"
	    Remove-Item $teefile -ErrorAction SilentlyContinue
	}
    }
}