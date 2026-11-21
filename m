Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=FDxO/ZxSvE20BIGw4yfUNDstLUU85EKXfYKqVQTtl4twlWty61qbJwO3OnmmQ7GAKIgK
	 VmsP6tLSk2kckTyTYEWuPRiEDjMQ2WGALYB1HH98E3+0g9lbTEyQi+oHSQbUz6POZWvEk
	 JNH7vBQdE5A3uXrf30sMgusWXi/CgVhBSzEcuE7oMGQUfySbjCxQ627Wa4SXR7xp7YDlD
	 4fzBlHj+yhafeZ7qxoVTR3CCM0BdvoHfsxC1ZA9rWb41Y88M/Vmy/TeCd88Ej3T88H+jo
	 Qocwhnl9q9HhxTuEUflMVgtNzrIoHMSaGaElO3dHCQy6roB7UvvYmcKg9wYCS7xkzKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TqtduEAWIT4N//BJunJdmv3uqzjvRPrYCDzoVBx+3uU=;
	b=3e84IfY5laaaF4NU42A8+rVkIcTwfWePgrjNhM7kylqQaFqEM78dpkjpvQdLgujKCWV3
	 uleYIumADblcPp7jX42Qx4YjaOOY2VSLpd4xGZcBLJAdUyrkkV0cabaubXFd+EU4lAEGW
	 di1wy1NsF5LEcsyZImCnSRcnHdm2HoccEmmuRPxBqFy6dIXSTiw86tj9WIQXJP6SUu50U
	 qEqaIgvOfCwHHjO2DvV06FqVd6gxv3kBLiYh2LH75U3SH7pPiW5F3o8IIn1/lZeU5u9zo
	 4qWMP5om4WxQMOhmyWVXtBmw0lxks8lx8sxl0m4i8+VCSKHeutaZsf3LYAauL0DxXag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XPpWsc2W;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4D6606A335
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4D6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XPpWsc2W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TqtduEAWIT4N//BJunJdmv3uqzjvRPrYCDzoVBx+3uU=; b=XPpWsc2W2fPT0CF1nedJQkkwNd
	l9o6ueLp6VND+WxpSYqn4N3VhXXAbd9iO0Gzu4d1Zeqs5/gw6ifvYLpbztbt+6KiCabXh38yzJpMD
	KsHYajNseaV426Ls4v7Hx6lCqEPHTNWtyd2eM96n7povHiAUms+ybaiJqIfBI8yDZdcg=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuL-006Q1I-1U
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/17] wifi: mt76: mt7925: abort a ROC on the BSS that requested it
Date: Sat, 21 Nov 2026 13:09:16 +0100
Message-ID: <20261121120926.3603979-7-nbd@nbd.name>
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

mt7925_start_ap() requests the channel on the BSS of the link that it
starts. mt7925_roc_work() aborts an expired request only on the default
BSS of each running interface. If the request of a non-default link of
an AP MLD expires before mt7925_start_ap() aborts it, the firmware gets
no abort for that BSS. The comment in mt7925_start_ap() notes that the
firmware then asserts.

Record the BSS of each request, and abort on it as well.

This is currently not reachable, because mt7925_change_vif_links()
fails the second ADD_LINK of an AP MLD. Found by inspection.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 16 +++++++++-------
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  1 +
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b78823e161ee..ec4f3db23c07 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -547,10 +547,9 @@ static void mt7925_roc_iter(void *priv, u8 *mac,
 	*bss_mask |= BIT_ULL(mvif->bss_conf.mt76.idx);
 }
 
-static void mt7925_roc_abort_all(struct mt792x_phy *phy, u8 token)
+static void mt7925_roc_abort_all(struct mt792x_phy *phy, u8 token, u8 bss_idx)
 {
-	u64 bss_mask = 0;
-	u8 bss_idx;
+	u64 bss_mask = BIT_ULL(bss_idx);
 
 	ieee80211_iterate_active_interfaces_atomic(phy->mt76->hw,
 						   IEEE80211_IFACE_ITER_RESUME_ALL,
@@ -574,19 +573,20 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 
 	cancel_work(&phy->roc_work);
 
-	mt7925_roc_abort_all(phy, phy->roc_token_id);
+	mt7925_roc_abort_all(phy, phy->roc_token_id, phy->roc_bss_idx);
 }
 EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
 void mt7925_roc_work(struct work_struct *work)
 {
 	struct mt792x_phy *phy;
-	u8 token;
+	u8 token, bss_idx;
 
 	phy = (struct mt792x_phy *)container_of(work, struct mt792x_phy,
 						roc_work);
 
 	token = phy->roc_token_id;
+	bss_idx = phy->roc_bss_idx;
 
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
@@ -595,7 +595,7 @@ void mt7925_roc_work(struct work_struct *work)
 	ieee80211_remain_on_channel_expired(phy->mt76->hw);
 
 	mt792x_mutex_acquire(phy->dev);
-	mt7925_roc_abort_all(phy, token);
+	mt7925_roc_abort_all(phy, token, bss_idx);
 	mt792x_mutex_release(phy->dev);
 }
 
@@ -631,7 +631,7 @@ static void mt7925_roc_stale_reclaim(struct mt792x_phy *phy)
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
 
-	mt7925_roc_abort_all(phy, token);
+	mt7925_roc_abort_all(phy, token, phy->roc_bss_idx);
 
 	if (phy->roc_notify)
 		ieee80211_remain_on_channel_expired(phy->mt76->hw);
@@ -652,6 +652,7 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	token = ++phy->roc_token_id;
+	phy->roc_bss_idx = mconf->mt76.idx;
 	phy->roc_grant = false;
 	phy->roc_notify = type == MT7925_ROC_REQ_ROC;
 
@@ -683,6 +684,7 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	token = ++phy->roc_token_id;
+	phy->roc_bss_idx = mconf->mt76.idx;
 	phy->roc_grant = false;
 	phy->roc_notify = false;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 3604f02a5376..07c5e67db8cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -305,6 +305,7 @@ struct mt792x_phy {
 	u8 roc_token_id;
 	bool roc_grant;
 	bool roc_notify; /* mac80211 expects the expiry of this ROC */
+	u8 roc_bss_idx;
 };
 
 struct mt792x_irq_map {
-- 
2.47.3

