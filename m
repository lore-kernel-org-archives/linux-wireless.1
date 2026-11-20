Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196706;
	b=EoWRP0UUBjN2i2Q8mh+hr1KEIIkK30FLNHF80Ur7AImGjuTj6cQqJ7se0wbyY9793qhX
	 6svvqdxvdd9D0GunwFOQrfR5MgSUIvXwPEwaEtCxPAM6d5BGbPStRB0M3xgEdSeNBhJVF
	 fx2/JrK36Ig6jN/1bwcCWSojqFdYamPPhLabzhvl6hUAnc71g3XYgrHvOF2s+/VfxjpKl
	 jLup0UlKo3deirl5wPOXYfSjsOIHBXdcqJrHwarwXGr+eSPcOI0ItxJjN9DBmGucqIL/o
	 5By4gcR8KRSXgu0v9+8QNu4dD0RiJCBDp4NvfFQiyTGcnOJEEWCwk5LHc0feuRzJBcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196706;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jzHV0mctXPtU30Yh7Z1AwrIk4+zBx1XrDkiGJs1XBts=;
	b=ddASAwCUf/8gK2NzGbk5gDcRSIzVlT+P+ck+Wx9lH1Xcaq3rVDwvlxlYcLQoxpeWkhgF
	 tUwM5VWPoVtHboSIDFNoSzxxf05alQ5s6/KfKZb7VMsnc/oLBBzW/Pg9CJuKyLA4EogXf
	 c8rPNwge4IHuoKmb/++WSB84AEq9Fq0Ge0749WxzpH4AUdzZu1vixGZIDIifYVVemcwpO
	 fzklUH2PtpHPGxqprXC5zbwjjvPqiwT6FtpWi1SQyGM8sunfIY40bC4H5qGFQvSj3BMi4
	 E4Ju1Dne/+0Ei2wZbDgvAT9Nzp/AEKNRhsaASvyuFfbPgO3INK0RBewcZj41mh1BxvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=FxItTLwZ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753960A2609
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5753960A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=FxItTLwZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jzHV0mctXPtU30Yh7Z1AwrIk4+zBx1XrDkiGJs1XBts=; b=FxItTLwZsA+99Irm0kiuj9Svtu
	Ixxe2aUynyqP2A12Q5+eTgsqVGvE0N9bz8ayZuhhPuP+bFEr4dWcYyZRGcHrLhHOKES32XDLADav8
	rXCJgUOlrKuNIIF+vZJT+EP4OxA3qsEuqSQ4av0FBMqrkj6XqNQpzbd3a7J4voEmthBA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfY-0065GI-31
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:05 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/20] wifi: mt76: mt7925: restore the beacon filter when monitor mode ends
Date: Fri, 20 Nov 2026 18:44:48 +0100
Message-ID: <20261120174459.1657382-9-nbd@nbd.name>
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

mt7925_sniffer_interface_iter() turns the beacon filter of each running
interface off when monitor mode starts, but not on again when it ends.
An associated station then keeps the filter off while
IEEE80211_VIF_BEACON_FILTER stays set, so mac80211 leaves beacon loss
detection to the device.

When monitor mode ends, turn the filter of each associated station back
on, unless runtime PM is off and a runtime PM write turned the filter
off. Stations that are not associated stay off, since the firmware
expects the filter only after the association.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 41 ++++++++++++-------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 188e3ad06c37..d3b1f5e7850b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -916,29 +916,36 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 }
 
 static void
-mt7925_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+mt7925_vif_set_beacon_filter(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+			     bool enable)
 {
-	struct mt792x_dev *dev = priv;
 	struct ieee80211_hw *hw = mt76_hw(dev);
-	bool pm_enable;
-	int err;
 
-	mt792x_mutex_acquire(dev);
+	if (mt7925_mcu_set_beacon_filter(dev, vif, enable) < 0)
+		return;
 
-	pm_enable = dev->pm.enable_user &&
-		    !(hw->conf.flags & IEEE80211_CONF_MONITOR);
-	err = mt7925_mcu_set_beacon_filter(dev, vif, pm_enable);
-	if (err < 0)
-		goto out;
-
-	if (pm_enable) {
+	if (enable) {
 		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
 		ieee80211_hw_set(hw, CONNECTION_MONITOR);
 	} else {
 		vif->driver_flags &= ~IEEE80211_VIF_BEACON_FILTER;
 		__clear_bit(IEEE80211_HW_CONNECTION_MONITOR, hw->flags);
 	}
-out:
+}
+
+static void
+mt7925_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt792x_dev *dev = priv;
+	struct ieee80211_hw *hw = mt76_hw(dev);
+	bool pm_enable;
+
+	mt792x_mutex_acquire(dev);
+
+	pm_enable = dev->pm.enable_user &&
+		    !(hw->conf.flags & IEEE80211_CONF_MONITOR);
+	mt7925_vif_set_beacon_filter(dev, vif, pm_enable);
+
 	mt792x_mutex_release(dev);
 }
 
@@ -956,8 +963,14 @@ mt7925_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
 
-	if (monitor)
+	if (monitor) {
 		mt7925_mcu_set_beacon_filter(dev, vif, false);
+		return;
+	}
+
+	if (vif->cfg.assoc &&
+	    (pm->enable || (vif->driver_flags & IEEE80211_VIF_BEACON_FILTER)))
+		mt7925_vif_set_beacon_filter(dev, vif, true);
 }
 
 void mt7925_set_runtime_pm(struct mt792x_dev *dev)
-- 
2.47.3

