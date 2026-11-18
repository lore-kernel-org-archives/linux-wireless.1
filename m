Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018714;
	b=ALYHeUAn+iY21irtZrljtzUE7pZvKWzW4ay7LXGmntMTEEjOX/Bvsc7kokdaGfNLw7an
	 +6R5HpZwUmUKfhlQeRhxUcS3QsBbqsOLccr+ClYEJmqDcSMCZh3lhpqx/YCBTm8DHIX2H
	 nxrA4Gd8YObCRkx8f9eEDITgqii05E6tS8UfIhdTltzWMz33ARioBDxZGADjw1ab3nv3R
	 hZ1NrLZjEGIfvgOrGZx4S/q92hmp3FFFPMp0Gp7fLIipsX6qqdexAQMpt8zlm7wUhrDbE
	 mOk1oItKB1pzsLok0KNq13FTAhSrRcSeJCpjCtAExz67MEA2pqwBHkDSD3tyNIryukw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018714;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fisKJUxr8CD0XMFHXfM3uiI0ZE8VKVaEx9LiePmnWbI=;
	b=TZvsPttykPtAxl+i3VhH74maD6Y3SZ85ytURIN1dozYgzdwkw2SRdOQx3VSod64LJZM9
	 k6LH8rSDPXkNMV1faWWMxx0iMA3socKHBTpMp8ZS+YAAbQtmmCmKTHPqpQerc6pdzMkD2
	 Cyco+hVk1ch7dREEe6KENVaSNDOByCDRG3tG/EKEuEJEHwCiqojbKkBJdu7qS07nm3r2/
	 TttamafEjx0+9FJf2nCWVL7qJYQ2xjyqqLmu9RJKiHWv6ok/o35AsQyVFftOEYly7iRWQ
	 CmZV5StViXFmpGicyDm2wEh3JAey0bGiwbzfiYrKTWkTeUTTcFdpCkMWkFmu9lpA16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tVkxzb+4;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163F60A2622
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B163F60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tVkxzb+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fisKJUxr8CD0XMFHXfM3uiI0ZE8VKVaEx9LiePmnWbI=; b=tVkxzb+47abGOrScVRh5wED7Yi
	XpNWYJSfXNDF/mWuxjXUB+xS+V7iEXsr/xkyo0iPUj13Y6VqTlW9dTO7jjAHZs07cgyeCkRsZTm4M
	fLlQATNiezTwRnHX6uVnkslrz6S+Y4LuZuxTH7cxbggGMNKTveNRzh2a8CP4lmuUqB+c=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMi-00552s-0h
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:32 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/16] wifi: mt76: mt7996: read a new MIB baseline after the firmware reload
Date: Wed, 18 Nov 2026 17:18:26 +0100
Message-ID: <20261118161827.1208649-15-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt7996_mcu_get_chan_mib_info() adds the difference between the MIB
airtime counters of the firmware and the baseline in phy->state_ts to
the channel state. Since the full system reset was added,
mt7996_mac_restart() loads the firmware again, which counts from zero,
but reads no new baseline. The first survey update after the reset
thus subtracts the counts of the old firmware, and the busy, rx and tx
times of a survey dump can wrap below zero.

Read a new baseline for every running phy at the end of the restart. A
phy that does not run reads it at its next start instead, since the
reloaded firmware has not enabled its radio, and a failed query would
fail the restart.

Fixes: 27015b6fbcca ("wifi: mt76: mt7996: enable full system reset support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c70e429ab419..8a8098f4fc82 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2430,6 +2430,18 @@ mt7996_mac_restart(struct mt7996_dev *dev)
 			goto out;
 	}
 
+	/* the reloaded firmware counts the MIB airtime from zero */
+	mt7996_for_each_phy(dev, phy) {
+		if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state)) {
+			phy->counter_reset = false;
+			continue;
+		}
+
+		ret = mt7996_mcu_get_chan_mib_info(phy, true);
+		if (ret)
+			goto out;
+	}
+
 out:
 	/* reset done */
 	mt7996_for_each_phy(dev, phy)
-- 
2.47.3

