Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196708;
	b=ksdhTmsSs2WPCZsJEX4j1qsZa7JELZxf5BEWnTJScFu/NjaqdsCdLbpx+JQ3FzaQwY0H
	 /zub9JOeMk/dPTEgGHf8Gp9tjJeRz5PSntkO/g/DsTu+2zs4xLRgHxBzdL8jbBV3sjP5q
	 6DoGj2hAkV+1QHHZauv23oKx4Yiuycx7Rr4m/gi62lJhCLvan7RIerYBWIjqghLxHE+xi
	 NE3EkiCLxTYk4sfHtptQGf76mMSgNqottJZPf5x6Z1tI5z4+VTm8IhelGLwGfkkkxnRby
	 jA65uqPEW/y0Pvf4TwqcEwjxe1Ppnb2QTBXjRQdTLUTGWU+0I6TvT9GAgzXfL6YhvfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196708;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qFZ/C99MzlXwav+KGNG6Qu4hn/iWdcx3rFJEd6nbxHg=;
	b=nPj9bONcSD5lXe61San4M3x1IWUAsYd9tj/NqjHx0cpXgac8R6fZHDYdHAsCLI9wD98V
	 nHlOFxnTSjs2rdX6vThgBpoabQVxSvt23Q1O03Txlfc4ZaESlWNgmrCReG2+OB6v6lYcY
	 R9ayxWa9Fg95+cXd6Kcgh3bRCCz0u2fmN05cbjH3AGcA8TYtCmWlWEeFdSBRyB/s9J7m3
	 lyS8Sfw8i4sdq5ytzh8Z/DzsktJ8C2nbQZmtQvVdx/vRAXtw47gvNatPonT2tT/GSJQCb
	 OuKLFK5fXLm8Qqec7GNqEDqGlrb1lseSX2ZhUbttSE7yoeO32nQ58ZcJIH/497ZvHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YCGEfBIs;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCE960A262C
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FCE960A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YCGEfBIs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qFZ/C99MzlXwav+KGNG6Qu4hn/iWdcx3rFJEd6nbxHg=; b=YCGEfBIscQ9O/IdGcxkZ38BjNU
	v1wgDcFqMpzRlBL/Gy1Aa+xKv99bpMBx/Qe/ziwW4IdSKQpc7Md+NWj1Fj+0tanDZjRp4uEJ6GAKQ
	apkwwC6GDI0C1+VAc0PSpK7bJk1TO67CKzGLRNe0Tvpt/cr6FEXppYoT0Iysn5l/OqBY=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfZ-0065GI-2N
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:05 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/20] wifi: mt76: clear roc_link before the ROC link is freed
Date: Fri, 20 Nov 2026 18:44:52 +0100
Message-ID: <20261120174459.1657382-13-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

mt76_roc_complete() queues the free of the off-channel link while
phy->roc_link still names it. An RCU reader that loads roc_link after
that point can use the link after it is freed.

Clear roc_link before the free is queued, as the error path of
mt76_remain_on_channel() does.

This is currently not reachable: the only lockless reader of roc_link,
mt7996_tx(), finds the phy through mvif->roc_phy, which
mt76_roc_complete() clears before the free. Found by inspection.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 9638f65a679e..db2d6dfc12a9 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -409,9 +409,9 @@ void mt76_roc_complete(struct mt76_phy *phy)
 	} else {
 		phy->offchannel = false;
 	}
-	mt76_put_vif_phy_link(phy, phy->roc_vif, phy->roc_link);
-	phy->roc_vif = NULL;
 	phy->roc_link = NULL;
+	mt76_put_vif_phy_link(phy, phy->roc_vif, mlink);
+	phy->roc_vif = NULL;
 	if (!test_bit(MT76_RESTART, &dev->phy.state))
 		ieee80211_remain_on_channel_expired(phy->hw);
 }
-- 
2.47.3

