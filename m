Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743766;
	b=LyE0ZVC1yamUkFZefQKvkAOrrrKY4eLfAeNsHgFGgTCEybbcR3Csg2i4YWX5skvgI/Yc
	 RsmTriNnu0v9LBT47hlkUJ5UPk7v6cJBcU3+KwBn4Qg+caiyqcilM6bnQR/3NNheMeoiN
	 x7SvI4UPAiRFI+wbyqlm3GDPE0NdS6ByukgkF0q3+tAx16rZLtKJDK5zOJOjE2OG/wvla
	 tKlRxUGhLzje839rrou+uP2IFIbLNWQL7A5xxofN00VqsxWz3ntlpESsOw2AU0xrQtbpE
	 3k2pfH3p7zELEyUzT5Y2QkIMOeFKXmblmdBLqr/6o3rOuC6pXPYoxxXboSTfKj2ALHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EeqUuX0V3kGoSLHtwDlP1qmk6zbbxt2+ixci+5837q0=;
	b=aWQpdwJJt6u0bpdIMNdqzzcUfotLzDwzOD9iNZzDyY0r44eRU+F0V+sWNKKzGNCgOahX
	 EszuLc3l415zCOrqg8L1zNEHphR8aKZjwKzfgogNToDVwLxHfqQL9UHCm9kygw2V3wBKv
	 GfU7WhtTabHyvLsLWnVuF4tRLciaGlfZeTZc3uSb7/Nrn5mEe8zt1kdxKG6lQm5bscvsh
	 T+3uBsK8vdmRCYN2lm0AmA9hWNVB06UEVl7uJQJKTI2z9AyhOmdahbr2/+D8+vw7iXnVp
	 hyyewEKHnSqcH4GswhQeYOQn3UXhQIC0rbpnP5u6rlTV8JwRLiuKtdTRrAeGJ6ZJGAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmiZqoby;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC98D606A886
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 11:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC98D606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmiZqoby
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so859939a12.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 03:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743765; x=1795348565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeqUuX0V3kGoSLHtwDlP1qmk6zbbxt2+ixci+5837q0=;
        b=tmiZqobyR6FuOYPWa84w29ws5Ob4xPl/e95wT0aw8or4Qzknz9VTft1BYo7DzD8MJk
         kaqZftuLrBDL31kXq/ovwK6L2kgvefEBDsnDzJORGRpTPZO4MrXfgrthfOTtI/SnIpuZ
         gdLfwJE9Degeg1S4hfnhInBYNFoNh7fL8z+sk8RZJsN7TBPgGyLLHRA6yxDs4ejuimBb
         yVdYl184YE0k+X4Nwlm9pC0h5yEK7cwHKm+cuy+CmlL4lEcHEh/jA2809TfT1mYSsIhX
         dDAuk30pNUE4Hb8UpKmntOh4T7gVCr95/+SINf4C07uJK6+Nzz1IfJ2F7+nSQBE836NF
         qXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743765; x=1795348565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeqUuX0V3kGoSLHtwDlP1qmk6zbbxt2+ixci+5837q0=;
        b=Rhds/qieYHQ6PDiqaUuFL+ICRrGlnnzCeEM2TUhPRUYIo5sUwc9Ke4oc7CXlLtioEK
         g4Pk4b0lNjvBd+OZ0Hw6Nh4woEo/4kEVW9eqXQ3qc2eN+HCcl+sECHcdYaT/wYsSsepz
         dUTLHng7fbroGpNM5bxAd3ineZ99/RRr7PkBDdu4NVXpxV0fTvFcOZcOW30HoHv2/oRz
         jVoWGny+vmcaBs/lm1fEeMyaInWJYzrrHaCi0cYpgxi8Nk6lNTOg6/V8HSaPJs1QvIlE
         lLUQaZ3o2g7sv6iRa4zXsOiXqeD7r9WiAObvvEOvyjNHR4MhKItDufklfS6A3nR1qoB5
         7nZA==
X-Gm-Message-State: APuU4Z8e0U8eHX4dToh8BRZF2Oi3sdAs3VYo/HON5EzXMpSO6abEr+Zt
	QHVcI6HKHilcBNcpHOFxsB6fTal/Qg7S9JmGKC4YY+emLDBW2kJ90F9BhmsyBj52
X-Gm-Gg: AYBFou3pz1ZvlytmjkMlxHgXiO7Emgan0guyVR0VKp6V+Bnj9DOVcK25DaDT/ffq478
	PHqSE/2R14uJzlbE2lo1HllDVAJyRW0/2LJwxbzXn0V4LG8eGtMrrP8DxUPHVNJKX+HRYIufKuI
	ONaGXvlZvfWyVoy/6v9pRnn2sHr9jolal/uZF0dZdTRMttF1iuUheAerAgdnVffkXUkgi0Dx4iX
	BPCX3JikGdWEfAgubA7yI2sVXMTYN5STbswVlArOuCS5BQuz5YmlIyCV/9OHmQhfoygvNm4V23j
	K+fMogHyRI7SquUYwXlyYp8Pdg7dDDh26y4JZn5e/ZCTmopup2hNi408cHSX9Bnz4WiC1V9pqU6
	o/SjeqwsBWyR4usWu8t93z0Xput3f4PH3SLCn4M2xyjCTjQ3zpL1MuNgNBiMTNxkQvLP3zrFGU7
	/VzHiBBto6w1ds28WoXpyVGxqHbYXk2eyS0DgqXP0Qk+kwDnbrDYyJAjBugEkgIchw0eivZV9bf
	/l69ODyuwr+WR+vIJ1uJvgWjE7epR4nmpMGNdEKIFophEqk64OcKqS8SH5jNtpNhsa92QMnxTrc
	tgZYuiQJBAxK0bpfEVTqGIj70X3zBXGcAi26v7Cv+GE3QOF+rg3Tg/GchlCRIpYTP1xgVj69Bz5
	Qc7xASJqgI0aE4osSLLdXbB/kKeLgb4jEaaWr+1Zlx8U=
X-Received: by 2002:a17:90b:510f:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b1b07e84e2mr6756697a91.2.1794743765055;
        Sun, 15 Nov 2026 03:56:05 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:04 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 1/7] wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
Date: Sun, 15 Nov 2026 19:43:27 +0800
Message-ID: <20261115114336.1739863-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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
only 1 path, but this is correct, since in that case it doesn't
actually support STBC.

Tested on RTL8812AU, STBC packets were captured in monitor mode.

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

