Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504781;
	b=3KRarFnC7wAnOpWpsy9+aOH7V+17akwdtzowPTVUeqLHkKCyWmPnY3bg7LxSz7Ffr7Hr
	 lzBemp54oAwh9wN4RVbolsY0Dhx0FxQiVvIGcZj4P5fm1+tQtAqIE8//cUOBZ/hIXduHR
	 W08uLYWgyelOsMP8Q14p5R6sRv1AXZFLG6qwzvazkTwR9vlBQfL8Ea+jz9foAq8JASmbX
	 6AE6P/xWaSpo0UyNRLEj+MrjHRadwiPwyfSz+VTSPDn9OA1XLF6wH5IzraTg3RE8J1Pvu
	 uJ2W0Us0t7tzh1ENka74ELi2XDfzL+B/m2BnpjmR1gN+sOtbUPX6KheAR8r2HCGPnpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jDBHfuMO+YFOvL2/0uo8WLcQ7wfZfcV4HJJDGgpbHCo=;
	b=pBG4cFeoZtVckufoDeVe265rlqFWiJXQdk0KcfLxNQzpSVB2IeZaDNbpCYiqZD25555V
	 0xD461ODUmiHn9eMWJ8drx+pI7wOSetWLyO3JOsYMYaHIs/t/dZlgIbVsuRjBeByPTc+L
	 lNLmXMh40x/R/rd4+QT/XdE1WG3aCrcAPjkR1Mq8w0Tu7+q+vjJRkqF2hP0Gdw1Q5N/Wh
	 cCuf23uOMWYUpO8FIAcCW9ll6YBUaxmwgv9pC7Ct0jZ8v+Ybf89YKeKnW+uJOClcLb4oz
	 jetP4pByN0lG2j1cEKCuJ6KJQRJorFELlYmeTFnRHjHt21fZsZ1bDD1XB3qwSaEtwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePrgk80h;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFAC606A880
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFFAC606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePrgk80h
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so700373a91.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504780; x=1795109580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDBHfuMO+YFOvL2/0uo8WLcQ7wfZfcV4HJJDGgpbHCo=;
        b=ePrgk80hVWNtLXQgWA+8NxGWfct9k/FlAnCH9AMhF8FZRfKhl61gbk7uDkAaQw4tbD
         qY9eH3VBZohAC7ixruP0VYyYUZfSp6ueU/zrAb6cyhxYXv0i1bk/L0C5sesNTDbhhEEF
         4cfXJFhaxTpt5eSG6zXn/BmQkC+rapTkvGMehUzjlZpfaiKV4OOI9W26q80W4oyhthEQ
         xqn69HX1sp0JsTsPNb/zm/YlK6u+hNob05rhf6YbEuu6qyz11CiZ4kgrsgt8OwkoXeO4
         vp+m33H9Ut209Fa4ILJSiPwZNC8GSDmshBU8FLNzF/Mz1o2zT9rH/qPFdCa+kOV1ufnk
         NjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504780; x=1795109580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDBHfuMO+YFOvL2/0uo8WLcQ7wfZfcV4HJJDGgpbHCo=;
        b=tzzMWccDsFj3qUDRWl7SEksxhjJIk8YFZKXthbBRVkOCMJSZHPf8pJqEafIGGJroTD
         /gfgN5AgvLYgjTj6r7fdQFr+QykwbwXnCsQxL46JPZz2BL+nvyVhDgbLdyAg+/K1ddP7
         42ZeBhI6AykWxQtTAhyxvpIrs2AJW1gZmINFEl1ULQheVH/oOVMmGvoKoIUPuyXVKvdp
         199VvxVOWLIWRVIeLM5y+ftcz71EK3zo9roUwLuA+HznwRZvOAX8jzafpZURGJF3C7M3
         4MzZKnMvzrySs5IE6Iry85dAqBbyE6IpfK0/ulTmzrc5Qy5o6rqCzUTcEt9aQPXPyiJY
         v1gA==
X-Gm-Message-State: APuU4Z8J3yvT3AzN6vU74d8dKIOdi8ga3Vlgdlp+oHI9JaqyC500FmDG
	t06h4ZaTX3cN0u6dNnvAZHc4tMS5Ql0D8H2MM9/k5H8VMRBEeVBAEp9+
X-Gm-Gg: AYBFou1JEpWVLj40/1oKTcun3sxuTqv9DGb8gtJP+m/aqdhDqzoPTq6xfwnIeNj4s14
	o4mN6GXBGsIBQWEsHmeV3ZxNtSmnjCDjVkSo0J8G4mR93epVomaRJoJyQ27Y4IwmVj9n/isr4hb
	gvKBJqv4DRuyjJO50Xy6vIfLP5EIAT70WFzbftYLnkhxyqKUJbPXjUtJamv70feFDbXwyOmn+C9
	kT6dP8zUm+yfsK1wQWy/29mBmUbx5Fh8JYQdnPJiEO03ZQAn/fw5ZsgR8ihikq9RVONvyBaDllC
	jKAz02PZc+sFrkWVr4sR+hZqpi66e4uNWgGDit7oDyJ8m6DQUdRFUv0EvCl9ZqmV344lNyHis3W
	k7CRRfGoENzfsS2OW7r2lKni9giknv3YJ2yHF9W9JIvgDKYTd917uQe32xP3dygKC2jgBBR17O9
	eBANsRk29q8Tz5a6rk1qb5CLo/Ww+txMxE3oioUjPreicNDtsg4BRHXVLeotbmxc8sflkFh7kxD
	+NkC1Q0Eo9CJyxM8WYrVcqGtJvg4lHBwSypKaU0dH9giEMJuQPMZY2VkYNK0t7dmSjUEIwCJfcy
	y6jw81xYLCrD3aFC3EY5AbbrWCGoatwVjHF+wM2+UN7lkEli0zCHE4jpVmRsXqROChXxYT8IEke
	YIdjXM4aAUSy/k28ERd0Ia7vO1b10R0R4JZsULFdygruo
X-Received: by 2002:a17:90a:8c15:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b197bb72aemr1627728a91.0.1794504779875;
        Thu, 12 Nov 2026 09:32:59 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:32:59 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 1/5] wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
Date: Fri, 13 Nov 2026 01:32:40 +0800
Message-ID: <20261112173246.3201729-2-hjf3108@gmail.com>
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

8812a and 8814a support STBC, enable it.

8822c will lose reporting TX STBC capability if efuse reports
only 1 path, but this is correct, since it in that case it doesn't
actually support STBC.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c     | 2 +-
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 1 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b..e243738809 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1583,7 +1583,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		ht_cap->cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	if (rtw_chip_has_tx_stbc(rtwdev))
+	if (rtw_chip_has_tx_stbc(rtwdev) && rtwdev->hal.rf_path_num > 1)
 		ht_cap->cap |= IEEE80211_HT_CAP_TX_STBC;
 
 	if (efuse->hw_cap.bw & BIT(RTW_CHANNEL_WIDTH_40))
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 781b66ccde..55f1d3d324 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -1077,6 +1077,7 @@ const struct rtw_chip_info rtw8812a_hw_spec = {
 	.rfe_defs = rtw8812a_rfe_defs,
 	.rfe_defs_size = ARRAY_SIZE(rtw8812a_rfe_defs),
 	.rx_ldpc = false,
+	.tx_stbc = true,
 	.amsdu_in_ampdu = true,
 	.hw_feature_report = false,
 	.c2h_ra_report_size = 4,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index b6916d3dc6..e35c57c9d1 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -2200,6 +2200,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
 	.txgi_factor = 1,
 	.is_pwr_by_rate_dec = true,
 	.rx_ldpc = true,
+	.tx_stbc = true,
 	.max_power_index = 0x3f,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_2,
 	.amsdu_in_ampdu = false, /* RX speed is better without AMSDU */
-- 
2.53.0

