Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371109;
	b=XQZIRSWvDHmuf3wCfSebmRBJEnF7Mf4BhBG47KdHSqa+iZh3qBqU/QS4U/xMNhwpBA8A
	 QQAL5qp2Kn2FGGq6YqiVuip5wriwJpv2rjyKLlYkIAT2Ew6qmufAGRKjVLW02ew9xXw8O
	 VeuJhyJ/GvtdOnvIOhJjHqYeEMX/vjFXkKvNZb5AZduhyYPvsZFC/wTtwtA1W7/b2Uc3N
	 TxOt1YuejpeVLlyZ2HjrhpXNTgeCII4bOzS56Ff/uTC/EqLdhJ4P1uzsCwhSy/ehDAJZb
	 0WOH0dcYAFWUoFyKeIWuNZB2Zzpm2p1KIbLb6JJOzKbeVugEVxdxhYVHZxGYNZvtqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
	b=fo3UTArSGPj0cMXJ7iGLuvI4dOYHrh+GJKVufP77BrBROj8lZwMVcOOlIdST/q11ojQ8
	 Edo48hryij+DJ6SfxTI4s0/YAlCeEkCZlk+fKI7OmGI40mDZgXBnihfZZCeIOrfG/mqPZ
	 mnXvY5cze9UNseT2NO0Ruf5tGB1cMGGHPy+0nojlNU2Yy9F+0vdqjfb8z3mXNN6V9c8+s
	 nw+51KIcsht0knhSRbD9yZWk2yZiEDXVtgFi3quqwuA/pzIvChF0lZwy0e3CeF1dYGgXS
	 Q6XyBQ79QGU+/tv0lVm7BysU8qreA2H/BiJqLLVNpW8zM7v2Qe3fsTTMVKTsxGD7AOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Be1CQCHM;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F91606A6A9
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F91606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Be1CQCHM
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c51373ae637so388871266b.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371107; x=1795975907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
        b=Be1CQCHMVz21lUKkuzjDUxwCH5Crn7ZDBY2BszDWbr+dZQ0FrzBwYAO5sYzNqMipfr
         kNDa+VoKtuMAmEnfHCCuqiIVGLuUMLkDJnUoFDEy+AOnnggf10eJLGhf8WHuIyqpYd15
         dvDtNdJMJjqXXfQQsIw15xudU4wB/DwzBszsL8E8Cb694WSdchFa2pDW/DCWTkKfUhN5
         xSHztUq6IdQ6hlYrMeQuBORAcCGJ8LEsBgx20gsTIshx07fjBmszT9DrHvVRtKOQ1qUJ
         FzxAOm0mKmWbMGCIB92e0IlnAr4bPsYRDIZwE3Vy0w2rGNkl0jZBJE06hCdw46LIV49v
         wKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371107; x=1795975907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mE/A8sDoniLUUaDAUsGG7lJKqfa/94EhZzjG2JUFfCQ=;
        b=yWyQps0x5JuM0vswzrszVPvAuptVsS58cfOgjg1TtNyCZ/4oRi0aS+R+KiWzrZKOyn
         pg5sFULSRpY8Wz8sFgMBFKy1CbXmGUBNFOyhI45Vf/mODXW8B+9I11Som/puFa0DAiBR
         Ziv+tEkCe7iLx6YDm9qItqoQiAakIehdB6m32Ys72/BinHSJ9qdlMcE56jvkky8dAvQA
         BKFvxvKHnAhqi7VkAobGHBVmzCvVn14oNsMy793vHdx439/0/I6TlslCRKrsI5oY6BSj
         b4DoeziJdrDVO92ifmA+MpJibHNSd/Mlk3kJkxeyTfTFggw+OiyUXhTaWIuLcanrgc0i
         3kAw==
X-Gm-Message-State: APuU4Z/o0c2xdFWAIM2j2I/bX75LsXbxoNOcyaLowhI2+ezb3+eobmtt
	nvyBhe0mBuiREU+p+jmjHKb8hbSmgfGS/oftXn/HlCq0xvoP0vfvPDM6swNzyWLOJw==
X-Gm-Gg: AZFdTZfd/HtUd8HeP5Wb6e7W8WitGwkLEnq2CWDhCgRmhHWZ31Tvl1Zujn7Em1Wzf2W
	LQHN+7xC+lKDV6oShwyHNYkzMLYIA8ko3D9uBX6nH3R/ZcuVrOeHZlyi3XcgrWMpeyA9qEoS9Kd
	HZLPDyGN2FeSNeMAbK1yHCI5mCX6X8yF1XOgeYP9WDQ2wRhafXMSNtK+FOc2bHhMOv/w0xGcWhW
	4cO/Kr3aexhzHZP8pQ09gsCdv7ka9THvLyDAmWCrIPSF0lSL0SNI0WS68hglhozlOFXXVStgJp7
	55G/GrEe2eavBWY6qmIIn+WbF/EsEfBymX1lItdZvBK+vhGWqSNURCNVNkL5tbkCGi1NLW20fLW
	KmVlPL4w0YvXKtoNBpjVoTFM8gUAjhqz1t+DlSIjFhoWUWdrSIgts8clF12mhrPfMJPotI02Wx0
	cuuLoBwU4aaqxjdndhWALx5SeRuJ9TDj3kLWSjdnX+beveSA7g43eaJrTq90a+sUl2ZKfT23I5M
	iAc3LrSqwOIjOzByjzdImvpii8nqIrPY3+L3yEGrPugYaI4Cm38A55Xh0XdxO45m8HTu+h68v2m
	o8F1e3JVNV7vGEpEOY2EjRyXCaonMAb/oCXEBJ+iUTlbLocuWxPQUUlyTuCMEQmI0l2uaXRFK1M
	JseJvwFnTebbVSBFgbhm+BroHwc/zegIiFMj0GvVPL/um/So1CLKy/yE7crNlGJBhxYlvd62h8k
	nEhSx8/3+jnoAawcmjjnbJLGzEH25XNkd1jKvFgHQoM5wqj3e4fOLbbqRWblp2zG99v77OrsE9Q
	L0Gwc4X61HdXOi3SghDTrv2Q9dyVLe1iQGB7js3kwkcMp2QgsmRBp/kl/CElA92mUGFZrDuO7JN
	mSRiKiD1Dqoyf1R7juq2rlVUuD2xIi+gv0u6uefvuPQ5jT751lnKGBnshMHdCz+Kj6TfzO10
X-Received: by 2002:a17:906:3713:b0:c50:4d71:a85d with SMTP id a640c23a62f3a-c513aac5448mr605392366b.32.1795371107075;
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:46 -0800 (PST)
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
Subject: [PATCH ath-next v6 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Sun, 22 Nov 2026 19:11:40 +0100
Message-ID: <20261122181145.1015729-5-julius@bairaktaris.de>
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

mac80211 charges the airtime deficit only through
ieee80211_sta_register_airtime(), which ath11k never calls, so with
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS alone every station stays in
credit. Register fes_duration_us from the PPDU stats, which ath11k
already adds to arsta->tx_duration, and set the bit. The TID comes from
the ack/BA status TLV, sent only for a PPDU that drew a response, then
from the completion or rate TLV, then BE. fes_duration_us is the
duration of the whole PPDU, from the common TLV that all its users
share, so each user of a downlink OFDMA or MU-MIMO PPDU is charged the
duration divided by num_users, in arsta->tx_duration as well. mac80211
takes only local->active_txq_lock[ac] inside the call, which runs under
ar->data_lock and ab->base_lock.

'iw station set <mac> airtime_weight' fails with -EOPNOTSUPP before this
patch and succeeds after it.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 23 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..777c56e416aed 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1382,6 +1382,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1400,8 +1401,12 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 				usr_stats->ack_ba.info);
 	}
 
+	/* fes_duration_us is in the common TLV, one value for the whole PPDU
+	 * that every user's stats repeat; a user holds its share of it.
+	 */
 	if (common->fes_duration_us)
-		tx_duration = common->fes_duration_us;
+		tx_duration = common->fes_duration_us /
+			      max_t(u8, common->num_users, 1);
 
 	user_rate = &usr_stats->rate;
 	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
@@ -1490,6 +1495,22 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
+
+	/* The ack/BA status TLV names the TID only for a PPDU that drew a
+	 * response; fall back to the completion and rate TLVs, then to BE.
+	 */
+	airtime_tid = tid;
+	if (airtime_tid >= IEEE80211_NUM_TIDS &&
+	    usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
+		airtime_tid = usr_stats->cmpltn_cmn.tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = user_rate->tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = 0;
+
+	if (tx_duration)
+		ieee80211_sta_register_airtime(sta, airtime_tid, tx_duration, 0);
+
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
 
 	/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6f4462b7d3f15..eca16a151d068 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10653,6 +10653,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0

