Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.227.64.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425451;
	b=husHGBaSdW3lP1ZhHQFl55CoT3gfOuIQTaNCzXZKBEeA1pF2pM0jbvYVJpKdxn1ZaD2R
	 ivcsj9aIPobwKdfOsnXYLGtP//u18kMKEtqxi+PuWNBGLCswA8wH2skkP3+EBfVzaON/F
	 75AScILcoPP3cF8Ai5r5tq9vj4zbHtIk9CHDvpUDU5wLYm+bdMfGGPkQmS4rufhd3A1lG
	 BkmAsMvmOCTAHxfEBo28+ch7NAXGrL3XReCSHUfpIxkJqj0yepTg3CT5KvhZgiOCWvZA5
	 u4rKE4asQ1UbhMC2iOGvhqVY5Kd8Ve2FPURpU4Ots4mnJR1OaWxgBv6UhN5fw4+NKcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425451;
	h=DMARC-Filter:DKIM-Signature:X-Virus-Status:X-Virus-Scanned:Received:
	 Date:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Cc;
	bh=c0z8mGhw1gEtfDzRgfSbjxN3RAnNpBLR7FXcIzFsFr8=;
	b=5mqRopwgGvYJHhoLuzyV97AP8BvD8M8Nb7Nu3WOOkpyZtej/jdYpG9S8+DnGvUK9/zaW
	 vPVh8pZHhabw/dJePJc8Ywa4+ICHzZVI5D4qPIYYEe6+N3esDJKszujhM+ZFxpiz5MYJ+
	 vRG2HMGFGWgLivkbbCfppp1OljwHkUcB5wAq07pxFXZkgStl/1lG+MIzOeiHA4sYDt9ZQ
	 d8YceliVGnqbBnswKApzjuxRXN+ao3JS777P+Eu1D0Wq9cr3R3UVbN/3eK12wt8LfbRz6
	 AwovxFdUQLgQFNMRufHwt49zDq/pdPjDW/NVqH22mCSw4j/IdhS7wd8haXmy87Htjow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rere.qmqm.pl;
	spf=pass smtp.mailfrom=rere.qmqm.pl;
	dkim=pass header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=oOyxLzrB;
	arc=none smtp.remote-ip=91.227.64.183
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 5CA5B606A333;
	Mon, 23 Nov 2026 09:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA5B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=oOyxLzrB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1795425449; bh=0NaLGEZPj32zgH/oU64wfMuqILAJnnZvT802hbIKr38=;
	h=Date:Subject:From:To:Cc:From;
	b=oOyxLzrB5eb2+KfnYnpuPwX5kRj7ywK3OqKP35XM5/3xuL2I30+28Fm57gxzZnijo
	 PCBDQr4/k/2KFpbrykzOQgRbTZMHhl37Rfc8d2kHGpUVF+mm2M3vH6hHc3jdjxpEoE
	 4TDS4DMbXEWU4Le3mKZaYBwgJBUjBpkVKgbPRrSZzoyYUIuCKmu6KYfjr2RaNSJ8Oh
	 ov2IEp5lsHRNY81d5WHT59c3NoDk3hrC+zPJI3hnR7GQhEqvSR2je8n29+UP3iHTAt
	 NVHf5HNsG3xvhQh+WDr/C8E2N3w25Di4mDEXbtdw56OGQXUSN8MIuKhJRHR6INLU22
	 31HEn9bmli7DA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.6 at mail
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4jY0hR2m1Nz5j;
	Mon, 23 Nov 2026 10:17:27 +0100 (CET)
Date: Mon, 23 Nov 2026 10:17:26 +0100
Message-ID: <001bfb2024a3941fed1c2fe7eab9caa1462ad3b1.1795425090.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2] wifi: mt76: mt7925: deduplicate MLD support code in
 mt7925_mac_link_sta_add
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc:	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sasha Levin <sashal@kernel.org>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Leon Yen <leon.yen@mediatek.com>,
	Stella Liu <yu-ching.liu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org

Simplify mt7925_mac_link_sta_add() logic branching where
mt7925_mcu_add_bss_info_sta() and mt7925_mcu_sta_update()
are called with identical arguments.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 v2: rebased on top of commit 3eea7a990506 ("wifi: mt76: mt7925: keep MLD membership consistent during link add")
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 36 ++++++-------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 15d95ad32636..22cc5b49da0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -918,6 +918,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	struct mt792x_bss_conf *mconf;
 	u8 link_id = link_sta->link_id;
 	bool wcid_published = false;
+	bool is_secondary_link_sta;
 	struct mt792x_sta *msta;
 	struct mt76_wcid *wcid;
 	bool pm_woken = false;
@@ -962,6 +963,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+	is_secondary_link_sta = ieee80211_vif_is_mld(vif) && link_sta != mlink->pri_link;
 
 	/* NAN_DATA (NDI) peers skip association - fill link_sta caps
 	 * from sband and push BSS_INFO with correct phymode + RLM.
@@ -983,33 +985,21 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 		struct mt792x_link_sta *mlink_bc;
 
 		mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
-
-		if (ieee80211_vif_is_mld(vif)) {
-			ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
-							  link_conf, link_sta,
-							  mlink_bc->wcid.idx, mlink->wcid.idx,
-							  link_sta != mlink->pri_link);
-			if (ret)
-				goto out_pm;
-		} else {
-			ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
-							  link_conf, link_sta,
-							  mlink_bc->wcid.idx, mlink->wcid.idx,
-							  false);
-			if (ret)
-				goto out_pm;
-		}
+		ret = mt7925_mcu_add_bss_info_sta(&dev->phy, mconf->mt76.ctx,
+						  link_conf, link_sta,
+						  mlink_bc->wcid.idx, mlink->wcid.idx,
+						  is_secondary_link_sta);
+		if (ret)
+			goto out_pm;
 	}
 
-	if (ieee80211_vif_is_mld(vif) &&
-	    link_sta == mlink->pri_link) {
+	if (!is_secondary_link_sta) {
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
 					    mlink, true,
 					    MT76_STA_INFO_STATE_NONE, NULL);
 		if (ret)
 			goto out_pm;
-	} else if (ieee80211_vif_is_mld(vif) &&
-		   link_sta != mlink->pri_link) {
+	} else {
 		struct mt792x_link_sta *pri_mlink;
 		struct mt76_wcid *pri_wcid;
 
@@ -1036,12 +1026,6 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 					    MT76_STA_INFO_STATE_ASSOC, mlink);
 		if (ret)
 			goto out_pm;
-	} else {
-		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
-					    mlink, true,
-					    MT76_STA_INFO_STATE_NONE, NULL);
-		if (ret)
-			goto out_pm;
 	}
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
-- 
2.47.3

