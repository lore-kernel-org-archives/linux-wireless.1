Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468525;
	b=5rXpWolhBGNm/G8ztBoWISBOiUM6I8ymOs6b8QukrhpMf17Bq8tWlGBs5+4GMeK36NVX
	 wdFi9bqlnt8ItR6ybvcXf7/s8SzXArsQqshMd3BFXpTz4ee58fWKucZmvK6SyLAs8Q8Ba
	 cgrabFief5E4Ihgk1CRYk9ldmUBCmFu2eWwU7WQubI9X0bc4qX8dFzDoGjFKrH7Lt2kjZ
	 Jj8UZQ8HTdimnFVApMyCXmvGv+JejPhII9fxAUTtwXNUTH6uGvKvVgN6Y9IW7VhUJxcZ4
	 xF0YMhDtQLCSfJeY3wWJ0K+KqVcmM6qj/3w92cnOWeVzckhUj06007PG1sZf9Duj8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468525;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=NMNkbp66ywBLd5rjR6iy1oAU+1Es85uVz72d+/vYbYM=;
	b=3IFqWL/ixCITeyFNCwlDbQ7GG3LiPTaCXkMPFUQPbeYpAOcFsH+tbh71gB4S/ITKKq0s
	 3eVPyFMNflDlzMPsqRngRqhv6QPxtjnhJLLGkIgF/Xw2nuTHSZutTXbydqtf8QfvBLZ45
	 LT+QRR2CHaCy3wQT9RdNaFOZzZxoGLM78nh230UhnilW9oHYNxjewdqUqtE60Pc785scW
	 yqF2Aw7nZR3kgUVmPbuTYK/v7wiFlTSkdghJwKqsB0ItEUzqNfFvq/zX3gkrTIVqOuEct
	 whbsxFwRhiO/Vs8UgZt5lDQPUr0jrrN5LXd/KzmB5heD60mlJrE6QVyAznCOYigeFgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="i4yI/PNl";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC53606A884
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC53606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=i4yI/PNl
X-UUID: aa92d9f2de6a11f18dc8c9802ae25ab1-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NMNkbp66ywBLd5rjR6iy1oAU+1Es85uVz72d+/vYbYM=;
	b=i4yI/PNlUFdNErz4FFVdVa8lMCLnjKt2+9Xr+RjJhAqCx85m2qm6gSfNU/m8M6Qkrozyjmq9IYzeFK1vXeIs+H/+lJRx6Bsc5n/uLvgWS9hCmUo3r7TQuLfg6VjoMUnWHR6pW9C7K6cPWdMlQWuJhvRi7ZwiAQaUg87nlhEenz8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:0633c344-d355-406d-8f3c-63a681e5e3a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:94b5bf30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aa92d9f2de6a11f18dc8c9802ae25ab1-20261112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 513020022; Thu, 12 Nov 2026 15:28:33 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:28:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:28:32 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: always initialize *ret_skb in MCU send helpers
Date: Thu, 12 Nov 2026 15:28:27 +0800
Message-ID: <20261112072827.1796829-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261112072827.1796829-1-jb.tsai@mediatek.com>
References: <20261112072827.1796829-1-jb.tsai@mediatek.com>
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
Content-Type: text/plain
X-MTK: N

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

mt76_mcu_skb_send_and_get_msg() can return -EIO on an SDIO bus hang
before *ret_skb is cleared, and mt76_mcu_send_and_get_msg() returns
from the mcu_send_msg and -ENOMEM paths without touching *ret_skb.
Callers such as mt7925_mcu_get_nic_capability(),
mt7925_mcu_chip_config_query() and mt7921_mcu_get_nic_capability() are
then left with an uninitialized skb pointer.

Clear *ret_skb at the top of both helpers so that every return path
leaves it initialized.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 54b2ef2d5916..d8821dc89247 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -58,6 +58,9 @@ int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int cmd, const void *data,
 {
 	struct sk_buff *skb;
 
+	if (ret_skb)
+		*ret_skb = NULL;
+
 	if (dev->mcu_ops->mcu_send_msg)
 		return dev->mcu_ops->mcu_send_msg(dev, cmd, data, len, wait_resp);
 
@@ -78,15 +81,15 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	unsigned long expires;
 	int ret, seq;
 
+	if (ret_skb)
+		*ret_skb = NULL;
+
 	if (mt76_is_sdio(dev))
 		if (test_bit(MT76_RESET, &dev->phy.state) && atomic_read(&dev->bus_hung)) {
 			dev_kfree_skb(skb);
 			return -EIO;
 		}
 
-	if (ret_skb)
-		*ret_skb = NULL;
-
 	mutex_lock(&dev->mcu.mutex);
 
 	if (dev->mcu_ops->mcu_skb_prepare_msg) {
-- 
2.18.0

