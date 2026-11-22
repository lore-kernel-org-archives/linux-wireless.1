Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371148;
	b=bGF+MYqd/cmkfLnyGRg593rSQtPmbETPjtHjbx97kZR21XZIvOShYZVA/Rsz9Qt52uWo
	 eYbzPx6jnqK36tP5GYsG4iaXAvbKBaBlIwhBK4cAi6Os+NtZVgwtuEd0rsf50S8Eo6n5w
	 JdGHvSCi/TlR0ImEjIQAnQkWPmJ6VGPtpIXIOWPKmQLnAKWlaBxPr3EU3NEG1Um4AfYvV
	 HB+o2YdIsmAVBEMdPdJkpaf+rXgzK2OuJK3G4qQLUySnM5gYgGKfOJexyAbR3Y0hPpnJi
	 ccngPdORTnW0we/3RbbSWmw30o6h992JgojMboboO+xqx6uppuKAPDvslDWFWyaizLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
	b=AQUOGuUVqJ6CTKmCALRW8LRV+0ls+4UFd9A6b4kySNcO52xHKc47RSWQ6Cz0g22wlxNi
	 RrcuVv9qQuqKXJujdpH/DXm5OGNO1Mz3EtL964E3LFsiqBLlvwOPGxv44g5wkQvyRDzCl
	 T3jYnSmZdGxX+89SCLJH1hi+/C+dl0GGuX4hzk5JXe4Yzw53KL0URlnEoI+fD/JaPZAvr
	 TLhgEYN/sZar1f4hHmLaj8WhaKnaAidutr/x140QBJS7WLB60I7CHHilLqaLaczS2ymW/
	 N6+DORjmJjAKn65nGLBqGTYxOqCEv26XwVH78irrfw+Qgd7tTOO4k0w0POF7RZDocCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="j/GaYwEJ";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B66606A33D
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B66606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=j/GaYwEJ
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4057479a12.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371145; x=1795975945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
        b=j/GaYwEJmmU916yqS+cd1VYn4bpJYyzyT59IwuexB9AIxkK4NVDVaznebjh4789eFf
         jymY995I5fIuwLOuu4AXYcVWQL53pWPjiZ2EvjU/JpNfOb9NLFdPW5EQRdUvwqwpCoK4
         CdKDtYjo/x2/RmZFaSbeMMYtwzuuiHhVd2lOsEmvvj28tky0Bp567+cI4gV1cRmhP8sy
         djyXxolHRTaGL2Fa56Z7azWE4TSIEMBvf5bLUGaxvv+Hir0NaDk8PVkX26a5KV3DhKy/
         U+UF+QqPceUm6+KnojVt3Sy9Q6UFLMlKVBnFKhsQHjEaCyQzM1XmT9VWJyHpzkDIu40W
         0JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371145; x=1795975945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
        b=JZnx7tUychBiPXqAgW39vAYlHWDz6XSKpVxb83ysvFGPRtgEMuNq6zvonuSLGHmqgB
         Tv5EMQ3LJ6YuQ2ELQIOLbn1epqtfNWyFYU7THuphc+7ffY8f8DPjTX/S3/z2mW8uXe8B
         SMPgURjIgRbuwjUbMf2R//y2kibh0wYdR26s2C+Fw/HNmPWM/f9t44xkBj10hQf48BfY
         9BpfRi5ul2s6kYZWorZzJ6VXdwKpcmBxIoMJBDvceCqhN0K7p9MCbLy4RNEDpZHFrt8k
         d45j2cDRVcQOBAzRbTldRTJgUwv2rQFTgiFdVxV7RUHpWLlza3WR7jeXRikacLbwuAqh
         iwwg==
X-Forwarded-Encrypted: i=1; AL+hErEakuO3nR/Hw1NdtLcefbA5XiMnv1DidHaRQdSKbe4gi298+W6r9zDzQAhmkJkzmacx+f0WRwF6qU5TvMSFCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jGKbgPIEBs3TCIXZudVCpCTQLbOvc3xOjV64uW/hKQJkE/lT/
	Z6N63SQmefPbHLNGAjrg/mci95AX9oKFUxg23iZpY9JVJfk8qsrZSAeH5SOCptzajw==
X-Gm-Gg: AZFdTZc/5305+nIC9ODuPMFwbBakIkiqbsv2xJGEz65EnxLBrZTe9JnmQilTayCxO/h
	nhT9nF+cIzqWfququk8ktQ9ndn22n7hlIsyGN3+JPc4LhGsOqnB1cPZeyAhgsUkoCw3qa8yHlXj
	Mu4hGRCw06Scoei43RFfEhPmdQp+/Wq0ziCoG8sGkGxEPkKeaeaAxHkssTz9L8AN1gI4uPlkgF1
	aMqp5g1kfEL+zilpfExaV1PNeLZq1e27vDE8+Yjv0kvAnc0iNCgJi7ioW/DuTnLCcZSdXTmSzrz
	6KtkKcdcEHu9tyYFQ1BlcbdRXYjwGDc3CxWDog/GeMTI65tnIdnPH5ayKzyQZjpLhbuDhClS7bX
	bPhsl3ofI2TvyvvMcfQYuVvyIcQur366ixSQHTaNS0cGrAOaIpoGdX1XO4QtWHWvSOAWMHlQPwW
	Y30l8DSx2/i4T4+7Zd70xzbDomsc6v73dK6oErhdXAeI5iSGUmIaaTlYuG9JPWLaYQ2R9w8jGfJ
	cf6vHykOuObYxNc8CLIFc26yKDU4gCWmXXYXUDoGobx2SrungS5RP7z0lYQJhnZK5QVzQxp8Wbd
	IeGhMAsEs5y7kJMSqySC9ytbDCVkREz/+mJWY3ps88tRWjZ1yM0NADgtYNd23OIX0rI329FUEGU
	uQS/AMVX9vK1WnAHOiKWnv0JWaNi7T9lVwSXVmIHgbI2gTO2C/oJRQRpGVnM0Ix8QhWklELwepv
	15Zy2xn4FJzwlvm5tGsIdmAmYhYyz6EnaMCVvNqSYsyi/CUYILMbowfIjDLluvxT6FzlH/eDd80
	RKacgyTgfAgkn57YDJyT8nr+6DstZQLjS/ZPUCdpHOM67W1GaTZH9VxBzjUujP4jASpSaG32m22
	qUQgSfS1kahAVOs1tQBZA3gfpHP64wvPV8popgqp1ytsDluht7/mdix6LbTOaeMJ0JH929Eq
X-Received: by 2002:a05:6402:51d4:b0:6b5:8cb3:5e19 with SMTP id 4fb4d7f45d1cf-6ba37e8826emr7380558a12.38.1795371145587;
        Sun, 22 Nov 2026 10:12:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 6/9] wifi: ath11k: offer scatter-gather and TSO with Ethernet encap
Date: Sun, 22 Nov 2026 19:12:10 +0100
Message-ID: <20261122181213.1016590-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

Tell mac80211 that the AP, AP VLAN and station netdevs may pass TCP
batches with fragments (NETIF_F_SG, TSO and TSO6, up to 16 segments)
when frames go out with Ethernet encap on a device whose TCL takes them
(IPQ8074). mac80211 segments them in software on every other path, and
when the airtime of the whole batch would not fit AQL's estimate.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c |  6 ++++++
 drivers/net/wireless/ath/ath11k/dp_tx.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 12 ++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 4fbdd15d1ce0..6d950afb90f1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -15,6 +15,12 @@
 #include "peer.h"
 #include "mac.h"
 
+/* Whether the netdevs of this device offer TSO and scatter-gather */
+bool ath11k_dp_tx_tso_wanted(struct ath11k_base *ab)
+{
+	return ab->hw_params.tx_tso;
+}
+
 static enum hal_tcl_encap_type
 ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 967f212d33db..a73b5197fac2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,6 +22,7 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring, int n);
+bool ath11k_dp_tx_tso_wanted(struct ath11k_base *ab);
 int ath11k_dp_tx_gso(struct ath11k *ar, struct ath11k_vif *arvif,
 		     struct ath11k_sta *arsta, struct sk_buff *skb,
 		     int held_ring);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5f2086bf6c5d..1076e3b09cd3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10727,6 +10727,18 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_ETHERNET) {
 		ieee80211_hw_set(ar->hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 		ieee80211_hw_set(ar->hw, SUPPORTS_RX_DECAP_OFFLOAD);
+
+		/*
+		 * The TCL takes a TCP batch whole, with its payload in
+		 * fragments, when the frame goes out with Ethernet encap.
+		 */
+		if (ath11k_dp_tx_tso_wanted(ab)) {
+			ar->hw->encap_netdev_features = NETIF_F_SG |
+							NETIF_F_TSO |
+							NETIF_F_TSO6;
+			ar->hw->encap_gso_max_segs =
+				ATH11K_DP_TX_TSO_MAX_SEGS;
+		}
 	}
 
 	if (cap->nss_ratio_enabled)
-- 
2.53.0

