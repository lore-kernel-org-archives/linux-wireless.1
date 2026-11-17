Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875601;
	b=wPC0hTaBlhOofTKooknc03NUpHCIqaMv4waEPEzUYLx69Fjsgdsbv2qjDjWCLzbsM5Tm
	 0TrNqD65hQamMXRA7+LFwscG0MzUcKzxwtd41hyfepk39ze/uWwH7tdno2rI2Ua3L5DvX
	 82oJN7otIOi5Gapn2tgxlp9V+o1rB0FBms9Ct6f9Fh5pGWrh/kUOJ+k244him9DgrtI3c
	 fT9RLDf32qH92UJgWG8uBPlv5sTFmKD4YSDmnPY1LY/EIPgGSIX5oOCzXVTZvNnHZ3qGw
	 lzEP0kVBm2WzI9Nk1xYVYtZwYK9ezOAJSsD7R9vDlF4bWSb7448PCq5cQHR2r7EgnQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T7IIQCqo8guYi8GfDq1q7f5IjmWJ2tulGl8JbhnGqY4=;
	b=mh+WtbtedSkJCIX1lKRZODEIWwZKiBJr3Hj2nryNWq3VQ5vs7x0FMYUaYfhL86Vp+zmj
	 +c5fiNVAJaqjptjW9H6FnOz1S7WdSn2G5TZVz7DhhPukOGUnB+bamELDu4Tc6YNOpW9G5
	 4LZb9+FY+SA0paSrHKUYExWK3dYLuM/E5z/v44TQHJlKJZkzRXtxlztWGyJlRPAG+ghEq
	 7uKwu6uLuw5KORYR8lK2csH3+F8rWbWvZSNWbpeMh+fdBDrgfMrhHF08CtazA6u+xxVgY
	 /UuM2aC2X3BfOZ0x9K6wDq6s8Ol5ARp9fPJc/wird/6hQu8tvHHjLMJzaq67b7rrp8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MiqTx3Cj;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1609606A338
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1609606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MiqTx3Cj
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso175453a91.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794875600; x=1795480400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7IIQCqo8guYi8GfDq1q7f5IjmWJ2tulGl8JbhnGqY4=;
        b=MiqTx3CjJtdROOGc37z9C5CIUsrfCeZrv8Vndqa/xMuObO5LFAissWXRFaw0T4ptP5
         4tY9LStPoDCpMI4dEm7/W/BfGe7GHilN3H3ZobPqAsT4dQ/iLNGXO8WvX5ZoC9CZgZ0d
         BZd495A2Td7uBLbOeaodPbLDUne5v2kHteG0OPOOkzcJZr1ISmPQD294Kf2LkU8NO50J
         84FqvvjGqJdi9LKIrm6BeQwdOfXi8/tx8wUyF8/UJsohXaAgxbRwA+XQBYXoKAMXKrZS
         OJ6R1jKGy6KJrYFulv3LksMPxlmGhEfRV/bK6PrKLr2l/chTG/HZcgLMUhVsC47W8VmG
         luvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875600; x=1795480400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7IIQCqo8guYi8GfDq1q7f5IjmWJ2tulGl8JbhnGqY4=;
        b=zEmJY3s4VoiDYYiqqaEbVUTq1e1Qur+c8ljGd5PtVgcWJf7B20HloXnFYV8MK6t8qB
         R7TzWk8p7yGxOOzw5VE3cR1NyzCN8BwmXD1i2yg4IyRNotSvtCmeLX/nLZ9hDtwEQqX0
         zFcD22d0bN8OFRJ7wBt+6SpTi2ihiQw1cXD8m+urFyKd7bFRJEnM/dttEJpZNq7T4wxS
         85DRIgnYeTiy+hyQy8ed1zEPfsxpQA+hPHYngVGofwUY2+/GI2ifGLhISxHnjWSE4YyA
         Rs3cNLPMuiMfu2mnBMZu8dIrfkrAlw7EznUa0j+v9FJjVZ2thZBkdvy6/1/SC+CK57Wk
         gjoQ==
X-Forwarded-Encrypted: i=1; AL+hErGkyCKP0udPKHTzrJFFujOjhF13nZJVvB7WkKqE/T+Lw3Pynr4dEle1k3yaYWMVnX6R5I7Jk47wJ19AYRRkRQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z93pLchwwNhz6iStkJKpyKM5RDgs/BaseE8Gti/Uxa+J82cyMR6
	klkzssSd4ViXBELBxIMFKYZxziyo0MhdH9cJf60coJrSUcym7UdQhjZVL2MtBmfmULfwCZ9qBf1
	Bud+HsTY=
X-Gm-Gg: AZFdTZcuvFOQ457jrnUtJzkOB4tP3nBq5Q5fv0yEwfA99yhM2gaxT5rGrZCP/0JqNEC
	FfCxhY9cGMV5kWpWez7NEFV3loW1HowU73cmviOqClfZFRX94wLbuQKweYT09e26XQryhOPmL43
	ppV0TJUeipZdjShYiOeZShGyjKixaCx7Gr2x2Q62UznOI9TF3UAjqIzbSypL8YjZJhhuli7CLVh
	hr44NFEd4FcuPXZXun3HPM00qXLDlyJYfwTecIioQCoH4Vqy1fFOiWfcqcHj0LXAGuEggjFcGKB
	lApo3Oq7IHq2n4QfnoeeIzBwrF1Y/jJShaij7/nfHTfZSrwIWmBoUqsl23zAJU8C7qfYHoxQYvO
	o46iTSsQl677HDHkgAhuzwGm7PqsYUL9Dk3xgjmlw3dTwOLMhZFrMBIXzeWEFpEfG+JOIm8rt3n
	b3Fpr46X7kKKIgMgW1qNlCsCtEnPrPkIOO1EW2OA/6rmK7gqEyGC/GBt4G/XGr4WihcO/d5GH5A
	M0cNO4vBgz+BCBqumccrETBlWhBJmBRGOaBaqGUmfKVNtWogU5BG0gHNkw639eC2UCpA2UrK3ZS
	rN8URnRsYzxIsq4My2Z3PQ35UMnf8PhmrxWDdxhxuqDTcJyhpPMqF4DiMxKMxNI6Nr4kUgqIwJA
	OmvUO+EHvp8ZuVLQ4GYCGnIEltANW76+sJHxYJCCYSkXFspo=
X-Received: by 2002:a17:90b:17c7:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b1b0ba4fd8mr12833227a91.55.1794875599769;
        Mon, 16 Nov 2026 16:33:19 -0800 (PST)
Received: from mma-H9MHD44.sydney.mm.lcl (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm1214868a91.15.2026.11.16.16.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:33:19 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 1/4] wifi: mm81x: use guard(rcu)() over scoped_guard()
Date: Tue, 17 Nov 2026 11:33:07 +1100
Message-ID: <20261117003310.1032097-2-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
References: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
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

