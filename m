Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=23N8NG/Z7KoSj2AqSfnQOJUjjc1+qk8I8kwxQtTMXbudw/FlSSpkN7UEBk2yS9Bpn3uE
	 Fv9H58BsssKcu1e7dc425Jn78fweAFJRfLW+rqMYwIyACt0nJJgWcey9beJzQQR4ZN4fA
	 Z0yqCV5DeAexIDmONN3iDG8PA7zrRaKSEAMyGkYRrLOVAAZCH/ArjuDtMkOOjNuJrMLem
	 kUgXgwQcdK5g/JMs/f96Wp+kYJd1olXRCDWY0OtKHiTOEE2FlirWqSt2TlL9Ffx9viyju
	 AkpqRh/sJUWn7Gh/JIJjIyP16yoEreSdjs29p0NqFdzJ2Ui+pbpjNymYJ3KzP4WOGFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CUR5AT3TqpBNGJcDBRBKWBFyRNC6KKhRmg4Yq9NChxI=;
	b=4Co/FQwhmEGLEbwb0tNV52Ccwn7sHErG8aom2YrnZsZnHupaSpj2Tdw/cjdfuWnJ8W7i
	 h1z3Cy9rMsbAgNzof2/znMYY+/HekQvcDkQw/L3FuJM5Xvo5jzbf18akQ/Vhj4ReZaW4J
	 gKcOadbwiS/tZvzJYU/xZAbCXu1ZAc7khnr1Z2Dc6ysRzsXbrA1gisIIK10pZIl8bSiHu
	 mSGx9hM7bwsmLPwl/RmBqkpWnr93z97xuneik5F2OSo0rf8mYWOG0BXI0mJBjDyrWHG4c
	 kI3p3rxFUK4fyndt/f4L3JpXjlyC3LKdFmDe6oNAWa89vL2PyoZ15eFEsm6wnsVNJ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pWuyNIX4;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5CA606A688
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5CA606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pWuyNIX4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CUR5AT3TqpBNGJcDBRBKWBFyRNC6KKhRmg4Yq9NChxI=; b=pWuyNIX4eu+NUIuEwxA4dVn346
	2m4YymP4/lbE/kPXwJZV9YV53v1mGooKfBKNDi0dPwRn6EH6u2w+ggbv3scHL2yzPl9LcgOx2Yf1p
	gXhCKCQCinKreD8w2vdf/SbAqo776z0WGlk8dqA0lr2p7kzwBVErWZ8RgMvz0XdROPQY=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGux-008IWP-0g
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/18] wifi: mt76: mt7996: reset on an MCU timeout only once the hw is registered
Date: Wed, 25 Nov 2026 18:36:10 +0100
Message-ID: <20261125173616.3776951-12-nbd@nbd.name>
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

mt7996_mcu_parse_response() queues reset_work on every MCU timeout, also
while mt7996_register_device() has not registered the hw yet. The work
runs in parallel with the probe. After a failed probe,
mt76_free_device() waits for it when it destroys the workqueue.
mt7996_mac_full_reset() then ends with ieee80211_restart_hw() on a hw
that was never registered. ieee80211_restart_work() flushes a NULL
local->workqueue or uses the local that ieee80211_free_hw() freed: an
oops after the failed probe.

Only start the reset once recovery.hw_init_done is set, as
mt7996_reset() does. Before that, leave MT76_MCU_RESET clear, so that a
timeout fails its command like any other error.

After a failed read, mt7996_eeprom_load() falls back to the default
EEPROM data and the probe goes on. With the bit set, every command of
the registered device would then fail at once. No reset would clear the
bit.

Fixes: d2b860454ea2 ("wifi: mt76: mt7996: reset device after MCU message timeout")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 4f0e59fc170e..4e1164e3afa4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -246,7 +246,8 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			cmd, seq);
 
 		spin_lock_bh(&dev->mt76.lock);
-		if (!test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state))
+		if (dev->recovery.hw_init_done &&
+		    !test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state))
 			mt7996_mac_full_reset_queue(dev);
 		spin_unlock_bh(&dev->mt76.lock);
 
-- 
2.47.3

