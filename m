Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743796;
	b=YtS7o4pIg9qvK/keNNRODkMYcH75sMIShQo1jx39SdEFWdHjJCyvBkcYjuu7Tehn0KGF
	 AhM3HFLgZXulTfk5zFlvMVHKCX+PqC7yq126o0wbio9McpBthCDuFsEx5FFTcOea8xMeW
	 4X5wa5AhqE9/N+49Pg9stFoqN2gpQgy0wTt3nY6XuGtlUblKqYtafrnUR+ZqrWd+BP1Ty
	 4nC0kTqH+FFuHwLzx/OhYiOrgKMWdO0SoONhYiDIoY/d4KDZN+8Wux/RjnDD5l7o0vRdM
	 70jGBqCPkCgJOU+yC2kbE6qONpQS0unNrBpX62ih9yId4INHA+xqJ47AuYDAFB/5Jug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s2xIIXIn9ZMfAOFx41C7Rxwc3LX9/CGKf6rN28Tp9l4=;
	b=4OK1+XxbVyHL08dlLI70B7FEZZ7EVsSZlRiijZ2gk+mrn9YpO6Y0RT5q2i4l6PDlXB0r
	 BhHbb7U04UNnfAMqJ9kO5yNudFKUJBkFwDs4PY9W0k/TkFOa2s+7yFqItwLinn7xMpwQt
	 GC+dZl3ogGsvQHRsbXFrHJ//0Xm1ysqZOWUmxBkM2EMlUKsVJXvNjzu/IbOS3E39YF+ua
	 l4PB0HYkO9BbGXAA+dSGQz16bpgB8yP49knWHJfCduM9Zr4cETghjoX5L++DodDwPNywa
	 TSkUrwUukNejdPuUYD1yLs/RhZnZQoSJb/S4AqH+c1P8Rw/G80SfnKUjfIdqWStlT1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y7R3p/T+";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D218606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 11:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D218606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y7R3p/T+
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so930318a12.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 03:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743796; x=1795348596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2xIIXIn9ZMfAOFx41C7Rxwc3LX9/CGKf6rN28Tp9l4=;
        b=y7R3p/T+cH55CCZbH83enIUNAXJFg5KoEU0Nqkl5d2kPB2fLJahZjBK0bKF1Kkt/PJ
         uZLQl0zsV8RFr3OHUleGRTe4Odg3i/meww5rK8K/ImFOAWkhPrLtqatoZ5UZjYLV3gCm
         LzgCMilGr6nPdYaRgCf7iHNUiQzH0CKclAFS/41gso2NXswtgq75YOoHBjKN8wsguZiF
         NVXFhlgzVFGha2198xoy3EOXqahQhHBrD2NpnW0NrcLXYLVc296KpJM4SQLMnxSlh5RX
         J0kTld/oI67+jOGsageib7dIPK/dLOw/Jg9PS6iAyrCWnpQ3MamHXKTzYhw+jxSTGv+o
         JizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743796; x=1795348596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2xIIXIn9ZMfAOFx41C7Rxwc3LX9/CGKf6rN28Tp9l4=;
        b=0gVq8H0DhtAttjisWMRsPuz7WrNN7XM/qxrcvapLhbnURXL2RiyBogoSGPGVqJwyss
         nM5j86OKMXeHP1itdzYKC8lWuC+wcCUMA7K1PxlPzNucStJ7yFb/nlakq461hT64QYEC
         HZoA4N1Kn3jDIQLQ1Re16JNAM2H3/cDBySROm9HOG/Xd2I7affhBAJELFHhyi07UIVcw
         WahRzc3YXtIY6DWjO+qB3QJPFMTcbMhFD8DEOe2pMd2Aw6uANXl9TE8u2ahqEk66eeoQ
         zwr0JQMLf7AHwQDe92w8gREwGt8HJKxa5Qyapwo4Eyk5fh4RsGXdNDp4Wl9/p6q3TLn8
         Neyw==
X-Gm-Message-State: APuU4Z+6Dxec1MNP22x8VuaRQpWZtVSxt2A68xNqJ8qJuP1I9KH6T5mf
	Zf1sN4+TKKL4YrD1+bjqal5aW7DzL/IQaaOIhw6Ru1cCB2WkwUxddZMf
X-Gm-Gg: AYBFou2g5NlzCMqskzKO/2M2/e07dOOgc6b6yT8AGdNfl+zBOfUeWCbsL3bNGdoS2a5
	tIe9aI741N2jC2aMD6bjgsZT7H/rzMYid2mPI/fgqvrCt090iAqGXGKJJwJ9WXSy6uc9HjVa0Ke
	BrnH/B86SiVUWlU7utMB7A4mZ6HKFrs9s0NVkvg0n+YeCoXln0lJeP4fUU6Z/ygWmbjh3FA69w8
	iqZYMTTEHRSpbxLBMh55u2OV/3cMTb8FqG4FPKcPkQiXL4BydW54mFOF+4MpM92IPSv6id0DP2n
	HWMiWvbzra9iHmN0ektB7Y+UKztdBcwl0uCBnUP3tOkS7Rzcl/0TRSzlgFCdwZXZToct/K6V5j9
	WFGkehcmjR3rzRRrM4i0Z+6yeTOsEMAh2LTC4L8K0tT7klF90VI5WpTVH0GhG7O0jhyDth6ldq5
	+X6qOjm3SbBcioXuxaP7zo/EYOJIVyqs8xKTdzLbqdEWsNS70ctNbxblz1kfdHQ2Lr7U24iV523
	6ZdD26eMXH26eluQ9WU+0eKlwHr0tVGdfMTlyw2iSQJt8avcVHK8le6YiEm5njSnZlwv8IewPkI
	Oep3H8tJfDwsuOPF/i+xXjknC9RpKF9/blYqByNJmOW11oOcp4jV+p8hgSTAYoQbZeJVLLsx0OK
	e9dJKAIFv6Guo+snYM6Ls6wjoFWOilxaUHRW/MMWVxq4=
X-Received: by 2002:a17:90b:1d46:b0:3ac:7613:1ec3 with SMTP id 98e67ed59e1d1-3b1b0a3eaaemr6651022a91.37.1794743795811;
        Sun, 15 Nov 2026 03:56:35 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:35 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 7/7] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Sun, 15 Nov 2026 19:43:33 +0800
Message-ID: <20261115114336.1739863-8-hjf3108@gmail.com>
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

