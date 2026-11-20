Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196706;
	b=YIlQ94HYyfhk7nViLB5N1BzZKAP/HFnRZxJ+0rBnNsxG5V4rU3DSRn3Ty3krKP5+PYdI
	 l54eA2znYYsg7rsWN1MGCH82PD5Pp0Q+Xxix9O2/O5PYXSeot2GmVSreVS1wfvO79QOUs
	 KSqaM0mXCcVSjt2Q+mZzEnjt72cgWA6ymS38flxwStLUAQGN75NaE5OqiS9+7mCflQucg
	 HanYn9mLTcSm7NLdhru7iPfNr40g2slTAEdN1406aSFqLQmjj6lHQF5qYP3kFeUpdFl9D
	 tXFQZovOmC8nGMZ0mV2taoyoxjmpSKfuqZWOfKj0iu5k8mwpxZ0VGrAkGTybh4oAUXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196706;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n+9SnmKycOG60AnOZCA5QeiRE0IxnacLLN9d4PsyiG4=;
	b=XA28BTV5oO2EnTtsysEkqhrzEcoVQNKpFYofOPnP992dhOe60GrpoMgijx9yscA+79/b
	 1WXwRfnx/LCWOELRsXD70BBj5qquaNV9yUV5caOZXlP9QXZZcgYgpkKL3WQikAcUBIgI1
	 fVjA+0y1mIb6E3TTHUdfYtEOtxzfQUWFIQxVC7YRrdgwfrT9I+tMdKPApfIdx9ff6jEhJ
	 1k/vK22EDd+4WimawPwXoIa2G3tPihOe0wpnNaJwhOuu7ZavJBzI74Vb3CktbKGDvCKh4
	 vC5/s0d9MyM+nNSrfJRmwmqfi4nTx20AkhtEpgc3W+raAoB0NFmc1FCfAU9uG63VttA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lgvfeWYB;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC660A2622
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BC660A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lgvfeWYB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=n+9SnmKycOG60AnOZCA5QeiRE0IxnacLLN9d4PsyiG4=; b=lgvfeWYBnjwDEwrZcKxi5Yu4DX
	aAbE8jJM7MChRxghkBq8B8WgiCWySyRKIlRZDl9hgMrud7T33Rb8kLpGMRdxtDY/lRpdVHBbygOX7
	8unIQKpN9nfxSzYgKzGhR9FMLAYG6TXf9hu0jby2I3SOsbiqzjWVfMOeLbxLE2YVVqmU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfY-0065GI-1S
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:04 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/20] wifi: mt76: mt7925: hold the mutex for the link lookup in conf_tx
Date: Fri, 20 Nov 2026 18:44:45 +0100
Message-ID: <20261120174459.1657382-6-nbd@nbd.name>
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

mt7925_conf_tx() looks up the driver link and writes its queue
parameters without dev->mt76.mutex, which mt792x_vif_to_link()
requires. The first queue setup of an MLD interface thus triggers a
suspicious RCU usage warning. The link stays valid, as its only writer,
mt7925_change_vif_links(), runs under the wiphy lock that this op
holds.

Hold the mutex for the lookup and the write, like mt7603_conf_tx(). The
op only writes driver memory, so it takes the mutex without a chip
wakeup, like mt792x_assign_vif_chanctx().

Fixes: 882b97c16ab8 ("wifi: mt76: mt7925: set Tx queue parameters according to link id")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 71e441f631d1..644591b994ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2149,16 +2149,20 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       const struct ieee80211_tx_queue_params *params)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, link_id);
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	static const u8 mq_to_aci[] = {
 		    [IEEE80211_AC_VO] = 3,
 		    [IEEE80211_AC_VI] = 2,
 		    [IEEE80211_AC_BE] = 0,
 		    [IEEE80211_AC_BK] = 1,
 	};
+	struct mt792x_bss_conf *mconf;
 
+	mutex_lock(&dev->mt76.mutex);
+	mconf = mt792x_vif_to_link(mvif, link_id);
 	/* firmware uses access class index */
 	mconf->queue_params[mq_to_aci[queue]] = *params;
+	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
 }
-- 
2.47.3

