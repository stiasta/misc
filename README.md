# Misc
====
A collection of scripts and text files that installs, sets up dev environment and information of files and code snippets.

## Set up dev env
- [Setting up windows machine](https://github.com/stiasta/misc/blob/master/setup_dev_windows.ps1)
- [Setting up java](Go here https://github.com/stiasta/misc/blob/master/java_setup.md)

## Useful commands:

### Find files in a git repo that has been changed the most.
To find which files have been changed the most in a git repo the command under can be used:

**On windows:**
```
git log --pretty=format: --name-only | sort | uniq -c | sort /R | head -100
```

**On unix based:**
```
git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10
```

The files that have been changed the most can give an indication that something is wierd with those files.

### Find self signed certificate that is invalidating the local certificate store.

This powershell command will output the certificate that can cause the local certificate store to be invalidated.
A text file will be created called `c:\computer_filtered`. If this file is empty everything should be _ok_. 
```
Get-Childitem cert:\LocalMachine\root -Recurse | Where-Object {$_.Issuer -ne $_.Subject} | Format-List * | Out-File "c:\computer_filtered.txt"
```

### Updating one or more nuget packages in a C# Solution

To run this powershell command  you have to open _Package Manager Console_ from visual studio and run this command:

```
(PackageName1, PackageName2, PackageName3) | ForEach-Object { Get-Package $_ } | ForEach-Object { Update-Package -id $_.id -ProjectName $_.projectname }
```
