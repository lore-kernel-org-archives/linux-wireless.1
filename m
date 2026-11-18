Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998863;
	b=5Qtum8bDTyt2pmoEh5FeLrueqROVYa1Z33rCnjh8Tt7y0dOzLokbF8AhmyizIWk30ApS
	 vdME73bUUxWquLAQIGle65LrQz5rn8WsZtHaWrCcbafp0stCFK6aO6UILPKXrMZvk2siz
	 YOxp6r4p39BlAHh+mwJMXv4UWt4lT+q82IioRWvRvGGNvjIo1A/udKDSsidl8OYOEjWUO
	 paCF/iyP3eFZvl+1G+6YoRbzNwXtP3T+oibJy0zZFhwHUCa/q0Zs9Ry25yinPFqAl+aEC
	 RCIvzbOnJptI6qHS6w2/tR4El9NGqiDNe6VAntKTSUYhbJjPq+jV6GLOwgF6bcRjOBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dmM67f7dnvS7ekX0wLU4p/nyag0ug9oC2PUG6KXqhxE=;
	b=05rAELToJ1unAl274SdENlKPknizPNBnFTR1IIg9SjtwRqLu62Ztsp22c8NLY9lVT0Tu
	 2Z89Z51X0j+HjlChg7osF8oaGYFKmy46tUa3v9Hq1+A1LEAuZh7i2SYpCQs9dXMHjBwY3
	 QxxUfiNt118ON1US2eSbKxmpFvlsx97j1sDe+0ignTCXDeVOCWyxYnDVQlyWzPipos0Cn
	 bSy2/J96Mgr1sc21uGxsDwBGmT2ESiBks2fRcHgwNLsqOjgsJPBYaObkukKxjCeQGNDR7
	 yxRInPx43mx1uLmTE+hHiAk1IlFMwfR/dZIMerzYO4paxA+fPxYaczg67/Va/IkL5Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3M22g9p;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837A60A2602
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2837A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3M22g9p
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so649927f8f.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998860; x=1795603660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmM67f7dnvS7ekX0wLU4p/nyag0ug9oC2PUG6KXqhxE=;
        b=Z3M22g9pOSAMlNQI2lPr36Rxmq/Al037EkxtL4M2qfFlxT/8fn/LSpjL5vjjVM8SHZ
         yOLiRiSWbEDs7iVphhsQcYC7nkiPP8f3bu6KYK+N//+JVbwz6yO6UJpN5U9NAn1HWy6u
         oMn9Vb/q5EU6sZq1rUQMRDmRAQPQreTfpC6Xpd1KKyCEtK/VffGtgnZFccYhkuiOw8WU
         LjGrMUZ0kvp60q2D9Qg+h4Muy153d1qdQ9nWhC4WrTcWDk3pw/aCrmYMzsG0uQDEbWB4
         r78Flcv3cCSzthuldKMRu4hTtzB1WURYWfzFqYZ0uTBZ2R7HpmVMqyaDP/3sGXWTgrRk
         UYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998860; x=1795603660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmM67f7dnvS7ekX0wLU4p/nyag0ug9oC2PUG6KXqhxE=;
        b=0BByaHfjHkapzWZkwIExl7E9aEwP9YpgM/9azFqtvJkdduYZj7qfKgGqM6KMjmIyXU
         X3YnZEutkgBEBkZX94TJyFNz+EMTLhykHsqhFyWWJq5d7HUASI9CtX9S06zuahIxBn4u
         bgxEvYKWar+4Ujm1AAq8mQleO3//6cuMNllUSMzyBpFKiXxXBPluV4RkTZ871XPvOHg7
         eaJmZQ19Qk6VLWsgRbLjU5WaotWp47M+QeWIUjrxHYV+LJpGfYaznxE1PEX1fF0nc9/l
         oFfYpDBv2PlMnmEZTaOzrPC/V2uX55imv8FsX/Z1oC6tnMQdCL0Dd/XWiMs4he7oga8W
         SQ+Q==
X-Forwarded-Encrypted: i=1; AL+hErF+clkHqeKOpNWf5ZOi5g3jaZwQ76WINwyyUQ2VV2EiQRizHmWDMqRJXF2VT3VudA17N/LzQCaFZo4j6euaBQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EHpNzZj/zsOki1nbaMXuuPzOWFRCt5E16+dSoIBPBa2WAsgue
	6jrcVb1oIuMfw8H+oahvLFosTwDEw/IjGKKsE7rf8sCFaDbYECkS8N5g
X-Gm-Gg: AZFdTZfdVPyUNp8zL8ArsdNtSDCVgkJ2BUguey/o/gEFPzBISqCRj7rb7a6OwX4Ws4N
	Uu0mlsbnjmUM2B/BLfbyG11WrctfzNYCW5miYh5X5CZMqlq94Fw4a5KOiEscHe7qe7mvJOB2fIS
	9iNP7F36Hu5hlQL7IYOT/zs+v9RC70vjpY+l3DmQX5RMQlrwjfHF/44WUE10DWRGHj+A5XbENvg
	bmab1ZG9kEqDyK6rq00l6HXgEDxXUO9CKVSH4jBVk+bFZO3Fy632+6sURmD8oKGjn0pT5hYrYv2
	L5aee/sZvVXfJvr5xrBq4braLspHpRBGJDlwTd48JLy+M33PE3oAwimfaV2FVHtBkGfPysTuiOV
	K/P+udTA6e9LVgofib3Dlb49JJC14+F5OyWfd/RO1ZBl3XtsiZTYE5wwJByTUn2ClaNY5QB/OzH
	6JnJqvxc9jra3sc5Y6wGZkgMvPriY36gEyoC7p1/nyMLNoCeKQNURWuUS3MCN/TdI1C0tsQjJcJ
	5eXkR+Rqj4nPsQrMnIMaNfzQgCgk7is/TaCvOVUUT+qtmzgEM7l63OWPUw83SM8leC/gdwsfEVD
	nf8ycWRoI8KsYiaAypcYCZ+A57eREWCgFFCR8IAfbkreETvfU6qc+mZ3
X-Received: by 2002:a05:6000:299c:20b0:49c:9e8a:31ad with SMTP id ffacd0b85a97d-4a63ab743f8mr3210519f8f.42.1794998860278;
        Wed, 18 Nov 2026 02:47:40 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11643sm3883554f8f.49.2026.11.18.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:47:39 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Po-Hao Huang <phhuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next] wifi: rtw88: find an associated station without allocating
Date: Wed, 18 Nov 2026 11:47:38 +0100
Message-ID: <20261118104738.2020747-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

rtw_core_check_sta_active() collects the interfaces with
rtw_iterate_vifs(), which allocates an entry per interface with
GFP_ATOMIC and skips the interface when that fails. A station skipped
this way counts as not active: on BSS_CHANGED_BSSID and in
rtw_ops_stop_ap() rtw_clear_op_chan() then drops the operating channel
saved for it, and a later hardware scan no longer goes back to that
channel between the channels it scans.

Both callers hold the wiphy mutex. Walk the active interfaces with
for_each_active_interface(), which does not allocate.

Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan with AP mode")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev/
Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on rtw-next with a test build that fails one entry allocation of
    rtw_iterate_vifs() inside rtw_core_check_sta_active(): on an RTL8822CE
    and an RTL8822CU with a station interface associated and an AP started
    next to it and stopped, the saved operating channel was cleared in 6 of
    6 stops without the patch and in none of 6 with it. AP, association,
    firmware recovery and scan on an RTL8822BU and the RTL8822CE on 2.4 and
    5 GHz gave no lockdep report.

 drivers/net/wireless/realtek/rtw88/main.c | 30 +++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 2a38a6828e3a..826e1bc37243 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2448,28 +2448,26 @@ void rtw_core_port_switch(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 	rtw_iterate_vifs(rtwdev, rtw_port_switch_iter, &iter_data);
 }
 
-static void rtw_check_sta_active_iter(void *data, struct ieee80211_vif *vif)
+bool rtw_core_check_sta_active(struct rtw_dev *rtwdev)
 {
-	struct rtw_vif *rtwvif = (struct rtw_vif *)vif->drv_priv;
-	bool *active = data;
-
-	if (*active)
-		return;
+	struct ieee80211_vif *vif;
+	struct rtw_vif *rtwvif;
 
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return;
+	lockdep_assert_wiphy(rtwdev->hw->wiphy);
 
-	if (vif->cfg.assoc || !is_zero_ether_addr(rtwvif->bssid))
-		*active = true;
-}
+	if (rtwdev->ap_active)
+		return true;
 
-bool rtw_core_check_sta_active(struct rtw_dev *rtwdev)
-{
-	bool sta_active = false;
+	for_each_active_interface(vif, rtwdev->hw) {
+		if (vif->type != NL80211_IFTYPE_STATION)
+			continue;
 
-	rtw_iterate_vifs(rtwdev, rtw_check_sta_active_iter, &sta_active);
+		rtwvif = (struct rtw_vif *)vif->drv_priv;
+		if (vif->cfg.assoc || !is_zero_ether_addr(rtwvif->bssid))
+			return true;
+	}
 
-	return rtwdev->ap_active || sta_active;
+	return false;
 }
 
 void rtw_core_enable_beacon(struct rtw_dev *rtwdev, bool enable)

base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.0

