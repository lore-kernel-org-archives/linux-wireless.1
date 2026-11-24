Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795509164;
	b=d+idf9cChFbdSa3u+F0s08SmgvoR/AyW9d69FGwyCVRV3SKLrXHJBpDnmDHFxW40pagY
	 2dNhPAoycLK8Hsb5BB37/zWjfQZA1xtpPeiZvlEe8ub7M6mbcRI0wXYKF/LmPc4awDtH0
	 bZL33Tb3LyEwzL4cXY9Cxs4rB8+kswpzLike/2xyOSEW1dPX8WcCPWiSxt0E81/8wKOa9
	 SRnKyDakeitMZuoQemDp/e6I5vaBLJMY0JgBBQ1KFFfMueutHvMMBeQMCD3ts+5JLy3+i
	 EWml4oawTVkxswWRcrgXlvZLJJq5PHi95TKbNruQqc6vkKsBzSrPoV3N0gXoWvWgcKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509164;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y11YFF9a0Jt8KEntL0VYkFAcetbBzl5rq7x8SnM21TU=;
	b=cs5lI0YBStoab0ayKirbpC4YOvuMPM+SbzDOA3h40yShu8ZyA9o3pqfmY2xjGb/fc9TK
	 K1xb9iloCJlKqyzdFWx1PWTQsz7ZtKF/UAO0+Bz3T59mnPCxDkQwX/4WKXz/YEUKnc2z/
	 vPitqDL5zRAECl4GqEVc56L3I2Ogw1Q/Djj2sunhnuLIHsM4IueZ++8E77AIZUKTkap9R
	 CybyefwKmbcrWOY0g1ffsG1VJHEwd8PLBS1KjViJBCarsowoJ8n2ntM6P8NAkto+6js+j
	 Cij4gUmPXK3GH9U+RrjfPSvoxNvSSiJAJ0Lh9HIUnwLqf3tAratnz/i2jUhQ5/02e+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kXbY975/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9E606A689;
	Tue, 24 Nov 2026 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXbY975/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795509163;
	b=2xWvIFoDItsoV9uQ/XDVE9ekjysKla/WkJOwDIksQBbn/kP8Wql78fXMAG7nvoU9J5qp
	 Za9fSwG8nm6XDKA/a/B8QI+U74iELHUl26WtaPRJarIKHvc4Hk+oa0qQCkj2vikF3DvWi
	 ATjavL9xzHG+BC8WOXudecw0/M0YvesmqHek406K4fl9mIlapuh/gPdM+v3u27d7FHuob
	 +qUXYUfyIGnfgyd0qKbaGVS4jg/veBDdzpEmCb4Dnp07ABMKZZ57AIVodg+DH+sPLLvFt
	 Ie3gppXX5uZkIY9D/v0tpKh6wseb1nMy/Ayk4+/qA31gfs249GXCayOGX19OxtTLVVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795509163;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y11YFF9a0Jt8KEntL0VYkFAcetbBzl5rq7x8SnM21TU=;
	b=eQBKXZ//h3yv2sZiM7LbpsZv9qO9Z5+6qJ0WmFGdfMmiglj9Ud4qEgIE2U1N7Yh7rTdn
	 l2kOpP3vQZGECZgpglsY/S++7ZE9K2GJMXFf/byk8Ac63U3HKC/bgLYpXIdU3P6AlyGnh
	 XVgvaplg+hp+p7l2vmbieNmgb2D+F2D8ZYXwJUsL9h5Bk6rzugxBf+iTaIxzkuXGVMZnV
	 TIoj5opQB7+rtVBtiWozTfobM3nCGwzXkwsiNDKKJULWkKgMBM4TCwvjw2FhmauK+CDlA
	 LDLGj6araJTQLuFZPHn5Cy9rY6JYN1d+QCvprpo/FJs9vQ8fVSVPZihyDLzmG56Qj3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 827691F000CA;
	Tue, 24 Nov 2026 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509163;
	bh=Y11YFF9a0Jt8KEntL0VYkFAcetbBzl5rq7x8SnM21TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kXbY975/6sui9bcjkH/Yv8kQFKhTvQn9vj0dwfhFEBGn+DUmqN96ErOt6sQY7rq62
	 I1vm56uO6+qre1zl3QKtaEgcnP49uIZUq19bo4OjbO3bBaRxOEKS/3UddD2JaipW01
	 Uhj5QOTBIltJXXeSJs3+s+fQ9v/zqHEyzT7Utt4wSGGai+4CQH6a+6UpsV7kfWT19/
	 qwtD2+QES6OJivorgN0eVYoVBUBWRW3MHlsLOA+1OfVQ/2Ky0aSZ4PacolqYFPyQ5+
	 8sSMP2x5G+d/bwn26CUKh/TeJriMzmhUE/gFnokxXJCgyDxrEr1BJWaYFjTw+v8olK
	 QwG25f6gHJtig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 06B094C949;
	Tue, 24 Nov 2026 08:32:33 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Tue, 24 Nov 2026 11:32:30 +0300
Subject: [PATCH RFT rtw-next 1/2] wifi: rtw88: use the rate, bandwidth and
 GI of injected frames
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
Message-Id: <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me>
In-Reply-To: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795509151; l=2582;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=FhYrSNa12y54f8TuWwnmFaCq9qmcQT+x3fX15vMZZZc=;
 b=Pfz+HMBDDp8gwVceUa9jV43NL2drTr8CtMLKA/mEZwrIvfnm+SpoEg2FN3RX7jk7ehqpBWRum
 RQ9VmTjaavPDBv0hBCPJbYevSBhMbdh6KQmgSXBLk12619+kLenCMnE
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


