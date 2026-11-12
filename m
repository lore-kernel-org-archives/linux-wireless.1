Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470188;
	b=4bEopzmw71G8Vevj4F+ny5J/GfqgnR2K7OkIcMqEJf47jEOcJWQ9DFn54kgfkCobpLPX
	 e7KUbh4PfEPdzllr34c2UFI0TInRPNSKHfK/1Fjt1383MpCoD3FCyi1zdl5kzB/sgBk5g
	 8/udKZqurxiIHGum4N0mFk9SN/zHB2ka4Lzn6usUp2/LtOUWvvn581+AxCdfXVqXBItQB
	 3dJl1MVjer+L+f1ovtQHGtbp6SnV/iao+IXFVGbsigur8rwpjbKne7UmN6yREKkiN2thP
	 fhl/iayTl1E9qttutt2RdoMur1+g/VKjUc3RW1mff7NwTlQZ6bxj8ywNp4c0jC0q8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BkAGiA/FGNFDh9nyzZQmLOkMkXw2X8gldLBWKYocwzk=;
	b=3gyx6/GQ5kwIoKvTFV+XAL75B+sWzx/QM/JLKpozn/FP31ntY6FPdKYi2a0fSq/ee1fh
	 f/LXbjppMQBpftN9IFTm4IDavFq5rNP14Yns4/A9XSuhZPuPB12COAbZr75V5ojLjaDb7
	 zk9j9t6CN3L4qLqWtSRf5+xcMjb1QVaE/DzJyf2IGc1i9zqsSf9qTgNpGmdi08MW2Nm3I
	 DgzEzQT3QBKMxOrWz9VRPR1rrkGMjn4LNSELcf9JB6y4lDnI1xqZAF/DZYwOZgHk95iQA
	 uzLrlrlAXgbWsDdVzBFntU6LQh66srhQm9net2v4wux0y5TUgjgImCN3VkVplExBEXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eNZSRIPx;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B754606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B754606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eNZSRIPx
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4395d31228so531285066b.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 23:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794470185; x=1795074985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkAGiA/FGNFDh9nyzZQmLOkMkXw2X8gldLBWKYocwzk=;
        b=eNZSRIPx5tgWPblFBYgIKymiQBCC4rIxPs79ZjocHX72XeUcjfZCj11kyNs4PQQbUz
         EK/mpNGakGc5QwI/i7cAJSJMui7SSVOn94NE5HxdtoU2xcsbzVI/r+nFveqJiiSG4R3/
         ox0qVZeDNK9Glz/mq1B90/IZ4Qph+ZPo7NIN5zw5sPGIVil6QmYmZ9Cc1UYJ1X3r4atn
         lFiYuW9aKFHpB4YiTXtqmz4l6kHpdtOCoOdSR7qNwHFLNb3XZza0ll9mw51duMI5JGb1
         aCJhdrboBjrBxFh73BtlabfwH30rgZJC7djrSdp0ukRMHj6W4QfzFNlB0S/zRZgTG3qq
         NRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470185; x=1795074985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkAGiA/FGNFDh9nyzZQmLOkMkXw2X8gldLBWKYocwzk=;
        b=d/Ved8WQ+eRhgnm78xyfH2knNuE/DO+pX2ajAj6hwVRE5z73kSxFTTbA83xHV8tvaw
         8bke1WOvL570wulvf0sdR4vvyY+1vR9gWYxbKMiddShiLMkvy54Cg+IV2UGv55F6rEhf
         qCWLg2LDbwdgcEacHNGSqmvKaYwVGXDE2bWl0DLUwHQvmz4f12StyfHMEUuNA7TY8kVv
         JsreZjTJZmkYEgHtkNRh2xv/z05XIuRQvynBbG2yEY8A376vOhsS74v6ySRG3CXGqXzg
         qhUOFfW+djOnCMzIE9cc7yhZL7yKzpboddi6A2sEiw25lY2tj5J6pNv7lVSxXptHx6Lk
         F6ig==
X-Gm-Message-State: APuU4Z/jIQZNiP8Iei0gWu0hyTN9sLCi3DR8aAzMKk6oiutmzL6k/JuI
	0oQUJrVpi0DpZb+qbZBsCxaRBNKh3+ZLs7llpWoEZcGS/PsUfnezVI2bESQ/X5we8g==
X-Gm-Gg: AYBFou2Z39aJXeqc8WaLYB8+s2wvieOS8uptmGEmwi9rDCiflxh3e7Q/xM18z59P6Zj
	+GqMDJWpLiwuIAONn6QV/RkbXyrUi1etqWOi/e5rkuEZO7ISGeaFqzwyQCC0zobN+ZWS8nHxjOE
	0siVvvwwc1bzjwv5p4yv8cMhnkPUt4V+cFHqUPMzEs6BM1GOGpFmXOx8FPfWn990XpnyS9gHHO/
	XdtwnaXMHlEk9RWYNZmj28GLr6uQa6rQmcTeICamy+KCZDeq9VhnvKVfp4YTkc7RtMcXk+owA4C
	BznjkUhPlZ2A/pERxmzt+P9znMJmyFsoMD3IilnGDDt4UYK7uro0rUZeM3jrso+KATfdp7/Yuup
	gdXQhKThahFRBY/fXkOpTlO+CSr2uqUPbJXHY+YsbXonmqVFNRyNN5U8C5aLv0mWsU3A0vaa+fV
	KAdhUWz+sdjRn483S8Nx2mlexFFy1vAcuyTwG5tqkAly83h5sqN6FrjUFQysxrkgUVj5g5E2EwM
	5Qfvhj/+qoh1vgH8yzX45QkhXIEur8Uizbj6KDcti4g9S46LPswZxBNWYo2IZGjr9YXHLe2auy0
	IHRLnay55kbpFXYZoCw20vZBi5ue7ULhryxp
X-Received: by 2002:a17:907:2d27:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c5066d3bd65mr436097366b.36.1794470185313;
        Wed, 11 Nov 2026 23:56:25 -0800 (PST)
Received: from vschurink-Latitude-5550 ([178.224.169.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a67ab93sm308262366b.77.2026.11.11.23.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:56:24 -0800 (PST)
From: Vincent Schurink <spam@acio.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Vincent Schurink <spam@acio.nl>
Subject: [PATCH rtw-next v2] wifi: rtw89: set RA init rate level from RSSI in RA update
Date: Thu, 12 Nov 2026 08:56:22 +0100
Message-ID: <20261112075622.32785-1-spam@acio.nl>
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
firmware. With this value, the firmware RA of RTL8922A uses 20 MHz and
VHT-MCS 2 for the station. The firmware RA does not try a higher rate,
also when the PER is 0. On an 80 MHz AP, the TCP throughput to the
station stays at approximately 35 Mbit/s.

Move the mapping from RSSI to init_rate_lv to a function, and use it in
the RA association and in the RA update. The firmware uses
init_rate_lv only together with upd_all. Thus, the RA update also sets
upd_all one time, when the level changes from 0 to a known level.

Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at
-48 dBm. Each test reconnects the client, then sends TCP from the AP
for 3 x 20 s.
Before: TX rate VHT-MCS 2 at 20 MHz, TCP 34 Mbit/s.
With init_rate_lv in the RA update but without upd_all: no change,
TCP 34 Mbit/s.
After: TX rate VHT-MCS 5 to 9 at 80 MHz, TCP 323 to 380 Mbit/s.

Signed-off-by: Vincent Schurink <spam@acio.nl>
---
v2:
- Add rtw89_phy_ra_get_init_rate_lv() and use it in the RA association
  and in the RA update, as suggested by Ping-Ke. Remove the
  ra_rssi_unknown flag and the second rtw89_phy_ra_assoc() call.
- Set upd_all when the level changes from 0 to a known level. The test
  shows that init_rate_lv in the RA update without upd_all has no
  effect: the rate stays at VHT-MCS 2, 20 MHz.
- For AX chips, an RA update with upd_all has no CSI fields, because
  the RA update calls rtw89_fw_h2c_ra() with csi false. I could not
  test AX chips.

v1: https://lore.kernel.org/linux-wireless/20261108131723.206533-1-spam@acio.nl/

 drivers/net/wireless/realtek/rtw89/phy.c | 28 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index 795920b899d..b6057465c87 100644
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
@@ -509,6 +523,7 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 	struct rtw89_vif_link *rtwvif_link = rtwsta_link->rtwvif_link;
 	struct ieee80211_vif *vif = rtwvif_link_to_vif(rtwvif_link);
 	struct rtw89_ra_info *ra = &rtwsta_link->ra;
+	u8 prev_lv = ra->init_rate_lv;
 	struct ieee80211_link_sta *link_sta;
 
 	rcu_read_lock();
@@ -519,6 +534,9 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 
 	rcu_read_unlock();
 
+	ra->init_rate_lv = rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+	if (!prev_lv && ra->init_rate_lv)
+		ra->upd_all = 1;
 	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
 		ra->upd_mask = 1;
 	if (changed & (IEEE80211_RC_BW_CHANGED | IEEE80211_RC_NSS_CHANGED))
@@ -733,7 +751,6 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct rtw89_sta_link *rtwsta_
 	struct rtw89_vif_link *rtwvif_link = rtwsta_link->rtwvif_link;
 	struct ieee80211_vif *vif = rtwvif_link_to_vif(rtwvif_link);
 	struct rtw89_ra_info *ra = &rtwsta_link->ra;
-	u8 rssi = ewma_rssi_read(&rtwsta_link->avg_rssi) >> RSSI_FACTOR;
 	struct ieee80211_link_sta *link_sta;
 	bool csi;
 
@@ -747,14 +764,7 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct rtw89_sta_link *rtwsta_
 
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
 	ra->upd_all = 1;
 	rtw89_debug(rtwdev, RTW89_DBG_RA,
 		    "ra assoc: macid = %d, mode = %d, bw = %d, nss = %d, lv = %d",
-- 
2.53.0

