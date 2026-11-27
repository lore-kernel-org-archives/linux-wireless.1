Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759983;
	b=toh9/ZtZNJM0abGO8mksihcC7GeZBAn9KWR50E+7mcVUXPi6ANl9kmIQuWlfxbCY+vsA
	 iMe02Hql4JWLQehJmnuVXs8rMTQ/s8YiHHNn1ND0nC2AlNNOI+rmZXIUoLmJSb/cQb9oj
	 GgWqvCydyaoH5CH3efsDIwC+PcIpRDfYgtCw8XNkjTmE7lKm/lxUH20/BxFvDY+rYZJm7
	 9kcHyV7IRiUPuCP/rwdw0S5AClwPAZiyjaEcTQH9D7gowbKi3A2Q3qKNYOQiIrAnBIP+F
	 NakI+j69eUDwgIroGHLAp7rD+CeK+9LbWwte/OFBQaOJMtNbgVDKa1a239UMv4zRRlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
	b=XHqZO8ECKlJcvIS+s1PamQAfb8IE6wKQcydzGThAjOWQ10eMR1zSCqPtRVPOV2lB8lLP
	 hQnkbKtHB2REQQMOF5Aes+XCmVcCzVG1MU8Tu3+GigfEFP89KYRWtyJZWMIOvScVI54HY
	 h6vilVq13eutMlx8gEXoRjHhrazhEvggGxIIDYOn/LEoOrLy/+ivsIwGxr2CXO4pdzzBW
	 rMy2PcINer8SL8E3BOgHfdg2vmVeqB747FcaCHVSBIrQ5ablrrTrkvGMkdopoSosq2Vch
	 6VXxekJ7zsl+BvH4HJjLG0O7xXKWSUece73F1P3ny5C3gxm4bxhsmDOEZUnpGBc6dcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4EI82nF;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242E606A321
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0242E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4EI82nF
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so10502771eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759982; x=1796364782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=g4EI82nF7Nloy8AYW+a/hEg1Vp9CiPUs78opiAEqztAWGt+rnfZGYefHRuK/3P3MIb
         u0FtuGU3ck2AoKHcWINsJZ0/xFyfLdRcpFAPIUXBaFduy1J+aLnZqWzVSYjxIw1IVLpU
         PkjOycV+9mLS5yKR7wrXBTc+uFeWbTfsfES7CAiU3vT0rYcm2N4UMQ1m7goBn/jOf3pb
         l3cSpqsw//tJS0gvI1snGWfBdBpmrWTvzhfms0icTgDhNiMfWBCafA/vQLk1QaWwhETM
         URt1FZF08BON6/v0tw6+d9kB6DkrZXgcVrK3HDZ7x6aVZR1y+QMV+ZA/LKjcYjj4WnUG
         h0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759982; x=1796364782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=txQ98aTa34jkyhRuVxGn81VQY/gH+7pFaFUX07EaE4JCGVmJU1FZRlR7SYncNtl9Kq
         KdCGYlHLUB9SJ/TpYAlyVc2xt5HkI/kMXXNYPHoBxqcrcolPnRFrJHiwmGVHtdyJiW/u
         6SH9iDu304xjWfHIBDtRqhcapxa0qvgmv7P9UMlknJFqLx7Dm8ox/RpA+PlwOvGNQmwI
         7mEOtTw137g+60B8IICi2XluWRQjPPGFSP/ePfXNDEC6v547YWV6Cw6Av9CbCzOOuB9D
         p75WNJmJdVcSs2ndpz6fSx89iTUs2w7cXLpurCYIKBuNNAs5+N0iLpjUnSZBpjiwxqEl
         TPwg==
X-Gm-Message-State: APuU4Z85BO//c36S/U5X6Qopap1i8hgEoHKf2kdg3qq5WF1M1s4vZwFG
	SiRfli+Y7kCDPxZqomKRGvckeOI9hCHUR9GIUYv+dAUbSkErUPcAd5xLtmmkU0DybMY=
X-Gm-Gg: AZFdTZdR7IiQki5kwIoOoROYwFlN/7Q5WrXZrpknojdjof92/HyysHgSKIsAm9/mTz7
	YYRbB8ZEA6h+s9/jqexeK2gSr861FAUsacQjmfW7clhASeHWOeSCLQ4ASNLqincsyFhjgwsQmv0
	+fHmU12ha1fp50Wu5h68U3OQ5sZ9QxK/0dcH8YGYTNUtec1P5R9DElsAOFfpxrUavQbkwdvPVWL
	193I77NvLzi46mZofYPN3L6vVn1VT5d8A/nbZ3alqFmOtnvtqQp5l/kWL3WTKvuObamId2v08Cg
	6aTCfUmwASZI5RyyL772caQdXsVkoV2p/g6rvCgDdBzbuO0rxAJJNkiAt8Z+Ibb+Dyeqf1E+4LA
	R3XZC5sTBhMO0itjJwUN8/d6j27Pr02G7NWxXF8a2+4FC4CKH2/+8tssgp+zZaGEIBUZOhTFlwT
	mgq3lj1r7wSsh0PnHQwe91rehKsrYfuo/2rLHC/jgYYx9cKnxU3yJ19CM7Ttdln6KmCiFqfHNeR
	9e390SFNV6XOb0JZyE14s5lrunaS3/xtd4R20D5WRdso6kE412fNQuadtiwc54M6W1Px3cpix6z
	3n+y8mx4bAm/fq9YFj+e6wQTxwEeesxdMNB+CK/PSpQ1SX7TDwKHIwMSdJ1FIvf/dx+nRcDhrtc
	Db8gQVM8J0NJDb6M=
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr17976279eec.7.1795759982150;
        Thu, 26 Nov 2026 22:13:02 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:01 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 02/11] wifi: brcm80211: move d11.h to the shared include directory
Date: Fri, 27 Nov 2026 14:11:32 +0800
Message-ID: <20261127061147.506129-3-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the header to brcm80211/include, where the other hardware
definitions shared between the brcm80211 drivers live, and include it
as <d11.h> in brcmsmac.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c          | 2 +-
 .../net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (100%)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index c1a2318d7e..eeae85cae0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -28,7 +28,7 @@
 #include <net/mac80211.h>
 #include <defs.h>
 #include "phy/phy_int.h"
-#include "d11.h"
+#include <d11.h>
 #include "channel.h"
 #include "scb.h"
 #include "pub.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 9cb09c8a13..d81de701a3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -21,7 +21,7 @@
 
 #include <brcmu_utils.h>
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "scb.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 0a0c0ad4f9..6841bc0052 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -17,7 +17,7 @@
 #include <brcmu_wifi.h>
 #include <brcmu_utils.h>
 
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "rate.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 2b10fd5427..e178b1a0e2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -18,7 +18,7 @@
 #define _BRCM_RATE_H_
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "phy_hal.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
index 79d4a7a4da..6e92dc4c90 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
@@ -17,7 +17,7 @@
 #include <net/mac80211.h>
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "rate.h"
 #include "phy/phy_hal.h"
 #include "channel.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h b/drivers/net/wireless/broadcom/brcm80211/include/d11.h
similarity index 100%
rename from drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
rename to drivers/net/wireless/broadcom/brcm80211/include/d11.h
-- 
2.53.0

