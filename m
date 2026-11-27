Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802454;
	b=SYh88yCak5FdhSPr1pOiELFQ266a9MitYd+zGrn9w4mgGfhMNzoJ9Ju4qUh1x2PpYv99
	 dYAwIVGIg8Npn0tNQb+NXFv9TO7JcpRuI5pQyWU+is1Jk6TQEJnd6UmdYJplkWg2QTWIl
	 MsG0DaAMnae07W5jVfR0tZeXG408ZeIiL4O7eC/DR7crDmS/qJ701nKsOZ+2IJkAbhl+Y
	 OegjRg5seTj2en5e9GnaE1J322U6mBiX2KXNl9Udc7enu2WVCYFIdQx8636RFyiQDtD4b
	 TdfikOoMiGfUCUqliqAxj60NeIupkWGYDsX2ijVtlEee087ZBXgrjstgfPhrhU82Ajg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DINsdIn8aVf3sGHW/eU0o3+NkbFWGDATIdCghQvmBWE=;
	b=Jajrx5sFkHQpDAL36TG0H8kaR1egV0aZO8EWos0d2azD245NUPJqUVAwIY/vIH3lhSt4
	 ALObksX4lP7K+1edcrLrEekSFKLmySrXf9jj6+1NaZjg3XcObZ2v3cYw1/LPB9oVjakrB
	 TIt8qGYxYD1UoyhlZJRglFhPZrMgfG7iYD8iA3Lb09lgmPp1bvNSUP8b5HLRcHYizJMDC
	 vnjyy4njsbKOIS7T0bgip5sHY+33OyfGNHIehP8+tRbuRhaNOqNeLEq2jBvr7Uu7Bfw1c
	 U9v+y9c+Lv7gHXxpXN52QA9JWSR81QCA1toi3bkyalbZdSbBmsNR/eyfaffW1o/dPlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0BkC7/18";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16B6606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B16B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BkC7/18
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso6476991eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802453; x=1796407253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DINsdIn8aVf3sGHW/eU0o3+NkbFWGDATIdCghQvmBWE=;
        b=0BkC7/18bQDyGCdDSlVn7MVqWbLaOeVArQcLkLB5mdc7s2/iKYI78zyRaaUDf0ObFx
         ZReK6kTmTkv3WSrR+8aUqivDd0LiuCok9sunCVLe2CWQvCjKr5Sv1ezvKprmBsiDUnyc
         uuz//S065Lo36rMgk74Ev9n0wTAUgUkXrYiquG54sAKq6gXVCJr2RcAJ5DuJ7HoYhdg3
         04MQFYPe2T0b48yUgDuLvHSJYmzP7BnC5OXgXMahWyJfl1OmQC4lWf3wVpOTxcBOLjq7
         e16NxPeIOYTgTYwZOtVm/Tclrh62pnfvMXyQBgpkJ0EX/KDvz3JeoqK9N1D8j5pfJInt
         mObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802453; x=1796407253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DINsdIn8aVf3sGHW/eU0o3+NkbFWGDATIdCghQvmBWE=;
        b=zAex8XNElLIBpyfD9NTPOrIHEFZLCJmuLcckL7YJoUe5N9T2KhYzf/kuAqan5lPP6j
         maJdO+oy9UhUAjZj2fKgbrqOXyd5nRTGpjny6pJQcZUP28JFvnUUe5+mwNU7BN39wv2o
         AWc7ClJhZjueP3ewZDPpREeg8ynAXPdxEDmI7Ttv6otyztd+LgmTIf9OCi9WAgeRQATb
         M6KrUg/e3lJ9MBP8sPq7Z024lY8wpfnRV2Mmkt8VGt7bRHCtJ4BKBjgXMwl/3lvc1tdm
         F/x4IIlJjfF6WKXpDqNklFtjWTyp9zm6HB2vviwM+0DHdXiAz+C91PMamR4zHaHTZmFR
         qRIg==
X-Gm-Message-State: APuU4Z91mcRfnDbipHsfO0wRZmaZVoQWej00/XBcitCbIE3XWU8jH33n
	8KOBo50ixZHfuTy5thBjcWZONsyqlxm5Nv+AcknCfzI9uGzcOOuTuJHt
X-Gm-Gg: AZFdTZf60WdVVrF3nBeqoqfa87N/Jl0iw3NGS5iOGHPjzO8A0wVQmSQ/lyXGi7YYpz6
	3Owya9dH9K7qH1d66kLBysDZPViIb8/bazuhoBYrRFJ/lXRUvIdnDjaijbyK7npnw9lbn7VYpMr
	gzYk/D9VFW9HwF7PWZ5uD4aX1DUpgxc6U++NHkVD2UZF3XiAsPdXJ/dHDM8Xs5Y86hwcrLHqH59
	/JoqjtefJPL9CHs8TDmYhvg0LTm7WUPyP+395mkTfQo917OgI6j1gM4MU75lgL8XM6nKKZ9auqN
	/T59HmtZ2fNFfIDn3OZF17vwbSP9j6ZAFwsL5HolbZqR/ToYT3uTkAFnimM1kaot6TB5C7PfDhs
	3UM+T/PMmyvde4NiiW3/je0DM/fWdQyeLYVFxx6t8ijOTMoXVFT+p4zLGldUKYdobIBs1R80KQk
	knOqJ0t4XheUq3CXcEDbv4iYWCqwpj+WrDX4lkJhK2HLQ9dVvdseVkQ4Mu4kbQUCei57/NP5AQS
	2DVDYmQjoXBwdInWOjGsfy5hnM9Ipkjf3UJZ1mMill3J5fddrslGdP+3Ic+P6So8ps6Er6lMYrR
	YVnS2dqJugsNzTW6SnQaQEszUkw16T5bOt55QGqAasYOW8eTEnF0mqNuPZVyUbzr4FPaxrun4S/
	VeHL/zLVs4Fb/P6ghUg==
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr27143371eec.33.1795802452695;
        Fri, 27 Nov 2026 10:00:52 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:65f1:53d:ffe:71c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm76044620eec.28.2026.11.27.10.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:00:52 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v5 1/7] wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
Date: Sat, 28 Nov 2026 02:00:21 +0800
Message-ID: <20261127180034.1058591-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127180034.1058591-1-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com>
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

8812a and 8814a support HT STBC, enable it. Previously, only
VHT TX STBC was advertised, this patch enables STBC for HT too.

8822c will lose reporting TX STBC capability if efuse reports
only 1 path, but this is correct, since in that case it doesn't
actually support STBC.

Tested on RTL8812AU with an HT only AP, HT STBC packets were
captured in monitor mode.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c     | 2 +-
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 1 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index e2d37c300f..6bafda9138 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1591,7 +1591,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 
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

