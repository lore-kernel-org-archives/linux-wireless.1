Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044685;
	b=xI5cnX/qiIL33NmMxRls5bOtS526OiRAHuiAU/aH7H48lQ23adK7Tf3fIrVhS45VrEO6
	 T6JzUHzKFIHniR4Sqm/YRZAgfuej7L5Ix+PIC48rLiMzFJeL4JGF5aZ54CKaAhI/IwC2F
	 dwvfd9tidWSCrbWpkOwsDCzf5/3didI99ezctXKQ6OIIp1VXHGiOdrzqakdS3XjFOZuxq
	 tqDQPj46bpWwETjzsCH8ZrA49AQn9c7x2nWO5Q39vUxVpI+aKufxu7jQ7wA4tlWqDQhLD
	 cy759IXumtrywFX0vuYhetf9S0SX8ain1hXSvC0vFlm3N1psILQ23wIHaprEsKo+iag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T7IIQCqo8guYi8GfDq1q7f5IjmWJ2tulGl8JbhnGqY4=;
	b=BGS1grXTxw6gGvZXbDUh3MadeI6otAlIsR4w66jVI+kPVphY3TCY0MCyeQUtOxI4paca
	 OSaMIfl5j55bQ6naprxfpaKwSwj7gX59gp0QzsBWoxL7IqP7Nh9D0fTdPtKG5h7F9VDX8
	 kWcYb3MABo0hzYuBsfs/7E+ib4Wxn4Wfz//p6RGl4C3clquLh6qgYxt3SMYzvUFBgPCt+
	 8Dcg7xKusnYIbzwSm3AP7oOGDrrJNPoFJTpYA6ECbVxYcfhDjHqQYJpKyHReg1EQSKeBd
	 0YdggEIE4YoDwjtoGkZaOvnQDY4nunhRbKCbkbMZ/5sqWteh8I38xxK4jG4jVq8mvJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gBioKUob;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4028606A320
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4028606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gBioKUob
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so240010b3a.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795044684; x=1795649484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7IIQCqo8guYi8GfDq1q7f5IjmWJ2tulGl8JbhnGqY4=;
        b=gBioKUobwtV7ywjda+DxqA73jXU6IlYfmPQnyRkS86YXa/9wTEVF/JyohU/Knjha8l
         KJy6WytI3wcdSVS++cnGzVMwnfXpL3p1i3+bNx2TyV0RnlJ7IDKgVr8ZqqWgeXihBMZI
         64Jnu589x3f+WZTLcEZk4vuie5EaoNacLmRQCLBnDRjbKRRL1a8cxPmbc81ku/xDInfF
         WtHG7wo0WSYlKDrfmemmYsJeUCcKM5+fFoCenF1un+XnSbrNqYquI1Pv4Hy9bBQD3U5j
         +CPf5yTSzvD3AIgqMEgPZ5jHpycHUFwrYsto6enLm41tKPIfhfxQfSUVbNAg8N4Dhx0k
         9Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044684; x=1795649484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7IIQCqo8guYi8GfDq1q7f5IjmWJ2tulGl8JbhnGqY4=;
        b=vf5aTF5/A1qV2f7qV4mt5w9cRHS90jVGj2OTF8QdnrIKoRa2Xt9HQkvsdPpSIfLXpE
         vBL1u9W8zTKdDZqO0g/MUJPVi8/ktRcWt3Jv8VtHcvkh1ChbSiA71EbiwLyedGCsrEDV
         UflcrRWdY1x799YwRkvzOIjEjr+Nr82seI0vnRaVscIr3f8nEFhUS4VMr5VjeqsAVVzm
         U3r7rmkSLTzPUWlwu1BQXMo4eWWnFqdeVZ2lv3nVZLfd3kZZ+4K41R0bNv7Xwg+ZamaF
         dm7vnPiqmUtj3C0dIGBcwCOE2Yp0uRGUmI7rNz7M4eojobhiYPLyBJs5ApQal6RMLKDa
         8mTw==
X-Forwarded-Encrypted: i=1; AL+hErHoSD8X3dTFJSHLvWSO+N8GVuPY5DcSbDb+l0Iufy8x1Oqie2bqT3E7/IuhgjHkmv6YS/ISNjXoGH9vMz5jbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nA3OWBRL+8wXUCkXJOLX1klVBgy5NcyeM/bW4VFI6Qv4aACJ0
	lcXYj70hh4KTwtteZupl0azsQXmA1Z/0mN6kt+3zWzPoNd6uCs8ZF9rYNFr1hDD9UwU=
X-Gm-Gg: AYBFou1m/cIyvNUE7ElVR7wbBrSqI/kEyjp64/PqCfEKd1K6DdhZqIGzFkDNDhqIa73
	FMtnXIRYrAKIqmLxVE1V4NZtplaA0PBN0cA7IAus/hf+S42kjqAyq5TL44ZOImH85mvCJlhw362
	ZDux1Yz4SOfjREYBtujOpAlyBDctS4JFMkRkaebKrjqWkZy/SHp0eETo5bV4wqvwTN5NL6NjjtR
	rTryJ+QRLbM2XXgrFf1ATQxgPTNiKbyvQkip3h2t6IZsUhIidPGBcHratceE1QT/5RpKNP4OVj5
	I/sPcCxNTlrIB1KsnjQRvSe0TnVZ9814EVyr7PVMbSaebDjtaJVMH3NG5Mx4noutdoXh5y7laBs
	E6GbrfXnuKu+f1sudG7tySzQxIkXLhJZMtT2FEj9CwXvMvuO3zsd2DcKuYNl9tQuUzOKCOaDcIu
	jwKZ71/Ca6Pfmw0cYvHqJchelU+7EbSEBkxhJzPDE9vnc4ZnbT8UG1JNzl9o3mgKm8HWjhC2vYi
	oWMaXi+iqFl/AwPs8hobd6y8udCd9E2CbYLia6upY2NkDSDx8lnQTyFHlb42OdGJwfLzMw9IygZ
	sri9rJeewvihdUqv5+TP2wYzq0Jy2QTLkZ/oKt7B/enLMsu6GMPBg9+4hEZ3X36Yq2D4dwL9G2M
	43iUD9X1LvEPMq5mtz99IPSSTPgw=
X-Received: by 2002:a05:6a00:1a91:b0:8b5:a3a5:6d57 with SMTP id d2e1a72fcca58-8c7853e5f48mr26613b3a.4.1795044683907;
        Wed, 18 Nov 2026 15:31:23 -0800 (PST)
Received: from mma-H9MHD44.mymodem ([60.227.235.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1467822b3a.22.2026.11.18.15.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:31:22 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next v2 1/4] wifi: mm81x: use guard(rcu)() over scoped_guard()
Date: Thu, 19 Nov 2026 10:31:01 +1100
Message-ID: <20261118233104.1640855-2-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118233104.1640855-1-lachlan.hodges@morsemicro.com>
References: <20261118233104.1640855-1-lachlan.hodges@morsemicro.com>
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

use guard(rcu) over scoped_guard() to reduce a level of indentation.
No functional change.

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 drivers/net/wireless/morsemicro/mm81x/mac.c | 27 ++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/morsemicro/mm81x/mac.c b/drivers/net/wireless/morsemicro/mm81x/mac.c
index cd0bb4d21acf..77c4d3358e25 100644
--- a/drivers/net/wireless/morsemicro/mm81x/mac.c
+++ b/drivers/net/wireless/morsemicro/mm81x/mac.c
@@ -2136,23 +2136,22 @@ void mm81x_mac_rx_skb(struct mm81x *mors, struct sk_buff *skb,
 
 	mm81x_rx_h_fill_status(mors, hdr_rx_status, &rx_status, skb);
 
-	scoped_guard(rcu) {
-		vif = mm81x_rx_h_skb_get_vif(mors, skb, hdr_rx_status);
-		if (vif) {
-			sta = ieee80211_find_sta(vif, lookup);
-			if (sta)
-				mm81x_rx_h_update_sta(sta, &rx_status);
-		}
+	guard(rcu)();
+	vif = mm81x_rx_h_skb_get_vif(mors, skb, hdr_rx_status);
+	if (vif) {
+		sta = ieee80211_find_sta(vif, lookup);
+		if (sta)
+			mm81x_rx_h_update_sta(sta, &rx_status);
+	}
 
-		if (mors->monitor_en)
-			mm81x_rx_h_add_rt_s1g_tlv(skb, hdr_rx_status, &rx_status);
+	if (mors->monitor_en)
+		mm81x_rx_h_add_rt_s1g_tlv(skb, hdr_rx_status, &rx_status);
 
-		memcpy(IEEE80211_SKB_RXCB(skb), &rx_status, sizeof(rx_status));
+	memcpy(IEEE80211_SKB_RXCB(skb), &rx_status, sizeof(rx_status));
 
-		local_bh_disable();
-		ieee80211_rx_napi(hw, sta ? &sta->deflink : NULL, skb, NULL);
-		local_bh_enable();
-	}
+	local_bh_disable();
+	ieee80211_rx_napi(hw, sta ? &sta->deflink : NULL, skb, NULL);
+	local_bh_enable();
 }
 
 static void mm81x_mac_flush_queues(struct mm81x *mors)
-- 
2.43.0

