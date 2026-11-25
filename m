Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628187;
	b=VP2tTdWyZc2j4iKmnuQtHi+IHXDsIDDTCXLwGBl3d5h6KCPVcCBim/uTVPMBwMemWiP4
	 ZbgNx5r00VgvygNL3hlFyEEBQ/Ld/qfU3bfOiTz+6vStiaB4DRnvupEw16Rtnu/xvj1gp
	 5Diuq9oovIl2V9kTZXE4KPuhpQ+o4x3N+QqQ1jhSMVxFMj4DTO4SWf/zPDIGK9OdlYfbv
	 9YdxXo/M5MT2CZwRwrq84QGkILZHf4vPpkdBAq14hgmPyagKd3hdHTuZwHg3CkZVZXaAI
	 sYEKKekz87+bJvXPfKTtM6YJtymZIuZgimS1Bq0COZ5aL/Vs6Si/Y49gkiVpZlXlSbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628187;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hxTCU1sgoNtp+vQLslWepVBEboysTYhjHeIwLomuak4=;
	b=tUPr4RgtBc8wMs2QwldlVDFLT5aycIGXOb6S6ZEdjdqJB8cahZKPsLMqkzw7phxnCwcv
	 cPnBNpgjDgPD9adDXAv4zuIEqMYVnnA5XpXOHuSlpu+C5Gq3ucjGuwhlaVTl/9Cg26jpG
	 3GympFZGPC9As/JIklRzj6Dm32epCA02oADE95nebqH54oaJVFhCFv+VeCpsZolnxjjPc
	 +0LQvwV9eU219k4DKZ7CEGAQ7cqvM8CdIkCf4k+PXAmrxY+Bekju/ZiLvrPu84oFMvRKw
	 P49aeXuOSKQDaGrtKXCH9Ixnyy/bPLLf20Hem448M7WxzIc8yiBUD9fPTHkBeKcqjtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UUziejMG;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC19606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC19606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UUziejMG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hxTCU1sgoNtp+vQLslWepVBEboysTYhjHeIwLomuak4=; b=UUziejMGKlDLFczMKNAW0oqt0J
	dCHKOCqpWAgsDiASfuSh4yJFijV25zuU/agE/R/mxA71v2HrqewVafRDJhVkjcg3CuyAsekFOVWl6
	C/ctWVeHjXPIeLgrp/n5bAMDLJjbX9pmLh/bIqQOBq0jYRORjN14YugYG3D/yrIwrPGk=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuw-008IWP-0R
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:26 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/18] wifi: mt76: mt7996: refuse an RF register offset above 12 bits
Date: Wed, 25 Nov 2026 18:36:04 +0100
Message-ID: <20261125173616.3776951-6-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

mt7996_mcu_rf_regval() sends bits 23:0 of the register index as the
offset. The firmware masks that offset to 12 bits and reports success.
A debugfs access to a larger offset thus reads or writes another
register.

Refuse an offset that the firmware cannot address, and correct the
offset range in the debugfs comment.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c     | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 7c976ec20d10..175adbcc186f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -879,7 +879,7 @@ mt7996_twt_stats(struct seq_file *s, void *data)
 }
 
 /* The index of RF registers use the generic regidx, combined with two parts:
- * WF selection [31:24] and offset [23:0].
+ * WF selection [31:24] and offset [11:0].
  */
 static int
 mt7996_rf_regval_get(void *data, u64 *val)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 91129c1f5a5e..671bbb741a46 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -5702,12 +5702,15 @@ int mt7996_mcu_rf_regval(struct mt7996_dev *dev, u32 regidx, u32 *val, bool set)
 		.len = cpu_to_le16(sizeof(req) - 4),
 
 		.idx = cpu_to_le16(u32_get_bits(regidx, GENMASK(31, 24))),
-		.ofs = cpu_to_le32(u32_get_bits(regidx, GENMASK(23, 0))),
+		.ofs = cpu_to_le32(u32_get_bits(regidx, GENMASK(11, 0))),
 		.data = set ? cpu_to_le32(*val) : 0,
 	};
 	struct sk_buff *skb;
 	int ret;
 
+	if (regidx & GENMASK(23, 12))
+		return -EINVAL;
+
 	if (set)
 		return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(REG_ACCESS),
 					 &req, sizeof(req), true);
-- 
2.47.3

