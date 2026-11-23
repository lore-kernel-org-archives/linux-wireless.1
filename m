Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447343;
	b=MVb5XH2VKSTQKz8+AQocQJQ1iLslRtNyEHv4LI7FPlGaDiybDXwTz5q7ykF06aQYIjPQ
	 1B0vzAeNi5qgO8MrtK4W6W9sHt3xs+94S1uENfpFaCqZGEjR69gra+msDeRmopxVpwrhq
	 f+vIlwTa7I/AvdQ+sm63GDVcMiDMHCF/Nd6AbHXXIseK47fDvw69AEjWi9MLsbn4z7Rad
	 ZnpKsfx743AYxasSX2Wt++l9ryO+KyfjP6b+HKb/twVGPfmSfYMebMhIsGcnqoMcuiL1E
	 wifeRPH+ypHVAf4mb7Bi9zKBpNRVexZI3r1WA6vOS69n3aRPyLFhdkcpZw5jqNT93/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447343;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=myPw6CvnEf4d+2848I2LYPJqyedKiv3uOPlswg0Zhwk=;
	b=Ay0klCR75wiNfAyKU96s0K1RPAlHOMhVoqdBiZ29/vnKGkYVaPohd+ULEOJbYePm2IjU
	 5dR6J1s53uDm6auK1VgHoXrR+UOMO53jyid0s7GywwGVhBt5Bt/5Wu+D7H+2r+Ch2ClPb
	 +Wo65x7T70rC3P5mY6fXb52r9NsIwVNlpPlDZzkokD6KasLi/7a9SZyweQiWKr7wtT0F/
	 a/EVbMV4wt5O0ZWOiRUl4OXt8vR0bMu/yFOdAvAM0XAcqZS+DixIZdivdlCCao6gYVJR7
	 ORRM95r9oLlh2PlxPrxJP2l3zF8ErREqZuIQK8veotAvhZufz4aDwRMoXjdP0VE8eCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=KWro3ecX;
	arc=none smtp.remote-ip=95.215.58.217
Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7479606A31F
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7479606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=KWro3ecX
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2G41HHhnwQT0Tn20WEH4SuNpAiGlUhBlIdmFYjsvXq4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447340; v=1; x=1796052140;
 b=KWro3ecXWGgUDVgLxoEkAHkfTqTit/nkDBVJU+OECEsj3KBXbdHzdAbWH1nLMOq6afDT76Cw
 HLpe/6vNJagkxxt1/hb0sIvG6JP4fXDDtjc36dqGyVbQXZ+RSgHuOWQBOVf9HxDZPxzLcoDzjha
 bcF8x2pvnFnCFN/Ep8qZ9TP6oQ5fCDIaN+cJFT0hIWuXSp8ewHjEBqAL+WVamoooT6dJigDE50X
 riq3U+yjqC2FXJ8aPS0SsyLxj+aafmzroXSPSnVTsN9iUS+ic19wRnmE594EslilK7qCKiOb+vh
 baF4Ae3s8ozDbw3mpzuiGagZZlBq/2VyxX8PFnazH3tkQ==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7b6caf759b52c97;
	Mon, 23 Nov 2026 15:22:20 +0000
X-Mizu-Trace-ID: f7b6caf759b52c97
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next v2 2/4] wifi: mt76: mt7925: keep the sniffer on for real monitor vifs
Date: Mon, 23 Nov 2026 08:21:52 -0700
Message-ID: <20261123152154.99634-3-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123152154.99634-1-lucid_duck@justthetip.ca>
References: <20261123152154.99634-1-lucid_duck@justthetip.ca>
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

mac80211 sets its monitor flag only for the virtual monitor. A monitor
that reaches the driver as its own vif, as every monitor on MT7927
does, is not treated as one and goes deaf after a scan.

Count monitor vifs and treat one like the monitor flag. Start a new
monitor's sniffer on the radio's current channel. Set it up again after
a scan, and when another interface goes down, where mac80211 would add
the virtual monitor back.

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 76 +++++++++++++++++--
 .../wireless/mediatek/mt76/mt7925/testmode.c  |  4 +-
 3 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index 0c40741273a9..3739959283dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -241,7 +241,7 @@ mt7925_deep_sleep_set(void *data, u64 val)
 	if (pm->ds_enable_user == enable)
 		goto out;
 
-	monitor = !!(dev->mphy.hw->conf.flags & IEEE80211_CONF_MONITOR);
+	monitor = mt792x_monitor_active(dev);
 	pm->ds_enable_user = enable;
 	pm->ds_enable = enable && !monitor;
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d99d86bf5be8..12bad1105d0b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -479,6 +479,9 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	return ret;
 }
 
+static void
+mt7925_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif);
+
 static int
 mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
@@ -499,6 +502,15 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	if (ret < 0)
 		goto out;
 
+	if (vif->type == NL80211_IFTYPE_MONITOR) {
+		dev->monitor_vifs++;
+		mt7925_sniffer_interface_iter(dev, NULL, vif);
+		mt7925_mcu_config_sniffer(mvif, NULL);
+		ieee80211_iterate_active_interfaces_mtx(hw,
+							IEEE80211_IFACE_ITER_RESUME_ALL,
+							mt7925_sniffer_interface_iter, dev);
+	}
+
 	vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
 	if (phy->chip_cap & MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN)
 		vif->driver_flags |= IEEE80211_VIF_SUPPORTS_CQM_RSSI;
@@ -515,6 +527,49 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	return ret;
 }
 
+static void
+mt7925_monitor_collect_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct ieee80211_vif **mon = priv;
+	int i;
+
+	if (vif->type != NL80211_IFTYPE_MONITOR)
+		return;
+
+	for (i = 0; i < MT792x_MAX_INTERFACES; i++) {
+		if (!mon[i]) {
+			mon[i] = vif;
+			return;
+		}
+	}
+}
+
+/* A scan takes the radio off the monitor's channel and the sniffer does
+ * not come back by itself, so set it up again when a scan completes or
+ * another interface goes down. The commands sleep, so collect the
+ * monitors first. Called with the device mutex held.
+ */
+static void mt7925_monitor_rearm(struct mt792x_dev *dev)
+{
+	struct ieee80211_vif *mon[MT792x_MAX_INTERFACES] = {};
+	int i;
+
+	if (!dev->monitor_vifs)
+		return;
+
+	ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
+						   IEEE80211_IFACE_ITER_RESUME_ALL,
+						   mt7925_monitor_collect_iter, mon);
+	for (i = 0; i < MT792x_MAX_INTERFACES && mon[i]; i++) {
+		struct mt792x_vif *mvif = (struct mt792x_vif *)mon[i]->drv_priv;
+		struct ieee80211_chanctx_conf *ctx = mvif->bss_conf.mt76.ctx;
+
+		mt7925_mcu_set_sniffer(dev, mon[i], true);
+		if (ctx)
+			mt7925_mcu_config_sniffer(mvif, ctx);
+	}
+}
+
 static void
 mt7925_remove_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
@@ -535,6 +590,13 @@ mt7925_remove_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mt792x_mac_link_bss_remove(dev, mconf, &mvif->sta.deflink);
 	mt7925_p2p_bmc_remove(dev, mconf);
 
+	if (vif->type != NL80211_IFTYPE_MONITOR)
+		mt7925_monitor_rearm(dev);
+	else if (!--dev->monitor_vifs)
+		ieee80211_iterate_active_interfaces_mtx(hw,
+							IEEE80211_IFACE_ITER_RESUME_ALL,
+							mt7925_sniffer_interface_iter, dev);
+
 	mt792x_mutex_release(dev);
 }
 
@@ -939,13 +1001,11 @@ static void
 mt7925_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct mt792x_dev *dev = priv;
-	struct ieee80211_hw *hw = mt76_hw(dev);
 	bool pm_enable;
 
 	mt792x_mutex_acquire(dev);
 
-	pm_enable = dev->pm.enable_user &&
-		    !(hw->conf.flags & IEEE80211_CONF_MONITOR);
+	pm_enable = dev->pm.enable_user && !mt792x_monitor_active(dev);
 	mt7925_vif_set_beacon_filter(dev, vif, pm_enable);
 
 	mt792x_mutex_release(dev);
@@ -955,9 +1015,8 @@ static void
 mt7925_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct mt792x_dev *dev = priv;
-	struct ieee80211_hw *hw = mt76_hw(dev);
 	struct mt76_connac_pm *pm = &dev->pm;
-	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
+	bool monitor = mt792x_monitor_active(dev);
 
 	mt7925_mcu_set_sniffer(dev, vif, monitor);
 	pm->enable = pm->enable_user && !monitor;
@@ -982,7 +1041,7 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor;
 
 	mutex_lock(&dev->mt76.mutex);
-	monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
+	monitor = mt792x_monitor_active(dev);
 	pm->enable = pm->enable_user && !monitor;
 	mutex_unlock(&dev->mt76.mutex);
 
@@ -991,7 +1050,7 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
 					    mt7925_pm_interface_iter, dev);
 
 	mt792x_mutex_acquire(dev);
-	monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
+	monitor = mt792x_monitor_active(dev);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
 	mt792x_mutex_release(dev);
@@ -1865,6 +1924,9 @@ void mt7925_scan_work(struct work_struct *work)
 						.aborted = false,
 					};
 					ieee80211_scan_completed(phy->mt76->hw, &info);
+					mt792x_mutex_acquire(dev);
+					mt7925_monitor_rearm(dev);
+					mt792x_mutex_release(dev);
 				}
 				break;
 			case UNI_EVENT_SCAN_DONE_CHNLINFO:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
index dbf1159effeb..0283bfc72779 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/testmode.c
@@ -130,7 +130,7 @@ int mt7925_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	int err;
 
 	if (!test_bit(MT76_STATE_RUNNING, &mphy->state) ||
-	    !(hw->conf.flags & IEEE80211_CONF_MONITOR))
+	    !mt792x_monitor_active(phy->dev))
 		return -ENOTCONN;
 
 	err = nla_parse_deprecated(tb, MT76_TM_ATTR_MAX, data, len,
@@ -167,7 +167,7 @@ int mt7925_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 	int err;
 
 	if (!test_bit(MT76_STATE_RUNNING, &mphy->state) ||
-	    !(hw->conf.flags & IEEE80211_CONF_MONITOR) ||
+	    !mt792x_monitor_active(phy->dev) ||
 	    !mt76_testmode_enabled(mphy))
 		return -ENOTCONN;
 
-- 
2.56.1

