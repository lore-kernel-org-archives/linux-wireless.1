Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092249;
	b=Oglq40nlev18JFFAbuPJj/0ahT8NMSUnLyUu/cBvOnnSicaIYJpxzZPSVRGlUEfrEhZN
	 DCF3aKd8Y89tKlwtQXQn72CE851mmNPQWgzvMZSvTXmiFHMAWfc6Ex5A+L17YSrQFevQs
	 CVTQ6++DKj4isUb9x1InY2oQ04SkBoqG5sEeged7NgNwiaJ+WAlRXMvcKRLIvWtpvBPUs
	 F6K0YujuGXE5wv35PI0K+HmhpMzAQIP+JtVBfZnghvZ5oHvr4+d3nJGj7IPcvmHqYF6hF
	 h0AuVGMDtBL3Av/mINUk/r50jcxQG3bsnpLK1ji5S7OVwoUzV2mWfG7LBMGG8tHdRyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092249;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RpuvtbilrWCg9KTJTthXqHJ9fer7FGpMSuHQqfcUw/c=;
	b=W1EUNoq/ynY8srboCCL1hwmr+lz/lTrbWb9evxVWgFP83i17sP50zERKoabcdgbT8w8n
	 XkBQkVPSAXVI3NlO6NdTqfFyI96ZgnexJ22YGq+RomSKWmLIkmOWcouluQtUoJd+6rnHS
	 VS4hr0om9eIvxeGgKGd2ybKFtYXjLymbSE79dY7K4ia2OeW0OGhCQuumwsC7yyI8Wu5vt
	 JtUlxF3tb96IJxEk7tElvn/iRffyAuH4dSTZwbTljes9f34UvUJDxHGPtrbhb/G9te0i/
	 wg1Sz86nhhn8MEk1b2YjMtXMUM+9GqHe0cjVb5K+ukmZQR3qZDyH1d6q0UrQ3lMqRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Fh3DEcXk;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B04060A260A
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B04060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Fh3DEcXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RpuvtbilrWCg9KTJTthXqHJ9fer7FGpMSuHQqfcUw/c=; b=Fh3DEcXk8MkfMQ/Asf3MWW+ab3
	ZpFjErY1Hid07VuENhQGbsSgHbaayGriG66J23HUJge80+B/u3+ad4375zBJzG9IskFYdnjzz10A0
	TouOV7y0+5ePtn9KnOLePk8UQrfBxJEVn8QiG19wJcy3a/CGJAuK3+vE+3G9uww3cnaA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Uf-005VJk-0i
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:01 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/20] wifi: mt76: mt7996: take the TWT flows of a removed station off twt_list
Date: Thu, 19 Nov 2026 13:43:41 +0100
Message-ID: <20261119124352.1842164-9-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

mt7996_mac_twt_teardown_flow() keeps a flow on dev->twt_list if the
delete command fails, for example while a reset is pending, and
mt7996_mac_sta_remove() does not take the remaining flows off the list.
The list then holds flows inside a station that mac80211 frees, and the
next TWT setup reads them in mt7996_mac_twt_sched_list_add().

Take the remaining flows of a station off the list at its removal.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 3028c92c2efb..69f1da5eae1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1985,9 +1985,20 @@ mt7996_mac_sta_remove(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		      struct ieee80211_sta *sta)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta_link *msta_link = &msta->deflink;
 	int i;
 
 	mutex_lock(&dev->mt76.mutex);
+
+	/* the firmware can still hold an agreement whose delete failed, so
+	 * its table entry stays counted
+	 */
+	for (i = 0; i < ARRAY_SIZE(msta_link->twt.flow); i++) {
+		if (msta_link->twt.flowid_mask & BIT(i))
+			list_del_init(&msta_link->twt.flow[i].list);
+	}
+	msta_link->twt.flowid_mask = 0;
+
 	for (i = 0; i < ARRAY_SIZE(msta->link); i++)
 		mt7996_mac_sta_remove_link(dev, sta, i, true);
 	mutex_unlock(&dev->mt76.mutex);
-- 
2.47.3

