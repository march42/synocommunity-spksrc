#!/bin/sh

# Package
PACKAGE="full-text-rss"
DNAME="Full-Text RSS"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
WEB_DIR="/var/services/web"


service_preinst ()
{
    exit 0
}

service_postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    # Install the web interface
    cp -R ${INSTALL_DIR}/share/${PACKAGE} ${WEB_DIR}

    exit 0
}

service_preuninst ()
{
    exit 0
}

service_postuninst ()
{
    # Remove link
    rm -f ${INSTALL_DIR}

    # Remove the web interface
    rm -fr ${WEB_DIR}/${PACKAGE}

    exit 0
}

service_preupgrade ()
{
    exit 0
}

service_postupgrade ()
{
    exit 0
}
