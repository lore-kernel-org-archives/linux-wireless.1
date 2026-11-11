Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364075;
	b=0EiKrhr15Qgi9x4tSy8A49zJF0OrrNtm5lc4d11otbcXAwggceZGzm7EDBMXrluogLK+
	 ML++FIeDCwmH1hpfXEXARONaCGGTI4l1JaUWPO/XOiDtoZlzZ8jpqV6z1iUBFYhYETaRr
	 sjl9ai4J/mLpTGo7vIZKjqCSzIJt3Ws6O6Ear9zhbbGTnCA0s4OwsZmdinbL9TMt4KXH0
	 JFnG7O7dilznQOn6P+YQ8XzHrH6W7dXb5YhlnHdnNY+fedeVffq2TTlIkE9Z94+BTAGDE
	 KeQnXzkmrYdHhPGNiEJkNS6+xWsIHSGscyOrPUqrY69g6/KmtmS1yWX7/FmfHsqvVBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364075;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=L5I1B5dReJ4xQ/aiPXnXg5Jumcrt0D9+GNfIpCmigU4=;
	b=tTUS6jgfHcxFmn69tjpuLm9FErJyVT5IrrOfz9fRBqV4wbj2RUnYyj94ANUl7aMEG0c7
	 IsMipBBRPPQgSK/IqksDTNsr09akA2CTleSbknKWR9PWXhYTe2zyLq2fu4O9WJM32BTjQ
	 UJiGKDSQwvWS9YzY/xYAzkVhmZ24O24tC3/F8SR5bK7GJuEiA2F64q+6YQZkWFXNmIpjV
	 o54yElI+SOwPnoZv1WDbVgdN5zQKLKN7+to7ZLhEaAmDhOFahOb9qlEj0S5iuSQbwxARe
	 XhAR+c1e+FcYUBrej0lkvlMfG/IIro8qYA8lJ1dbP33S5uu/8PkXpK9TAR538uFdcrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=e9ScvAs9;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A2606A320
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 02:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242A2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=e9ScvAs9
X-UUID: 7e789c1add7711f1b1788b6acf885367-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=L5I1B5dReJ4xQ/aiPXnXg5Jumcrt0D9+GNfIpCmigU4=;
	b=e9ScvAs9P+JQLsbEcs3azGmuXw6kn4O/OEq28pCTk2lspXcSu/pO3ULw8jj1yv0n/POP6NR6MvZJm2YbzvVuf67a0QIJwXKX3zNz+nXaYYdG8hDeIcx8UWLDWKqLefBHREuf/3TCLNN0vC3lG2uuo0z+CqUGDiL2kXnIhToHNoc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b5ff702c-43db-452a-b7da-424e9abe2053,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:1dfebb5f-1b4c-4860-998c-597777959174,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7e789c1add7711f1b1788b6acf885367-20261111
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1829346027; Wed, 11 Nov 2026 10:27:51 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 10:27:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 10:27:50 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Yung-lun.Chien@mediatek.com>,
	<jb.tsai@mediatek.com>, allen.chien <yung-lun.chien@mediatek.com>
Subject: [PATCH] wifi: mt76: clamp channel power to the s8 range
Date: Wed, 11 Nov 2026 10:27:49 +0800
Message-ID: <20261111022749.784001-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
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
Content-Type: text/plain
X-MTK: N

From: "allen.chien" <yung-lun.chien@mediatek.com>

mt76_connac_get_ch_power() computes power as an int from
2 * ch->max_reg_power and then compares it with target_power through
min_t(s8, ...), which truncates the value to 8 bits. An out-of-range
max_reg_power would wrap (e.g. 300 becomes 44) and could lower
target_power wrongly.

Clamp the value into the s8 range when it is calculated. Regulatory
limits are far below that range, so valid input is not affected.

Signed-off-by: allen.chien <yung-lun.chien@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ad53bb60d5cd..f5215fa27faf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2168,7 +2168,8 @@ s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
 
 		if (ch->hw_value == chan->hw_value) {
 			if (!(ch->flags & IEEE80211_CHAN_DISABLED)) {
-				int power = 2 * ch->max_reg_power;
+				int power = clamp_t(int, 2 * ch->max_reg_power,
+						    S8_MIN, S8_MAX);
 
 				if (is_mt7663(dev) && (power > 63 || power < -64))
 					power = 63;
-- 
2.45.2

