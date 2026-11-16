Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870183;
	b=wjhIXtvjOjOXWOjF309fm4DClXzVUDFxEmT4VnjNmxoaZMByptYrOZRPY7okcQvRlOqv
	 TREu54tfu6NjoBMSApEr2E7bOnCbm4PDqalJAdn/Irl9Rs/Uk4K/r8Kmd2A8mnEtifcxM
	 i1TzlmMHh2Ckny4VrjJZJI9/tseYkrtA3+t1kjgyorjQHxJfepKc76OC5ltUMCm0ZuHo7
	 /N9i9JMfcGZjvNV6yb1EVBTAILFkPRpuLEQN7vxrc/RiKhBDMrT5Gpksw2kraYXho7Lb9
	 YSIpmP+ikZB7iAceqsHVJWr4XVh5INb9UO1DmT2xuQ7mfVZbzrV2ALDVvo4nI3C7L2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
	b=3JZiPN5zWqmFM1ePGP3zGtqT9PubiGhUt4Uibw2xSB29xn2IAJSbR+4oxdi1I65vBuYh
	 UXbEDETQK/OmS7N3D1Na7LRrhZP36qm2jQoKUkb3vV3vYYIVrsSGTuPFLQiX5Cj4FjhyU
	 5bkNphcFVk6kNlfauGBBhOIGdAfcu3UodFM/guWpoVLKSwMOKQZe1jy25EXErPyVDOYbp
	 aZY0JGqE4YHo1GDUznURZhESrJyUoJhqF9NM5XplcflaShEidDUSnWtRyTshXkRjP3WAf
	 JJggQkudb/DGD3+YOdNJXb2+jOC5C4jT7nm+1HM18hu281CHHsWNKtDCCt2BAWy8GQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKfsChHR;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118C606A33D
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D118C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKfsChHR
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so33169955e9.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870179; x=1795474979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
        b=fKfsChHRbJkgHA1Zn5/95TRvUTd0+x6g+VLr5rHsu4l3Fjs1jlWRNjhlL7+uBhyAiB
         tO0Qxih+V+3owTpaSx59MFFHLwgs6iEIRiQo07ibXqFPIHpUhnjq5XIyvQGh7Zy0sBTX
         aNEAosnWXWrDdpHQTIIX8EntYgsBB2QMqtc8FYgW39w41lzSLA1gxxKismWU5hQJAGZv
         soc1u+S+Bop2jutNh40YpwlRqJdTpkKl5M8u/6u1Z0bDCWt0ExYNGkgZ4zaHpaLHidbB
         G2qnD8avvWcY1gk6Vcug0u1bZ/kNv5p2t+hxhxROUb/6QHZGTW8yemw0wpyv+TmzlAY8
         zNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870179; x=1795474979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
        b=hRxXG4d1jiI62I2cz6oVnzsj8zs2oFzTIx/tbSIq9zYpzaI61Va7nL677Ou+1yPVG3
         3H7NddhVdyUWtHC+SQyXdpjJ2IbmbjzgJZeI86Mumr784rW5LEpDr1NFhhZByvO+RFRa
         mKZqo3RnNXNRVqXgFxyVrR8LhVq5nkXic+Bf0F8uzBr3TngvzCv8peLEham8yC2OR8AJ
         NWyX4RrZZdmjEdWNqq3fXDJCmAg4lo7fFjE1ETLhbHa6EyKYI0lXvWLiwAXoip0Qc8no
         nnI8kiH7RJ6KhfzeDGsGrK0nskoTlabuUf7lElAJS0gxafw46LC2ZIJSVzKWd3rlGcoe
         +sdQ==
X-Forwarded-Encrypted: i=1; AL+hErEECUj7DAQaEEaTsP7pB2D2WzKo+GVqI5V/cpvcU3MLTyv/bPtvarP/vdkj3BXiLYemws1zZcve1Q1+dKurDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qly2OCGgpxfxtjrhv5V5VikLaFKLNKM1YwXhXGZFYEVhFwjeM
	VYZl6SOlk75bpSH1pJyi9d/DBmYlcaZPMyc8jraFnTM4v7r0acgEyIaj+6tVBpcK
X-Gm-Gg: AYBFou0vSSSueP1V0INFHsXNWIeZqF9LPVJUL+Hk0ylNRJRpudkenN1Pe6cLbsgIRpz
	4ESSydYfN2o0XGAiBsXZm/CcV6IZ5qwZGY/3BSHT+nTD+iuqStHBgr4M5JlKV6cwG92s3r8bP04
	HWuYrWWm0tHxgOUf0CXqRt+Pjm7Mo33kINo575qYlZhMGAMHNDH0kxYHB8sAU7gj31KCud2QxeU
	nTMyk7vv5J8Hm4My0H6v/z1nTB0K48KDB4xdrjDT2EG7vViQ0UMY5a6lofm2+v0XCS8F+83PphV
	Q8y08YiOug7JYSxKJp8BwYHXpskTk13rtqj1dimeOmF76brDEAHuXuPjOXuPz65rrI01hCNI6Jo
	XJbwcVGCd3CUtahJXyrIA5ODEYN0wbGV6hmNPwBoxq1uY9yLmvPsowX3SXzCbXysNNio80soh3I
	+2mRVtri48G/IWWws7td2s4CasbC7whHV6XoMY8nKo7fM2uH+Xf7ezYrEqcMEHQG/DK7piud5+V
	RuI0AG+G9TtACOqz3W3mHhbzV+IGiBCANbOSMCTbKo77IzuF//ZqwGWANK17o7ul/Pe0ynkCDea
	odvYoKcDRpHe/C9nvW6wOFsA+ehby0U7tQ==
X-Received: by 2002:a05:600c:8b34:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4bb55a25c0fmr239411275e9.3.1794870179190;
        Mon, 16 Nov 2026 15:02:59 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:dd63:7222:aab1:aecd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm24680955e9.0.2026.11.16.15.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:02:58 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: report TX status for broadcast and multicast frames
Date: Mon, 16 Nov 2026 23:02:49 +0000
Message-ID: <20261116230250.369383-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

In AP mode, once a station is associated, broadcast and multicast frames
sent by the AP log:

  ath12k_wifi7_pci 0003:01:00.0: dp_tx: failed to find the peer with peer_id 2

These frames complete against the AP's own peer. That peer has no
station, and since commit 981050b918fc ("wifi: ath12k: Fix TX status
reporting to mac80211 when offload is enabled") a missing station is
treated as a missing peer: the frame is dropped and an error is logged.
Before that commit, the TX status of these frames was reported without a
station.

Report the TX status without a station when the peer has none, and add
rate information only when a station is present. Only drop the frame
when the peer is not found, and log that case at debug level, as the
HTT completion path does.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
only in dp_peer") in ath-next; the resolution uses
ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.

 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 41abf1865702..794d85d9dbaf 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -856,24 +856,27 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
-		ath12k_err(ab,
+	if (!peer) {
+		ath12k_dbg(ab, ATH12K_DBG_DATA,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			   ts->peer_id);
 		ieee80211_free_txskb(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
 		goto exit;
 	}
 
-	status.sta = peer->sta;
-	status.info = info;
-	status.skb = msdu;
-	rate = peer->last_txrate;
+	if (peer->sta) {
+		status.sta = peer->sta;
+		rate = peer->last_txrate;
 
-	status_rate.rate_idx = rate;
-	status_rate.try_count = 1;
+		status_rate.rate_idx = rate;
+		status_rate.try_count = 1;
 
-	status.rates = &status_rate;
-	status.n_rates = 1;
+		status.rates = &status_rate;
+		status.n_rates = 1;
+	}
+
+	status.info = info;
+	status.skb = msdu;
 	ieee80211_tx_status_ext(ath12k_pdev_dp_to_hw(dp_pdev), &status);
 
 exit:
-- 
2.53.0

