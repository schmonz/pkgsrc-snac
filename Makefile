# $NetBSD: Makefile,v 1.12 2024/07/09 23:45:48 schmonz Exp $

DISTNAME=		snac-2.56
CATEGORIES=		www
MASTER_SITES=		${HOMEPAGE}archive/
SITES.${DISTNAME}.tar.gz= -${MASTER_SITES}${PKGVERSION_NOREV}${EXTRACT_SUFX}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://codeberg.org/grunfink/snac2/
COMMENT=		Simple, minimalistic ActivityPub instance
LICENSE=		mit

WRKSRC=			${WRKDIR}/snac2

LDFLAGS.NetBSD+=	-lrt

INSTALL_MAKE_FLAGS+=	PREFIX=${DESTDIR:Q}${PREFIX:Q}
INSTALL_MAKE_FLAGS+=	PREFIX_MAN=${DESTDIR:Q}${PREFIX:Q}/${PKGMANDIR:Q}

.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
