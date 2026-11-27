Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770016;
	b=4Vlju9td86jOKMVLhQ415qr5vqlthQnixSXcStKgwvnd6F3XxEhJeES9CDOdcMo+dyMt
	 W+ZaqH/kA21vWM+IEPnMu0/Tiy9YDp/kUj+Vs8MpXUmm5XeudIN6dcr40rkOlPr/ns/s8
	 Vxllrv1ihbpJy352hYehNehxEmSwjUdhJJ4rRpZxSl2N3eHP/n92jS7bX550MGZup/CKN
	 YqPPIaTAi1qFKjerx6SYpuy0DLrDaY4Y0iTBUTOPGgFQWFbsyo4H4ORhSTJwmMWhmvr3m
	 NucR+P3dqW7sQD7huxLZdxzu5xGM4CGboIF+SICtlv2PQHGyDF39fa0Ojz9+PTrhPXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770016;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y11YFF9a0Jt8KEntL0VYkFAcetbBzl5rq7x8SnM21TU=;
	b=kvrXqqokGXQWUglE80Xn+Lzw6uTh/FR7Sbm1gfpylEae4SOqhY8IVXQwHNcvBaDf9Tbw
	 1rP1pws6N3MtvY/UZ5u9LS5QPWFQQs0rwEuNzXfccHfyBtMZU8qtXsPQVW4neAehDkarI
	 g3n2sByD5f7p5vFz+k3AwkgREzJ16kWRsV4A3s8PwZLWFA5zc4Nh6lK9jbY/Hp/yQR60D
	 xmJs9Cf856/0qzEHl14eiyMARM4/pNGAPAeXPpH+RbFSQx9uVZTanzYTTpW5K6/NiT0Bk
	 QFokHD4H364OOitQCZt+WOeqLeA2qOkFQwaEWXDEKCq3RlyxosT8rrOdVE0cukt6Uiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ge/7bMCJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB8606A329;
	Fri, 27 Nov 2026 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ge/7bMCJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795770015;
	b=gO8g/GAXWF6Xwhz1AuSRzJYQ+BIojsLwKPuO9e/QJQLLLkmt9PIgfrQp3g3IAcFjf88v
	 XhdJ/pgH4DPPpMujf8V9jntfDEfrgaj2HY25PBP0/jPi0NorRBq38coQZA/f3Fn3UY3lQ
	 2J4jFXtyCNSNDTT6ULsPpJTzBrphDLhRsBhfO/WdZSy2pObD3UPGAeQ17u+rUv0MBzDuY
	 YC14edmdzIxkiN+SJ2r53azzMmU6p8cExMlgxJi5/tTISPrguC4fE5aNkUdsffGnA1Dj1
	 LcUY36/2B4BjTid7EckFl1IfFCaDBnhSdYKqZHNLIcaTWi18PsdFQ6K6JBh4vNOEEyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795770015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y11YFF9a0Jt8KEntL0VYkFAcetbBzl5rq7x8SnM21TU=;
	b=drAMRXdl3X4dsJixtxmmJAvqJ7FHoSahzvVfS067Qcw/CIFNOMalxoVsdReVzECd0ahY
	 qsfSqAMLfY1r/TL9duOZt+yBW1uctddDHwRf/j6UgOPEifpZtPvcp06ZrP7Ilk8VPBgOe
	 C79ucf40il53I4OM/1YoZqT+U0d3YhmsboX14mBtIaM5+iM3fSnD+eTR8drzpKY2C/agB
	 fwXX8drhVBRIwtHMjQrPUglgT6scINX7g6P35unBgcFeva23CIn+gzSlmb2cgAlvEKIvS
	 /FxXxY9eSprOq/RUcPj1Ar0duOvPzt7d6902hnRB8KZ2e4b2gJxxI0l3ZY7w6mrsAFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E2851F0089C;
	Fri, 27 Nov 2026 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770015;
	bh=Y11YFF9a0Jt8KEntL0VYkFAcetbBzl5rq7x8SnM21TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ge/7bMCJS/x6+suG5lpIxQeNczjivP1ARISQrIE8faQ868Z6+GGe4nYMAyaM7F0sh
	 xpCGrIJm63gvnnt+bQ2Pfu/BjOnB2Vai+81+iNkgDkL9xdBYbjXLcpgcl0iU2LexHT
	 3tAEovnaYtMmZe7PVLV3L2oigRddMZFmTwjDDixMuS1S7neSm8uthmkjcdJY3tbJkF
	 +cUmMbtpo5Ujk7ruQf7mSrRsIaeAjH32o9IbeeA0ob3z0IwadxeY+rEmjjMFLUIVtR
	 RV8XVvnhaZ2cGB8k0QaCVgEuXGdH0J3Fy/OlCUMEBCdPBVl73tIhc7Dv6C3nC91EsH
	 W0jv3MiDK8w0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0B7474B685;
	Fri, 27 Nov 2026 09:00:03 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 27 Nov 2026 11:59:59 +0300
Subject: [PATCH RFT rtw-next v2 1/2] wifi: rtw88: use the rate, bandwidth
 and GI of injected frames
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-rtw88-inject-v2-1-f9701b9243a3@proton.me>
References: <20261127-b4-rtw88-inject-v2-0-f9701b9243a3@proton.me>
In-Reply-To: <20261127-b4-rtw88-inject-v2-0-f9701b9243a3@proton.me>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795770000; l=2582;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=FhYrSNa12y54f8TuWwnmFaCq9qmcQT+x3fX15vMZZZc=;
 b=2qZllMslEIoqqQfuU7er/nYfcqlWngHobLmvSRT+likvQP3ryNUusWTFCJzTi5Q++uzKIzd7e
 wRILA2UjkkEAF5EMlUMu6YxC6QsiSIm423eQXJ+ieayraFfYCeMDGab
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

Injected frames ignore the rate, bandwidth and guard interval requested
in their radiotap header. Data frames have no station, so USE_RATE is not
set and the firmware rate adaptation picks the rate. Management frames
are sent at the lowest basic rate.

Use the injected rate, bandwidth and guard interval and disable rate
fallback, like rtw89 does since commit e96abe4fd7cd ("wifi: rtw89:
consider data rate/bandwidth/GI for injected packets"). Injected frames
without a radiotap rate are unchanged.

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtw88/tx.c | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index 701ed7c4f3f..dd5537d0cf1 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -405,6 +405,38 @@ out:
 	}
 }
 
+static void rtw_tx_injected_pkt_info_update(struct rtw_dev *rtwdev,
+					    struct rtw_tx_pkt_info *pkt_info,
+					    struct ieee80211_tx_info *info)
+{
+	struct ieee80211_tx_rate *rate = &info->control.rates[0];
+	u8 nss, mcs;
+
+	if (!(info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT))
+		return;
+
+	if (rate->flags & IEEE80211_TX_RC_VHT_MCS) {
+		nss = ieee80211_rate_get_vht_nss(rate);
+		mcs = ieee80211_rate_get_vht_mcs(rate);
+		pkt_info->rate = DESC_RATEVHT1SS_MCS0 + (nss - 1) * 10 + mcs;
+	} else if (rate->flags & IEEE80211_TX_RC_MCS) {
+		pkt_info->rate = DESC_RATEMCS0 + rate->idx;
+	} else {
+		pkt_info->rate = ieee80211_get_tx_rate(rtwdev->hw, info)->hw_value;
+	}
+
+	if (rate->flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
+		pkt_info->bw = RTW_CHANNEL_WIDTH_80;
+	else if (rate->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
+		pkt_info->bw = RTW_CHANNEL_WIDTH_40;
+	else
+		pkt_info->bw = RTW_CHANNEL_WIDTH_20;
+
+	pkt_info->short_gi = rate->flags & IEEE80211_TX_RC_SHORT_GI;
+	pkt_info->use_rate = true;
+	pkt_info->dis_rate_fallback = true;
+}
+
 void rtw_tx_pkt_info_update(struct rtw_dev *rtwdev,
 			    struct rtw_tx_pkt_info *pkt_info,
 			    struct ieee80211_sta *sta,
@@ -432,6 +464,9 @@ void rtw_tx_pkt_info_update(struct rtw_dev *rtwdev,
 	else if (ieee80211_is_data(fc))
 		rtw_tx_data_pkt_info_update(rtwdev, pkt_info, sta, skb);
 
+	if (unlikely(info->flags & IEEE80211_TX_CTL_INJECTED))
+		rtw_tx_injected_pkt_info_update(rtwdev, pkt_info, info);
+
 	bmc = is_broadcast_ether_addr(hdr->addr1) ||
 	      is_multicast_ether_addr(hdr->addr1);
 

-- 
2.56.1


