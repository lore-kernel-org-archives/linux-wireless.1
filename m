Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938511;
	b=aoURnDQfD7EpT3/uXG3zqF3a6GO9qyaYKFS7RqdXJV1UIGRn3aQgn2QuabA2NmEeZTSE
	 QEXS1WPTP43uDLOE7QsG5ftfaZisW/+1azVW4/AATjUfws5nv4Z1emt3rHjHRO7YOeInI
	 a7yvfXeQxxmhEFM1olog+l+b/9veUypsu+m3OKkLz/neLMhq9yI7c12WpdsUlzUjYBRab
	 fNm/fpeYs5OA2grSqD6ZT2n0K1fOABcUdvtgFmFbrI9iz26/qdBoEGD3zPVTK+vbj0iR0
	 mdl9E8fzwtC1Cd9nDKURAmSbByKBa0DKXsY1BxWAzkkTOzCXmEgxBBoep05p1RTz8Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938511;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gAof8CfHm5NkaGY65dwC/7pxXHspoUQ3OpJqL/qK1mQ=;
	b=FWCocobb6tSrsxFHJBgHNX1mMtXn7GxhgoSP9VekM94eAnU4cx9fmPzkOC+P3WaeVu2e
	 HOTJt8jeysJn34j4liFyhVxbw8uLk0H4Wvtc50NU2nf0MW6DMteugyQy1STdHdAOPssAW
	 lO21ne3iixDzICssPZnciFIYEg/Uhgfeq2TlwSirQKC2GP9PYOBTvPgp1Tez+aC2ND43c
	 T+/4CroY+io2+5eVdQR5kPtaiYjQJrw9+3gBz96c15JxXmRggSnON/LacyRuBu0sQ7dk5
	 cGebRpAIJYyu+IFRnhcmdFfPIdZL6sIwM+3ESW6kt1KE7J9OqRzwNVgEySIa/z4k8kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=FbsKGM9g;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375EF606A330
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375EF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=FbsKGM9g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gAof8CfHm5NkaGY65dwC/7pxXHspoUQ3OpJqL/qK1mQ=; b=FbsKGM9gksUhjqYJqwx3LwHlkt
	efSM8mOFywyEiAcSNTu2/wb6yQzM9vGtI4KHc+LsOsCJaGs5l70XT9yLW/btGevSKB2dSQKQtzkNc
	DFI2MKmV1SOs9gmbcIGquBo3YD+Td8tpsO3X2UO6r07ngGa4McK2LRB7ycnB9KeyRnIY=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV0-004eiZ-29
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:42 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/19] wifi: mt76: mt7915: use the default timeout for STA_REC and BSS_INFO
Date: Tue, 17 Nov 2026 19:01:19 +0100
Message-ID: <20261117180134.2940930-4-nbd@nbd.name>
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

mt7915_mcu_set_timeout() gives STA_REC_UPDATE and BSS_INFO_UPDATE a
timeout of 2 seconds. Their payload grows with the beacon templates of
MBSS configurations, the firmware can take longer to process them, and
an MCU timeout resets the device.

Use the default timeout for both commands, like mt7996.

Fixes: 1254c66356d1 ("wifi: mt76: mt7915: decrease timeout for commonly issued MCU commands")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e66968b819da..9b748b37624d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -214,8 +214,6 @@ mt7915_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
 	case MCU_EXT_CMD_THERMAL_CTRL:
 	case MCU_EXT_CMD_GET_MIB_INFO:
 	case MCU_EXT_CMD_PHY_STAT_INFO:
-	case MCU_EXT_CMD_STA_REC_UPDATE:
-	case MCU_EXT_CMD_BSS_INFO_UPDATE:
 		mdev->mcu.timeout = 2 * HZ;
 		return;
 	case MCU_EXT_CMD_EFUSE_BUFFER_MODE:
-- 
2.47.3

