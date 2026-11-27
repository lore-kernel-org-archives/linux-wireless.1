Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=125.209.209.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791556;
	b=g76e+kyD9bK/lcXsqV5s20ZJU/6PWeW/4JJyUNL20hhUGRjri+jft6ffs0qUUwxGtBLe
	 2hh2FxdPXkcew5eBEeGhVUVVM9n7ZWuCRm0+tF8Y69ELk6YC+kqxD8e0DnTnSj1lPeCao
	 QGKuSTJbSLJJYVuwVjlBSZBxN3fWKTP0aKk+q0S45FqWUldXSfUzSvPkPmyfNQY4wrhlz
	 Zr9P9vopwb6zRxOSlJKj/tbAO4izqYwBDIB1Th7WezPtqKXSadwsjMISP013vgPTAuAWD
	 iffsgkDrRABXou3cw6iw0l10foNDsbEUAWy1PutZYez0a615JqMqlNKeSwNYIO/jBng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791556;
	h=DMARC-Filter:DKIM-Signature:X-Originating-IP:Received:DKIM-Signature:
	 X-Session-ID:X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YAqdGQW007/LIhedLhNZHlBV2fVA8j5odnvQXMl8c98=;
	b=u8NE8tn6NWeScnz1DcNGc981liCEjcxrmqrAwFLl21qyJ8PBUUUE+UIElHN05/id1YT4
	 Uem8G/5Kpt5e/CcoaYqoGtZVpD1YfXo3g0yyqfS7J/Q51WsSinMZGh41qHT+959jw8SaQ
	 d0mPhx8/7RkhMX9qYYgqc8fdXtm06eiSwSi4aSBG+c+q7UCeU8rTEGpIWxNygNFRV5Bxw
	 cn9wceQ7ckGIMumrB71V/OA+IngrdCZB3xwtniOP4qeDkZ1zd9agN31S1Ovh4JfzNcrKB
	 hmFh3qaG8iPFtPsX/uCie8t0qlhPpOwiZ0TXT79yHjEwvmOUMi20hV+bOKIILRC/24A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skku.edu;
	spf=pass smtp.mailfrom=skku.edu;
	dkim=pass header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=MitGCYa7;
	dkim=pass header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=ASUpXHBi;
	arc=none smtp.remote-ip=125.209.209.74
Received: from cvsmtppost106.wmail.worksmobile.com (cvsmtppost106.wmail.worksmobile.com [125.209.209.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA15606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=skku.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skku.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=MitGCYa7;
	dkim=pass (2048-bit key) header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=ASUpXHBi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1795791548;
	bh=Cf3ojejIQANA7l1156VtG0a17vepQd9QGtJ0WgyuLwY=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=MitGCYa7R6LC/ORKCEKTgQjuEa8vRNy5Q6C/XlNXMTfqTJcgCwfvnm0a0dY7765D6
	 hjsckp8sU7Ncy9jCw38AcPlg/M/icBr4vtIt7Q/ukgF69ZKoD9pw2yJS5WPjGVc/8r
	 fso1TVGdRvmW5W4S6yCzldnrRfFt/Y3t0nVRDnI58GJUsvH56eA7wnsqxoUoe+pHVz
	 O9BVkBbG+qiQpKexEYPVCzXjJsNCZZM5EHCHYTKZixZPR5hALSx/l9Cg96vo0or0kz
	 ta4516jS61gGBhrmYyJgTVwHc6xC9QOkGb96v/w1pi3CvL9ORB4NRR1t/E0tlQ0921
	 00a/ASQ2HcM5g==
Received: from kr1-hmac-real-7 ([10.174.201.129])
  by cvsmtppost106.wmail.worksmobile.com with ESMTP id LE45LFO7Seq14gNprdfjkg
  for <linux-wireless@vger.kernel.org>;
  Fri, 27 Nov 2026 14:59:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skku.edu; s=naverworks;
	t=1795791547; bh=Cf3ojejIQANA7l1156VtG0a17vepQd9QGtJ0WgyuLwY=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ASUpXHBimnCthsqobKvVmFWr2KWb8JqyxAqut7dPFKo37/9BJPzabGWCEpuygIcib
	 W9YyNQjz4v5SX4v2UaHI3PoQHfK4O5tGG8nOfJ94E1USJ3b4DUJOIqdaFy6yTdKaDy
	 a5vFAXPijhECyjaJ5aFgP6HLXsBbgQEewFE1uG2ufzCscq2ByLNy6SNzqz1THa9WuP
	 Y5lTC3y8nc+W4XHsOZriCof0uBKdWsmmLVr+TBh+sKDrehCgASODqytspEB9mkSEVW
	 gLhSRrJp/3LDzvn0gFeRxEFiF6Nj9XPJ45htipD3FRqALj4YkkGuDFO7QRjUFX43lv
	 qEePG7foH1wQg==
X-Session-ID: hfNTN2MnSBGtxGFnpW+6vg
X-Works-Send-Opt: wXYXFqgmKAKmKAFYKqMqKA2mFAurjAumKAgmKxEmKqK/aAtwaBmmjAiYKxM/axKmKo2rFBwYjAg=
X-Works-Smtp-Source: Vdb9FqElFqJZ+HmXFAul+6E=
Received: from d20be28ee783.tail196be.ts.net ([115.145.173.180])
  by cvnsmtp101.wmail.worksmobile.com with ESMTP id hfNTN2MnSBGtxGFnpW+6vg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 27 Nov 2026 14:59:07 -0000
From: Kyuwon Cho <kyuwon.cho@skku.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: drop a removed AP_VLAN's frames from the station TXQs too
Date: Fri, 27 Nov 2026 23:59:07 +0900
Message-ID: <179578858734.1979329.2169541291730255@skku.edu>
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

Frames on a TXQ keep the AP_VLAN they were sent on in
info->control.vif, which ieee80211_tx_dequeue() uses to find the sdata.
When an AP_VLAN goes down, ieee80211_txq_remove_vlan() drops its frames
from the AP's TXQ but not from the TXQs of stations. The frames of a
station that was moved to another AP_VLAN (NL80211_CMD_SET_STATION with
NL80211_ATTR_STA_VLAN) stay queued, for example while an aggregation
session holds the TXQ, and are dequeued after the AP_VLAN's sub_if_data
is freed:

  BUG: KASAN: use-after-free in ieee80211_tx_h_select_key (net/mac80211/tx.c:635)
  Read of size 8 at addr ff11000012725890 by task test/114
   ieee80211_tx_h_select_key (net/mac80211/tx.c:635)
   ieee80211_tx_dequeue (net/mac80211/tx.c:4056)
   ieee80211_hwsim_wake_tx_queue (drivers/net/wireless/virtual/mac80211_hwsim_main.c:2318)
   ieee80211_agg_start_txq (net/mac80211/driver-ops.h:1384 net/mac80211/driver-ops.h:1391 net/mac80211/agg-tx.c:220)
   ieee80211_stop_tx_ba_cb (net/mac80211/agg-tx.c:942)
   ieee80211_sta_tear_down_BA_sessions (net/mac80211/ht.c:318)
   __sta_info_destroy_part1 (net/mac80211/sta_info.c:1348)
   sta_info_destroy_addr_bss (net/mac80211/sta_info.c:1622 net/mac80211/sta_info.c:1652)
   nl80211_del_station (net/wireless/rdev-ops.h:224 net/wireless/nl80211.c:10246)

Drop the AP_VLAN's frames from the TXQs of the AP's stations as well.

Fixes: 531682159092 ("mac80211: fix VLAN handling with TXQs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Kyuwon Cho <kyuwon.cho@skku.edu>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. We reproduce it with a
mac80211_hwsim radio in a user and network namespace: an AP with two
AP_VLANs, an HT station added on the AP and moved to the first AP_VLAN,
a burst of frames to it while its first aggregation session is being
set up, then the station moved to the second AP_VLAN, the first one
deleted and the station deleted. Without the patch, deleting the
station triggers the report above; with it, nothing shows up. The
reproducer is available on request.

Found and tested on mainline 9437ee8b6cf6 (v7.4-rc4-571, with KASAN);
the patch applies to wireless (35c42b20ac87) as is.

 net/mac80211/tx.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 6e70e2046d1a..cc3e6f425613 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1541,24 +1541,30 @@ void ieee80211_txq_remove_vlan(struct ieee80211_local *local,
 			       struct ieee80211_sub_if_data *sdata)
 {
 	struct fq *fq = &local->fq;
-	struct txq_info *txqi;
-	struct fq_tin *tin;
 	struct ieee80211_sub_if_data *ap;
+	struct sta_info *sta;
+	int i;
 
 	if (WARN_ON(sdata->vif.type != NL80211_IFTYPE_AP_VLAN))
 		return;
 
 	ap = container_of(sdata->bss, struct ieee80211_sub_if_data, u.ap);
 
-	if (!ap->vif.txq)
-		return;
-
-	txqi = to_txq_info(ap->vif.txq);
-	tin = &txqi->tin;
-
 	spin_lock_bh(&fq->lock);
-	fq_tin_filter(fq, tin, fq_vlan_filter_func, &sdata->vif,
-		      fq_skb_free_func);
+	if (ap->vif.txq)
+		fq_tin_filter(fq, &to_txq_info(ap->vif.txq)->tin,
+			      fq_vlan_filter_func, &sdata->vif,
+			      fq_skb_free_func);
+
+	list_for_each_entry(sta, &local->sta_list, list) {
+		if (sta->sdata->bss != sdata->bss)
+			continue;
+		for (i = 0; i < ARRAY_SIZE(sta->sta.txq); i++)
+			if (sta->sta.txq[i])
+				fq_tin_filter(fq, &to_txq_info(sta->sta.txq[i])->tin,
+					      fq_vlan_filter_func, &sdata->vif,
+					      fq_skb_free_func);
+	}
 	spin_unlock_bh(&fq->lock);
 }
 
-- 
2.43.0

