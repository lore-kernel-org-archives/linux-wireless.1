Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049833;
	b=PgHsfLxIqlcOCLzSvqcPm5jRtczDp5ZgxV3zoKykw36CAW4bh43tkexH6dpTMbu2Jt47
	 WoS+HOIRq4AB6SCxHva3/2wRLqlZrgQBP2rOhwLoBSmS8pewcJRNpIk4ctS7eY4TPlTKQ
	 jL29pERgsA1yfgVfiso3t13WmjMVOhOkJ8sxF4ch4HrhiEQQrZOTqO07fJ20CFrmBc/aK
	 epajMcGFxWVX11BQvSuwEdKOdWnCIfs2EyoAy+/TT16POzfI3DL72i0CstGj+pgUiUbSY
	 0+/7xYxOu92PAARklznSY0P9SqkAWDHZFkSQ6w/nI4h6AmTQy4t6W7rDWAk0NH1IKVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049833;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xWgtswuu5voegshuaN7lrRpgJMW8L3MRLlTeWqoC8wQ=;
	b=TCKBBHx4qDj+7Qs1uj6uKZ4/LOCU9JznhvvCZk6PcuU22MbaH69f4T/fBG7OVqbEs54E
	 2erjZtlZoS5dg3YRu3+5cL9fZTyMZcdDOm4DHoIZfZuBHJe8T2X4rllneadqcVRqrd7E7
	 iGWgrfyv4e3BkG1qUSXd5hg0Tln3JKq8lrxN9XaziQ4VmKFL1w2tIhqTlAI2hZh+8Gy82
	 p+Q9HTZC06k0sjMXQDqfiWI7p6EfapdOXcxnqgXNQycvwrb6JpinpNnpI83GT5VaJh698
	 688fzr9pL/f9nGLRNMjYSS4n+mBsSX369Nt7qAzlFuMYzGjMvOSDE7PO3OtTHwSLecQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b="CpcNuJ/w";
	arc=none smtp.remote-ip=91.218.175.151
Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF11606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 00:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF11606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=CpcNuJ/w
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xfkh/Wtbxs9DzeSqhMzPOXb3vEgBrjD1S7FQ0ecCs/E=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795049830; v=1; x=1795654630;
 b=CpcNuJ/wbL7oXaEIttpFzz0OSRlpCcTQdvE7YzYRc+/iyBbeA3b9sdMabc7aAznaUEYcQu1i
 BD6iU3+KMjlVF2cuwBWvdVxhSPGfVFOWU15HiwClxAP/WGHH0LsoTtURtfLMbhPY4LdNR3i0ihx
 T6PE/7riIcAsiNFwOFP9bVYsihYx/OTN8f+fW4/1kOM2LLFOuXu/ySm8H9HWwzoJUG74gG1/Xho
 2VE8n3IXdsH7JRoDYlySlMDKHeDjo00G23FPUrDhOc8fkz2rLuUDuE5fwGf/kp+TmtcY3RxZi9H
 lX6QVdEQSsnPjAVHaaAuBO0QdT8Eizjb2wjnt0ERycZpw==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 11d9fcbaf7dca7b1;
	Thu, 19 Nov 2026 00:57:10 +0000
X-Mizu-Trace-ID: 11d9fcbaf7dca7b1
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next v3] wifi: mt76: mt792x: tell mac80211 when a disconnect cancels its ROC
Date: Wed, 18 Nov 2026 17:57:01 -0700
Message-ID: <20261119005701.8154-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
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

A disconnect during a remain-on-channel (ROC) cancels the ROC in
firmware without telling mac80211, which then waits for a ROC that is
already gone. Scans fail, and after an AP deauth the station does not
reconnect.

Tell mac80211 when the driver cancels a ROC that mac80211 started.

Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
Fixes: 5ed54896b6bd ("wifi: mt76: mt7921: fix a potential scan no APs")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Fixes: 45064d19fd3a ("wifi: mt76: mt7925: fix a potential association failure upon resuming")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
v3: rebased on Felix's mt76 branch, where v2 no longer applies after
"wifi: mt76: mt7925: do not take iflist_mtx under the mutex".

Tested on that branch with an MT7922, an MT7927 and an MT7925U, the
MT7925U at USB 2.0 and 3.0:

  disconnect while a ROC is held   without this         with it
  AP deauth                        no reconnect, scans  back in 3.4 to
                                   fail                 4.5 s
  the station disconnects          scans fail           scan in 3.1 to
                                                        3.5 s
  the same, MT7925U on two links   no reconnect, scans  back in 9.0 to
                                   fail                 9.6 s, 34 of 34

Each cancelled ROC is reported once, and a P2P find ends its ROCs as
before on all three chips.

v2: https://lore.kernel.org/all/20261110005846.38432-1-lucid_duck@justthetip.ca/
v1: https://lore.kernel.org/all/20261023014827.57411-1-lucid_duck@justthetip.ca/

 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 14 +++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 ++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 09574d4417cd..58df080a342e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -381,6 +381,9 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 	ieee80211_iterate_interfaces(mt76_hw(dev),
 				     IEEE80211_IFACE_ITER_RESUME_ALL,
 				     mt7921_roc_iter, (void *)phy);
+
+	if (phy->roc_notify)
+		ieee80211_remain_on_channel_expired(mt76_hw(dev));
 }
 EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
 
@@ -405,16 +408,21 @@ void mt7921_roc_work(struct work_struct *work)
 
 static int mt7921_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif)
 {
+	bool aborted;
 	int err = 0;
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
 	mt792x_mutex_acquire(phy->dev);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+	aborted = test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+	if (aborted)
 		err = mt7921_mcu_abort_roc(phy, vif, phy->roc_token_id);
 	mt792x_mutex_release(phy->dev);
 
+	if (aborted && phy->roc_notify)
+		ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
 	return err;
 }
 
@@ -430,6 +438,7 @@ static int mt7921_set_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	phy->roc_grant = false;
+	phy->roc_notify = type == MT7921_ROC_REQ_ROC;
 
 	err = mt7921_mcu_set_roc(phy, vif, chan, duration, type,
 				 ++phy->roc_token_id);
@@ -471,6 +480,9 @@ static int mt7921_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
+	/* mac80211 ends this ROC itself */
+	phy->roc_notify = false;
+
 	return mt7921_abort_roc(phy, mvif);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 975c564236f9..7ff95683d268 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -569,6 +569,9 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 	cancel_work(&phy->roc_work);
 
 	mt7925_roc_abort_all(phy, phy->roc_token_id);
+
+	if (phy->roc_notify)
+		ieee80211_remain_on_channel_expired(mt76_hw(dev));
 }
 EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
@@ -596,17 +599,22 @@ void mt7925_roc_work(struct work_struct *work)
 static int mt7925_abort_roc(struct mt792x_phy *phy,
 			    struct mt792x_bss_conf *mconf)
 {
+	bool aborted;
 	int err = 0;
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
 	mt792x_mutex_acquire(phy->dev);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+	aborted = test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+	if (aborted)
 		err = mt7925_mcu_abort_roc(phy, mconf->mt76.idx,
 					   phy->roc_token_id);
 	mt792x_mutex_release(phy->dev);
 
+	if (aborted && phy->roc_notify)
+		ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
 	return err;
 }
 
@@ -721,6 +729,9 @@ static int mt7925_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
+	/* mac80211 ends this ROC itself */
+	phy->roc_notify = false;
+
 	return mt7925_abort_roc(phy, &mvif->bss_conf);
 }
 

base-commit: e1b736d305e903b8a3e961d77bc392cab23ebc6a
-- 
2.56.1

