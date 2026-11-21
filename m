Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262972;
	b=ZAqWiRs4FHsCgh6EBXEGiO/quhm0+9d7Ppmmy90r8wNcohoCuZ340HR2wgnWS5N/fDRK
	 MdV6h5DzTz1ZVmzjIG8XYOpMuC9rtRGOOVaRq+HeMWmqzGlA3Vv1w9yyrQLe+aTQb9CEi
	 ncmfZH6JSyqKA4IWZeI9OGDxbls04FFu2S4r2oVTTkDnq58ceQ79y3XjzlMothR1Jo4ru
	 WB++EKafe1graJPR514y/rqRGbs5u0XOkSrF7A9ub8L/qF4ZiYC/HwCjkXXeeXdfpITEj
	 njdFmIQDFpRtiY3OgorBi/m08StDs7lnXO4NYpcyjU0i/I1NAIxpWq/RmMGrf6imhBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262972;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mDuBirDNL0pPx22AQirU0K+llS1M1bH5lKlBxZEdJsU=;
	b=UmyZo9JZn8pdBjvRjyUpMWejMrGlNbz/Sje0sXTk6CoWAPDeQeHjb/w+iRAQeLlxtzq/
	 oOhlzrj7k6T/zgspyAPy02Ktyt/qjo8YPeTHW9dJfdV0kBan8ZvQ6vlnlOV2iYAcc5y0H
	 8wnBkok92TAnPCfMMLWQNVCy80D32G8sisFJK0mVCmpjoxUpQGbYj1HDpvhrRgkPo7ERF
	 TF/u8fa/H8UxUDQ4rfrzDFednizgLdn1hscJgjlqP4drtae0xprw3dG1kKFrRQrtVyqzk
	 MUWxcu+fCYCgEDvfj26Vy5f5i/7VEuzgYXKaUkoPb2oXw9JyvIy+dKlO47xa383aCGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=n4mtIomR;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD0606A699
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CD0606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=n4mtIomR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mDuBirDNL0pPx22AQirU0K+llS1M1bH5lKlBxZEdJsU=; b=n4mtIomRc6Woj6+1jS7v7Cq1di
	L3JjLZl7wSS5bF4NrJKxUUtyiiFngD9Rr408w8bGnPGgA7W1ElQ9ro//rdBOHFlBhyLFooxKCnFyp
	DJlTzbX/QG03e14ZnS1TgZLDgDC5hlVqYGY9ek1Ht42JWFP8MQB0Zicm4RWGdTy7VApE=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuM-006Q1I-1S
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/17] wifi: mt76: mt7996: abort a background CAC at a full reset
Date: Sat, 21 Nov 2026 13:09:22 +0100
Message-ID: <20261121120926.3603979-13-nbd@nbd.name>
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

A full reset reloads the firmware, which then runs no background radar
chain, and nothing tells cfg80211. A background CAC in progress thus
goes on without radar detection, and cfg80211 marks its channel
available when the CAC time ends.

Report the CAC aborted to cfg80211 after the firmware reload. cfg80211
then stops the chain through the driver, which clears dev->rdd2_phy,
and user space can start a new CAC. A restart of the chain would leave
a gap without radar detection in the CAC.

Fixes: 27015b6fbcca ("wifi: mt76: mt7996: enable full system reset support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 62f3ac2b2cd2..cf8d57b7b5bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2555,6 +2555,9 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 	if (i == 10)
 		dev_err(dev->mt76.dev, "chip full reset failed\n");
 
+	if (dev->rdd2_phy)
+		cfg80211_background_cac_abort(dev->rdd2_phy->mt76->hw->wiphy);
+
 	mt7996_for_each_phy(dev, phy) {
 		phy->omac_mask = 0;
 		phy->rxfilter |= MT_WF_RFCR_DROP_OTHER_UC;
-- 
2.47.3

