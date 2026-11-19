Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092250;
	b=WtaPZNiIeDrDIrDkulULRokHMyYWqCvhW12YZ1LefsDt/58gjYlaKwVIKGHx+kcFELAp
	 tm27tPqcYHlnQx2cn6WuzwnWP1/39AINXSSzhiRjkSPKJluzYINtiWnJZNlusHwgrGhfH
	 aiTVLc+1d6XEyeFJgsMuKbbyj5xgiWG24hpfyGK92jvd3HpIsJ3unSwQarN/NKjDReYjf
	 cRV4qvaHLxxrkCznF1N0tBaT2gxuo98jvFttvGDgKEH7VrDiD4isgHSuP1mNvt6uc1naX
	 rUjiOEuhhhNb91iQ7p8MjWXoa4DqtXPRxuMAwglMAsFqBjE3yULBE6OmR0d+XBlq7kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092250;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GbA0WaHl+4JV7wSuF5Ar1x0XQwNq7AWQw+B6bpfqzio=;
	b=d+eFLO6v60W8r95VaSLcsUEoPHiP12OJBzQoEY160AukRWG/J/iSstheCtVywXxJ6Jei
	 6rbqeIdgEJQgsJbKY37bR4jS8b2Xu4/Hj7rZ3WmSlqv515A9DA13xMoO7r4qCJA5a1PUA
	 OoXFinfIMQhjBmJATOMEjh9J3+fnjyW/BO3yWHmhERUFkznx1fzMiPhUfKq/g3ZZDSJKn
	 63UY1gSK3DfKKGltK/FIyfSQ9nRr3k02su44fpgyUgXDs5AaN8e3yjOInQWojlg3nyBUG
	 qRh31OE9H/xH/IO0ybWRc30yypCEVEV6godv8xA7jQiJR+TP6TDyk/LYtZR58KzW+7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bQ0BPZwa;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DA60A2617
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73DA60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bQ0BPZwa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GbA0WaHl+4JV7wSuF5Ar1x0XQwNq7AWQw+B6bpfqzio=; b=bQ0BPZwaMCLG9S9bjUHGzYoCIk
	PR++gPJWnNiRznlgH8ER9LuxPcuMdJ7o/vPrQerLGWDuRwRkvivr+Kf2r5fvBsSd5I4rNhrLNWnkV
	vI+vjDh5vYS/AYmWtUnRZ65clIjCTCAM+X3VoT/gNm126a/D3jXcm2AmLZ9P9O5523d0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ug-005VJk-1D
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:02 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/20] wifi: mt76: mt7925: keep the antenna mask across a firmware reload
Date: Thu, 19 Nov 2026 13:43:48 +0100
Message-ID: <20261119124352.1842164-16-nbd@nbd.name>
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

mt7925_mcu_parse_phy_cap() sets antenna_mask and chainmask to every
chain that the firmware reports, also when the chip reset of
mt7925_mac_reset_work() loads the firmware again. A mask that
mt7925_set_antenna() set is thus lost, while the stream caps of each
band still follow it.

Only set the mask of every chain at the first firmware load. On a
reload, keep the current mask, limited to the chains of the reloaded
firmware, and build the stream caps again if that limit changes it.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 218815e64a81..cc7a020c14ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1122,16 +1122,28 @@ mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data, int len)
 		WF0_24G,
 		WF0_5G
 	};
+	bool changed;
+	u8 mask;
 
 	if (len < offsetofend(struct mt7925_mcu_phy_cap, hw_path))
 		return;
 
 	cap = (struct mt7925_mcu_phy_cap *)data;
 
-	mdev->phy.antenna_mask = BIT(cap->nss) - 1;
-	mdev->phy.chainmask = mdev->phy.antenna_mask;
+	mask = BIT(cap->nss) - 1;
+	if (dev->hw_init_done)
+		mask &= mdev->phy.antenna_mask;
+	changed = mask != mdev->phy.antenna_mask;
+
+	mdev->phy.antenna_mask = mask;
+	mdev->phy.chainmask = mask;
 	mdev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
 	mdev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
+
+	if (dev->hw_init_done && changed) {
+		mt76_set_stream_caps(mphy, true);
+		mt7925_set_stream_he_eht_caps(&dev->phy);
+	}
 }
 
 static void
-- 
2.47.3

