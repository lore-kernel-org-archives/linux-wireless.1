Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196709;
	b=S+3tMcqdIcDKTF9T13YACUHomXrI1vdJ1YToFYPwccE/2+07molP1OqC1fYLlWpRwDvt
	 lfMoaaoSWiuBWV325nQZ1VOe8PGCLpOmZkjbq0GP7aiFwKwqs7yeUS/UByAty2pUl78KS
	 OyNsxxGLKbU5Dhp7IRNtkUXEvQqb5Dd3gAPxDMsjHRHi8JMbtheGo6K9z/8W2Fs7AcE2A
	 inC9oXnDrjZKum5lRtOVyPsuSz+WE28tDElFVXORUvz9P2QRNpUyM+fV2Uk9xPT7iLWLh
	 I55tsBu55LLFeYG5OHlSKnm39zl6K911Ynawdj/FrOoSP+w8d60YpCN1e5rFJrmtiQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196709;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d5y9nrBLFsTXz7H5GB+OSUzysffKWTJQaM2dW3AQLQY=;
	b=B3gkAGj32jgygBMTdk+WhjOhc+eihJmLQFusRhfpy+kn1lJCMZVGn+HRZy6gUl3+5cgZ
	 WCaknyaFZDQnwQY1csFf5WNOBx8yNFoG9G2JkdFM5lHKbxiEwk9idSB724KmIImyxiPsW
	 oXWZcji5MiFqVDKYK38CjohFdS4OU3SkBhP60wVVS9caKmiXQDXbSJOFlBycTX2x8QbEY
	 F65n1jywN0PEqRn0xEl/MVGARuObp63yBfQ6XoDJl5ljT6day9UjbErn5dmE5uYMHcrjs
	 hsp13/wL803b5YLzTbGuD2xhxfxuOfkAcuUEO3nM3EqVZvq/NilvJ7ZPJ6ZzdG4rRwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pIIoa4Uy;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4060A2636
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E4060A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pIIoa4Uy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=d5y9nrBLFsTXz7H5GB+OSUzysffKWTJQaM2dW3AQLQY=; b=pIIoa4Uyw/T6lRX2tnNm57JNmI
	asQcaVcqQUfkMka4/GQ4sNUoJIPr7hOZYKAy4hiyHO3VNjhAoog1rJNs9SgJTYPFpgMQWU/m/C92s
	ssUxPCi8PZTl7B/Qmz9cAdAjkVtqGGfV5z649I2RgrKfs+tD0OOR3v7eZcejUy7AoAPU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfZ-0065GI-1q
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:05 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/20] wifi: mt76: mt7925: read the monitor state under the mutex for deep sleep
Date: Fri, 20 Nov 2026 18:44:51 +0100
Message-ID: <20261120174459.1657382-12-nbd@nbd.name>
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

mt7925_deep_sleep_set() reads IEEE80211_CONF_MONITOR before it takes
the mutex. The value can thus miss a monitor change that mt7925_config()
applied under the mutex, and deep sleep can then go on while a monitor
runs. Reachable via the deep-sleep file in debugfs.

Read the flag under the mutex, as mt7925_set_runtime_pm() does.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index d0677a24e080..6cfd3c4cac8c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -231,8 +231,8 @@ mt7925_deep_sleep_set(void *data, u64 val)
 {
 	struct mt792x_dev *dev = data;
 	struct mt76_connac_pm *pm = &dev->pm;
-	bool monitor = !!(dev->mphy.hw->conf.flags & IEEE80211_CONF_MONITOR);
 	bool enable = !!val;
+	bool monitor;
 
 	if (mt76_is_usb(&dev->mt76))
 		return -EOPNOTSUPP;
@@ -241,6 +241,7 @@ mt7925_deep_sleep_set(void *data, u64 val)
 	if (pm->ds_enable_user == enable)
 		goto out;
 
+	monitor = !!(dev->mphy.hw->conf.flags & IEEE80211_CONF_MONITOR);
 	pm->ds_enable_user = enable;
 	pm->ds_enable = enable && !monitor;
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
-- 
2.47.3

