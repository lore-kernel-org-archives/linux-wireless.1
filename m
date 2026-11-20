Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196708;
	b=M9xsQcirKYfJGibFB2uiJTctpLY9wGHOvpGbI0lVIn4+gNEece7/JGy9Iv4TM3VVNRXO
	 WnRHbXKDIh8o4CLWKtyuYPDlX7zc0h4r6kpyTW+rHM/4Zck6Q1Oaa38KrwulqStE88LvD
	 HV/6Yr3ncslZERJCYXCYb9eoZRJkeR8TxZmYuXzAih7ZLdRdefSblysXB3xu8qnqPk0jd
	 PhS0Y3t4CaoASzm43xvL3QTLZvXivYdR7jZjouo6cTxOS0Q9Nea5l3mThtZM7Ei1zVq9u
	 ISJ2Fg3kC9KQEY8184B95ZkhrEVLruEwmsiNfyhGve43To7CORY6FlzIJoYQ3I594zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196708;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bB00txwZVbR+XcMLh7dI5+mDf40ukQLbJ8kYGhhcW4E=;
	b=5INCNiu5+SvTbj9VYErKZgDKZZjMdJ46EAAwULto6lcYJmXOHdlxi4bpjuCoKEBEvuPn
	 0JfH3wjaJAV9BEJlqZTIyYGvXqW474bYGjhUh15Hls2lpAFAUNexJuhJ2rLioO6XRXbZh
	 maTa3/bHP10Vv0mkSPMrskzbwoXpUv0WQMwUkCRxTbL2pidym9hxSF8Vdl3atNwGTBLwB
	 8kvPgsc8lUqWg5IORydk6VEc/MCKctQNFYylonVGiz+uGJ1S/s0C7GeSNL8J47HvdK241
	 QpnsURTHH1ArhD/pPYNP/4m1AKk2AZ8oI8cRDaUx0wzT2V0Gdmnzt73ceG5xNH+Ifhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lBvPKHmj;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873360A3809
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D873360A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lBvPKHmj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bB00txwZVbR+XcMLh7dI5+mDf40ukQLbJ8kYGhhcW4E=; b=lBvPKHmjGVCWI/6jc/xCTwKk2H
	IMQGk28jH9VYiwR/W0M04OKmNimfvM4dscgSAY6vXRaG2jccJGXEPSmBtg0ZkKLapbgYsE0+K4RlQ
	hUJkF9DE9CgULQovqSIRDCvdWnuR0BXBLVh4x5c2RAvX/pYIaIzyOcZuX0HvMg2eRyxw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfa-0065GI-1j
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:06 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 18/20] wifi: mt76: mt7925: wake the device to unassign a channel context
Date: Fri, 20 Nov 2026 18:44:57 +0100
Message-ID: <20261120174459.1657382-18-nbd@nbd.name>
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

mt7925_unassign_vif_chanctx() takes the mutex with a plain mutex_lock()
and sends mt7925_mcu_add_bss_info() for the default link of an MLD
station without waking the device. With runtime PM on, the BSS removal
can thus reach a device in power save. Reachable whenever mac80211
releases the channel context of the default link of an MLD station, for
example at a disconnect.

Take the mutex with mt792x_mutex_acquire(), as
mt7925_assign_vif_chanctx() does.

Fixes: 621e9e22b8d0 ("wifi: mt76: mt7925: add mt7925_[assign,unassign]_vif_chanctx")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8c9c77bd97b6..fa5628c06b04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2800,7 +2800,7 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_bss_conf *mconf;
 
-	mutex_lock(&dev->mt76.mutex);
+	mt792x_mutex_acquire(dev);
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
@@ -2814,7 +2814,7 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	}
 
 	mconf->mt76.ctx = NULL;
-	mutex_unlock(&dev->mt76.mutex);
+	mt792x_mutex_release(dev);
 
 	if (link_conf->csa_active) {
 		timer_delete_sync(&mvif->csa_timer);
-- 
2.47.3

