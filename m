Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824209;
	b=3Bqe6NcDd0dX0HMDxe63sJocyNVEj36YF84RlMI6UwA5KOcrgRMHoz0A2NPK4ktEZryZ
	 UW17Y0v1tZEleu2zCLhsBslv2DNF2WkVgPFBROBCSbZKAKuLrsw3Eho7VKxAQW8z4Q6OL
	 Z2Z8T9bjvY1Wins576XDLkILVXzPxrG3JpQqkX3SKvarzGWZLWkKeGEjyHQ4JdI7Wo0Er
	 jLkLvl0uiDB10zIOw0Y0hJJZ6MT0gx3CEvTN2fppYWfbtzH1UBzC1f3TPQYubn+m1oJDh
	 JTo3Y1nrdbmn+QmTjelibkfLof6V0X/zrDTkgAuDUj8/62IKLjNCHpNu8dqmKsaWEuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824209;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zbaFq7OEWqsLiuTjDHUQxdS44tS3QqhoQkwXVTbBnss=;
	b=S4hw8oXmb+FLqvUcARuzz2MDOa/uo9QdeAHosS/dSIx9QuYECPbgilT2axvjnkgdJ6el
	 kV68tDDf44HEkmhqD3F/o0CH1IZacW4dxZqATK1McXXJFXPC+OhJC+6NVIkRghELpyir/
	 ImZ2y8btbxD//JwZGbFuoQ1IG3m9nbLVFXqKHy64kGiOVLIOkW8/I4m1gML5fTDE+QpGv
	 CVi0sRy8tuO+Kv+rNjWOETx7hgCNMcaQ635DQChbNlgZCbFiHkqrkIYU7R0tR0piKH2Lb
	 0X6NAlQVE2u4fOSXu68iGzvlHxOYF1DuYM3RSUKm3vMpyMxtKb4ANCdAlColIQWSF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37C2606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cf5adc6ee1a611f19a56ed5b684f684d-20261116
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI, GTI_FG_IT, GTI_RG_INFO
	GTI_C_BU, AMN_T1, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d3365779-1235-4317-ab9f-a067164d5eac,IP:15,
	URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:40
X-CID-INFO: VERSION:1.3.19,REQID:d3365779-1235-4317-ab9f-a067164d5eac,IP:15,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:40
X-CID-META: VersionHash:7db8b62,CLOUDID:d6c680d3a9b1ba532d44a4d321665fab,BulkI
	D:261116180357T5TB6NYH,BulkQuantity:1,SF:17|19|66|78|102|127|153|850|865|8
	98,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:99|82|11|1,File:nil,RT:nil,B
	ulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cf5adc6ee1a611f19a56ed5b684f684d-20261116
X-User: kuangkai@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <kuangkai@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1765325865; Mon, 16 Nov 2026 18:16:38 +0800
From: Kai Kuang <kuangkai@kylinos.cn>
To: linux-wireless@vger.kernel.org
Cc: libertas-dev@lists.infradead.org,
	Johannes Berg <johannes@sipsolutions.net>,
	kuangkai@kylinos.cn
Subject: [PATCH] wifi: libertas: reject short monitor TX frames
Date: Mon, 16 Nov 2026 18:16:15 +0800
Message-Id: <20261116101615.276337-1-kuangkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

In monitor mode, lbs_hard_start_xmit() casts skb->data to a radiotap TX
header, skips that header and then copies the 802.11 destination address
from offset 4 in the remaining frame.  The generic length check only
rejects zero-length and oversized skbs, so a short monitor frame is read
past the end of the skb data.  If the frame is shorter than the radiotap
header, the subtraction that computes pkt_len also underflows, turning
the following memcpy() into a large out-of-bounds read of the skb and a
write past the end of tx_pending_buf.

Require enough bytes for the radiotap TX header and the destination
address field before using the monitor-mode header layout.  The check
runs while driver_lock is held and before the TX queues are stopped, so
the drop path reuses the existing "goto free" cleanup; placing it after
the lock is dropped would unlock driver_lock twice and leave
tx_pending_len set to -1 with the queues stopped.

This addresses the same out-of-bounds read that the earlier submission
linked below was meant to fix, but was reverted because it performed the
check after driver_lock had already been released.

Link: https://patch.msgid.link/20260704011140.37639-1-pengpeng@iscas.ac.cn
Signed-off-by: Kai Kuang <kuangkai@kylinos.cn>
---
 drivers/net/wireless/marvell/libertas/tx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/marvell/libertas/tx.c b/drivers/net/wireless/marvell/libertas/tx.c
index 27304a98787d..6ad7a5067f2a 100644
--- a/drivers/net/wireless/marvell/libertas/tx.c
+++ b/drivers/net/wireless/marvell/libertas/tx.c
@@ -88,6 +88,22 @@ netdev_tx_t lbs_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto free;
 	}
 
+	/*
+	 * A monitor frame carries a radiotap TX header followed by the
+	 * 802.11 header; the destination address is copied from offset 4
+	 * of the latter.  Drop frames too short for that layout instead of
+	 * reading past the end of skb data or underflowing pkt_len.
+	 *
+	 * This must happen while driver_lock is held and before the queues
+	 * are stopped, so that the "goto free" path above stays consistent.
+	 */
+	if (priv->wdev->iftype == NL80211_IFTYPE_MONITOR &&
+	    skb->len < sizeof(struct tx_radiotap_hdr) + 4 + ETH_ALEN) {
+		lbs_deb_tx("tx err: short monitor frame %d\n", skb->len);
+		dev->stats.tx_dropped++;
+		dev->stats.tx_errors++;
+		goto free;
+	}
 
 	netif_stop_queue(priv->dev);
 	if (priv->mesh_dev)
