Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018712;
	b=CbvsfOC2b0K+NrjzFX7TujJaVSXpc/0hfRE6EFlvUh6X6mxMSwy0birDkoVjjxNEkxvv
	 /SpkKChbGdVUuNCv7i1d4hEp8wQ83rjXxAdRyE8kOJoa51EKKlWbbRCC7SvVXGo0TR1VU
	 DqpkZ4Pm09CmL7CwzWM3IcvD7jaL9eOMqYs7UCtt0R48Fk3ocgjGgP/lF4mwqTr9qRLuM
	 aOnNZmzXCklYrMzrhXoOvZGoM1oFtHLueSlf2K8mlUzvQB7aLi1yl6Yg55KeJw3LpqylL
	 LfPi5KfsZgARy6cTGMv4h+JFNQGLy8Ry5DyVrRiuAQ1yoKp2yD/K6+ws9DI1Z1we2Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018712;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbMq2bcCyqysdselhl/fFdYuelZ4YrYyfet048xyi8k=;
	b=y9fesFGqjmIwh5CXb1MdBFllnIhT2oi+nlRw0GibUPGBpad3cIw7zhfPL+FLh7aS60r1
	 Sou1NIimnwG6QHK9V13vVFlP2xf3VlvY5GcYnQmRPsYVWE0pcnNo0vurC8E6MO+gAVODB
	 otVwtCD2sm6+8ZM5cL0nxCPOAo4i2b3sGW/ihJk2/x09nI4nE5VmqeLWXG6kuSOQefn8u
	 RMRRvVyva5yTwrk49tgBPGyd4A9GX9/NNcXQnyunO67tqNeOsZez3dAO+CICagTfFOCfC
	 7qrUbRmmIVf4+Jqeb+hLpToPh9EW/EmeEhho0oEkZZI0aHcl2A6wWMZ7rKAnu2gzWnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=NtLfYQRx;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC9606A338
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCC9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=NtLfYQRx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rbMq2bcCyqysdselhl/fFdYuelZ4YrYyfet048xyi8k=; b=NtLfYQRxCz/DGvkJqS4sfXsf8Q
	BYNF5S6+wj/ZhMrULGsYsO/C0Azi9l24svgz/Xsu4xoyo6SKhYUIRteyuBDs5xtp7kosqqx1iSQa3
	ALVYtW0JIW0EKmKuY1JSfiS+334CNjGcChS5JptlVhOKK7pQZSqZfHQGYdMq8CjCGLt8=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMh-00552s-03
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/16] wifi: mt76: mt7996: install station keys on a link without chanctx
Date: Wed, 18 Nov 2026 17:18:19 +0100
Message-ID: <20261118161827.1208649-8-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt7996_set_hw_key() returns early for a link without a chanctx, also
for the key of a station. Since commit e8c819df0243 ("wifi: mt76:
mt7996: Destroy active sta links in mt7996_mac_sta_remove()"), a station
MLD whose active links were reduced keeps the station links of the
inactive links. The hardware can name the WTBL of such a link for frames
that arrive on another link. After a PTK rekey that WTBL keeps the old
key, so the EAPOL M1 of the next rekey fails decryption and the AP
deauthenticates the station.

Only skip keys without a station on such a link. The first of them
updates the BSS of the link, which needs its phy, and the link uploads
them when it gets a chanctx.

Fixes: e8c819df0243 ("wifi: mt76: mt7996: Destroy active sta links in mt7996_mac_sta_remove()")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e6b81aa890f4..2c09351a56f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -212,9 +212,6 @@ mt7996_set_hw_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (!link)
 		return 0;
 
-	if (!mt7996_vif_link_phy(link))
-		return 0;
-
 	if (sta) {
 		struct mt7996_sta *msta;
 
@@ -226,6 +223,9 @@ mt7996_set_hw_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		if (!msta_link->wcid.sta)
 			return -EOPNOTSUPP;
 	} else {
+		if (!mt7996_vif_link_phy(link))
+			return 0;
+
 		msta_link = &link->msta_link;
 	}
 	wcid_keyidx = &msta_link->wcid.hw_key_idx;
-- 
2.47.3

