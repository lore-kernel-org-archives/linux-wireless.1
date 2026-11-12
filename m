Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460325;
	b=DO+E7nSgMSmKAMFBVq34BUHSFgibYSzlxs9dp+Lu8f/U8zOx/Al2Soj76+CEey/LJM4W
	 sZAhBSMneBj3ZjlNo0v0TmGe9Wa31O09thUVO297LiZnSSD4ghyxFnCgJSH57RXQIwmoc
	 735VCtcfdEHwN9Oi8A9Ph0VFRGv1O29VDHWZ7UeUs+dCZzuno/I4/k80ervAbLzRIoTIb
	 ZfhwzU95jqavawpqKYX94rabsa12n8YTvVf2OA7cavNaAeP+wZEvrthFAWg5cDXE7ALRa
	 kbGaF4x1nGg4+LlsuPY8SU6fJntiH4ZBAm0VcauDLXIZBbVQHVVdFaEdWjFoac8+McA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
	b=xz257Sxr+ijJZzVLIaKtLQ5WEFs/cKk5Dp9+gNLGHfcHXfTRhBQaT/DrZVerCWibD5Bf
	 8WjShkgC1d0HzmfepTYP4DI0R1A9Y8G+iw5vPLpVbLW2f8uQCdmsxEDPKMNRvsg4F5SqC
	 g5vzlRNOc807cKtP5gP7WRARAJ8751zx4/NBuXplVKoQuSqNmI1+GlzGg8IP0CE7DJWPs
	 kTt3QnABgoZDpwON2F9zkIVng9q4ZbB8bM2VBNS1nPPuA2j2E6m9YJ34HPK84cr3uYiEP
	 VTeg6PcQS5htWiRSkreLmtBcqik8J/w4aMrJVqShnYbevgrhq+3qLrH0Ens6RRXGw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grSH4cuT;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B0C606A880
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B0C606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grSH4cuT
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5873187eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460323; x=1795065123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=grSH4cuTeil7DmfeYByb529y3LjJgYepDb8OtKEsY7Qv8LhjhWFOn9wb8u8vo4WKG8
         HWO5SUKcEzHEsZ/j1SW0ZF3Z2x5rnkai7mqS8aWfYMXyWUDy5h2iBSRc23GBJ+s8T2mj
         BC89Y16sN+TXvZBbg9mTqu2+zWTsXAyJwPVEym/pWONvufndFLrfIEpE0UCrJssw5gTM
         R1l0IYMlJ6R4WaTDpn6KrIXw7HJrXGLvl5d+FjEikhTvDeKV1VipDZveSJK17kmEqZrJ
         8ckCnd5KlAt0z61Y+MQg2MPm9S97ZWT40qC74Zd3l2AIl2+rhgidIXYQpfnovpD7IgrD
         f84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460323; x=1795065123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=CjzaBZ45neKgB6huZB4ytVvWn50A2WVd7nGucEi18c5aVIkYSTduOA+Lf5HWgzRLdK
         LYAbDedDsjCohkuJYs21I0nIEHsX4b0MW/uCSOBR3ghJCxrNMGQAGuVfDspGeJ3766cI
         mVSwkOK/BQpgcXCB4+q27tcCoefmEFlA9orCSrImhlvM/u1oepqixpmS2w4Vr/Hx5Sqj
         S064qWFbmA34/nL9k/1IrMLEa7NPHjrZAWAaxenxy4opgTOoFpcgpKRVwhfP0jjcYE5O
         Sh82WhlZFgv8cBKjIkO85UjOkLOouViAc98AVsfuYR8veIDsKExw5+aByU/WP9BbUtRI
         7FKA==
X-Gm-Message-State: APuU4Z+PGxRQB9xTC8ePzSPUQg+bntZC2OJyWohOKJGk5/RYOGtNvmmN
	uBCntQCQc8KcWf0di00tb936yxepjCbW/oN4sxOjTUU8aNi1QKLre7SSTgtVRCxEwIk=
X-Gm-Gg: AYBFou2o6IjDHKoqh8WmBMAy7H2EJbaHgNXH44QhlMSP+OCF3uSsy1ro5lhlqrBaZhp
	IbIdjyOl26pwz53yVQuxGl/IRWvLKfMieMfFirnP8Kc7dt34DQJnf4hc82sjtTKiH/u+ba70yX2
	kUXZ2zm7AIjZe13h01nrZ2+WltWEcCE8AcOdvIgw6MAdloC8aYoYlfsvITbTyFYOnJUHYXeN6wy
	Pit9dOCE7deyU1Z5ROE7DgCrrUh+1cGGQwc3+TFE1717Og9phi8PSXZw8nmP+AXf2rtiPIuH28S
	uSr6YfIPnHeZGD8SCBTw5pdImlFrH2o0Z0+2lHAdLv+f1jrrq0/CHwoOG/tCjhelYdnLFz7CDjd
	DchxUlDUxI0PZ46V5qj9hefMS6PF6ttlXkQKHDLYJlEohoa49e1ZjiH4Q27MPqPe1cXrDi62UNk
	ZXsNAIly9PFKO+sRXhoMCHaFySnMEvP4iqDtE6ekMOVZzgORqMC3BhOs3sGRhUi5iq4aC/2DC5G
	FC+lAVD/s4ddnebk+vvM9dzI/22AyL46n4uBvYWUHSQYhUncKNkdDAG428fxMoO1lYVZWePvsDx
	iSvGqEOMXW0MrZHWau3UuG7yA2yhaknIObAuq36n075/jC2ad+AeC4Y=
X-Received: by 2002:a05:7300:e024:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37685b80494mr4971787eec.11.1794460323501;
        Wed, 11 Nov 2026 21:12:03 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:03 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] wifi: brcm80211: move d11.h to the shared include directory
Date: Thu, 12 Nov 2026 13:11:29 +0800
Message-ID: <20261112051142.2797529-3-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

