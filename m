Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196711;
	b=ud95KYAmXzNvdseTww9aybhg3wNJoZg5XVAuZs4J9HZU3BSfot6YPB5UCim9oAvUUA9e
	 wWpUsqAhYV6o1R12uqFb2Ti0kkuUZzOohCO4HU9CJZzCij6MKJk1jteofaVzd3BzLHxu0
	 vEU4X2s9gKkik9P33uU5Pokr00qY02FBjbZ5qQk+SLQ1xrB/S1LQ7YVZ8VHTWjAn8x9T1
	 uQsp8tfRgVN2DCzaaQqVyXHoyrc0ZMyJJfZ3isRpkTWbNl7E4RM2WNSeJa9EDn9+cp9iX
	 iRwis+BNUqJ7t9/vE5+tot/sRv25uDyYu2ChnkNcQ1TkV1UwCnqZSXZWJ8oupzFymWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196711;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EuLobmyWpebtht15GiU9ilblPR+t9d5VRYFxAsdzt2Q=;
	b=EW8MAKUhDYlomrb8eOJfqWXTCDxkKiLn6iybaIZeM8TdfpzhQ8Jlf69u1hUjZQpTuOjI
	 EY8KN9ezJTWCjSPZ8L/aPacOe6l+66kt52hX4T6/PilNMC6AhYgBRHzRQ2kR6iOYx3sSk
	 52+bV9z3lvTX9j890yZBqZQGqNaRfRca5Q5fBjUhvL1pfA5GUBzSxTCnuRPD5J2r3K1dQ
	 bGCJht71AgSY2IsR3f6pToLLEGRt8MYI3sYP+KEydEREnmF9mSispK0ORgg3HWD5vJU4g
	 PnmNnHVRyGWNW0FqMDytH4dgkj7dfxVwneSRf+7ZlPxC20UAwYXj4ChRw/rafM/CWLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pZS7D38z;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F0E60A3804
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F0E60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pZS7D38z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EuLobmyWpebtht15GiU9ilblPR+t9d5VRYFxAsdzt2Q=; b=pZS7D38zmo22l17QRN1dPsgnsM
	Xqdy5qGajitcHprWoTChvZaoxoAyF/yUzWbCl4gBk5cSGBJwziplZFZYJGyrYM5z6U4ouiALBXVdJ
	ihp610lg2nvD7FjYoXcVdUS+y63k9sHmSUfmugauYMsxdpLvM449eStJxUtz/HCV/kjU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfa-0065GI-1D
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:06 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 17/20] wifi: mt76: mt7921: read the monitor state under the mutex for deep sleep
Date: Fri, 20 Nov 2026 18:44:56 +0100
Message-ID: <20261120174459.1657382-17-nbd@nbd.name>
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

mt7921_deep_sleep_set() reads IEEE80211_CONF_MONITOR before it takes
the mutex. The value can thus miss a monitor change that mt7921_config()
applied under the mutex, and deep sleep can then go on while a monitor
runs. Reachable via the deep-sleep file in debugfs.

Read the flag under the mutex, as mt7925_deep_sleep_set() does.

Fixes: 4ad65a54617c ("mt76: mt7921: toggle runtime-pm adding a monitor vif")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 62bf33347e9e..14c70ffa9665 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -189,8 +189,8 @@ mt7921_deep_sleep_set(void *data, u64 val)
 {
 	struct mt792x_dev *dev = data;
 	struct mt76_connac_pm *pm = &dev->pm;
-	bool monitor = !!(dev->mphy.hw->conf.flags & IEEE80211_CONF_MONITOR);
 	bool enable = !!val;
+	bool monitor;
 
 	if (mt76_is_usb(&dev->mt76))
 		return -EOPNOTSUPP;
@@ -199,6 +199,7 @@ mt7921_deep_sleep_set(void *data, u64 val)
 	if (pm->ds_enable_user == enable)
 		goto out;
 
+	monitor = !!(dev->mphy.hw->conf.flags & IEEE80211_CONF_MONITOR);
 	pm->ds_enable_user = enable;
 	pm->ds_enable = enable && !monitor;
 	mt76_connac_mcu_set_deep_sleep(&dev->mt76, pm->ds_enable);
-- 
2.47.3

