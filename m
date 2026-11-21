Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262972;
	b=uqO3eQbulavKLQiiVheS+Ea1gzMmYmaaSSal9OgBkY/ZZ198s+bJSH6QYQoLxFR44B7C
	 b228aFrC4r0SwBcdCQT1dT24uPvAGx6TX8gGpfXA1LZR51nvL/9afzv9nqYja59B8OX85
	 UnkXTND6BLhpoetRg4L0kD9LO5V1nOzR7ecUUmnu88Ls+PUE8I2owAnVrV+UC7xyKAeu7
	 549Xkj4riQApF8Mshrj2lR5LP4oqeeu2qTWwx9IipAfqsQ6hr9y2xRmeuJZoNErm6Ytdm
	 nu3LcrMcw8qD3Bh0N82XbnoBww2Xi9XWblgylO5yb+pICq7ybH+dkSZeextIBhlymzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262972;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SObQtDjlFWM3vdY6J6bWuTG6sMOKmuJ8QdGmuDxKy5U=;
	b=mpMvp0hoBnhI55TbbM4y6nUET0C0GXMUIORDa29X2zOrd63eh4kPJfmu7UQU+Uo1KGUK
	 W8lj/SFszqD6zaabX2OQZWs/lCAy0RF1MTSlFBcUnfkPzdSs8cBWxBRMdnLrTjmstUdAb
	 1y5KiuQYtrgD+K2jMZ0nZh0bVlNNBaz/U2ZO9Nf7YOf5VUPPO/picxxAMTuS+l4KmusVo
	 ayJcfGEysC3afSCSA4L6dLXkInU+q2phe6QH82lDp9RZJLVxnKO0wRnXt3Cf7CTEBYS/K
	 2xk6/31X1OuM8PtuwECCOA5MuahxeTWx86MkWmPkj0sNlnSh/amMaUS6AJ1n/MHk2Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=G0NuDFpv;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDE9606A6A1
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDE9606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=G0NuDFpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SObQtDjlFWM3vdY6J6bWuTG6sMOKmuJ8QdGmuDxKy5U=; b=G0NuDFpvnKR7CS0cCm7VvpQmaZ
	3gWORgtOSa16rJ3b8MdIyjswm4P+xUeitJ45cqx1OVwvbkPcjS2KVNAFw7hksGOHKzgfZeDRPVEhO
	TNlQXFY+0rBr1CxmP5Bt/L9KA9X8YCc+aOENnehLgJuDecJlAkf1gkN4+ZLcF4r8POzE=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuM-006Q1I-1y
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/17] wifi: mt76: mt7915: abort a background CAC at a full reset
Date: Sat, 21 Nov 2026 13:09:23 +0100
Message-ID: <20261121120926.3603979-14-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121120926.3603979-1-nbd@nbd.name>
References: <20261121120926.3603979-1-nbd@nbd.name>
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

A full reset reloads the firmware, which then runs no background radar
chain, and nothing tells cfg80211. A background CAC in progress thus
goes on without radar detection, and cfg80211 marks its channel
available when the CAC time ends.

Report the CAC aborted to cfg80211 after the firmware reload. cfg80211
then stops the chain through the driver, which clears dev->rdd2_phy,
and user space can start a new CAC. A restart of the chain would leave
a gap without radar detection in the CAC.

Fixes: 8a55712d124f ("wifi: mt76: mt7915: enable full system reset support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 0c03199a55a4..5d1b5abc8fff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1466,6 +1466,9 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 	if (i == 10)
 		dev_err(dev->mt76.dev, "chip full reset failed\n");
 
+	if (dev->rdd2_phy)
+		cfg80211_background_cac_abort(dev->rdd2_phy->mt76->hw->wiphy);
+
 	dev->phy.omac_mask = 0;
 	if (phy2)
 		phy2->omac_mask = 0;
-- 
2.47.3

