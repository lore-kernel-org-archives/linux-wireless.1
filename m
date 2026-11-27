Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=125.209.209.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760701;
	b=UAw3uxgRv+aMxz/ymS5s33wCAykrLqbtyTbETO+Q9Ulw43eOAFm0M+h+ue2NUJkEFgVK
	 2J2gToAcw09dM/m7zzwapvY0sw/SJJkhS1btSNPfnZ0D3xid8Tj5+741j0lEBbKywRHYg
	 ML2/zdqDQP/ZszAyBsSRh4THzYOD+ZtiumKrzekJCp3dKDZPHtjlZUswNRXlbAH4tQujq
	 Il3HMt9OLOkNHM68iULj/4lOho9AHQY3IzuNl2WMPmrz3+qsyzQL3tyAMbPvFwgHSI4oE
	 svADSJrcSwBYxlHqVWhgFBHMTC+awV51MwoaS+BiBwmdZyPu942YloCJHL02lDIERTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760701;
	h=DMARC-Filter:DKIM-Signature:X-Originating-IP:Received:DKIM-Signature:
	 X-Session-ID:X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/VL5LrZqDgkoP34bCauWfwlbzS110rLmFK1pvGJxQdU=;
	b=Y4OW8Lo9wEmDGKq/RXFvILcx3+TeMAXRqT/qqEb8xbdz6OQOXw87bmTS2UFWhOLTW8lH
	 RDEGmOuWXbQoXz/5Oyoq9AKICnbwtdufHb5m/UUHsfez8qqdpFzjS1YJIndg+pPjJjZ/0
	 uy7Z8/Iy8TX/11Vvc3sW5UzyECdBce8328z16sFZGIebelXv/RLsdj1f6Iv/MuvabK7fA
	 WzLEln+VD+Ye2T772BDsmAYrlkCxyMatE/10vp9Ds9H+y/I06RGkpG8bPtLiWAwnkVmug
	 EAHq3Uc1iH1lncYLaML8ag1AZg7H6aOfBJGSudEPtbMmRvdcOedCCESvzKc4cbaqAug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skku.edu;
	spf=pass smtp.mailfrom=skku.edu;
	dkim=pass header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b="Sh/UYUD5";
	dkim=pass header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=ln3LvFzR;
	arc=none smtp.remote-ip=125.209.209.39
Received: from cvsmtppost101.wmail.worksmobile.com (cvsmtppost101.wmail.worksmobile.com [125.209.209.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77865606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77865606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=skku.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skku.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=Sh/UYUD5;
	dkim=pass (2048-bit key, unprotected) header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=ln3LvFzR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1795760691;
	bh=JNNNSkeFJW6OxNUVkNfwiEMhxptL1YqOV/wD8XX8GnU=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Sh/UYUD5tio6NPOMI7qiU3GQj2iX8vjpa51OmxPsnqLa+xGwKUdvNdoW0Mekh67bu
	 ORrVrK5q034lsSE8NGb0BTlYfXyca0YIptagUQf/qdrpJVx8rVs4RzP6jyru9UaD45
	 Z9rzJCO3cOW+opmkZGdfu77FbvpSfJTk4Iyw1pL3gvF7LLjots9sp4UCG2TetTk1d4
	 huU6iOCm3XwSO1hjP6h9R5rOtU4tA/H1z4ZlvSWouzvjio4Gu4OWplIbTv/DnzAumC
	 B5pdfkZQw4pxav3C8l+C08Wn3Bryn3kRbuN5AI5Dtpsq9phk69fnjcdVQ1awVIkUjw
	 Vfl3i57IN1Esw==
Received: from kr1-hmac-real-6 ([10.174.201.129])
  by cvsmtppost101.wmail.worksmobile.com with ESMTP id EJm9sJ5IQ-CsI3u+TLZ4cQ
  for <linux-wireless@vger.kernel.org>;
  Fri, 27 Nov 2026 06:24:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skku.edu; s=naverworks;
	t=1795760691; bh=JNNNSkeFJW6OxNUVkNfwiEMhxptL1YqOV/wD8XX8GnU=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ln3LvFzRq/KiVERmupQfNIdTOyme9AFQrESwLyJPpvxubsN/OgUskketq+73ADolb
	 El6AeI7GMeBAFJaZmQKvDGodN2+IbzNUcbyXIzJU6BUldMO7lyuGXbxjKNy23vruD4
	 KClu3yP/sTHBwzzFm0QjF3nliX7mA0XRfkz4WEcJi/Yh8JM3RBvDxjQ4Kt1xAAtIbF
	 yVPiJVzCoFUkQJ0Wd9ENoDY8s1DB3hw/XhLxv2Sat9QG6mGV7W0QxLZa3HUloARnZi
	 +7WPRI5lVyEqlMBAuHKoh1YJpca01FkxrtW4TImGuooPQ2aEiCZwX/rLy53J4O+GWf
	 HauU0AS5L94Vg==
X-Session-ID: lj2z8a81TmKP5CPvIvjBhQ
X-Works-Send-Opt: w/KXFqgmKAKmKAFYKqMqKA2mFAurjAumKAgmKxEmKqK/aAtwaBmmjAFYKxM/axKmKo2rFBwYjAg=
X-Works-Smtp-Source: fdKZFqElFqJZ+HmwaxU/+6E=
Received: from d20be28ee783.tail196be.ts.net ([115.145.173.180])
  by cvnsmtp104.wmail.worksmobile.com with ESMTP id lj2z8a81TmKP5CPvIvjBhQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 27 Nov 2026 06:24:51 -0000
From: Kyuwon Cho <kyuwon.cho@skku.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Arik Nemtsov <arik@wizery.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: delete only a TDLS peer when a TDLS setup times out
Date: Fri, 27 Nov 2026 15:24:50 +0900
Message-ID: <179575981569.1588942.5602808785682214558@skku.edu>
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

ieee80211_tdls_mgmt_setup() keeps the peer of a TDLS setup in
sdata->u.mgd.tdls_peer and queues tdls_peer_del_work, which destroys
the station with that address unless the setup completes within
TDLS_PEER_SETUP_TIMEOUT. The address survives a disconnect and the work
does not check that the station is a TDLS peer, so a setup sent to the
address of another AP destroys that AP's station if the interface
associates with it in the meantime. ieee80211_set_disassoc() then finds
no AP station and returns early, and conn_mon_timer and bcn_mon_timer
are still armed when the interface is freed:

  WARNING: net/mac80211/mlme.c:4531 at ieee80211_set_disassoc+0x15bb/0x1c50
   ieee80211_mgd_deauth.cold (net/mac80211/mlme.c:10842)
   cfg80211_mlme_deauth (net/wireless/rdev-ops.h:551 net/wireless/mlme.c:581)
   cfg80211_disconnect (net/wireless/sme.c:666 net/wireless/sme.c:1582)
  ...
  BUG: KASAN: use-after-free in __run_timers (include/linux/list.h:1047 kernel/time/timer.c:892 kernel/time/timer.c:1783 kernel/time/timer.c:2375)
  Write of size 8 at addr ff11000012d19b08 by task swapper/0/0
   __run_timers (include/linux/list.h:1047 kernel/time/timer.c:892 kernel/time/timer.c:1783 kernel/time/timer.c:2375)
   timer_expire_remote (kernel/time/timer.c:2387 kernel/time/timer.c:2379 kernel/time/timer.c:2137)
   tmigr_handle_remote_up (kernel/time/timer_migration.c:985 kernel/time/timer_migration.c:1076)
   run_timer_softirq (kernel/time/timer.c:2410)
   handle_softirqs (kernel/softirq.c:669)

Only destroy the station if it is a TDLS peer, as commit 6f0a100df853
("wifi: mac80211: only operate on TDLS peers in the TDLS code") does in
the other TDLS paths.

Fixes: 17e6a59a365a ("mac80211: cleanup TDLS state during failed setup")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Kyuwon Cho <kyuwon.cho@skku.edu>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. We reproduce it with
mac80211_hwsim radios in a user and network namespace: the station
connects to AP A, sends a failing TDLS setup request to the address of
AP B, and connects to B. Without the patch, B's station is gone 16
seconds later, the next disconnect warns as above, and KASAN reports
the use-after-free a few seconds after the station interface is
deleted. With it, the AP station stays and neither shows up. The
reproducer is available on request.

Found and tested on mainline 9437ee8b6cf6 (v7.4-rc4-571, with KASAN);
the code is the same in wireless (35c42b20ac87), where the patch
applies as is.

 net/mac80211/tdls.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/tdls.c b/net/mac80211/tdls.c
index 8ae01c277fd2..b260513858a2 100644
--- a/net/mac80211/tdls.c
+++ b/net/mac80211/tdls.c
@@ -33,8 +33,11 @@ void ieee80211_tdls_peer_del_work(struct wiphy *wiphy, struct wiphy_work *wk)
 	lockdep_assert_wiphy(local->hw.wiphy);
 
 	if (!is_zero_ether_addr(sdata->u.mgd.tdls_peer)) {
+		struct sta_info *sta = sta_info_get(sdata, sdata->u.mgd.tdls_peer);
+
 		tdls_dbg(sdata, "TDLS del peer %pM\n", sdata->u.mgd.tdls_peer);
-		sta_info_destroy_addr(sdata, sdata->u.mgd.tdls_peer);
+		if (sta && sta->sta.tdls)
+			sta_info_destroy_addr(sdata, sdata->u.mgd.tdls_peer);
 		eth_zero_addr(sdata->u.mgd.tdls_peer);
 	}
 }
-- 
2.43.0

