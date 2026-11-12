Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504799;
	b=mgH5rxgLYWGCiK60JQV6Ze6VLdzZaC7wDjQ2OArPUpZpnGn51+Coq2DDwzuBKX0ajJ31
	 Px+WjPfU3Kt/QQjTdbFl54m1l46WKg3Jx9BEGaXo0Qg2tPaCvPLKjkRiHPKQOiqWMVZWE
	 Q4HePpC57tSMlZdw7LCbNHOTISwAndSmqNGF9MMx/M+NGDrV6fPJoNq6V93VtdXJpecw7
	 zaWpw8h9+RFtVpSlh+ycjnHlKRd7iDhtTDj+9gXiZs1hKSekPpAdZgPdjvXPGF9QTkaNP
	 H5pD8fbXkRnxX+5lZlDTb/VjO2wW8EVSbzdDZDrkLfnDEmiVyLLqv7yCjugbd2n/+oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lP+qoc9O0R6uSwoM2iPaMaGse/6oonGEJ6oTW9GIAvM=;
	b=tj6MJ/APY+QqPtqROi+IY7TcPgG0FrggafI4KPadEwzcw545GXRqR5Q2NQ52elKZ4h7Q
	 EhdwlEXGkIohgHCz5PmpRZWN3rmOL7e54n5l7WNiWLw3BLeAgFc/okrCuYORLUjn2hnJ/
	 hLSMKBgPoQTrq9JMQQZOUbRfeDc6ztLEalpemnpOB0pVtI8yLag23iS2jUK+VgOTVBBxv
	 wwpVb/NuAZILzBZ6K30hveV/NHCCb+OnlMKqHC9PisuWNZuank3ijVqjbDM0yaO8mKzc4
	 58CT/G+5NhcDHbLVw9fQ0VB/fNmqnqpopqO9shBo/TY0oO3NfNygAPQww9JL3MJR7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1vZoe5B;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A260A383D
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 205A260A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1vZoe5B
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb9f760337so636922a12.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504798; x=1795109598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP+qoc9O0R6uSwoM2iPaMaGse/6oonGEJ6oTW9GIAvM=;
        b=x1vZoe5BGYRuFpBLOPhCdQU5gaILZzJUx+nRkt8AFoyK8kmvscUCWl31wyuMeezn03
         gkrX2XlXFOvTOeSnFPVbZhF7+hkEtQdEmh0tOH8rm5HkrHRZF2SMu4fE3lVutMhvezbP
         0fLgGJxfIG8WIAfnc321rvtIq5PEAkNfTXXDaUlHPj45hKM6x9sfhK4ql8OT8270ro8o
         eu9RjRmuMUncOMIw3ZIPlyMgGpYHvYzp+pmTrrYu/1/gjeignl8B8O+BqsVO4LwgBUXv
         BLEnDTC6+qoXFy/1jf8fYL+grywzlbn0hBrfbDNKzyWtOcR9PoZTxAoN5cs4Qst3SIk9
         3oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504798; x=1795109598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP+qoc9O0R6uSwoM2iPaMaGse/6oonGEJ6oTW9GIAvM=;
        b=Mg4colCgCtQCPB6+m8WoWpD4p/qeXcidFTH4HexfM6EwTjO8L4r084Q5yrpxpi6o6R
         QB9nEf4u4i8vkAN00FM75Mr3Bw46bGy6WNtRYIUTviBy1F7ifh/3QTa3HJxGDkgnqeJZ
         OTRjah/Si3cewuPVJXSCPvhC1dWgzr5NV2Fg/payWXKxEa2JWvbz9BxMakTpDB2XFkAn
         Qt8hQfjqnB7GZvxucs/SgG/8JHZaX4zJfvi9IpoOV2A54bwOpDHh09byGEX8dkSxKw8r
         CBIvNC8vCaFB1TeJUgU0fjgX2p1YbhjlgHR8D2ZjTK4nB8IAZLt4gXkGdcFCI+8Cm6r3
         QzxQ==
X-Gm-Message-State: APuU4Z/mJK0Kdq8qYs/mSYJ+TrOmpKUmvdrYZYiNpYZSszvA6EOqsioV
	OKNUxxZCTuZiyrXiE/bthoKd8k29KMTgqAlw/jVWR0JLIRCpyg2bveYm
X-Gm-Gg: AYBFou2xPwzgwpgTPzEl6oUGtW4clMcKmLnZ6Q+x8Y96kFhxOLGEDvR6nKgAFoNFxSU
	lccwBJe58TmgGVdh+N5LYbXdjRktOUuMcUDGWfv035jM08m+WLmcnKso1WzN3LNmrR3VWXFKJP1
	4Pi6WAXDvqItIu3P5+sXmwsGH1gSXZIVpjWSzYmN4qbR8xo2pXjl8FHwmU7JU4fn8gQGrizsllk
	54D3R/5g6/9HYI44U4dPzTb13cezUNY26jCkAB7EP3ZqddiYZxAM0fNgxv7iFBq6OAvVVJ9MJCm
	sjsho+lHM6hVRz57h7SHnXgrga3vZ5DvjsaFwVuQK5n8dDC/IjbG2be6mWw7Ahum08+63k4dZGg
	6tV0ZFsGtl7uI/570IV5Zw0zNU2dAofdu46ptg6fwjk2A35t+PA0k16gftPvP5au+BcnEpnSFKU
	LhaTfO5OFxYNV8s/C6jDqsAMbTCk7diCF+k7DY1F+9mWp93hczGtXKDpL6gsCEqCLPiRFa+U3tj
	Sh0gRQWmIsT8w0Do1UNJ2nzOXSEPub9zGm+Avwp3VtLxU1/2UCB7FFj71frH1SZuzbOnSqFOiWE
	XcemfhmUEXQWphra6yJyR1zT939E6j3lBtWg+QuWhtg4DqKNPzronu5xKy7d04QvtiPcaZo7U9k
	YN/1X339C1g6vW2lbvyd3JaTcm2Dq2EdUVzZxMVQ8ygxi
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr2243793a91.21.1794504797884;
        Thu, 12 Nov 2026 09:33:17 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:33:17 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 5/5] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Fri, 13 Nov 2026 01:32:44 +0800
Message-ID: <20261112173246.3201729-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112173246.3201729-1-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com>
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

Honor the peer-advertised receive limit for transmitted A-MPDUs.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 10 +++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index c8008cf43d..c8f5cdf31c 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -78,6 +78,14 @@ static void rtw8812a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
+
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 static void rtw8812a_do_lck(struct rtw_dev *rtwdev)
 {
 	u32 cont_tx, lc_cal, i;
@@ -926,7 +934,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8812a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8812a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8812a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 17d3677ca4..796c100165 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -49,6 +49,14 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_64K);
+
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 #define CAL_NUM_8821A 3
 #define MACBB_REG_NUM_8821A 8
 #define AFE_REG_NUM_8821A 4
@@ -872,7 +880,7 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8821a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8821a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8821a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
-- 
2.53.0

