Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795894933;
	b=rdcJ2hw03bdX1sbxYG3utUpbj/E3/+2TpmqttkioWT+G+NbpnoJ/jhiHVb2wf6P7MRpD
	 kJbZcLrrtEn4GVij/cp59btpbIbRq74ZC4YvedKhaNUj5d4xSLCMmpy1VDm/845ofl1ld
	 8j/XGs6NK02Tn9FSXlD07eH5DOTuq8V/OpEG1T+geDkZ5ou9cqjSTPYNbuZ8Z5a50VaHK
	 /g/TIGfxPUwRLREW0gKsNAWjv8G2WmD2Ut/BCPTif7N+cYlMDyG4v9O4qxyvTR5m662Ol
	 GB1kgCjW64SQucWqZ1bWuw1fayokUZ6aN0f7HxHA0MaoG7kw7ExqlIn/o6XHC/7HMag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795894933;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bkxCIZVOlGlH1oNVzUX629cNySCgjVZ4/vU/+YCnoqM=;
	b=sIlkYUa2qxK12AspiVbfLHjjN9yk+H7MZR8NJev64vlhsmtnu6x55YTt+IUCAAEGhZkL
	 QJb2jb0/ee3kVNQUJcCY89Ip/aC02y9fQZpufLMLYTVOGMnhAL2jx+9fLo+BD7dwJTp1s
	 Zx2Rr0DzMFMri3mLFQ+Y00BCxWsz0l1pmgPb/xVowDPejdqhBZozNvdS9vJ0hvTWzKXYU
	 LuYQuFM1efrMA48fgiWNE/m5LFUADC3F9IArS/ShnmoZDC1Mvr7DMoNRkNdY4fsTSA8gE
	 1V1kJp5kTdZW/Ih9ARXyt68tac6fMDoJUEjW9znMGBvm5Ql8Y/cMn0TE7dqyaXIyp5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=e7qCj0hJ;
	arc=none smtp.remote-ip=91.218.175.39
Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29944606A329
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 19:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29944606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=e7qCj0hJ
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o04tTOLnbPq4meHSZphWu667HlB3Vb4QOKsWShHrYkM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795894930; v=1; x=1796499730;
 b=e7qCj0hJMIC8/AM90kZuT1VSXnyXstVcgLA7IZr3OXCmFcO9/0roBuh96C2dkIQucJlW0T1Z
 0yQitgVZC9LKGtWS6Q/T5Y1aFLxmGga94yfKKz9OrRbxAI4BtW5LeKpw0Yv7bjgnY2GPSUzFu6S
 5Xnc071o8xwzAirYGbhkgZ/67F6PlujygDAVWOPKQjprAguCKEtPZZwRGCT62zjIVrpTL8uxio2
 fI/PtB6TOELMLqtKzoDHFf7KCradRflI6d381PXaNMzAisNPIjFZ2/RDmSz8hW2G6ZZtnIta4U5
 j6GTI5FOb3KlCrDKoXbKWFz2S8KEaY6BaIrrUUjQaBmkw==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d45ae4c9c43b4525;
	Sat, 28 Nov 2026 19:42:10 +0000
X-Mizu-Trace-ID: d45ae4c9c43b4525
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
Subject: [PATCH mt76-next 1/4] wifi: mt76: connac: honour an injected legacy rate
Date: Sat, 28 Nov 2026 12:41:53 -0700
Message-ID: <20261128194156.112602-2-lucid_duck@justthetip.ca>
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

An injected frame that asks for a legacy rate still goes out at the
basic rate, because only HT and VHT rates from radiotap are used.

Look the rate up in the bitrate table of the frame's own band, the
table mac80211 indexed when it parsed radiotap, so a legacy request is
honoured on 2.4 GHz as well as 5 GHz.

Key on the injected frame and its rate entry. mac80211's injected rate
flag shares space with the tx status area, which is cleared before the
descriptor is written.

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 33c5fca45296..3d0596868f0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -636,6 +636,25 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 			       FIELD_PREP(MT_TX_RATE_IDX, mcs) |
 			       FIELD_PREP(MT_TX_RATE_NSS, nss);
 			val = MT_TXD6_FIXED_BW | FIELD_PREP(MT_TXD6_BW, bw);
+		} else if ((info->flags & IEEE80211_TX_CTL_INJECTED) &&
+			   info->control.rates[0].idx >= 0) {
+			/* An injected legacy rate indexes the bitrate table
+			 * of the band the frame goes out on; without one,
+			 * mac80211 has put its lowest rate here. The injected
+			 * rate flag cannot be used: it shares space with the
+			 * tx status area, which is cleared before this point.
+			 */
+			struct ieee80211_supported_band *sband;
+			int idx = info->control.rates[0].idx;
+
+			sband = mphy->hw->wiphy->bands[info->band];
+			if (sband && idx < sband->n_bitrates) {
+				u16 hw_value = sband->bitrates[idx].hw_value;
+
+				rate = FIELD_PREP(MT_TX_RATE_MODE, hw_value >> 8) |
+				       FIELD_PREP(MT_TX_RATE_IDX,
+						  hw_value & GENMASK(7, 0));
+			}
 		}
 
 		/* hardware won't add HTC for mgmt/ctrl frame */
-- 
2.56.1

