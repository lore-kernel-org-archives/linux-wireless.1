Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327175;
	b=fXA56b0M1J4xoI+sLtOtQ0N/WUc9zlUDwrfV+Sr8oyt5l7OQK+7x2fCVSbTZIvyVcipt
	 U6DIvcDCrEBZ6HPA+cvWcRfr5AvIV6JqT59Fyah5aCUzFRSOfNtJFqVhXJfyJPlyJWZrU
	 nxKwLSEhvkF0PzUaai2YOgF91A4CrQUatM5Q3d7FyqXtXVhsoM3C90qz9OeD4bR+YOYQp
	 dxlrAwMakVulphGpZDfgIaFvzDvR3JYuKtRLX/vUcnzn8uuFUpjubdGg+b+kFgvjpO1kS
	 2iZOCnBYEdzlN7c4MSY383K1O6l9vwClQheiBGZkK7YcBKyGaHfGnnS8Ewl1jeBG5Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327175;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YwHbxTs+D5wtL3FcCI1VoZqTAiHyVco1+vHCvCejMtU=;
	b=B7gl2KJUfw49wNwZNYCuaLuj5j1IP+69YoqaGb/YHQWbKnhgTj0Waymtaaox2MGWWBoH
	 Qsb57O6s1oZAkhp6mbBff6zWmf8YQZU2FsN0KlN5/XFGX2PxvUjCGXenzbUtZGKe5gqGo
	 6aBR9U5rg5x5ygNjZ7V6/4B0IgqOpJI+00+ULdmJtq7+R+48UFbYVdZcOfXFMH5+mA1Gg
	 hcixxq5suaSaXjWGDhRkAVqKIRVEBmgGRSq42yheIDTGEud+4gfpSp7QXZbXoeCBhzp0p
	 jw/mHKAH9VaLNsgEDpz03lzeWu/smeO3+fkrciFrvtGhMHV2r70wH0dIbI7/WEkV5HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cck4oSiX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64E606A33E;
	Sun, 22 Nov 2026 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cck4oSiX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795327175;
	b=oQgo8MuxPp2qNd12Jfz1kRth/vdj7qOVyWzUP4Gs2CJc8Mn3B2iazP1UorXMgmvES3G6
	 6kivsJgoAwNgYG7zxLIpMu2hSilZNawL4posFRB00AOFuLRB5qB02mvfJPQahgpc6dcSo
	 TjvB7/NUdydPVlA/O//JQCmDAQGk8ryK5VfYZuKXRa5EXYFdSWUPiRTPlOCeGLAn8jsSf
	 YnXGlAQsCjQZHptVAcnwOGa7KqmemZqFfOHPIwF0HSf7AMlX3lMDeLJKUBau6G7USgnjH
	 flk/p/jOv+p6HFgygtpRh5lUqP7bViDXSvhywnWvfbeaeYi7+BXNES87Wal7RbCfSdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795327175;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YwHbxTs+D5wtL3FcCI1VoZqTAiHyVco1+vHCvCejMtU=;
	b=zATy08s+LYbzhe6qKEB78PafPKjqtstsZuh+7P2lUwlTqK8mKC4/DMzDPbf1FAroTSyl
	 YJCVZVnWWIAvBP3HuyNJ2BTLdqN2mYFWQdFt3h1xGbw6Isy4MS0+WRBm8fp1VGYKsC3m0
	 hKaBW02CdB/NiXkB5fSE0io7ww4ky5fUrPXeOH3Mhohn7EC/xysR1N3Zl8RdHapxlCj2I
	 LR5tNaW+4zTx/hajQEUHte9f6yv7+4nuo5dhlhTFt7iUMHL1H+o3CmLdnaPhCHUCEa9HF
	 wjm0ut/v5Xux3fcqxW5B4eJSDnqWNH56AyDZOS0sdaHAxDvT/l3drK+fCQttkJMPlYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 479641F000C0;
	Sun, 22 Nov 2026 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795327175;
	bh=YwHbxTs+D5wtL3FcCI1VoZqTAiHyVco1+vHCvCejMtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cck4oSiXZWzEghLpbe7LgXPByMQ/K9Wo1OxxbENncPvS5r2cnxdpyzX5cR957BFkG
	 AGn4f/mGwWuGUAAOR7qz18AxFGKdk6OCM1dMDJrfJR2ffcfOrLcRUaUWwMyNnzUWcI
	 v522w0VsinbylJG/c6G4xRJs4UBu+QNUdy4g5Aj1OBqtTzJIwaN0SrBiovfu8Z6Vf7
	 BWvEBVquoXws0foQhw88y7qBVUAw3SC4pWYZ5btt+F63OSWGGJL1WmSaUA4qn7OBA2
	 z+hFqokit5rvB1gzB6se67z3tv5zoxEexKg3M9y8g08aV3jS0uTHVdSWzv3uP8MGCl
	 WQrQ1AvzUlb2w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8CB74BF72;
	Sun, 22 Nov 2026 05:59:33 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Sun, 22 Nov 2026 08:59:31 +0300
Subject: [PATCH rtw-next v2 3/3] wifi: rtl8xxxu: honour the bandwidth of
 injected frames on gen1 chips
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
Message-Id: <20261122-b4-inject-v2-3-0ee720fe706d@proton.me>
References: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
In-Reply-To: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795327172; l=2300;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=BWt8I4IM+KIbVr++O0EYE71ngSU1pr2qh46dYNVlYmg=;
 b=+kcGfWu4ZKd3LaMliWy36LGjq2rfKOYXsnXnjlNalYDAaoMUb7TwLJazC7uEVYmdnfrOlm159
 SIw3DEYHTr+CyClWPcpyKAzuCtukkATnEmr4+xjawVGiplPVbksjkEu
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

Injected frames are always sent at 20 MHz, even when they ask for 40 MHz
on a 40 MHz channel, because only QoS data frames get the 40 MHz bits in
the TX descriptor.

Set them for injected frames with IEEE80211_TX_RC_40_MHZ_WIDTH.

Tested on RTL8192CU (0bda:8178) on channel 6 HT40+ and HT40-, received
by a second radio sniffing at 40 MHz: MCS 0 and 7 requested at 40 MHz
arrive at 40 MHz (without this patch: 20 MHz), requested at 20 MHz they
stay at 20 MHz.

Acked-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 7d6f5243f64..0f7c4ee4437 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5278,6 +5278,7 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	u16 seq_number;
 	int retries;
 	bool inject;
+	bool bw40;
 
 	inject = rtl8xxxu_tx_rate_inject(tx_info, &rate, &sgi);
 	retries = rtl8xxxu_tx_retry_inject(tx_info);
@@ -5313,17 +5314,22 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 		tx_desc->txdw5 |= cpu_to_le32(TXDESC32_RETRY_LIMIT_ENABLE);
 	}
 
-	if (ieee80211_is_data_qos(hdr->frame_control)) {
+	if (ieee80211_is_data_qos(hdr->frame_control))
 		tx_desc->txdw4 |= cpu_to_le32(TXDESC32_QOS);
 
-		if (conf_is_ht40(&hw->conf)) {
-			tx_desc->txdw4 |= cpu_to_le32(TXDESC_DATA_BW);
+	if (inject)
+		bw40 = tx_info->control.rates[0].flags & IEEE80211_TX_RC_40_MHZ_WIDTH;
+	else
+		bw40 = ieee80211_is_data_qos(hdr->frame_control) &&
+		       conf_is_ht40(&hw->conf);
 
-			if (conf_is_ht40_minus(&hw->conf))
-				tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_UPPER);
-			else
-				tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_LOWER);
-		}
+	if (bw40) {
+		tx_desc->txdw4 |= cpu_to_le32(TXDESC_DATA_BW);
+
+		if (conf_is_ht40_minus(&hw->conf))
+			tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_UPPER);
+		else
+			tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_LOWER);
 	}
 
 	if (short_preamble)

-- 
2.56.1


