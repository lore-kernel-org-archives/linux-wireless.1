Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441307;
	b=xyo6OU1CKLb+VnHzfoH07MV4LMnh3sr1fi8RwQPblMDdJqMkv0osxdtiC+Gz8wSWeVdT
	 DOIo/A/Nwip1VzcLeukA85Qu2VFnt+mwmWH+K94xA3gn/Fe2TErGuVXmbcNohcwSPNVWQ
	 YmIOR5i2GEMi/f+E9JxkjbxeDU1i2xt/WxoXzjjFVmKbaMUeVu7I+cLv1sdicMOZVSig7
	 h2GEW1scZNGDpikvYqhvnTlXll2Kiy21Ix4+11SZW74qEWVc8AmLFU7saHysHf0MPA8nK
	 mRrpUtFXrhwXdliqGrwF5GSaUcHfJa29DZmkDpPr7HT1PU6AqX1tKJZ89GmYICeVCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hZNZFDMt84el0uzbl7Y+L0/EjDGNQFFEF3vsJXRqTkI=;
	b=BB1XOPcKG3SE7tkEQbtZtZELDkDE2pwixhZeAVjw36gdhuV1w27fzWo95hwPkP+0sri9
	 njPNzR4Mc+rhtjSpSWKf5WmVNGGodd5dgrsHjFq452bTero1hGjzRA4Nb2RGa5uwnubp0
	 6s4VuBG+hEsUrZk+EJL47kFRLt5/TJaAJhqHfc/W0aBOSH22V59ecP7SfjzvRnRwNvGI/
	 V7HXxbBwhTG6roxOvWKWYmLwsMlz5NNhZuJHzorRkwz7+n0DZy8m7R2vnOaNIfP2lSEVc
	 YuNWa/dWxP8Js59+ab7S+UdGHmqVNrM8NLucTwi4UbQyZIf1tWx814sBtyMh1UFmr2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=u8fDyLOq;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC6C60A261C
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC6C60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=u8fDyLOq
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso4160529a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441305; x=1796046105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZNZFDMt84el0uzbl7Y+L0/EjDGNQFFEF3vsJXRqTkI=;
        b=u8fDyLOqoaxqxbghlrnzaVe1E7NZfmkNngR3kZEgNvq3M54QAnHbg0VPyvHcK3bJKt
         0ZSxJ1gRr5Xn9L8QWkmcFSTckVu+1xcdDEZvCBYDkq9lRtuQkV/Ha3NWfbvA2sHXe7Yd
         vfwloIzWz3egdQ9oo/ecZ/aa+wXfoGn/8SSBbJCnNeSMC1a6Xdv7sjaf21XBq3GZnEDo
         1lkcL/+cesQhViAyf5X/GLalLD4IY83ojfb3z38FFBNo9VxvlHElvj+bUush/jHaBOe0
         ZPIYAHsv8QdBnWhi1U9FQN6Xwz4RjIPBoCUUeKFngbx3s16qw3x7seBKBecX/+XY2hlv
         HfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441305; x=1796046105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZNZFDMt84el0uzbl7Y+L0/EjDGNQFFEF3vsJXRqTkI=;
        b=EwmZu/2s/XEsvCaLtLd75BwHm3U7aDg08t5yizNzFs5JV0Js+3rYyY9WqdUkgZdBXn
         4OohG1DlzCZsKhTLvcpR9uIR87siIFINCRkbjCrF0CRuvIcVjMI92uaKrHG2/FgF3QRv
         /+HaPJzShFEsOXLnN1CL9dcAnrzjF+XivNqP+dbO3AsTSBPosv3kfRJVfFpW4Xn5jfQ6
         2mzkVB2TLlNpaDQyBUQlPyn1FRPNGJns2hTvkBOpPZRVZqI2xCpiBTFANkCEcV6F/FZJ
         OIVrMOax3U53mvQuuqAajqQFQLWgsRpsZBw4NHQut9fYYJEW031PP3z/JwLDb7QV6+65
         oKmA==
X-Forwarded-Encrypted: i=1; AL+hErEJ6+oZSG4AbKmf6n9h/DV5qZNOtSwaL4rCHb0se8cF8tAUfVL5nJqtCHfAiQOWIAoy7/RiNna2SBIxlN4y8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vWj3OD9scXRKbWiHhwRldqZZU8hC3i+r1ZF6lvD1xboqRn8g8
	u9umg5G5jc3Ad2F9VlbZD/7IYhv0DAVV3IlrNFJtWUEijMU1/GYBR1PwCrjg+++NMg==
X-Gm-Gg: AZFdTZeqJinZHmumndQhecJoHeU7S6ub0I+vBtNP+T/VvZud2EFxYqT3nI3Mcc8cpZr
	YzlW9waC7XZyVWyQ24sAZC3XgX84wrLOhtVd77+W7aLq7/x6QFODEImShrzFAQT6LZHguh7H3OM
	CFdDcmbYvZSiOi+ozIHvi2OVFJnrE24YOK+sDdANeIArsJFcLZ7rrfX7ERZfPo3pu3z8WGAp2Ok
	Woymsl8NCc9+2nVYODwGuVNG3XUlszCSybRQ9huerYr8bBUx9Z/m3yxJ1SSaZU9zFEPz/b8af0+
	ZeMKI7CEj3c4SH6V9A02so4PLrvoFM00bawFkUUMp46wkk7qmsX8o9hRQKllrBSJ8s+lqAQFShL
	ChI48NFoy4u8aOa8ZxMOgGf3uGo5SM6MHqvWgbS5TxWgvwlLVPAWP48Nkl+FqoGUKD8HJmRJZI6
	xxc4NSLYSB6ZYj3XbGEZV67abuHdN84ialN2kA39IN30TlnlTMCmwqgoJn3kAVCiVGcgz4INz1Y
	IFfOgIbOiyP+rMVnhZcEbdyMrSxEqIQ4CcLHs7SxBo5xhcL7Dic4/u3p2rCFDbqKidMpYRAWehK
	RAtgcEbBxVceVtSwWbrd+Oih0rm5f/nYIMx7iA5XMo0SNLsTtPRWZTZm/pxXRtwcLIVcpOOx6pQ
	o1TnySWqZMGHGAZFKuSjOblCjCFcGV36eg5rtQAw8or5D7zBpfJ1aZWt9I8RqL0nn7o7zG5i6gg
	ZusVSDwzUXJFibEFcTme9XHthdfeqRdX01Or94NJSMBQHj+6zgAqcYSywtz+Sxl+TkIBfYs0Ih+
	vKIxVu53hZTeZTxaaZQwjKrYjl1dKmeXf2Fz0YUzAnkfxsQCdEr2CMKBDsmQFrF6cCrsAqwoYeO
	icpL5gcPP2GuuuS0Y4evdx1PVYQpTJ8vFfz7CF99TLMQoGd/sCPssC1ZSFjshJJO7wfam7MUpab
	L3VrKNmOhPKO6dDjnSIU=
X-Received: by 2002:aa7:cccf:0:b0:6b7:cc0c:945e with SMTP id 4fb4d7f45d1cf-6ba37e84fbemr6637619a12.23.1795441305235;
        Mon, 23 Nov 2026 05:41:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:44 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 07/10] wifi: ath11k: look the peer of a received MSDU up once
Date: Mon, 23 Nov 2026 14:41:34 +0100
Message-ID: <20261123134137.718575-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
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

ath11k_dp_rx_h_mpdu() looks up the peer of each MSDU by its peer id in the
rhashtable, under base_lock, for the cipher, and
ath11k_dp_rx_deliver_msdu() looks it up again for the station it hands to
mac80211, under a second hold of the lock. In a profile of bridged uplink
at 900 Mbit/s (IPQ8074, one run) the lookup and its hash take 1.7 % of
all samples (ath11k_peer_find_by_id() 1.12 %, rhashtable_jhash2()
0.62 %).

Keep the station ath11k_dp_rx_h_mpdu() found in the frame's control
block, and have ath11k_dp_rx_deliver_msdu() take it from there. mac80211
then gets the station of the peer whose cipher the frame was handled
with, where two lookups could find different peers if the peer table
changed between them. The station is used after the lock and in the same
NAPI poll, as ath11k_dp_rx_deliver_msdu() used the station of its own
lookup after the lock. A frame that does not pass ath11k_dp_rx_h_mpdu(),
from the monitor and error paths, still looks its peer up; the mark is
cleared where those frames are reaped and when it is read. The debug
message prints the station's address.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  3 +++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 33 ++++++++++++++++++++-----
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..4eb40e674c14 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -131,6 +131,8 @@ struct ath11k_skb_rxcb {
 	bool is_continuation;
 	bool is_mcbc;
 	bool is_eapol;
+	/* sta holds the station of the peer ath11k_dp_rx_h_mpdu() found */
+	bool sta_valid;
 	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
@@ -140,6 +142,7 @@ struct ath11k_skb_rxcb {
 	u8 tid;
 	u16 peer_id;
 	u16 seq_no;
+	struct ieee80211_sta *sta;
 };
 
 enum ath11k_hw_rev {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e8226b2b832c..ff09463d829f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2512,6 +2512,14 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath11k_dp_rx_h_find_peer(ar->ab, msdu);
+	/*
+	 * For ath11k_dp_rx_deliver_msdu(): the station of the peer whose
+	 * cipher the frame is handled with, from the same hold of the lock.
+	 */
+	BUILD_BUG_ON(sizeof(struct ath11k_skb_rxcb) >
+		     sizeof_field(struct sk_buff, cb));
+	rxcb->sta = peer ? peer->sta : NULL;
+	rxcb->sta_valid = true;
 	if (peer) {
 		if (rxcb->is_mcbc)
 			enctype = peer->sec_type_grp;
@@ -2721,17 +2729,27 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	if (!(status->flag & RX_FLAG_ONLY_MONITOR))
 		decap = ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rxcb->rx_desc);
 
-	spin_lock_bh(&ar->ab->base_lock);
-	peer = ath11k_dp_rx_h_find_peer(ar->ab, msdu);
-	if (peer && peer->sta)
-		pubsta = peer->sta;
-	spin_unlock_bh(&ar->ab->base_lock);
+	/*
+	 * The station ath11k_dp_rx_h_mpdu() found for the frame, if it ran,
+	 * so that mac80211 gets the station whose cipher the frame was
+	 * handled with.
+	 */
+	if (rxcb->sta_valid) {
+		rxcb->sta_valid = false;
+		pubsta = rxcb->sta;
+	} else {
+		spin_lock_bh(&ar->ab->base_lock);
+		peer = ath11k_dp_rx_h_find_peer(ar->ab, msdu);
+		if (peer && peer->sta)
+			pubsta = peer->sta;
+		spin_unlock_bh(&ar->ab->base_lock);
+	}
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
-		   peer ? peer->addr : NULL,
+		   pubsta ? pubsta->addr : NULL,
 		   rxcb->tid,
 		   is_mcbc ? "mcast" : "ucast",
 		   rxcb->seq_no,
@@ -3081,6 +3099,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			continue;
 		}
 
+		rxcb->sta_valid = false;
 		rxcb->is_first_msdu = !!(desc->rx_msdu_info.info0 &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
 		rxcb->is_last_msdu = !!(desc->rx_msdu_info.info0 &
@@ -4562,6 +4581,7 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 			continue;
 		}
 
+		rxcb->sta_valid = false;
 		rxcb->err_rel_src = err_info.err_rel_src;
 		rxcb->err_code = err_info.err_code;
 		rxcb->rx_desc = (struct hal_rx_desc *)msdu->data;
@@ -5471,6 +5491,7 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 		rxs->flag |= RX_FLAG_ONLY_MONITOR;
 		ath11k_update_radiotap(ar, ppduinfo, mon_skb, rxs);
 
+		ATH11K_SKB_RXCB(mon_skb)->sta_valid = false;
 		ath11k_dp_rx_deliver_msdu(ar, napi, mon_skb, rxs);
 		mon_skb = skb_next;
 	} while (mon_skb);
-- 
2.53.0

