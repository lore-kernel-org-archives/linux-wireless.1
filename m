Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262972;
	b=Fpv8q9RfyE4OMGmPyv4rnzKuTJLkX7bBPry1kuGzKSmtPQeP9LbQBCgN+mZ7RKgsqaF+
	 7MWkeAdPCMmRSTFQPuaG5m8cDzRName9ObajVA6cc1h04+sYWdncMA9aLisQM6WjzOH3T
	 EjHXfOhoLlx65B05wt4kym6m3qgLpiUPxBzu5bLJXKz4Q9FfC326T47cndy6wvglJdUu9
	 pIbBTXi1ut6okTPSVk1RuMvKeUlxC7AMrojCB6XeBYcHPN27LdWTqmpXZHvDFDZQLzeVy
	 UDpHSlioNTzaMr+FIkKtwzPFpwgNMWxf6dlX6HjSoj4RPqx/dU4UkC9+p+HP4yio22g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262972;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aUVYF0rhIWEtY45+KwIoTo0KNRO/yCZk1BogkLrEMDA=;
	b=hjkZMoVTFw6QTRO8SuLP5DvU+eqopCEcKw49iuvlC9k+ldpWoKJAcmLL3I9BkNB0d8oM
	 q2K/MbRL0w/IIzeIMGu6OkJypwb/n0wgqOQMDOMuFV1A+wq+VUGrHdPtlzmbMCVNYkPq9
	 Tpzo5bO+AhXGtkrR4UM4IsiRp+NQLiJyxBzuaUdxWJXxsaUO4p+Gdtir4Eor7+30dO8BY
	 OU1jefPXDNHThXgaFpySwmTstcF1OAwmhVU7HpPETuQkvQ7RoooS5qQH1U+admoCAGP7I
	 XYWHzjAChXZk7d+aFca0fWRYMv0kB7BGwgNu4ut1qhJqWPJ2aEoeapwHQKef1b+oPhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="GLFSt/hc";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC36606A690
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC36606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=GLFSt/hc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aUVYF0rhIWEtY45+KwIoTo0KNRO/yCZk1BogkLrEMDA=; b=GLFSt/hcTxSGRHQG6I7hqpwKXq
	Q/ORV6HL6nDKcKEJNkXHkSYu0DlxVMqQAPZn2Lk5egIWSMZLJR04Hw0foL3fW6uKT9WtwJeK1HCrz
	4UNWs17vsW4TLcrj8XW60iYpAuY9gKGi5AHnsBZ3CrmJIvLiPEr2o98YnNpvCQrGb3ZQ=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuM-006Q1I-0w
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/17] wifi: mt76: reset the DFS state of a phy at a full reset
Date: Sat, 21 Nov 2026 13:09:21 +0100
Message-ID: <20261121120926.3603979-12-nbd@nbd.name>
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

mt76_reset_device() keeps phy->dfs_state, while the firmware loaded by
the full reset runs no radar detector until the driver starts it. The
channel set of the reconfig on the same channel then finds the DFS
state unchanged and sends no RDD command. An AP on a DFS channel thus
transmits without radar detection after the reset.

Set the DFS state to unknown at a full reset, as a channel change does.
The reconfig then starts the radar detector again. A CAC across the
reset still has no radar detection from the reset to the reconfig.
mac80211 gives the driver no way to abort that CAC.

Fixes: 8a55712d124f ("wifi: mt76: mt7915: enable full system reset support")
Fixes: 27015b6fbcca ("wifi: mt76: mt7996: enable full system reset support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 77116d9f4125..4c4e9b7bc57a 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -908,6 +908,7 @@ static void mt76_reset_phy(struct mt76_phy *phy)
 
 	phy->num_sta = 0;
 	phy->chanctx = NULL;
+	phy->dfs_state = MT_DFS_STATE_UNKNOWN;
 	mt76_roc_complete(phy);
 }
 
-- 
2.47.3

