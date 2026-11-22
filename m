Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371111;
	b=A2dRl1by27+xO9C0pT1A8bDmsz6b9OsZqfGHo2irc7ndQwMUvnsWFC0BPyTD1Rfa3q+5
	 vXyl0Roomu6tfjVXVnK7BtHwj/XetOP/x4XwF2R3pim1UkLkZuUMTbuN5Ey5evWvKk6NE
	 hjXHlvr3jLylrnzrpAlyF7eUB+FPj/qaWHXlgGwoGatLg8SnZ3agbi+mZ+sA0VUV8pGYu
	 WE994urdZ4nGpGPLLEBa2wAr8colK+TmoeG6qUgBAD7VJ7Ya36GpopAwKolEFWi1ciuCY
	 58+G3K5Ec3cRfclgcXL4D7UbD9V/zJuX/tOcGymeYLLd4QhY453zGzF7clAPgPAsLaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
	b=AfpKD1cCKPXrFdJ4IOgbt40gpABvEQLxJM7VlOXCnPLe12fN6ocPj05sfszwK2pKuRPF
	 IyIDzu+ilwtuc1W/fnGVmbP7bHSE+cQIi3uHINOpIrKiXVf+9b4ruwdHwsQuhTv65sXXq
	 FTGTbddB9RRZauhW3XGceRbDUEmV8y6kNwb/jAyD/hNU4YyXJu8QJhwCbdj8fKcgyB8JC
	 7VSsWVLSJS2IGV/VwPG4lObuHDohxMixWmOYrBYToWtTuvWKPuf1rSvevjo/yiXrqKLhG
	 Uk3vtXNVx72xyIPe6FpOzbYYukeXbP2D50OE9a8KB2gEhLhEMyf/gdWKOJOdH7khHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=eWZxsdTT;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A560A2618
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278A560A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=eWZxsdTT
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso566723466b.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371109; x=1795975909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
        b=eWZxsdTTy5LP8T69/vEVfk3Vv51q1FIr/ibktW+61VnmQljeFT5gq6uNMt36e+wYyc
         i4kEH2xlD90NmxVefmdG8dTxLjwb4QE4CqNksI4MIyRxJ03pyiZ9RnaBmb3A9eKEMBht
         PluKCUBKGYEeXBtPKTt1l7sRa0+hKV91yh6ZwNyOuOCiFWAArAwus35LZmEd+e4Xvue0
         m0qaHxUuM+8EC7E4utiSxMfetGoY2pVAR7sdslVEM/U65opPBKgJvfc0Kz7DElK+EQCo
         +Z1LJuKza70WKElCSo6MfCOfxlsaeAC+0TSeqSBNEUb31eZKeIOzyg2VP0uHa3OeuUzB
         KPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371109; x=1795975909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
        b=VWkOPBod3AWGhNNiCQVXxtvCOZTlQk2ZpR5XuKQazbujbz/SnMc6Ro8cIS2Cotm+7T
         tXEbbAtI0eDbMFUjCSDc8M8xv0H5xB+s1QykQeLwBKeBdFKhFfY3yDcLNueeNQiNYo7N
         zVq+Z60OfBgC4VH5xEZKTaGvM0otg7O8WNTeIBfRd4r0GIhwONIKbowlzy/HoCZ3nLhM
         ON+Vjk0sAIZPHjjye0+L8QewVoL7Y8GAuwOXywhffYdyAIXH1wvjg3B9FgFSq1WBo9nY
         /cWeYJd/hc2Gia9mrMgDMb2y9XgNSMnjNasvqwuM/ZEPndMuAYHEoZilPAzzC7uFmlGF
         dy4A==
X-Gm-Message-State: APuU4Z+esTsm8hUI7b3D9yuKvnfNPKMePb2bhkahYjb8Tou6nKX0P1nj
	hNdH4bQUSF5JuyCHZS445cGJOt7uXYf8rwU5mZQ+kaVSoAbijacTo2jw4YxiHroK9A==
X-Gm-Gg: AZFdTZdIumG9I8Ef9jCQ7oZUwAvatD80TARtCJQ0n9khgt07QlIvyat70T4Cl+jcjjN
	0dnx95voaZntVOU8hu1Vn1SvsH6ZpMa2pTZPtKIG+bKTO1kiSbvdb+uRxawjSZY7ctKGhD2q/Fy
	/qCH8e0+Rf4tY4/8LWLtEcE9aDYxnJiHgZIE9pqoZ718SVpr/lX2izKJ0fvhtg0yyvgrGaLBOcN
	1p32HsUBtYxnB/1XGCsPt2UtjBVhnMLW+qinJ1+izV+DA0CIkCnVXnMO7vi0GYERjDtIH9UZKKf
	/xJtotavMyje38rH6DR7nRN1WBs7BYw9z2vpcv+sQUqlcpVqq3Rm0D67l0Sueo+gs3lzYJEZ7Ns
	E0pIM05UFQ8AHt5vyNXvMJxRpiXmoN/0jBGnQYH4zQR4Ul7HyIisMoWOj+FRaW/mg8qzP1LQc6S
	zK2GDufjKKw8iN2r6QMd5uPupEw/TiuvisB1t3NZlTapnsds84zkC13lDfYrVqo1ajgzkNnV1iM
	z2kz4pgu9olq4Qx/x+nUyToavrk/TMbVEO49FPElRyuDcWa/LO3+yDBAQiv6h3Zeuf9PLFoWIZ4
	Vzl7orH60TtpnyuA2ECBBZ3IbRdjYXPtBltr3uA9IzAxLuZ6Hfa1s6XPLODlfYNhlMR+2SYknDj
	ok9bAq1ZsnlUbm3YltY/asGmQNIsfk5lUa1o005hvagKgLN+8ukb3lUoa3pvn14wTCeEyHzaa94
	ktJMjjhdmkvwB2Kee6QzphYbPQJ7VxuG585WQBEvMqjChDzXKfuWUISfxLWqukbyhyfeiNRulsq
	brb3WeAXoa4rA+cZOsCqEOrNQ/a4eL8BTe8YPZe/7zo4fas6iqRbmFe/tzlP80lESwcTWFgfr1+
	b1tReiA+VggRX4zxT+RvqMgDc4QIq/qxl2gfi8gFy3TLrTLJJ90w5Jcd4D63AQMRDq7Oj56D
X-Received: by 2002:a17:906:a1d4:b0:c4d:31be:1f27 with SMTP id a640c23a62f3a-c513a80de57mr563735166b.9.1795371109556;
        Sun, 22 Nov 2026 10:11:49 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:49 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Sun, 22 Nov 2026 19:11:43 +0100
Message-ID: <20261122181145.1015729-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
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

mac80211 charges received airtime to the same deficit, as AIRTIME_USE_RX
is set by default, but ath11k reports none. Register each received
PPDU's duration, which ath11k already adds to rx_duration, once against
the PPDU's first TID, or BE when it names none. The TID comes from the
PPDU end user stats TLV, which is added to the default monitor status
filter. The call runs under ab->base_lock, as on the transmit side:
ath11k_mac_op_sta_state() drops the station from its peer under that
lock, and mac80211 frees it after that without an RCU grace period.

A station uploading with DSCP CS5 moved its VI deficit in 3 of 3 runs;
uploads marked BE left it unchanged in 3 of 3.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 11 +++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 777c56e416aed..1e4080caaa80d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5280,6 +5280,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	int num_buffs_reaped = 0;
+	u8 tid;
 	u32 rx_buf_sz;
 	u16 log_type;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&ar->dp.mon_data;
@@ -5347,6 +5348,16 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
 
+		/* Charged once per PPDU with the measured duration, as on
+		 * the transmit side, to the first TID of the PPDU; BE when
+		 * it names none. mac80211 frees the station without a grace
+		 * period after the peer drops it under base_lock.
+		 */
+		tid = ppdu_info->tid < IEEE80211_NUM_TIDS ? ppdu_info->tid : 0;
+		if (ppdu_info->rx_duration)
+			ieee80211_sta_register_airtime(peer->sta, tid, 0,
+						       ppdu_info->rx_duration);
+
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4527ab6977d04..d17f80cbcdb5d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -229,6 +229,7 @@ ath11k_phymodes[NUM_NL80211_BANDS][ATH11K_CHAN_WIDTH_NUM] = {
 const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default = {
 	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
 	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
 	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
-- 
2.53.0

