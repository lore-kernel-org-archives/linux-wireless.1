Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770011;
	b=5ewk9oCde4/J6/o27O6T8qsLFx4yotcg7EbBmUF39XYcbNQ1mgW1kLP0tKpBJf2qsMEV
	 meFtj5XN7LZi2sZ1dRQ1BhK8myN0qMtXtoj9TsnKGoU8IMhmJWtYoe6Lzflu8emaGCQsB
	 yOMlW5OzAUX1yzdFm37zNRyshvxKDJMvZE8OHz9VGbvbt7HI5VmWLfarYF4ExdOWwr0Po
	 uawexNpk3ba/2mgQiy3H0siuGfkNeLEXiLonh8v2vXnmUmLVkT+EJhF+gBdJwgrYNLi6s
	 Mqna3z9Bs4Ymw9QXFmeNrcXMxLWL9S8krfb2BiJMnTHTXUeW3gYHoKr1K8GlReame1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770011;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DLOycZyzH2L2826RB/0UJfb1FZL/VodXkNjbNsvKGdQ=;
	b=1d07u2SE1U8lpSIuhT+r/FcvbW936f9ppvw+JPmTCj/6Mw+JHjmycs/ghNv8sJimPQfr
	 t+TkzC4c3ElzeOvGb8ZvBKQSaFCbLTrfxl09y118cbjDRun2s6f0wWNZZZi/D4/yULrf3
	 bqb8Sh04CTDlZwdVHZiSrHSXC6oO3AyIRKoUCoJnhtzKxDK75y48gWY+0bFT+QUSBOgeP
	 gehkctjWxEzQrSlpn61RFsD6eHIWm8lp+xBbCPTPvomo1hJcRjudVO+m7vOZGGlGapA2q
	 ZIVn13MCmOu4H2FZUP1IUTiAEz/UqwITGqEIowNrNyVrT16Es9Bt7qV1d38FCRUvyjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z4YRU/p8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6EF606A323;
	Fri, 27 Nov 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4YRU/p8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795770010;
	b=HD9myXSi1AlUtXcNAZuNfRKnQ/BfPglEG4JWi8YHwEjTcISnXzPfMRChCkqCG6m1UEpp
	 jxLbfnhJlf6KHGU4857488UcMwEREo2fydsv4Oxh4MHW7aZPhTJBQ6KanRzNJ0uELsIMW
	 jrkHj91i2owHH0UpCzhC5hV6h9RsC2Dx3e6tribJPbro3MTNTbeCy8ABAbjlEB3dNkjCE
	 BhmP7jRhXEJFdqKptIuf4OLslXl5DM3pF2wOXH6vUt4IGrgZzB6mPZI/AWlnarYZoEY40
	 1D4X8ojT+/Pzs5hdcVvUejeQju0j9GmbKCPjfATfWVLwxvcdaaSnuiRC83xAvQQTvoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795770010;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DLOycZyzH2L2826RB/0UJfb1FZL/VodXkNjbNsvKGdQ=;
	b=r8aMn7hD0ubjziel0U/2qOeRNWZm/M43g5groS/Zo2//FyjNqetj5/WwnEANZzTGXK7T
	 o+cZeTS1YfJ+kdPMfYKyCISJqrYttFmXInYg9tq/ZsheIAVQw/XZZAea5upXP/QLlFJt2
	 prUI56tYm+HyWqq62b5ByznUF7pATlXt1a/1mOXLkz7INor+XZUPbHsy1OwRrk7CAOk9k
	 Ih0rdX4jAYdpnY+GboPcg2LgoI5AxVyWzLddbscKfzEOtp4Lvh186kqFh0mDUvoQUe2i9
	 /PMka+A88D8Qnn/do3CSz8d/AO2/sStau5IsMbTkHhY5wv1hpzxyj1xjUV898CwdT4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C5A11F0089F;
	Fri, 27 Nov 2026 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770010;
	bh=DLOycZyzH2L2826RB/0UJfb1FZL/VodXkNjbNsvKGdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Z4YRU/p8lYaPNXcuTzdnMdboaInp3HrInXkzR1Oil+PbZ4v5o/ObhbmOvZ/iPOoFV
	 PxcmGZQBFJ7zW17ZDOOxk0F65nq4ZecUud527rlUAOHSi8daICqmBw8m4Pr8BqPB1i
	 AqRy/28KVajxvZj2B82Z8nxSMT0vio2dTB0IA4qfaOLIFj3g9D3PcPAU1wV2z1fdl7
	 9+R2wmXDKeOr/ZDd/Peae0D2Ewg8VoF36Pg0FnUZZx+pS9N1MWzhXMnGmu67COC1rA
	 6jpPCb+/dO4qeGKGvix84yKvEUZYwYJJrWIOvrT4xJzTA9qGC6lC3ewOfXJYiVEVAS
	 8/iG9ptrkI/dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2AB7C4B681;
	Fri, 27 Nov 2026 09:00:03 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 27 Nov 2026 12:00:00 +0300
Subject: [PATCH RFT rtw-next v2 2/2] wifi: rtw88: honour the retry count
 and NO_ACK of injected frames
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
Message-Id: <20261127-b4-rtw88-inject-v2-2-f9701b9243a3@proton.me>
References: <20261127-b4-rtw88-inject-v2-0-f9701b9243a3@proton.me>
In-Reply-To: <20261127-b4-rtw88-inject-v2-0-f9701b9243a3@proton.me>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795770000; l=4930;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=POOXTH3H0L3oyee8z36H+ZnuQn4Fh7XcOGuPBQbULUU=;
 b=8qWHhhf9NWi8e6rK9TvWkG2sBZfZjETpMs+88M1I4qfGjeaqUl+8GsNroyaT56s5RBun8aB/3
 h6PyjGJFLr+Duhu7fqdFebQf+xo8LHoBzoVNKQh2I4i3sRKuF/3+//G
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

max_rate_tries is not set, so mac80211 clamps the radiotap retry count
of injected frames to zero, and the TX descriptor retry limit is never
programmed. Injected unicast frames, even NO_ACK ones, are retried up to
the default limit, so frames to an absent station stall injection. The
TX report path also reports NO_ACK frames as not acked.

Limit max_rate_tries by both the TX descriptor retry limit and
IEEE80211_MAX_TX_RETRY, and program the descriptor retry limit for
injected frames: no retries for NO_ACK frames, otherwise the radiotap
retry count if the frame has a usable radiotap rate. In the TX report,
report NO_ACK frames that were sent as IEEE80211_TX_STAT_NOACK_TRANSMITTED
rather than acked; this includes group addressed frames.

rtw89 got similar changes in commit 92608bb5f14f ("wifi: rtw89: honor
ASSIGN_SEQ, retries, and NO_ACK for injected frames"). The retry limit
fields are at the same place as TXDESC40_RETRY_LIMIT_* in the
RTL8192EU/RTL8723BU TX descriptor of rtl8xxxu.

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtw88/main.c |  1 +
 drivers/net/wireless/realtek/rtw88/main.h |  3 +++
 drivers/net/wireless/realtek/rtw88/tx.c   | 16 ++++++++++++++--
 drivers/net/wireless/realtek/rtw88/tx.h   |  2 ++
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 826e1bc3724..c715a6e86a1 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2273,6 +2273,7 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 		max_tx_headroom += RTW_SDIO_DATA_PTR_ALIGN;
 
 	hw->extra_tx_headroom = max_tx_headroom;
+	hw->max_rate_tries = min(RTW_TX_DATA_RTY_LMT_MAX + 1, IEEE80211_MAX_TX_RETRY);
 	hw->queues = IEEE80211_NUM_ACS;
 	hw->txq_data_size = sizeof(struct rtw_txq);
 	hw->sta_data_size = sizeof(struct rtw_sta_info);
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 525f17590ad..7888033376c 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -625,6 +625,9 @@ struct rtw_tx_pkt_info {
 	bool stbc;
 	bool ldpc;
 	bool dis_rate_fallback;
+	bool rty_lmt_en;
+	u8 data_rty_lmt;
+#define RTW_TX_DATA_RTY_LMT_MAX	0x3f
 	bool bmc;
 	bool use_rate;
 	bool ls;
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index dd5537d0cf1..32621b5c4fa 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -66,7 +66,9 @@ void rtw_tx_fill_tx_desc(struct rtw_dev *rtwdev,
 		      le32_encode_bits(pkt_info->nav_use_hdr, RTW_TX_DESC_W3_NAVUSEHDR) |
 		      le32_encode_bits(pkt_info->ampdu_factor, RTW_TX_DESC_W3_MAX_AGG_NUM);
 
-	tx_desc->w4 = le32_encode_bits(pkt_info->rate, RTW_TX_DESC_W4_DATARATE);
+	tx_desc->w4 = le32_encode_bits(pkt_info->rate, RTW_TX_DESC_W4_DATARATE) |
+		      le32_encode_bits(pkt_info->rty_lmt_en, RTW_TX_DESC_W4_RTY_LMT_EN) |
+		      le32_encode_bits(pkt_info->data_rty_lmt, RTW_TX_DESC_W4_DATA_RTY_LMT);
 
 	if (rtwdev->chip->old_datarate_fb_limit)
 		tx_desc->w4 |= le32_encode_bits(0x1f, RTW_TX_DESC_W4_DATARATE_FB_LIMIT);
@@ -224,7 +226,9 @@ static void rtw_tx_report_tx_status(struct rtw_dev *rtwdev,
 
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
-	if (acked)
+	if (acked && info->flags & IEEE80211_TX_CTL_NO_ACK)
+		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
+	else if (acked)
 		info->flags |= IEEE80211_TX_STAT_ACK;
 	else
 		info->flags &= ~IEEE80211_TX_STAT_ACK;
@@ -412,6 +416,14 @@ static void rtw_tx_injected_pkt_info_update(struct rtw_dev *rtwdev,
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
 	u8 nss, mcs;
 
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
+		pkt_info->rty_lmt_en = true;
+		pkt_info->data_rty_lmt = 0;
+	} else if (info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT) {
+		pkt_info->rty_lmt_en = true;
+		pkt_info->data_rty_lmt = rate->count - 1;
+	}
+
 	if (!(info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT))
 		return;
 
diff --git a/drivers/net/wireless/realtek/rtw88/tx.h b/drivers/net/wireless/realtek/rtw88/tx.h
index 168f48e8785..b6c687d33db 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.h
+++ b/drivers/net/wireless/realtek/rtw88/tx.h
@@ -46,6 +46,8 @@ struct rtw_tx_desc {
 #define RTW_TX_DESC_W3_MAX_AGG_NUM GENMASK(21, 17)
 #define RTW_TX_DESC_W4_DATARATE GENMASK(6, 0)
 #define RTW_TX_DESC_W4_DATARATE_FB_LIMIT GENMASK(12, 8)
+#define RTW_TX_DESC_W4_RTY_LMT_EN BIT(17)
+#define RTW_TX_DESC_W4_DATA_RTY_LMT GENMASK(23, 18)
 #define RTW_TX_DESC_W4_RTSRATE GENMASK(28, 24)
 #define RTW_TX_DESC_W5_DATA_SHORT BIT(4)
 #define RTW_TX_DESC_W5_DATA_BW GENMASK(6, 5)

-- 
2.56.1


