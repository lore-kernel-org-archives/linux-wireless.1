Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628187;
	b=Q/Po88ayxvCd8EAe6zLQ/AxShsh/kPPQRwrDkuBCkRX5Q1WNJFjccug6noCIPrT1vofR
	 H49z9qs+vbzLJlc1RHQd8SYAItwIy5SZQcmjkHfvGQU0FUcec2nTmtiNI/wnBoVGyNfYD
	 y47qCIfcKbC8leUSiNSPQLQxV4x7Nltpm+xtIAcPHzB+KFF327nhKwarqSM7mdzrEHWsp
	 O4e0fEf4bU0DERlejAEUd+1r+3tkoBD6vpI/ZRbF4giuy9JMUFwwBTwMKDEMWxEX2LQAt
	 PeFoyo/FJboUDqsHjXidrfA6igHfXZoFYDMtxHDBd2T9lQyrrtxZjg0FVdh2G3N32gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628187;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=84fe/NsQMLGF3RP8VC5YuBXqa1iJdMKg2HoOYXZ7Wlw=;
	b=Ot1Fbk4vPZldqZPCV4p+1CNftLZqeEI3mb5pNso0UZPP5VuDA11EweVM5UYxgy6bZSlV
	 RO1/6/LXDLCx9AYSB/qtvPmnr09Ez11xmk23RTLEXMPMARK0+Y4HsyJMaxos9h3z3td1G
	 OF1Yb8IUSIJtAB9Bcp+jILd+zUN1oEUo3uZST3nldmG5u/K11TwdcX/6vDf/KB+RZ0+ps
	 76AnDP3NfHaGiNBUxJisjkiOolccMFivcsxIU/AafC/PDsUG5PI0P+dpXq28oovMQOZF2
	 lzmHQc9X8/PSyHWEc23pzE4DKRPG2DbK3WAM/fWJ+maOyEAkj0CwRP9nGlaM/Mv3bbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lU7xNsR3;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB29606A329
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB29606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lU7xNsR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=84fe/NsQMLGF3RP8VC5YuBXqa1iJdMKg2HoOYXZ7Wlw=; b=lU7xNsR3evE4IIwDMxkq9H3Vv9
	R0MsxOsFkkmEitvfLigE2F489R6hPMXhJEQfn84uYybbZFSlY0swVQ1ktmZx1SN+zuWKrZMrw0aFo
	6cr9cOMs58D2Q8Xc3e44uo6pzXeu0Lok60FGYRRyY8/JfXCmV20QQa2DXDfU8HbueKBc=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuv-008IWP-2Y
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:25 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/18] wifi: mt76: mt7915: keep the BF column count within the row count
Date: Wed, 25 Nov 2026 18:36:02 +0100
Message-ID: <20261125173616.3776951-4-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

mt7915_mcu_sta_bfer_vht() sets nrow to 1 for a 160 MHz peer after it
took ncol from the streams of the peer. mt7915_mcu_sta_bfer_he() does
not limit ncol_gt_bw80, the column count above 80 MHz, by nrow_gt_bw80.
The firmware refuses a STA_REC_BF with more columns than rows. A peer
with more streams at 160 MHz than the row count gets no profile.

Limit the column count to the row count in both pairs, as the driver
already does below 160 MHz.

Fixes: 89029a85482c ("mt76: mt7915: add Tx beamformer support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index bb71e6437a62..d3842268a638 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1230,8 +1230,10 @@ mt7915_mcu_sta_bfer_vht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
 		bf->ncol = min_t(u8, nss_mcs, bf->nrow);
 		bf->ibf_ncol = bf->ncol;
 
-		if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_160)
+		if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_160) {
 			bf->nrow = 1;
+			bf->ncol = min_t(u8, bf->ncol, bf->nrow);
+		}
 	} else {
 		bf->nrow = tx_ant;
 		bf->ncol = min_t(u8, nss_mcs, bf->nrow);
@@ -1299,6 +1301,7 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta,
 		     pe->phy_cap_info[4]);
 
 	bf->nrow_gt_bw80 = min_t(int, snd_dim, sts);
+	bf->ncol_gt_bw80 = min_t(u8, bf->ncol_gt_bw80, bf->nrow_gt_bw80);
 }
 
 static void
-- 
2.47.3

