# TFS2015CustomTasks
A few custom vNext tasks for TFS2015

## Included tasks
1. **GetAssembly**: Select an AssemblyInfo file from your Visual Studio solution to retrieve the versioning of your choice, and write it to a Build Variable of your choice.
2. **Echo**: Generates a simple entry log message.

## Compiling
Use the tfx extension to compile it after cloning this repository in your drive.
    tfx extension create --manifest-globs vss-extension.json

## Installing to your VSOnline or On-Premises TFS 2015
Upload the compiled .VSIX to your local TFS2015/VSO gallery and install it on the collection/s of your choice.