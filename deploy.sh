#!/bin/sh
git pull
dotnet publish -c Debug -o Build
cd Build
export ASPNETCORE_ENVIRONMENT=Development &&  dotnet API.dll
