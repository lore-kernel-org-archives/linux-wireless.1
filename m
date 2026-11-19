Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067866;
	b=PyzK0rJ/6PaBVOPvAMCehjtA7DWR6AXCJXgBTdq1DkaA8WfQBDBw/fombRAp7cm+9z78
	 njcYCtI41I3eJZ7Q8PSGT/V4eUdpDiKAv7mSGpTc8FRp4QPzOkDBXQBGChA4QD0lTfqxX
	 2WdFDXw1fvFDicGdSPnr/oYj/BzNv4DV4OUEIjvxWR1q9k4X0L4VnFYlEQy1leabZRSKn
	 stmfuAOC/V+f7NvoHeCCuZrpFTtHM4tJ1ZZlOl7N3go/UTJQke5FmIl8CGPlAc7frZNsv
	 Ti4tQtpJ/+WZKCEYhr1VwPLAT7QPk2KguYw0OnvWLcpcWdC6k0bs0jIA5rTReIV1rIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
	b=yP5JzhbAPnXmdBUboxGpZ6tNrPC/vj2yaEJWMfRf++oM+sjcboUOx9yCPfR01agZ8P2s
	 RsWs6lW8bOyWTBON/e1d837Hi6gXHCDDlJOt2TW5XN+QY+BBsDz8vpGWNrYSfFyfJN3lZ
	 yieE2q1qfxwi8QmHRmzDuCdyF00fSfdOw0ABGlI/bQb1Pat6xOJOOe0p2Mw8V28gdwe6m
	 3W75DWy0ssBhGXg7e0KZhMYBeOo21CdPxOCLlVgeDjQof7ZmmiWWT2fDFeXgDDnoztK5w
	 yvxTBasGZPPM6RiWhY4nWjwYa/jsYpNZWfOWpCeGfeeYLiHj6DERCkJ3ZYWKsqu5f3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edN4lkzL;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B8606A32C
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 05:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473B8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edN4lkzL
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eb18f4da15so8126375ad.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 21:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067865; x=1795672665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
        b=edN4lkzLoerGnOUz+XU+d/BCZNqPHs8kMn5ctqctnN5ihldL6Tovx6KDoeSBRs0yik
         YXHiEoaqoGjI3ugZXaw+bBuBzzh8lGouLKku5VIyWIP2WsSLQVooTbIgfjpbkRXPQCMa
         13HS2f7KdvE7aX1VGcXIjZOKVWkLSGp9vVO2GJHOMKL8cRAVdEttghi5tbgVzASucta8
         HF53S0aZlzey2K4/Gsax/g1q0O73EZAbCjpNX7qiSF4/q5Ali6kOcq+K/PModinNYsul
         s+jYH7ZZpPWTw9ezWHLWPaWoNWDuV2I97ocSTRXXfwXU9bcR7GM9I1VNlZArFRezGYO0
         F7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067865; x=1795672665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
        b=WyqSuOU8PgiurZeiICrlj1NBP+ggt5QG/MGMh9nGkaL+xC5WUc779mcZO02xatzUhB
         gxoutVqVmbVBLh29T3T+/yKKhiU1EUyGHRSsnQzEpnTD2pcHHLr9ceWokvGk8sNBHRja
         1qWL2KPfUuBhxifUchZvdotKgTtWAxDsecsdQOmoJcBjpKxGOPyT1jqCz2qwZxFcpieJ
         d+94xWzr55vkjQY6oxStkdS7IIL2OSBw0xiqGewOFRbP8En+mmLuviCRatqLn2AK0Fnk
         LBPHK9YXXkBmJ9plpgcisNTwH+KqvmpUMBIWaBUoRu0vAQ6iscFFkA6Rese7SppaAjfA
         lr7g==
X-Forwarded-Encrypted: i=1; AL+hErF4iUXSyOuQqmxrrtp3d/PPIRzuWR8wCrE/K+emjtgkrEO3u7hnHThLvMDRibsScsidlLFLguU8yexVIE/XTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8r7HKsL881rWg7DFKZ+mQ3NV5ioDxP2ZiMIZS7C9IG96/4sMIQ
	mUIE0/qKli552DG7Gu10HpoK4QbzW2DQ0V7F1fTPvT514A9VPVy9DSTMCCd72j0oMak=
X-Gm-Gg: AZFdTZeBCp+UUWwdc6iOh8kJCd2Qb2MV7EoT0MgeRcSguyhUk5BKEF6Bn6YOdIcjNAa
	YPEL+10GLROan2UcTwbiXSKg7i0SGGUfryzQDcZS+Uj7JW489dDLuaGd0czkcdu7qy0U28NqwVj
	eIXfxBURWq5plnAbAx7JZ53yvdDROLUsCMUG/U6mov7i+G7WqHQ6F72r/u6xIEGecVj3IICmb9J
	EisbN5bHEow32mj70L3EpHhE5zvzIk+XymEqp+qUXNazXv/wsL/75hilYmPJ1GMrpqXwW3QdwEJ
	IvXV1F6T3ahgFOBKyB7nb+j3KlRnF38zyU7B1RLLU1+wZdgLfPgxV3d7lNTla9ycNHJE18Ioynt
	6i2Uky6JZplA68dsyCNqZyXqLNnCTIb80W6l8bgNhLRSYVCLV36wvsbbLATU9pDwhGZHv03hdvz
	f8VBDCRViJCM5u7K8lkr2/ksxL5mT2PCAXod0OKBgvHeW3ADNfU+z47IzZMlmAJpaFuoG7tBEK5
	eJ5sjfm2Ey8Dt2n5hxHlO4MOruGLZS65M4V+Wiqi5sL6q452Xhnp7x7YdcS2R+MhUJAUBi+F27n
	cW3CCXZPGKAE73wVh0vKXxYJuH3jkNJbVfTCQMkY5pZkXVc1Mg==
X-Received: by 2002:a17:902:f605:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2eff740ef49mr46440545ad.29.1795067865468;
        Wed, 18 Nov 2026 21:57:45 -0800 (PST)
Received: from localhost.localdomain ([155.69.167.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm24522945ad.76.2026.11.18.21.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 21:57:45 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: jjohnson@kernel.org
Cc: lcy8047@gmail.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath10k: Do not free the caller's skb when HL TX expands the headroom
Date: Thu, 19 Nov 2026 13:57:40 +0800
Message-ID: <20261119055740.55934-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When the skb has too little headroom, ath10k_htt_tx_hl() copies it with
skb_realloc_headroom() and frees the original. If the copy fails, or a
later step fails, the function returns an error and
ath10k_mac_tx_submit() frees the original skb again with
ieee80211_free_txskb().

Expand the headroom of the same skb with pskb_expand_head() instead, so
the caller still owns it on every error path.

Fixes: a2097d6444c3 ("ath10k: htt: High latency TX support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    Bug was found by kbound, an internal static analysis prototype.
    The fix was written with the help of Claude Opus 5.5.
    
    Compile-tested only (x86_64 and arm64 allmodconfig, W=1, sparse): I do
    not have an SDIO or USB ath10k device.

 drivers/net/wireless/ath/ath10k/htt_tx.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..7b759f506f80 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1276,7 +1276,6 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	struct htt_cmd_hdr *cmd_hdr;
 	struct htt_data_tx_desc *tx_desc;
 	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(msdu);
-	struct sk_buff *tmp_skb;
 	bool is_eth = (txmode == ATH10K_HW_TXRX_ETHERNET);
 	u8 vdev_id = ath10k_htt_tx_get_vdev_id(ar, msdu);
 	u8 tid = ath10k_htt_tx_get_tid(msdu, is_eth);
@@ -1330,16 +1329,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	 * and realloc the skb if it does not have enough headroom.
 	 */
 	if (skb_headroom(msdu) < HTT_TX_HL_NEEDED_HEADROOM) {
-		tmp_skb = msdu;
-
 		ath10k_dbg(htt->ar, ATH10K_DBG_HTT,
 			   "Not enough headroom in skb. Current headroom: %u, needed: %u. Reallocating...\n",
 			   skb_headroom(msdu), HTT_TX_HL_NEEDED_HEADROOM);
-		msdu = skb_realloc_headroom(msdu, HTT_TX_HL_NEEDED_HEADROOM);
-		kfree_skb(tmp_skb);
-		if (!msdu) {
+		res = pskb_expand_head(msdu,
+				       HTT_TX_HL_NEEDED_HEADROOM - skb_headroom(msdu),
+				       0, GFP_ATOMIC);
+		if (res) {
 			ath10k_warn(htt->ar, "htt hl tx: Unable to realloc skb!\n");
-			res = -ENOMEM;
 			goto out;
 		}
 	}

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.53.0

