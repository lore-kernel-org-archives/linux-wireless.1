Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795894939;
	b=pvCX0FqIYemPIKzlbIkKNBl8IrOXJmFdbDCBgYF1mzjadQCOVf6nWoBrEKdxSy+9p6sd
	 bKJl9P0yljbGYFe/YXIxvKDj1K3529HM1Vygiev/rBib+UytD+rYwU4Vrz1RlFU8B5iW1
	 /mC+AjFLDTJwtGq2mmPiGIQtxrKvXCPgdJelFwVpoGh1x1d+3aecCfgWmJbX8TJaVqDOh
	 t6nC/xFlce7C5YDph+U3BZG0fV+WB7BRJ0oP7br3zy7z5JJ/VHjomMghk5uO4nv99kSi3
	 BJ1NEcFbkAAISzdi6hqvf2lCpu+1V2ugb0d/oyyAh6/lXL1kB2K3p+xwHVL5tJdzxxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795894939;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yc4aQU4Z2umIOixBjzcc/grxTT2lvTaAOsI8iPuYlZs=;
	b=X83GKmPlMajkdS3vQ6YeGAvxkMZjqMhCy4ed4vuw98DOYbLzKYFPIe8cUwSKRp7mM9kE
	 uo1FmCSD8geh4vvkRzuuQEyXPIRcFOHtI0lhAqjejqlOaW8XzxoLuWkJ7skFV7r2lN3Lt
	 Oo0aJqA6A/vkSPcEhHQqiUdYScwAwy9Ep779uGEXAlMP+jOdZlXc8uARtVuQ/UAot6vFn
	 u3NrmKCRJh83GC4bYIDV/4SQ1QuAU6t5fGCkKnK84Jy+i1FOgwWFRcnCLTk9svFiQ9Ko4
	 6Me9/I8JVpNEK/qqmil4maJzki2ykT14kojXrCxQtAmyb+1L9j2JoEYkidWcTdsjesg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=EjAeTiQB;
	arc=none smtp.remote-ip=91.218.175.41
Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4160606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 19:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4160606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=EjAeTiQB
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wT6c+fm13r/1iGTmDcWgCwjizK8UPHsnrodf/FcuW78=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795894936; v=1; x=1796499736;
 b=EjAeTiQBwqfn7QxvPEVJlhKsfC++8wHIySNgVPo/j+9fF3xvilqVC6F67DHflOO/jAZcdG06
 04x+6Lx+QTR6QBYv58XGTHcaABo3PHDx7dc+jg6PIywFvxcwnLt4C9QoIotrNNDpT3G56OmeFJG
 Fg0QuZWtjHo6FnuREWdDWIddJzMBOyIx0aiExl3rf7+UGvy8tPrs+OmUp/CjvDgX8Z/79Ea0cfD
 ExynBjpITwW2wydwoJQY66Pey4uoXWAUBJ8YqzPs8rT03OWVz3HEUA76f5w+oM1An94ZA5wXMaF
 GIZQxotrRDrEoVnzLi8s+yHj8Ndpd7bA1HDEpREJyvI/Q==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a819c9e664db38a;
	Sat, 28 Nov 2026 19:42:16 +0000
X-Mizu-Trace-ID: 5a819c9e664db38a
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Aaron Beckendorf <albecken@mtu.edu>,
	martin@rfdeck.de,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next 2/4] wifi: mt76: connac: honour injected short GI, LDPC and STBC
Date: Sat, 28 Nov 2026 12:41:54 -0700
Message-ID: <20261128194156.112602-3-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128194156.112602-1-lucid_duck@justthetip.ca>
References: <20261104142737.186484-1-albecken@mtu.edu>
 <20261128194156.112602-1-lucid_duck@justthetip.ca>
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

The short guard interval, LDPC and STBC asked for in radiotap are
dropped on connac2, so an injected HT or VHT frame always goes out
without them, unlike on mt7615.

Honour them for an injected HT or VHT rate. STBC spreads one stream
over two chains, so it needs a second chain, and the rate then counts
two streams on air, which is how the tx status decode already reads it.

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 3d0596868f0d..0be7efef02e1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -657,6 +657,26 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 			}
 		}
 
+		/* short GI, LDPC and STBC requested through radiotap */
+		if ((info->flags & IEEE80211_TX_CTL_INJECTED) &&
+		    FIELD_GET(MT_TX_RATE_MODE, rate) >= MT_PHY_TYPE_HT) {
+			if (info->control.rates[0].flags &
+			    IEEE80211_TX_RC_SHORT_GI)
+				val |= FIELD_PREP(MT_TXD6_SGI, 1);
+
+			if (info->flags & IEEE80211_TX_CTL_LDPC)
+				val |= MT_TXD6_LDPC;
+
+			/* STBC spreads one stream over two chains, and the
+			 * rate counts the streams on air, as tx status does
+			 */
+			if ((info->flags & IEEE80211_TX_CTL_STBC) &&
+			    !FIELD_GET(MT_TX_RATE_NSS, rate) &&
+			    hweight8(mphy->antenna_mask) > 1)
+				rate |= MT_TX_RATE_STBC |
+					FIELD_PREP(MT_TX_RATE_NSS, 1);
+		}
+
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
 
-- 
2.56.1

