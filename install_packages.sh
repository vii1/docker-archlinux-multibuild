#!/bin/bash

# NOTA: Qt5 no disponible para linux-x86

#echo PLATFORM=$PLATFORM
#echo ARCH=$ARCH
#echo WINE=$WINE
#echo capa = $1

PACMAN_FLAGS='--noconfirm --noprogressbar --needed'

# Windows (x86 y amd64)
install_windows()
{
    case "$PLATFORM" in
        *windows*)
            # Install MingW packages
            pacman -S $PACMAN_FLAGS \
                mingw-w64-binutils \
                mingw-w64-crt \
                mingw-w64-gcc \
                mingw-w64-headers \
                mingw-w64-winpthreads \
                mingw-w64-bzip2 \
                mingw-w64-cmake \
                mingw-w64-expat \
                mingw-w64-fontconfig \
                mingw-w64-freeglut \
                mingw-w64-freetype2 \
                mingw-w64-gettext \
                mingw-w64-libdbus \
                mingw-w64-libiconv \
                mingw-w64-libjpeg-turbo \
                mingw-w64-libpng \
                mingw-w64-libtiff \
                mingw-w64-libxml2 \
                mingw-w64-mariadb-connector-c \
                mingw-w64-nsis \
                mingw-w64-openssl \
                mingw-w64-openjpeg \
                mingw-w64-openjpeg2 \
                mingw-w64-pcre \
                mingw-w64-pdcurses \
                mingw-w64-pkg-config \
                mingw-w64-qt5-base \
                mingw-w64-qt5-base-static \
                mingw-w64-qt5-declarative \
                mingw-w64-qt5-graphicaleffects \
                mingw-w64-qt5-imageformats \
                mingw-w64-qt5-location \
                mingw-w64-qt5-multimedia \
                mingw-w64-qt5-quickcontrols \
                mingw-w64-qt5-script \
                mingw-w64-qt5-sensors \
                mingw-w64-qt5-svg \
                mingw-w64-qt5-webkit \
                mingw-w64-qt5-websockets \
                mingw-w64-qt5-winextras \
                mingw-w64-readline \
                mingw-w64-sdl2 \
                mingw-w64-sdl2_image \
                mingw-w64-sdl2_gfx \
                mingw-w64-sdl2_mixer \
                mingw-w64-sdl2_net \
                mingw-w64-sqlite \
                mingw-w64-termcap \
                mingw-w64-tools \
                mingw-w64-zlib \
                mingw-w64-qt4 \
                mingw-w64-boost \
                mingw-w64-qca-qt5 \
             || exit 1
             pacman -S $PACMAN_FLAGS \
                --force \
                mingw-w64-qt5-tools \
                mingw-w64-qt5-quick1 \
                mingw-w64-qt5-translations \
            || exit 1
            ;;
    esac
}

function install_linux()
{
    # Linux
    case "$PLATFORM" in
        *linux*)
            pacman -S $PACMAN_FLAGS \
                gcc \
            || exit 1
            # Linux amd64
            case "$ARCH" in
                *amd64*)
                    pacman -S $PACMAN_FLAGS \
                        linux-headers \
                        fontconfig \
                        freeglut \
                        glu \
                        freetype2 \
                        libdbus \
                        libiconv \
                        libjpeg-turbo \
                        libpng \
                        libtiff \
                        libmariadbclient \
                        openjpeg \
                        openjpeg2 \
                        pdcurses \
                        qt5-base \
                        qt5-declarative \
                        qt5-graphicaleffects \
                        qt5-imageformats \
                        qt5-location \
                        qt5-multimedia \
                        qt5-quickcontrols \
                        qt5-script \
                        qt5-sensors \
                        qt5-svg \
                        qt5-webkit \
                        qt5-websockets \
                        qt5-x11extras \
                        sdl2 \
                        sdl2_image \
                        sdl2_mixer \
                        sdl2_net \
                        sdl2_ttf \
                        termcap \
                        qt4 \
                        qca-qt4 \
                        qca-qt5 \
                        qt5-tools \
                        qt5-quickcontrols2 \
                        qt5-translations \
                        libglvnd \
                    || exit 1
                    ;;
            esac
            # Linux x86
            case "$ARCH" in
                *x86*)
                    # Falta: pdcurses ? -> cambiado por ncurses
                    # Falta: iconv
                    # Falta: sdl2_net
                    pacman -S $PACMAN_FLAGS \
                        lib32-gcc-libs \
                        lib32-fontconfig \
                        lib32-freeglut \
                        lib32-glu \
                        lib32-freetype2 \
                        lib32-libdbus \
                        lib32-libjpeg-turbo \
                        lib32-libpng \
                        lib32-libtiff \
                        lib32-ncurses \
                        lib32-sdl2 \
                        lib32-sdl2_image \
                        lib32-sdl2_mixer \
                        lib32-sdl2_ttf \
                        lib32-qt4 \
                        lib32-libglvnd \
                    || exit 1
                    ;;
            esac
            ;;
    esac
}

function install_wine()
{
    # Wine
    if [ "$WINE" = "1" ]; then
        pacman -S $PACMAN_FLAGS \
            libglvnd \
            lib32-libglvnd \
            wine \
            winetricks \
        || exit 1
    fi      
}

install_$1 || exit 1

# Limpieza. Elimina todos los paquetes en caché para reducir el tamaño de la imagen.
echo -e "y\ny\n" | pacman -Scc
