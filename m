Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044697;
	b=cNXIb/FNsIaw3BUv7kYQS4atK4DBOwto/jS9qoDGzo4kuqXsuHlxyRgAmsNQrzar4yQD
	 0kh3kEdBtGmwFmLB9Jd1HfRQ2DVqNzcWoEUqtHaTmIR3GaQ176sSpBAcjj1bc1wgfd7SF
	 DxIu8vLiV97+/BsJxmoaysq5FaxFWryvTTPdaorfFBK0rkFc08SPc/x/VPlJ9NTr/afew
	 +YzbMIHJEPvlwSa8OCAJ442ukKzVKWulZKL9pTz7Isk7A3TQBzm8Hfr2UaEmvau8bVy6w
	 XY1VioOdGQIM8S4Q2uevdoX9gAEC0RO3tNZOAsRE9y8LL7UvBlcuTw4yWfKDqFRKPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JljOJ+5JZ/mVB7HR9h7Mk/LiTfMJkqAy9rLcaKV+yM8=;
	b=5nw7DI+/XHA2Xnj8i/zhXI9oM+JvYDJI7dte0Z7EigavS55aOuIuOU7jSKVffION1ebX
	 zbGAnOGZgymLLxzaVTznxiHiYZfnNHvWy9IQdUIakdFyJzl4sO5EqPpFtZ1gtYYpd5Fuf
	 HLudi/ZDT1FbBeNZ6J9DtyHU/yRT8fbYdyi+wN7XeajoPhNxpsBQMES6yKjX1Tget5jP5
	 IIREEuWeFU/D9N+241zjnDDwXLjWhkEYTlNOILSLrBxH7m7Jt/30OsSsKgf7CxlC/Dh3X
	 Im/xn7X8hHIUXsHny9hPY02aRPz/cE9I94R9V+uOBeZ2O8CWnGV07kgOWSJtF35DA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pKOamYFN;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B2606A320
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pKOamYFN
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070781f63so892380b3a.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795044696; x=1795649496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JljOJ+5JZ/mVB7HR9h7Mk/LiTfMJkqAy9rLcaKV+yM8=;
        b=pKOamYFN743YaMPi8zZtS2X7EBb8HKn5yZzI38+Jh465xcRu6eI7tkVlJsbEEsmn74
         ZA18+dYrmtcm/ifLt/mqcxRxgbelwyrYseP1MJviYXCarhUAH8GbSlCdLR72Ho0LMRZU
         RL+dwSQVr2IQ8XHhIc3734RjT7FcgMwOCnP7j79et2JMsYhT7/zb/23W0K3RkESk86uU
         S2/zGZ35rAJ1U9JfVgChjUMa6JVKTGItW3u5+DihUSzAz+KICD5g2Xv59cvuqHc4GWBN
         UkUJFk8qEHy7pN6TalHL4gXb4LPULbsna/cuuLoQXj96nc9qooUsQfd+SnXuMX3y9rSw
         gvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044696; x=1795649496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JljOJ+5JZ/mVB7HR9h7Mk/LiTfMJkqAy9rLcaKV+yM8=;
        b=1koAExtkXvAtCP/j2fiY7FzWatvPCcBXfIqRWs5gxukf2WT3q0GszR/M6teRPToor4
         eGMaeebavcFvbaIwbmdxR4H7a0jPqHsnY0+/DCYIXvZK4QHRHTEZSSP0W9A7Z77vBoI5
         2AQqpjd66US8ke3Zg7Vbc2y2GFXl0+xgOuf0/Z/ceXCmbX508aavEZpsWzSkFZpmtGZa
         FttggevhI2RWYjn5NwLh4ZimXXGE9HF5nVbScKod6K22SM+3uRDWib52FTS8D52NSxSU
         ny9JbecZfG8vzcghM/UiLsB/30lEcW3qqGmpjkd2kUDJpEGqxleerAGu1f12NKtzDOLz
         R+VQ==
X-Forwarded-Encrypted: i=1; AL+hErEjudCnt39emlynV/QNBbly87alkitNuJ49D50Jp+s7GuFKQGqQVTGlSUgCPQxMVCjgDMxcskIy2ykB+S/jow==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MueDGhentr2VwfUnOiUY5yQ2qXnhKWz47usvxO4NrVq64yQ70
	3cGCC8ktTpEZRBnq390l2nxOXpqOPS/zJh4J4fJ+6ApBmK5JOvTQLVV8U+itmawr4ts=
X-Gm-Gg: AYBFou0NvyD9T9W8JAtOQvNMbkDzwbCHHkK1tXFWUg46Jpei3Bj7ZUinkSpg+4JMQQu
	Jq7RajaprC9k8Q73NMcUlUUeOoK0l1fdL4CPu/6eIY/2KkIfnwJV4xHvP603tE7fY6F4LOj2pmx
	pYK6YAxSulvIeIPGa9em3JLPQo3U1tOlVLFmSz2Ku9EFj89iqPagEouTbslKQsNjvM8uIRyoNf1
	Tuj9voaSl9Rj5lwM25y+Fz/FUWJNtb0SrDo+Dz0Ol6AfD94ohWdeWaDf74jPUVctyzzK9NqaMRy
	GRDvWF0bVCs7waEIWHGINTgYQZkuAK42dkIgtWYm5lcZW9pBXMJXLG7bddvcNOPzZVPOki0AzyM
	VHGy6DTapSHmRvY3X+ZheWD+WI31He9SXwbKE3AQagpIv2JdrDVbu7HB6K4hwLtMqmuA0kwhqVe
	A0SgkTEOAOZC0EJN5MeMpD47T0vxuaYLMvC/fpElgiZKfwujH7oXzbKpKL7eLmPItCOoGDuc5tc
	IH7ZaAlO09ACvtuS2rDJ81bu4UnRRB71yiyVCseacWpr/bukrwzaKKiu4Lx6Lw02ylCbfDwVK8j
	40lXjSpaXwe99YXcklRKTpc61x5hmDaExvYOVNZPkVMmPeiJNWZCPkYtp5bNrH4mahbvlRV3O4w
	P0jKCpw==
X-Received: by 2002:a05:6a21:7983:b0:3eb:34dd:74f3 with SMTP id adf61e73a8af0-3fe970f2bbemr3562030637.11.1795044696000;
        Wed, 18 Nov 2026 15:31:36 -0800 (PST)
Received: from mma-H9MHD44.mymodem ([60.227.235.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1467822b3a.22.2026.11.18.15.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:31:35 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next v2 4/4] wifi: mm81x: drop probe requests received off channel
Date: Thu, 19 Nov 2026 10:31:04 +1100
Message-ID: <20261118233104.1640855-5-lachlan.hodges@morsemicro.com>
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

The mm81x receiver picks up probe requests on channels adjacent to
the tuned 1MHz control channel. These probe requests travel up
the stack as they are assumed to be received on the control channel
which leads to multiple probe responses being sent out on the control
channel flooding airtime. This is especially noticable in mutli-sta
scenarios at lower bandwidths where airtime is especially precious
and leads to failed associations.

To fix, drop any probe requests that weren't received on our tuned
control channel.

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 drivers/net/wireless/morsemicro/mm81x/mac.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/wireless/morsemicro/mm81x/mac.c b/drivers/net/wireless/morsemicro/mm81x/mac.c
index 86e7887c1772..60d849c51da7 100644
--- a/drivers/net/wireless/morsemicro/mm81x/mac.c
+++ b/drivers/net/wireless/morsemicro/mm81x/mac.c
@@ -2115,6 +2115,22 @@ static void mm81x_rx_h_update_sta(struct ieee80211_sta *sta,
 	}
 }
 
+/*
+ * The chip receives 1MHz PPDUs on any 1MHz channel within the operating
+ * channel. Probe requests sent outside the primary channel are from STAs
+ * that can't hear our response, so don't pass them up.
+ */
+static bool mm81x_rx_h_is_off_chan_probe_req(struct mm81x *mors,
+					     struct ieee80211_hdr *hdr,
+					     struct ieee80211_rx_status *rx_status)
+{
+	if (mors->monitor_en || !ieee80211_is_probe_req(hdr->frame_control))
+		return false;
+
+	return ieee80211_rx_status_to_khz(rx_status) !=
+	       ieee80211_channel_to_khz(mors->chandef.chan);
+}
+
 static struct ieee80211_vif *
 mm81x_rx_h_skb_get_vif(struct mm81x *mors, struct sk_buff *skb,
 		       struct mm81x_skb_rx_status *hdr_rx_status)
@@ -2152,6 +2168,11 @@ void mm81x_mac_rx_skb(struct mm81x *mors, struct sk_buff *skb,
 
 	mm81x_rx_h_fill_status(mors, hdr_rx_status, &rx_status, skb);
 
+	if (mm81x_rx_h_is_off_chan_probe_req(mors, hdr, &rx_status)) {
+		dev_kfree_skb_any(skb);
+		return;
+	}
+
 	guard(rcu)();
 	vif = mm81x_rx_h_skb_get_vif(mors, skb, hdr_rx_status);
 	if (vif) {
-- 
2.43.0

