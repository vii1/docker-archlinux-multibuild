# docker-archlinux-multibuild
Arch Linux image with compiling capability for Windows/Linux x86/amd64, including many popular libs and optionally Wine (to run tests, etc).

Forked from [haffmans/mingw-qt5](https://hub.docker.com/r/haffmans/mingw-qt5/)

## Available tags

### windows
All tags containing `windows` have cross-compiling capability to Windows platforms through w64-mingw32. Both x86 and amd64 are always supported. Invoke commands using the prefixes:
* `i686-w64-mingw` to access the x86 (32-bit) toolchain
* `x86_64-w64-mingw-` to access the amd64 (64-bit) toolchain

### linux, linux_x86, linux_amd64
All tags containing `linux` have compiling capability for Linux. If no architecture is stated, then both (x86 and amd64) are available.

### wine
All tags containing `wine` have Wine installed, including 32-bit and 64-bit binary execution, Mono and winetricks.

## Tag chart
| Tag | Windows x86 (i686-x64-mingw) | Windows amd64 (x86_64-w64-mingw) | Linux x86 | Linux amd64 | Wine |
| --- | ---------------------------- | -------------------------------- | --------- | ----------- | ---- |
| linux | - | - | ✅ | ✅ | - |
| linux_amd64 | - | - | - | ✅ | - |
| linux_x86 | - | - | ✅ | - | - |
| windows | ✅ | ✅ | - | - | - |
| windows_linux | ✅ | ✅ | ✅ | ✅ | - |
| windows_linux_amd64 | ✅ | ✅ | - | ✅ | - |
| windows_linux_amd64_wine | ✅ | ✅ | - | ✅ | ✅ |
| windows_linux_wine | ✅ | ✅ | ✅ | ✅ | ✅ |
| windows_linux_x86 | ✅ | ✅ | ✅ | - | - |
| windows_linux_x86_wine | ✅ | ✅ | ✅ | - | ✅ |
| windows_wine | ✅ | ✅ | - | - | ✅ |
