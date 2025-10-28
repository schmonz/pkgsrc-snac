# $NetBSD: Makefile,v 1.46 2025/10/05 19:26:28 js Exp $

DISTNAME=		snac-2.83
PKGREVISION=		1
CATEGORIES=		www
MASTER_SITES=		${HOMEPAGE}archive/
SITES.${DISTNAME}.tar.gz= -${MASTER_SITES}${PKGVERSION_NOREV}${EXTRACT_SUFX}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://codeberg.org/grunfink/snac2/
COMMENT=		Simple, minimalistic ActivityPub instance
LICENSE=		mit

WRKSRC=			${WRKDIR}/snac2

LDFLAGS.NetBSD+=	-lrt
LDFLAGS.SunOS+=		-lsocket -lnsl

INSTALL_MAKE_FLAGS+=	PREFIX=${DESTDIR:Q}${PREFIX:Q}
INSTALL_MAKE_FLAGS+=	PREFIX_MAN=${DESTDIR:Q}${PREFIX:Q}/${PKGMANDIR:Q}

INSTALLATION_DIRS=	share/${PKGBASE}/po

post-install:
	cd ${WRKSRC}/po;							\
	for f in *.po; do							\
		${INSTALL_DATA} $${f} ${DESTDIR}${PREFIX}/share/${PKGBASE}/po/;	\
	done

.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
