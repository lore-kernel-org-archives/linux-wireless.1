Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802474;
	b=TWvTDhTOgR+3wK9XlqQPUJMCrjYF99tsZLZssE1QD/uvRwTbUWCvmn4ZULpi52qIpBdn
	 LH6NDAjB/4w2Qs0XKpTWwrzalRpR7bZnScFdLk9Ev5VQxHxZDT1FnV5kkt5zSldclxj1x
	 smCkPCBsiewlM+DDH4HBcNFYMumFIO2RdDYGjIoHpWOG/QJUfzCbvJUwDbGCM0s7O11GL
	 KwCRkZbtkLZN+O2n1BWqGWluwQNBuVTESW87If1oX4O46xguBKHnlWh0w3Hj+Nsn/xBqU
	 27dT2TOFP0MsYi20PAa8MJgcmk4o5z7XApFykSExUMSVf9aEksN19kpy9DOxGDPw0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RQl7usxNoXpg62krpdtYwmUisSfy7ujLO8fNklTaDb4=;
	b=vCkD4f+qr6cnMrx8DUuREemmYA+5rJr5wqnprn+5m7LFRgYjhNwhjRpszPXNpynycqx8
	 Dqaa0S/oD2DEoqW3+SIHXKchcMyBGPLhJrQPmtqmoWC8hB8BBpalJPmjrob82kGDNKCym
	 pGnhNrTKBsQOx18Q+5J+wWD1cg1F92MZrWDi5yfkFf9s5qtPLs/pP7woYkVF5toO3Hf6F
	 Qf6x96p9H4z1GP3TP45zCRlUtkLSiNiB+wmXZTD2BKcmG1w9g1vErKLsD4n7m4aJJF4TN
	 3XhmlDuRRasbM7tWa+ciHG2kLQm6nEKSZmSGhbaV4O4ixKGq+Wse7Z0e+0Lv9jMnKrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9Nm+ODD;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F9606A324
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9Nm+ODD
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso6477464eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802473; x=1796407273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQl7usxNoXpg62krpdtYwmUisSfy7ujLO8fNklTaDb4=;
        b=b9Nm+ODDsN3LgiNRVNlsFyLp3iqL/Ycttq21GG0drFXaU/ORH8F5OAE/m0+EMzPOq5
         km2Lf65allDC0Q46A9vLXM127PSKCJRp3EdvPQCnoY5TiAm8qtOX5/4SuSowWOWzmxKd
         iC8UQzL255OTfZLo1qxxkk1mtKFBHfcW0IN+HKBjkDhuy3MlWrdluL0GV3ZcsKrB9G83
         8cIUHekTuapb60uKw4O+wvmK2HFvQ8RP0imA9xyG7sOtq3eh8RIBvCZcP14jEdCKz7PC
         Q1tqKf0bSnlL4FTIr9KdR8c2DJcFg8ztGuE34vBglzPq/E+tAd94/rqvl3WpZfv89ruU
         UqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802473; x=1796407273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQl7usxNoXpg62krpdtYwmUisSfy7ujLO8fNklTaDb4=;
        b=cZVWHF8vlDJl+pGVSAs7KBZWmb+5SUif48YWEH8ZsipvkKDFno9LUul4yE2SSRkndv
         jAB0zZCns132sG93rt+NI7xjHHvlo6fAjKoK0yaMjTqzlRF+kaUTN80tCKE2+UwISEKW
         2/Ai6DmbNuDmEMevOGaPYhLVT7esdBvC0b9mXKQj4ojpC5UGWSppCr9Sumw8VukaPsZZ
         cVJo7767UklV0Rb2n8435Q9arugquOrKdMQOyPI40ulJ34E7AxgLI0eh3zWoZqlV8VVk
         PMXBdyo0xJJVlPFEuhexKY7u4UF9NUBtEKquh3GJzCjyXpg1xdTj7NBGh0IqbM/l47PN
         4fVg==
X-Gm-Message-State: APuU4Z/foGBf8PY/pJO7ujTif1zzSKe5XAOVuuqHqfRsMKV1NtLCzxRl
	rCKLbtwC0mcpAgW+5stHO8K+gp+aLK476EpPK9+Fidkwj07ryNJDLtAQ
X-Gm-Gg: AZFdTZd+4oHQxxdVfH2tfagAVsX9lJtct3AXCrAwkFpGZFKWNJOT85hG480HKXEkLNm
	BJD4X2a8tmGwTN3zKrvqZQeaULGqqzdlD05+2y0IcpWlxzHD9oUW+X/KTrd2/orGFFl31vn/fnf
	w4+8PW+reum7eS9TYCnM9d2tClRxc0uOBbSIyO0uWIjqZeFa6cq9u0MzKwX+xgew2BVBP7VrtX7
	RsloRUND/xZuH1u8QopCcbZht7PrOBxVXMhwjndgw1HXatsxTWeMw2ASwwraZhokQoRnXtrhXhL
	i2Yi5tcAU6Xtvk7LjxFes4odaCfhY7YVhrtsYSr2h1AfHYc41c0yR84ZFlMGGVMS9/pLAX3JSus
	WJSl06QgotEUU9xfwBl3cWNjBX0iL40CaOs3LHaTMamf8+GB6ww3zy9nrpXqyUR6YUosf3iVlR/
	etnG8Yar1nnf5rtUOz1bbCwEYcaMA7KZ+i6MLvQSBxLCDzbYPZHFgsI27By54SpFHP0VP8hYkT+
	mgRb+zyTB95dvcT1scBZ9SOr63XHu+Fj0F4jLNirXlCWnCGYKj+WEblm3TF04lkfiQcAULWYf3Z
	RQmKVwTz9/y48nOXU05kFyLkf+upN6GZSyN1Ab4UiinITlTphQGaTaBev8DR5M1azac2pJNdDEY
	3eQPAUNBlPzG6ObYlAIM=
X-Received: by 2002:a05:693c:880e:20b0:386:b54a:7f6e with SMTP id 5a478bee46e88-386b54a8032mr15389898eec.6.1795802472387;
        Fri, 27 Nov 2026 10:01:12 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:65f1:53d:ffe:71c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm76044620eec.28.2026.11.27.10.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:01:12 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v5 7/7] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Sat, 28 Nov 2026 02:00:27 +0800
Message-ID: <20261127180034.1058591-8-hjf3108@gmail.com>
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

Previously, these chips had no set_ampdu_factor callback, so
rtw_set_ampdu_factor() returned before programming the peer's
limit.

Honor the peer-advertised receive limit for transmitted A-MPDUs.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 11 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index c8008cf43d..7e3c86160f 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -78,6 +78,15 @@ static void rtw8812a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
+
+	/* the vendor driver sets the undocumented BIT(31) */
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 static void rtw8812a_do_lck(struct rtw_dev *rtwdev)
 {
 	u32 cont_tx, lc_cal, i;
@@ -926,7 +935,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.set_tx_power_index	= rtw88xxa_set_tx_power_index,
 	.cfg_ldo25		= rtw8812a_cfg_ldo25,
 	.efuse_grant		= rtw88xxa_efuse_grant,
-	.set_ampdu_factor	= NULL,
+	.set_ampdu_factor	= rtw8812a_set_ampdu_factor,
 	.false_alarm_statistics	= rtw88xxa_false_alarm_statistics,
 	.phy_calibration	= rtw8812a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 17d3677ca4..408b5ecdc5 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -49,6 +49,15 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 {
 }
 
+static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
+{
+	factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_64K);
+
+	/* the vendor driver sets the undocumented BIT(31) */
+	rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
+		    ((8192 << factor) - 1) | BIT(31));
+}
+
 #define CAL_NUM_8821A 3
 #define MACBB_REG_NUM_8821A 8
 #define AFE_REG_NUM_8821A 4
@@ -872,7 +881,7 @@ static const struct rtw_chip_ops rtw8821a_ops = {
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

