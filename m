Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938512;
	b=Wk7JWTPNptKw5jrk8+BXlu9xpFj06l2WFSbrLbd5OUO5DyaWn+cN0EHFHT90xBLGQNDr
	 BbeTQ3no3unD/SmpekUSByP4yMIFXerbWnWkxWCDT4SJncJHbEIV3hQzkPzO448lVPA6d
	 kH3CN68W9Ng2Xohj50s8p2KM0TCWTeHR6HJ86F5lo9izvw+tm7YaetHzULIiCMDuzOoET
	 YGyGwG9lgAbouCtF0nFLZSnH/kNidy8DmAL3rc7f9BTRBx2ctOI3zAN3/HSKL1Lfd6zdT
	 RTAxl1xz6H/tUoQ+DE8N/X5HqS+jkHDjEQEXVZktL6t20XUXd9U7uJRz2MQgeSO78cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938512;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w8zM61uobS4pxesMZzAHhNeL81h1pTaPhStQUgYnmfE=;
	b=U426vE0E+qX7FuivVofdXY2enHhS7elfbBaH5ajCKRwKVo0z5bVvacRLdgTA37F5nch3
	 GA6Jmng1a/n0NpFMt2nq5rVK92C6Yq8D512Evld0LHMgpv0DxMEhEZHEXCfpxyLtF2+MM
	 z5oFc8QvsB6KMX+zV6TKu7QixTJEKiOW/LtgGafuFX3dpyQGL+vfOTSCbkQd64/yEfvy8
	 N04g3BKX4nQ/QYvjDkqInp7zuhDh2rT4aKM2rOAuJYhUmWabd/JW6kAE14VTh+YizPgg4
	 YrymW3036B5B7G6Ir9+bR2ogFnS1XGAV+aEwUVGp8hWmu1ELwzWjD8hed9PAsXMmURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="unBu/q8w";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609D1606A894
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 609D1606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=unBu/q8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=w8zM61uobS4pxesMZzAHhNeL81h1pTaPhStQUgYnmfE=; b=unBu/q8w+T1AhtZPZcskTU/du1
	x6OycGrhqmzhrIUY9HyYVD+mPcdmopqXRv89uRHiUrXkzfWw3eLIo67dfPL0mz8XpHfD5QnDFH8oX
	ZgJlFs+vvr0siaCb+oVwFlzUANaI8i/Pq50+m56QqsT+gpkMp95iQZgo2C9S+lQ/5viA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV2-004eiZ-18
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:44 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/19] wifi: mt76: connac: return a negative error for a firmware status
Date: Tue, 17 Nov 2026 19:01:29 +0100
Message-ID: <20261117180134.2940930-14-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

The parse_response functions of mt7615, mt7921 and mt7925 return the
status of a UNI event unchanged, so callers that test for a negative
return take a firmware failure as success. For example,
mt76_connac_mcu_uni_add_dev() activates the BSS after the firmware
failed the device activation.

Return -EREMOTEIO for a non-zero status, and -ENOLINK for the WLAN
failure status, which mt76_connac_mcu_bss_deact_err() ignores because
the firmware also returns it for the deactivation of an inactive BSS.

Fixes: df5ab0d58b2e ("mt76: mt7615: parse mcu return code for unified commands")
Fixes: 1c099ab44727 ("mt76: mt7921: add MCU support")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c    |  2 +-
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   | 14 +++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    |  3 ++-
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index e5c2ad5fb458..65c57d5a480a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -178,7 +178,7 @@ int mt7615_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			return -EMSGSIZE;
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_uni_event *)skb->data;
-		ret = le32_to_cpu(event->status);
+		ret = mt76_connac_mcu_status_err(le32_to_cpu(event->status));
 	} else if (cmd == MCU_CE_QUERY(REG_READ)) {
 		struct mt76_connac_mcu_reg_event *event;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 2acaae9830fb..cac47c8702e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1960,10 +1960,22 @@ mt76_connac_mcu_get_wlan_idx(struct mt76_dev *dev, struct mt76_wcid *wcid,
 
 #define MT76_CONNAC_MCU_STATUS_WLAN_FAILURE	0xc0000001
 
+static inline int
+mt76_connac_mcu_status_err(u32 status)
+{
+	if (!status)
+		return 0;
+
+	if (status == MT76_CONNAC_MCU_STATUS_WLAN_FAILURE)
+		return -ENOLINK;
+
+	return -EREMOTEIO;
+}
+
 static inline int
 mt76_connac_mcu_bss_deact_err(struct mt76_dev *mdev, int err, bool enable)
 {
-	if (err != (int)MT76_CONNAC_MCU_STATUS_WLAN_FAILURE)
+	if (err != -ENOLINK)
 		return err;
 
 	/* Ignore wlan_failure state false alarm when deactivating an
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 2bcd5f085cd4..a16f41eda2bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -62,10 +62,11 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_uni_event *)skb->data;
-		ret = le32_to_cpu(event->status);
 		/* skip invalid event */
 		if (mcu_cmd != event->cid)
 			ret = -EAGAIN;
+		else
+			ret = mt76_connac_mcu_status_err(le32_to_cpu(event->status));
 	} else if (cmd == MCU_CE_QUERY(REG_READ)) {
 		struct mt76_connac_mcu_reg_event *event;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d3806d8dfbbf..bf8cc4b1f539 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -77,10 +77,11 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt7925_mcu_uni_event *)skb->data;
-		ret = le32_to_cpu(event->status);
 		/* skip invalid event */
 		if (mcu_cmd != event->cid)
 			ret = -EAGAIN;
+		else
+			ret = mt76_connac_mcu_status_err(le32_to_cpu(event->status));
 	} else {
 		skb_pull(skb, sizeof(*rxd));
 	}
-- 
2.47.3

