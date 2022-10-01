$type=$args[0]
$app_name=$args[1]
$open=$args[2]


if($app_name -ne '.' -And $app_name -ne '' ){
    mkdir $app_name;
    Set-Location $app_name;
}

if($open -eq 'open'){
    code .;
}

git init;

switch ($type) {
    'react' { 
        npm create vite@latest -- --template react;
        npm i;
        Copy-Item $PSScriptRoot\.gitignore  .
    }
    'react-node' {
        mkdir frontend;
        Set-Location frontend;
        npm create vite@latest -- --template react .;
        npm i;
        Remove-Item .gitignore;
        Set-Location ..;
        mkdir backend;
        Set-Location backend;
        Copy-Item $PSScriptRoot\node\* -Destination . -Recurse;
        npm i express dotenv;
        Set-Location ..;
        Copy-Item $PSScriptRoot\.gitignore .;
    }
    'node'{
        Copy-Item $PSScriptRoot\node\* . -Recurse;
        Copy-Item $PSScriptRoot\.gitignore  .;
        npm i express dotenv;
    }
    'new'{
        Copy-Item $PSScriptRoot\vanilla\* .;
     }
    Default { Write-Output 'Invalid Option' }
}