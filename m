Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=125.209.209.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760701;
	b=d2EQ8MDqVVJRDv0luhm2ghCRNbQ42i4OF5SI9sED723m/HP7Ip/xge13JnlTYmoscwve
	 KPiROoil7xfSGd9QkH5T0xWioInJhUNhxUPLrhJLybXS/+P1OVZHJH5/vMW/vodpn8AVg
	 ENPfPR8Wjx3wVn29zGSadWYBRNwggItmq4T7xM+veH8bP0MV4y6nn7YfAxCZdnzL/Ohv3
	 nFAOODg7SymbtbJBrse0YnmVk9zExcIn5zzc3shtGgavPJ8KDo9iakMsT38rFDasOP8W0
	 o/RNr58prPTlgqafM+Qe+iLZzli/zs1rhkUHO1ciXSkBjNSx+eo5GnmdI4aHz5d53zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760701;
	h=DMARC-Filter:DKIM-Signature:X-Originating-IP:Received:DKIM-Signature:
	 X-Session-ID:X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fj33dijwGstbYggkpkxycJ7TWs98Tw1LR49UjArPlqY=;
	b=ZEQiiIPzOlxRtrEofmWbWgNoa0ljnTm6qil1uzYETpieKWoZnkUzfuleVlMAqfegHudE
	 fLkL2qdcJOobYN2PtTUWPHAs3rnUp78FhwsxLTvcCRMkmCkHcjWgDfvRpYGDpcbg4rDnb
	 52b2q80O1NncmlXaFud/+4g+5H0Tr8NdkYujEbevJ372RmYdfYMlvZ9Bij1lxTk2S0L0q
	 1QRY2692sOahYUSZOrJyyrxRsKw1PVUBDTpTnHtvssP94vX57ubD64YBz68U5HODPwY9b
	 fE+uzZR+vBpKcreSqO33y6eXbb05WIlRQQAtzHjqenB0wWHgGrTYbGaKyMz2aDK+ecA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skku.edu;
	spf=pass smtp.mailfrom=skku.edu;
	dkim=pass header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=XvXLXHkI;
	dkim=pass header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b="uMf3/mrZ";
	arc=none smtp.remote-ip=125.209.209.75
Received: from cvsmtppost105.wmail.worksmobile.com (cvsmtppost105.wmail.worksmobile.com [125.209.209.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63427606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63427606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=skku.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skku.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=XvXLXHkI;
	dkim=pass (2048-bit key) header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=uMf3/mrZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1795760692;
	bh=P2rbTox4GQi1dpRGzIN8Xt4AaPGy/zYBSaemJNQeQAs=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=XvXLXHkIkSb4MzvhFHpTeF0gr6zSa8+L0Y9i7yvdHPRZn7A+8w2k6mFpR5m1qrWjz
	 kzhRw5EzcPr32AC5COwpOiJlQuMZoAXkwa1UK0p0sTZxuKQ8897ZPykpDrYM0dOINh
	 z1G8v3yJaT0/8aqEIL+3ONP0VUAxOjW6KmJ8SOLmsXlbeKCx+AX1JvyXcP4QLipNKp
	 xAI8fdxC21RkwmvxtYdQRgNh6b2N8fSiSoU1i9T6mhxcDugyUfu2MVB6/YCoY2kC7m
	 MlQvkrDAe9L7OuSieNJQCO8eks+7pwe8u40UiWKFB8Ix4mv5/nTxk7o51hfy1+fpbJ
	 4hOwjWvVVbtiQ==
Received: from kr1-hmac-real-0 ([10.174.201.129])
  by cvsmtppost105.wmail.worksmobile.com with ESMTP id 9zLek5noTWWWgfP9PDVxvQ
  for <linux-wireless@vger.kernel.org>;
  Fri, 27 Nov 2026 06:24:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skku.edu; s=naverworks;
	t=1795760692; bh=P2rbTox4GQi1dpRGzIN8Xt4AaPGy/zYBSaemJNQeQAs=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=uMf3/mrZXdX2c8NwHPITMj7+awYTmWYvshxU85KcJyst0Qg4o8Uds2zjk0YLFxjxX
	 5vJpcx9CCOJabM9itCd39SXuEbdVAN1OSOkOg7qiBQ7VIz0jeW3DUEIjKsT7K+4PWF
	 M1WhSqus6nt+8Z3Aik3/hZouTbRtZDLHO12B6ZgLVhxIUc5P7CDLUsVRNPv3nenJ1o
	 wptcD4YEsSKuBSvzVhOKZVltMlqmcgEgbA/S5iLFyXssBEkWcs+uDTh2E1UYWG1gjI
	 cs3FKD9uC1WugrSpTTQuif8OA020E+XwjSDANwGhMjv4xnDrFw2OZDq6UlUskuNneK
	 +uvW+UUBJIBQg==
X-Session-ID: GAF2BqrnTb+72BiZkq4Svg
X-Works-Send-Opt: w/KXFqgmKAKmKAFYKqMqKA2mFAurjAumKAgmKxEmKqK/aAtwaBmmjAFYKxM/axKmKo2rFBwYjAg=
X-Works-Smtp-Source: fdbZFqElFqJZ+HmZaxU/+6E=
Received: from d20be28ee783.tail196be.ts.net ([115.145.173.180])
  by cvnsmtp103.wmail.worksmobile.com with ESMTP id GAF2BqrnTb+72BiZkq4Svg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 27 Nov 2026 06:24:52 -0000
From: Kyuwon Cho <kyuwon.cho@skku.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@openwrt.org>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: set up the TXQs of an AP_VLAN station with the AP's vif
Date: Fri, 27 Nov 2026 15:24:51 +0900
Message-ID: <179575981569.1588942.8945055698942160441@skku.edu>
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

A station added on an AP_VLAN interface (NL80211_CMD_NEW_STATION with
NL80211_ATTR_STA_VLAN) gets TXQs whose vif is the AP_VLAN's. The driver
does not know that vif, so drv_wake_tx_queue() warns that it is not in
the driver. If the station is then moved to another AP_VLAN and the
first one is deleted, the TXQs still point to its freed sub_if_data,
and the next frame to the station reads it:

  BUG: KASAN: use-after-free in ieee80211_queue_skb (net/mac80211/driver-ops.h:1380 net/mac80211/driver-ops.h:1391 net/mac80211/tx.c:1731)
  Read of size 8 at addr ff11000012995658 by task test/117
   ieee80211_queue_skb (net/mac80211/driver-ops.h:1380 net/mac80211/driver-ops.h:1391 net/mac80211/tx.c:1731)
   __ieee80211_xmit_fast (net/mac80211/tx.c:3870)
   __ieee80211_subif_start_xmit (net/mac80211/tx.c:3938 net/mac80211/tx.c:4497)
   ieee80211_subif_start_xmit (net/mac80211/tx.c:4734)
   __dev_queue_xmit (net/core/dev.c:5102)
   packet_sendmsg (net/packet/af_packet.c:3177 net/packet/af_packet.c:3209)

Frames sent on an AP_VLAN have gone to the TXQs of its AP since commit
531682159092 ("mac80211: fix VLAN handling with TXQs"). Give the
station's TXQs the AP's vif as well, as a station added on the AP and
moved to an AP_VLAN later already has.

Fixes: ba8c3d6f16a1 ("mac80211: add an intermediate software queue implementation")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Kyuwon Cho <kyuwon.cho@skku.edu>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. We reproduce it with a
mac80211_hwsim radio in a user and network namespace: an AP with two
AP_VLANs, a station added on the first one, moved to the second, the
first one deleted, and a frame sent to the station. Without the patch,
the first frame warns in drv_wake_tx_queue() and the last one triggers
the report above. With it, neither shows up. The reproducer is
available on request.

Found and tested on mainline 9437ee8b6cf6 (v7.4-rc4-571, with KASAN);
the code is the same in wireless (35c42b20ac87), where the patch
applies as is.

 net/mac80211/sta_info.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 5c95ffee257d..6ef704402e5d 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -634,6 +634,7 @@ __sta_info_alloc(struct ieee80211_sub_if_data *sdata,
 		 const u8 *addr, int link_id, const u8 *link_addr,
 		 gfp_t gfp)
 {
+	struct ieee80211_sub_if_data *txq_sdata = sdata;
 	struct ieee80211_local *local = sdata->local;
 	struct ieee80211_hw *hw = &local->hw;
 	struct sta_info *sta;
@@ -717,11 +718,15 @@ __sta_info_alloc(struct ieee80211_sub_if_data *sdata,
 	if (!txq_data)
 		goto free;
 
+	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
+		txq_sdata = container_of(sdata->bss, struct ieee80211_sub_if_data,
+					 u.ap);
+
 	for (i = 0; i < ARRAY_SIZE(sta->sta.txq); i++) {
 		struct txq_info *txq = txq_data + i * size;
 
 		/* might not do anything for the (bufferable) MMPDU TXQ */
-		ieee80211_txq_init(sdata, sta, txq, i);
+		ieee80211_txq_init(txq_sdata, sta, txq, i);
 	}
 
 	if (sta_prepare_rate_control(local, sta, gfp))
-- 
2.43.0

