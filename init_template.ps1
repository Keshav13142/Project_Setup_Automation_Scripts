$type=$args[0]
$app_name=$args[1]
$open=$args[2]

if($type -eq '' -and $app_name -eq ''){
    Write-Host "Invalid options"
    exit;
}

if($app_name -ne '.' -And $app_name -ne '' ){
    mkdir $app_name;
    Set-Location $app_name;
}

if($open -eq 'open'){
    code .;
}

git init;

if($type -ne 'node' -And $type -ne 'new' -And $type -ne ''){
    if($type.split('-').length -ne 2){
        npm create vite@latest -- --template $type .;
        npm i;
        Copy-Item $PSScriptRoot\.gitignore  .
    }
    else{
        mkdir frontend;
        Set-Location frontend;
        npm create vite@latest -- --template $type.split('-')[0] .;
        npm i;
        Remove-Item .gitignore;
        Set-Location ..;
        mkdir backend;
        Set-Location backend;
        Copy-Item $PSScriptRoot\node\* -Destination . -Recurse;
        npm i express dotenv express-async-handler;
        Set-Location ..;
        Copy-Item $PSScriptRoot\.gitignore .;
    }
}
else{
    switch ($type) {
        'node'{
            Copy-Item $PSScriptRoot\node\* . -Recurse;
            Copy-Item $PSScriptRoot\.gitignore  .;
            npm i express dotenv express-async-handler;
        }
        'new'{
            Copy-Item $PSScriptRoot\vanilla\* .;
         }
        Default: { Write-Output "Invalid-Option" }
    }
}