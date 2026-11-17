Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938510;
	b=Gb8qiDVELJAV05gCwj8wydebOn2YW6OAdBkznmD9LNDHF5w7vLqRT03gIifx25R6gI3i
	 pIa8WNayNPTG4fW9kaiMpiRFXikrpa4UsbCSTVJhl8jauiXRShfxMMEpXzeumLYNK3oDd
	 HRFpl42SxLSA69jEUWzwJKjrIjoI4LDgDcJ73B1+i4tP+1spBI5L2/LqFbw3l7WDnf5rc
	 0EvMXD6Oz9Sg4Zd0Wt7FdFSORa3rmtPtjwsCFa5PvF35+TI2/Xhc+doNA2F1Z85YZZHSS
	 nSzuxt44h+yzKPU4Admp65LxK5eQslxeJglb9RnF+bCfIG8W5dZlwJOSlc4VGDdKtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938510;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v0cGjfCIEz6a+Z9lmLe68K/5FNioLnZsVuXkPbJFZ5k=;
	b=y6YmlTGBBNZnAL8xnYH8+LCh9tyZx6FLQNbqA2nN3+RrWdx8Y5CdO7FtJkaFKNZwqKx5
	 PnhloZiSTmVnvdQVU1D0xXoG8lzeXDKHDb+yUSZltkRUKSqqawgpB3Kx/zulpJGEMN3S+
	 lwZKoWVx7Ei3NxM9c0eMC6qE/u0VygzTT/gL7Tk5yBQWSwUB0bvE4ZbB6UU/n9yJ0zhtB
	 B6vXygKs7Vs1peqDCAakqcbSXKN3ECRkXwSLhExAq7IslZJnSwGHYnsGbn7VXPhTND8Xf
	 Bnb7wxwhzYoYiScJhUYpxHG9ROl53wAEZ4gAY9uTSybC+03xq3RrWJeRS1EltUMlT5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jlHFUSZe;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C960606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C960606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jlHFUSZe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=v0cGjfCIEz6a+Z9lmLe68K/5FNioLnZsVuXkPbJFZ5k=; b=jlHFUSZeU5SatF/4RWrvCT6+gu
	2Hq3+jQwqPrPf5RjiOenCRhXhIlQODD5lW+H65ZLLZELTyXWarNCLnLXMj6tkCX7JRsB/hdM6iH/0
	Gum2PoKllxr3tN7aQH5+cWpU17BW4QWNeDEX3/whqeC1Xz5nYC5OwPKC/2owp7MBFsUw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV0-004eiZ-16
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:42 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/19] wifi: mt76: mt7996: return a negative error for a firmware status
Date: Tue, 17 Nov 2026 19:01:17 +0100
Message-ID: <20261117180134.2940930-2-nbd@nbd.name>
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

mt7996_mcu_parse_response() returns the status of a UNI event as a
positive value. Callers that test for a negative return take a firmware
failure as success, and callers that pass the value on hand a positive
error to mac80211 and nl80211, which leaves hostapd waiting for a
further netlink reply.

Return -EREMOTEIO for a non-zero firmware status.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 34ac25c22b01..94e88455c732 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -258,10 +258,11 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt7996_mcu_uni_event *)skb->data;
-		ret = le32_to_cpu(event->status);
 		/* skip invalid event */
 		if (mcu_cmd != le16_to_cpu(event->cid))
 			ret = -EAGAIN;
+		else if (le32_to_cpu(event->status))
+			ret = -EREMOTEIO;
 	} else {
 		skb_pull(skb, sizeof(struct mt7996_mcu_rxd));
 	}
-- 
2.47.3

