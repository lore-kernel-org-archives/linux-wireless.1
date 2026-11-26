Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715615;
	b=Vcyn/OGNoR4zlGuxA7GoG41NTQ8ddVK2TA4q2Z9ppPNKd2W3JW6gt2BlT7bbWPYmFGsj
	 Ss4cEvmT3asJD3FiRBZXSDmaLa+PoZYEu7K1W4t5GrLGK2CNOOiiPTT62yjbvNSADDv7L
	 +zr5KFNC1C3DP2rUyfB+f1yHU8cD4NsV9CB+v9UZN0uuVAn+KhIhiWDYfPVUg2eMPEYkh
	 8cmoezqnb0FI+dMjYKg4eNeR/xkY69N5KFBSGGOj/8UkCHfQ4aIuOtKmKh/Ul7i13P7lU
	 tLxAGcT9oDbR+1Y3gX6TG3WxEXpLg2ineful8+84C/bU3OfHQosytGmbXEKOn4TxUtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
	b=5pRrWmJLA4g/Y+X7MNVG4MFS0qQq3tsOVbdKS1eCKL8zI7iZzR1aHmPpHdSLuDg24sHN
	 sxdcCND8NUJTiDB4R6uVZ7i4dx1hOAOoAr2tLEHnb6dY363f7ibTSzXycKFCGCCN/jYci
	 YK3zD6B5M4lWV1Zo8J51ohSjHtHGzSwlnIaavQpDCxF4xvzwLWx0MecRPB3N2UcFgN/T3
	 GyEFHFeLfuRQtpM7HrnqCbAHV/iSwqn75jiLGvJYE66saQ60vz5y6/T5HPbI/MUJGoxxH
	 ti9+OPO6jgdPVhuM1AAJhQk2oH/Qr+0Wb9y7VlOcmAPyyopnk85P6qmLuJERR3fBlew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpHC8wJb;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0172A606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 17:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0172A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpHC8wJb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so59207005e9.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795715613; x=1796320413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
        b=UpHC8wJb50bq0qZ2YFO8xWsMUEQX58CwzJ37600UltwuGNQsEzBvIVCZH08puwAY5n
         9MmDny7QWhBhhnT97QaZF4t6r3d4RwnSp2JUBIy+ZogsF2PeEN1JITlPS7K8pPME7nQu
         aPsGrla3Yo+o3m2ETseb26VJpaCX939F25/UW/1HMTMuyLbJZlw1TK9bCNOvtEIQ8ujd
         VSPBpjwMjTq4B9R4HBHLEu8ypRlVnJeFWJRzcIeHzPocwKqhoVw//B4HVjv/uDWsglSn
         iTU0UP0ksnAU1UWuzpNCMmlAQb05jm75A8qpM9n/AlIX9lW6Telp8o5vqDrHrZ0WNFdP
         mAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715613; x=1796320413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pQ9GEAcc8EGQNOQeS3VNOfksRTSnbgTKVbMBryXtAQ=;
        b=JWzvz9fAM8dzDBZudsLn2dMr8hBxJmHzccmuGWKezRxIr7qDdjBx/WYH+VZmYIOwR/
         WBfUd7wa0gq2JqJeDg31iDe96RTDmm5IDn6HLodFKENIm363fTD6svGXwukIXGSbH5ER
         OfGqFlKFZZ3CAMqG5OWyYByfA7VMTHAzi7rZFh5UpK/7s0yMZTM3Gzw85w4o4JOvFc4X
         FswZfFJBfn1TRWVApJy7Bk8oqr1dAkERwQYhveW5qakiRCpMC8ILhNzS/LfUZEZgK6Ee
         ilPSZLS/2xOFEAzlWqS3jByLuCXQAKv0Rp7aPcMM7CvNI9mWwpwfTO2HHvea7TN/cYtt
         0sIA==
X-Forwarded-Encrypted: i=1; AL+hErGpyLzHYV/jNHKnEXy2gErrIglMYMnIcrKsDZzov55eqHDBvnxShOAHeS3+otioD3R/f7/ecBIqsyQkeLm8mw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zY0q63+YEngwunOY9H0KkkNK/gb+ieAl99QUY0QCyvVW0JR3u
	cOAJ+TwYl5/fkm9qrIc0LOb6hW9O7XLeF4D4fyKpPMlwHQ8cbUsTMC42
X-Gm-Gg: AZFdTZdog6e2qzBE8xxGiwMHNOtAHQnTkW6MVtyqV5xfKWQ1zTvvAfEhzuMNtsg9Wnq
	Eg0kI6EOH391p5uPnGM2M3EVVNCWcLyO9qWmX3I6k9lrWYRgjufKkDzLKnHaPbQIxpXTtvTbK5T
	KK8iJlNgJe0Wc1vmESFgPM1P7fMbArSlSCqw0qLzqZPSC7dS/2BuTa2EvBazU0rfd1IPM4wkneC
	3FQXeS+DCof/FQva97P4AFwTMnkjkdunMHdfgneVmivW8YRNzBrARVXas5ljWLTyGZObSkNTFbx
	DmqsECGYFG0fLf89Jv3+77UoKjgwFRGpLbhkcSKJcteaYHWOPF6VSaksu3znpqQcBEdySpbQYbV
	NP0qgHmkAXIxMsnbZWTWPTfQJ7/QZrByqKVV3yuTtqQQ4pFxOsg1sJQLr5OMHvpILeofGIMFEc9
	jcbLelcNCh/v4jGk3w5MAJ7QEzf6vTv6NBAZhGyJgVRx600rS4eM4+++Dc+KEBGqQFjaKWvG/HH
	ZXBO8N9TbjOOJr/iVILllWd5JCAJe/Lz8Nw/QKjBerLFN/Fr+82km3hDG194Ab0sQ/zqRs4yfQn
	WNsHTJ2ijb4B1fOexWcFZ0ZFzUPX8UXOvJMuFngaL0gMEAYD/CQcBP1/Aw==
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr414371695e9.6.1795715613194;
        Thu, 26 Nov 2026 09:53:33 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm564366045e9.9.2026.11.26.09.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:53:32 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-current v2] wifi: ath12k: report TX status for broadcast and multicast frames
Date: Thu, 26 Nov 2026 17:53:23 +0000
Message-ID: <20261126175323.2390231-2-ivitro@gmail.com>
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
when the peer is not found.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Keep ath12k_err() for the peer-not-found case (Rameshkumar)
- Link to v1: https://lore.kernel.org/all/20261116230250.369383-2-ivitro@gmail.com/

This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
only in dp_peer") in ath-next; the resolution uses
ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 41abf1865702..3c2a008ba185 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -856,7 +856,7 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
+	if (!peer) {
 		ath12k_err(ab,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			   ts->peer_id);
@@ -864,16 +864,19 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
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

