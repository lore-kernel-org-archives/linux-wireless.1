Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=jcC8cJ97FQ5mhAlySQM2xoKRiE4tjWQo4t6uKQEC5BWHF3L0KCby6+mtUgP0cUcQJM0f
	 y17ZuSV6NvOLWOdGa+jpYgmbVmsQP4R8rWC08Ev+sTxMep8hz1HvIFy5FfkXHCheDACgo
	 avGcoV6z1Vjlx5E3ggtI0bKsc1QS01634j6BjlorXBn4c4ZkajDgQBIHQl1118k3ux8LH
	 XdaJYdjjmP2p+2LuoRVQmnxQ1hvum+IGgkIwAVLx9ztiPqszxLbsMiHwKLmnBp+5ofoxz
	 Eecq8F24VHpJicXUAXJ19r2WkGreUg3glVDPYZ+G8AWaNl+HvpZ29D7RvFoJs89za/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6L1+x85qzB1+/ez5JhicVwg3gg0T1BwIIMLDUbffz+A=;
	b=lzRoDRUNwa9/iLNWCg6yPR6UP+I35rZgZFk7/fu96NQNPQ2NbQhygKd8/1lzUUNTVpkS
	 2LJiPX0GneMvwFVgcpS4iPZEMGInYxdsWHbe2viL89SIhM/KkGKPDNAkcu7fnx/nvFWkc
	 6bcHVpSp7FGPNSInlnbfQu3qIrVvAdSsv3nB9haudXwO0QQAQ8PHqK1QKzcI9QI2Gp35V
	 MMA14Vy4WG96KlDYgMM3qIuSPwU2/IQSs61iRl/xmI1UBZujw7Q1dH2frEYAdx0gnv9/c
	 c4HiccAS4UkMNgDpMRahkM1OuJyFKJpy7zAa0rV/Fl2zZ7aBFS/2vsmv6lWyM4UWcGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="D/7P5pUg";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E7606A33E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477E7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=D/7P5pUg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6L1+x85qzB1+/ez5JhicVwg3gg0T1BwIIMLDUbffz+A=; b=D/7P5pUg24s4mUJ3pH+IwnYzB6
	N3kMfGqfvzS9bZYb3JG5r1VvAf0BVlgrH3RBeMqTNGvGEVlW6gxc+xnzJJTNIhLX3186UzO1HwNU7
	/v/aPOn6p82W7/AeRjSyIXullAtZbDQehlI7PUADuZPGLfVTfRr7awKAyHmR8cnJIaTI=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuw-008IWP-2q
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:26 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/18] wifi: mt76: mt7996: bound the in-band discovery frame by its buffer
Date: Wed, 25 Nov 2026 18:36:08 +0100
Message-ID: <20261125173616.3776951-10-nbd@nbd.name>
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

mt7996_mcu_beacon_inband_discov() limits a FILS Discovery or
unsolicited Probe Response template to MT7996_MAX_BEACON_SIZE. The
firmware copies the frame into a smaller buffer per band and does not
check the length. Since commit 79e788fcb204 ("wifi: mt76: mt7996:
change max beacon size") raised that limit above the buffer size, a
longer template overwrites the discovery state of the band behind the
buffer, up to the stored descriptor of the next band.

Refuse a template that does not fit the firmware buffer. The buffer
size comes from the MT7996 firmware, and the driver uses it for MT7992
and MT7990 as well.

Fixes: 79e788fcb204 ("wifi: mt76: mt7996: change max beacon size")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index c3a41935967e..4f0e59fc170e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3529,7 +3529,7 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 		return -EINVAL;
 	}
 
-	if (skb->len > MT7996_MAX_BEACON_SIZE) {
+	if (skb->len > MT7996_MAX_INBAND_FRAME_SIZE) {
 		dev_err(dev->mt76.dev, "inband discovery size limit exceed\n");
 		dev_kfree_skb(rskb);
 		dev_kfree_skb(skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index a97fbcce1d47..a39ed2dc9e65 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -1026,6 +1026,7 @@ enum {
 #define MT7996_MAX_BSS_OFFLOAD_SIZE	2048
 #define MT7996_MAX_BEACON_SIZE		(MT7996_MAX_BSS_OFFLOAD_SIZE - \
 					 MT7996_BEACON_UPDATE_SIZE)
+#define MT7996_MAX_INBAND_FRAME_SIZE	1520
 
 enum {
 	UNI_BAND_CONFIG_RADIO_ENABLE,
-- 
2.47.3

