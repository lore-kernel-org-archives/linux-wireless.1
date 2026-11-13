Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557262;
	b=JNxaTHrg8S9tvqFW4SqsjCo7Zk8G1HlwGRySkzvKdR1yYzB8TmhEh8upOolRYpVrL5t8
	 38yTERseeTT0a0rqMI/FS/w72vMrV9UjBVEt2WsZGiQJ9DyTUUofeVbR7bgeKNTjICTfY
	 ctKJ6GW1S3psfV2pF+w8NP19D54lxBE0OJgC5jhmW4KmeJ9cAG38YoY33D9dmWyJ6Of9p
	 x3cYg7j+B1oGjZhTkUa1tg9ucwN8jUEJ+Zoq1pkgRwBCIU9Xpjr1gx1irvpzlSN/ESoTF
	 ikp/eiGFzt0gb5rRQ1DEf5JdwKOfiPYBfxtNo9pETJtw2nMIqhrA380c1LpoWY0RKmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7ieDqsXSgaS6RaWfknuZ9JmiW+/3gvsuLX/K5vhjd0s=;
	b=oPHsjwH3JzS7Xk0/SSl7Djz94IJbZ6xj4AeIhQNe5T9eEyGr2aKZNp3Z0Plj7Y8fcO8j
	 6VbDDnm+2df097T0L2WEQAorv5wuaOJynis7ofLV69sTYac4EUshqL188HbiKpm+Q9Fvx
	 1pdQWP2twcIC1Pivwk1om7aKY0Qq9BG1hhmyCglOnwDNlNiHynMlX/vhdtxftm/tDql62
	 ngBcCDuZiaY5QIoyzFTIbGWk2wHOySB+EGIujvvxLBNhNzUkbwESS+Ys/93r0Ju/lhClp
	 GizCAt0EoAzbMJCu0p2Vvg4sUfICce6+L65yZ8fRGiZmuOOCUnmGQP6xBF2Etec+lcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MWW9EPln;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032C606A33D
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3032C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MWW9EPln
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d28f75d62so151416166b.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794557259; x=1795162059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ieDqsXSgaS6RaWfknuZ9JmiW+/3gvsuLX/K5vhjd0s=;
        b=MWW9EPlnYVIPrf1kAPp5iwfQ3PNeymbdTPxXMX5qc+MTfOgHulTBpSsMlbf8+Sojbs
         tor54RD3COzltf5TcQsQlDh4e8R93fDU96H45XlIbQZBGgXdQHCvaligZ5BOnquGDeZd
         WfHflhbT4USFPwFP6TvGVKEI8f6MAH9Yb5l31FixO0BsYXHtAytsKQJXE7aL51o2f1fe
         xESAglBT2i+vnkcDZcXPKFRt/hpOoCyEJxUlAwRWC8EtmS6y3RiHzGUu7bZRvF5BQxw0
         j/Oec6SAdX9H67xY1U6zNCHukHnAmVL4xf8fbBZT6eMZ15gKAFEhMgOK7EPj/MtespWd
         IP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557259; x=1795162059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ieDqsXSgaS6RaWfknuZ9JmiW+/3gvsuLX/K5vhjd0s=;
        b=Sps+6v9skL52NaWoWLsX+p69z8aZQwJdBsjKVT5+1cgzzYi7ALZ79LMkAziIK7BWEL
         WoPAip8OfUptQq8PRdU7SOIV+OxObdifD8A4yUpUGHHfOfC2JZUFONqkFq7gWEnxP7SW
         afK8EB+WhFNJ7kPMxjcbphgKX7idynd0BCO4kLqN1qn5M9rv3CAIeNWmN+ico313pHr5
         zrYd0CSLnvCKcB2njhbQVvGp5S1pVextIqca81SxvHRdUKHj98HqQR2USkRY/GZ6+YXT
         JW1yDbRPvvY6hTVlosocRRTcLUM341rkvtFdMAouv+JmgcvxlHxz5FoQJDUx2EBFaiYp
         PpqA==
X-Gm-Message-State: APuU4Z/usIuYEKoxw3KAT9U2YkHhmavLRiAEfTEms0c6WZ0nD4hCMZ2g
	PCEcRIS0omHuCfjB9wEBiQd1NAEjvFwk6MPz+BKV3mICHNNZvkCOZEA9oPfDmyk1Jg==
X-Gm-Gg: AYBFou2qTpC/linuULm2eiNYsNBe+eRnKeG3XvIePcLMD0kUTQzfw9SDI5i86XksC2g
	YbvqUzFucFS2JU4zTpgTk0ER8EYp6t3XLDpTKijz9CuWCDWnjaBhJeNjrsvoW3M4eNRfFuFQQtZ
	nSfhKomeveiiiiqZCdbOsQH1o5fc4m2Ov7OtjkKpuH5gDarJ+BnFQx1/WYrpW6XdKpYvX5PM8g0
	aVva32KuPnu1DGuNS8RKIPMjpIYZ6iKxD2HAFmOc9uyUvGDCt2GfGWNIMhDsY3EjHI/tIPJviQ1
	W96NZdocWSO/WCxhRScR7QQ9yTKAhZ8sFGH5JMeAPDnwsbzCKgRBiZv0v+mdil9rmezXjl0Qd7G
	yrZPbyDXduZZ6WfaCHarZiELlE3KtDcdUqRzgl8lex4p/armIO6A070lakj3rVkwCvyGMGuYD0o
	YJ1ZhHd3RluiAs0sSocbLbBvkxAoYWEbkEGdc06S999DqO3U5LZRpcLuBpoKO5oyDT96LXStW+M
	l4j2S8WcmOinuXngAzkpdH58Ka9tEbvveb7feJQR3ch4EmTaX3XzCTyd4E2Fy5gwqEeGTn5//Kl
	qivav/WdGI6jE/wjFdUDE79MdQfyc+EBCHuI
X-Received: by 2002:a17:906:c154:b0:c4d:18e2:e66c with SMTP id a640c23a62f3a-c5096369d85mr118746566b.18.1794557257985;
        Fri, 13 Nov 2026 00:07:37 -0800 (PST)
Received: from vschurink-Latitude-5550 ([178.224.169.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5b078sm63494566b.56.2026.11.13.00.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:07:36 -0800 (PST)
From: Vincent Schurink <spam@acio.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Vincent Schurink <spam@acio.nl>
Subject: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the station RSSI is known
Date: Fri, 13 Nov 2026 09:07:31 +0100
Message-ID: <20261113080731.30155-1-spam@acio.nl>
X-Mailer: git-send-email 2.53.0
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

When a station associates to an AP, the AP does not know the RSSI of
the station yet. Thus, rtw89_phy_ra_assoc() sends init_rate_lv 0 to the
firmware. With this value, the firmware RA of RTL8922A often uses 20 MHz
and VHT-MCS 2 for the station. It does not try a higher rate, also when
the PER is 0. On an 80 MHz AP, the TCP throughput to the station
then stays at approximately 36 Mbit/s for the full connection.

Move the mapping from RSSI to init_rate_lv to a function. Use it in the
RA association and in the RA update. The firmware uses init_rate_lv only
together with upd_all, and upd_all resets the RA context. Thus, set a
flag when the RSSI is not known at the RA association. The RA update
then sets upd_all one time, when the RSSI is known.

Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at 50 cm,
-38 dBm. Each test reconnects the client, then sends TCP from the AP for
60 s.
Before: 6 of 8 connections stay at VHT-MCS 2 and 20 MHz, 36 Mbit/s.
After: 8 of 8 connections use VHT-MCS 7 to 9 at 80 MHz, 614 to
669 Mbit/s.

Signed-off-by: Vincent Schurink <spam@acio.nl>
---
v3:
- Set upd_all only one time per association, with a flag that the RA
  association sets when the RSSI is not known, as suggested by Ping-Ke.
  v2 set upd_all whenever the level changed from 0 to a known level.
- Remove prev_lv (reverse X'mas tree comment).
- Test with the client at 50 cm (-38 dBm) for 60 s per connection:
  without the fix, 6 of 8 connections stay at VHT-MCS 2 and 20 MHz
  (36 Mbit/s), and 2 of 8 go to VHT-MCS 9 at 80 MHz. A stronger signal
  does not prevent the problem. The RSSI rate mask does not remove 2SS
  MCS 0-2, and it does not limit the bandwidth.

v2: https://lore.kernel.org/linux-wireless/20261112075622.32785-1-spam@acio.nl/
v1: https://lore.kernel.org/linux-wireless/20261108131723.206533-1-spam@acio.nl/

 drivers/net/wireless/realtek/rtw89/core.h |  1 +
 drivers/net/wireless/realtek/rtw89/phy.c  | 30 ++++++++++++++++-------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 0d893b992a4..ca5f2aced33 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -4711,6 +4711,7 @@ struct rtw89_sta_link {
 	struct rtw89_vif_link *rtwvif_link;
 	struct rtw89_ra_info ra;
 	struct rtw89_ra_report ra_report;
+	bool ra_rssi_unknown;
 	int max_agg_wait;
 	u8 prev_rssi;
 	struct ewma_rssi avg_rssi;
diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index 795920b899d..def01000a59 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ -502,6 +502,20 @@ static void rtw89_phy_ra_sta_update(struct rtw89_dev *rtwdev,
 	ra->csi_mode = csi_mode;
 }
 
+static u8 rtw89_phy_ra_get_init_rate_lv(struct rtw89_sta_link *rtwsta_link)
+{
+	u8 rssi = ewma_rssi_read(&rtwsta_link->avg_rssi) >> RSSI_FACTOR;
+
+	if (rssi > 40)
+		return 1;
+	if (rssi > 20)
+		return 2;
+	if (rssi > 1)
+		return 3;
+
+	return 0;
+}
+
 void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 				  struct rtw89_sta_link *rtwsta_link,
 				  u32 changed)
@@ -519,6 +533,11 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 
 	rcu_read_unlock();
 
+	ra->init_rate_lv = rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+	if (rtwsta_link->ra_rssi_unknown && ra->init_rate_lv) {
+		rtwsta_link->ra_rssi_unknown = false;
+		ra->upd_all = 1;
+	}
 	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
 		ra->upd_mask = 1;
 	if (changed & (IEEE80211_RC_BW_CHANGED | IEEE80211_RC_NSS_CHANGED))
@@ -733,7 +752,6 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct rtw89_sta_link *rtwsta_
 	struct rtw89_vif_link *rtwvif_link = rtwsta_link->rtwvif_link;
 	struct ieee80211_vif *vif = rtwvif_link_to_vif(rtwvif_link);
 	struct rtw89_ra_info *ra = &rtwsta_link->ra;
-	u8 rssi = ewma_rssi_read(&rtwsta_link->avg_rssi) >> RSSI_FACTOR;
 	struct ieee80211_link_sta *link_sta;
 	bool csi;
 
@@ -747,14 +765,8 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct rtw89_sta_link *rtwsta_
 
 	rcu_read_unlock();
 
-	if (rssi > 40)
-		ra->init_rate_lv = 1;
-	else if (rssi > 20)
-		ra->init_rate_lv = 2;
-	else if (rssi > 1)
-		ra->init_rate_lv = 3;
-	else
-		ra->init_rate_lv = 0;
+	ra->init_rate_lv = rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+	rtwsta_link->ra_rssi_unknown = !ra->init_rate_lv;
 	ra->upd_all = 1;
 	rtw89_debug(rtwdev, RTW89_DBG_RA,
 		    "ra assoc: macid = %d, mode = %d, bw = %d, nss = %d, lv = %d",
-- 
2.53.0

