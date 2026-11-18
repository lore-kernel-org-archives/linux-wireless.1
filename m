Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964086;
	b=VO9PQSE0xQXLtVhGh7jE21F7goz7gUQqkmlxXNOCJ5G4PyhZSXMGGsKwLiI1bucoPvjb
	 9Rt3o6CGvVsAVg7x14BU4MKD5A7LaepapahvqaiozL2uf0YsfMB7uhnkgKuEbzcqD9oJ5
	 5LgytwMdgtREU5AKSja1PyCCw3S6KOpX+dI9jXkx+4S6D1lWoSeeu2xVsMcCP0yhy/0uX
	 PA/o3mZHDVp/aWs1IDMqtIoJBGrPrBM2MKLP8PQMC4FWTtNVN0sFkyHUx9/YV5ybuWNaU
	 SvsNGUUqQYJ1Z04CJIg3fRH0Ipqw1tv3+Yf1+jGFff2q/BfosahqrgJYTmUizkE+b2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QJeXKqaLJfu1ADqnFNTkkC7IC/PbhleAkobnZxPdqQ4=;
	b=Ve+ZeS6jb7FXQug3qAtMbz2bOkanBeOdIyj9zCxDs4Beio5HJ11xuJyjwQxTw3wvCUsz
	 kXKyD6XgRYhZj8xIY2csKDKVjbQAp6MKtiBTRXtzhaU3xifPLRVI11rXN/glsLJmVHZ9N
	 iZp4GMyQQTNq1yErFxsIVeL1CyKncpNq1x2UeeJvLqRYHVj+uGylnqF/G1ioO8bfKg37h
	 gjSsnu52uswi24Cqnq7ifEtplnWZR4BKqYtF03lsHKgbsRPGRJVXxu+3ZCNqaM7+XXOPV
	 IAvotBr6+flTTaReDquUaU9y83wAvSrTQrgmMk+mAXlehxroAfiTLxx0ZsImp+z2faA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TYhff9h3;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B198B606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 01:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B198B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TYhff9h3
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso170052a91.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794964085; x=1795568885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJeXKqaLJfu1ADqnFNTkkC7IC/PbhleAkobnZxPdqQ4=;
        b=TYhff9h30wYeOPzyhZqoWQVQ2MgUUb6WFfPDQfWLgBu7kGefRImJ7YKQJCNlWGP1CM
         jxyf1sdS3lIB8wojf4ppv2Sru8n94oyl8ui86rtFIl8EFxeCUIDZ8KaqbuAjI8dTbqzd
         KElcb45rGfGQgVn1t/5VkLvw5r8Hrs/2jon7eCi9C+tiHaUxFwQrIvYpEWc2nPmq9o4k
         Sy3j6dSu9k11o40vf9h0gvqOEMgdavdURLc6XmGC6qO0CZXQz0YmwYlgfS+S3AYeXjEo
         kQ9AP6/ez4WuklWAN3VL74YGS6i+q/1sRsJV+k/jVqDD2SJlxP1v+VamqPZllzKBa8O6
         2Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964085; x=1795568885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJeXKqaLJfu1ADqnFNTkkC7IC/PbhleAkobnZxPdqQ4=;
        b=G2N5QgWgg/m3hq67g3qAiCaoF95JnUbMxGujqFavhli+tM6fcUaePqIohqdApxp5qF
         BzhVyA4DmPeGS+Qx6YHyoImnHKq3BgacSj9r/0B1fwzTvLSUKCZBXf/3kcLSrzoxk11R
         AAGA5o8toYUpncHv1KE+TT8Gw45gn/85ZW0O504NhvMtjIgoZXHEXraqECMYXq2IhWBu
         6xgaj55eKaGpOaYHMsxBs2pIDifm3GDA7yPGW6QgAOgeK9O+Gewyqlgw7MzvUvxaMzDt
         BbkK/ctwUtVSWD/16YFZTjFxnjIFaX5jP/6j3wDf1BMQNRn+3c28CEf2Yju/PZP33YxH
         1djg==
X-Gm-Message-State: APuU4Z8zW5IIwnBUKWDCNKwDlK5USePDT28RYLzzqxklublwTM4gSBt0
	R4x1DZ2yFROmzgvW+MxSPW+v1rRZl8sz7jsrC9Zwmz+lN21/mHPUzK2ex8qlx1DZax0=
X-Gm-Gg: AZFdTZfBBxV43k4O9sDYuZuwS2DMOZgUHhUkj+iADUoFOhIeo6QeQ60TmpaBA1YZBB3
	xwRpFHtECticDAOz92gn+UyNdaxLLaeTFTnnUoldu3hEz8cBVnLtZf0CpNoPDAt89jqUL4w6SlN
	9gnCe93rQfF6+5HPxmFeEceRkjwcEhg2+CcAFIotkbjvIUcAmtzp13rNegtqXDYMxz/4xqBpKOG
	76Cl8XVLllCcMTg42VNHeGEAZnpk5Jld5LH9M0Y662UKkDYCSI+vCDVmdyLZ/7wTx7PeUlDnn4k
	lbgikkXgrhQ/rOlfkDYq0xD4u0gBH/CvJFDGSkzIS4r4qu2E4b1tAnNsfXGp+5ZiQoiFyIqx61u
	Sz2rHFdXNIUNVZI/h3c/zMbylmnRceXdnWThUrdbEtJAoXtZVXKyQk4lmqPKkKwLP0GRS6wMuuh
	xuSL/8OYe2HLTFGqnDmWE1lHC4ynxXoC8QcN3mjYzWRg/cWZpi+N8m7TjoEbqL4xnfaZQckkmpx
	sPgLvEEraXYcdOTH+sGfblPg8V1R9/EAiqkLmrejJP7sCEk6yx+UHqfBdHwybptvClmBcepiFup
	IsMeM2N8t80gG4xAklqMM9eJNG+C5FT7/dvHrioh5/6NyUz/kh9AGznQtwsGIg2wuh/qHWkJkqB
	BVYCtGRyMW0MxZHyeRouTVJnpTnl+VB6VuA==
X-Received: by 2002:a17:90b:448b:b0:3b3:be94:8dce with SMTP id 98e67ed59e1d1-3b3d07b92f2mr940377a91.31.1794964084964;
        Tue, 17 Nov 2026 17:08:04 -0800 (PST)
Received: from mma-H9MHD44.lan (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm6420780a91.10.2026.11.17.17.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:08:04 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	arien.judge@morsemicro.com,
	samuele.yang@morsemicro.com,
	james.haggerty@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: [PATCH RESEND v2 4/4] iw: print S1G channel widths
Date: Wed, 18 Nov 2026 12:07:38 +1100
Message-ID: <20261118010738.1353183-5-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
References: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
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

When printing the channel widths in iw phy phyN channels, print
the S1G widths for the S1G band.

Band 5:
        * 902.500 MHz [1]
          Maximum TX power: 30.0 dBm
          Channel widths: 1MHz 2MHz
        * 903.500 MHz [3]
          Maximum TX power: 30.0 dBm
          Channel widths: 1MHz 2MHz
        * 904.500 MHz [5]
          Maximum TX power: 30.0 dBm
          Channel widths: 1MHz 2MHz 4MHz 8MHz
        * 905.500 MHz [7]
          Maximum TX power: 30.0 dBm
          Channel widths: 1MHz 2MHz 4MHz 8MHz
        * 906.500 MHz [9]
          Maximum TX power: 30.0 dBm
          Channel widths: 1MHz 2MHz 4MHz 8MHz
        ...

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 phy.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/phy.c b/phy.c
index 84cd025a3d81..65479e696fd6 100644
--- a/phy.c
+++ b/phy.c
@@ -126,17 +126,28 @@ static int print_channels_handler(struct nl_msg *msg, void *arg)
 						printf("\t  Radar detection\n");
 
 					printf("\t  Channel widths:");
-					if (!tb_freq[NL80211_FREQUENCY_ATTR_NO_20MHZ])
-						printf(" 20MHz");
-					if (ctx->width_40 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_HT40_MINUS])
-						printf(" HT40-");
-					if (ctx->width_40 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_HT40_PLUS])
-						printf(" HT40+");
-					if (ctx->width_80 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_80MHZ])
-						printf(" VHT80");
-					if (ctx->width_160 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_160MHZ])
-						printf(" VHT160");
-					printf("\n");
+					if (ctx->last_band == NL80211_BAND_S1GHZ) {
+						printf(" 1MHz 2MHz");
+						if (!tb_freq[NL80211_FREQUENCY_ATTR_NO_4MHZ])
+							printf(" 4MHz");
+						if (!tb_freq[NL80211_FREQUENCY_ATTR_NO_8MHZ])
+							printf(" 8MHz");
+						if (!tb_freq[NL80211_FREQUENCY_ATTR_NO_16MHZ])
+							printf(" 16MHz");
+						printf("\n");
+					} else {
+						if (!tb_freq[NL80211_FREQUENCY_ATTR_NO_20MHZ])
+							printf(" 20MHz");
+						if (ctx->width_40 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_HT40_MINUS])
+							printf(" HT40-");
+						if (ctx->width_40 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_HT40_PLUS])
+							printf(" HT40+");
+						if (ctx->width_80 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_80MHZ])
+							printf(" VHT80");
+						if (ctx->width_160 && !tb_freq[NL80211_FREQUENCY_ATTR_NO_160MHZ])
+							printf(" VHT160");
+						printf("\n");
+					}
 
 					if (!tb_freq[NL80211_FREQUENCY_ATTR_DISABLED] && tb_freq[NL80211_FREQUENCY_ATTR_DFS_STATE]) {
 						enum nl80211_dfs_state state = nla_get_u32(tb_freq[NL80211_FREQUENCY_ATTR_DFS_STATE]);
-- 
2.43.0

