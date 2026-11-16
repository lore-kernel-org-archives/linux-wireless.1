Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819347;
	b=ouMQR+LgUAAdYVG2tlM/09sItRreh+Ah4qu/Fp7XcsYqgQdqC7WqNgMYFTtCLC4Ltbod
	 KPvfTyiRhk4fpJG/Wj7/4cgBFLrneJhdAEuLHJ/keHf5vSuoci7xGSE1hc2JezUOVtbZ2
	 sqnuTxmimxyHDzlru9hzCFPZGsAQAFLUgjBNaS4w2lwIXp0Jj81TbqzAeFV6uUMQAvhTz
	 gMT6cNONJDMHOgwOGAlX7pvRa2MeKrzGbLAliM+8cFOnFxRFdfOJH97uwLaaT8Tq32mqb
	 fJg1xJJVOCKVWyOdj/8MmEaqW1Yiaf+nBx8PS+0KZGitW2LDRf0IO9RUGRsN8yYRRjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gcdDSJULjHpjwcIK/ZLBfGxzwE2L03fgXn7CdZqLvu0=;
	b=VUX98YPM79qHd3AeRgUoVfvRzoksnLrVkCa28BnR/q6ltgIElD8xMvqyFgUwWQkFDx6P
	 NTbwyVeV48ZVDNTqBELjHT5njifGNQ3DBHU4BbeUHdhyyLtXcDEKTh8URU2ErXfYdwA0a
	 +fggSGZMOB276/1ClOLlIlQqwZS+9W2jpeuUEje9+FJTJJp/sTQMbg7B65VAzGo5M88P8
	 FB53ncI3nF26/EaXwtkasvQuYwe9wwTVAXFQvOIhIWDICiuGzd9m7oHMc7WXx+hoCZJb7
	 esba8oWodauQ5ApVcPbRYWCttF1NX9AEA9zrdMCDXMB2v5nb7jpWmIXpV9Uy1crP65Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=REZFzOKq;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1842606A330
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1842606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=REZFzOKq
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50e26763a4so63176666b.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 00:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794819345; x=1795424145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcdDSJULjHpjwcIK/ZLBfGxzwE2L03fgXn7CdZqLvu0=;
        b=REZFzOKqXvOLPKpYFTeZqDoQ59xhErs/yDxv+W4HpctHEG8JfMU8Y/J89qjR72sW+C
         ZJGAJDYmX9lfsPxS+aSNgfFZddOQJ0EeTGwA31X+CPK3MJtmTFjy/B2/+ePAdSzl48kP
         4NP0Xh2DpFQ5ElJsMS3TO71akaEYhJRMdHH9SXV7WopqDWDzqDbl3bK+Di87aaxpqfdB
         RiWa8S2VOu9snnmwFtsopB4GIbrSFPQzc8ayjKpGJElXH5BCpKesaWlbZnZY2VL8F88I
         FhurRJiTSvFGuMu7vunZuHHUMjVjArVPOsLUyn7JrZwb3YaOB+AIf6uw883BEgP44rAf
         WxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819345; x=1795424145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcdDSJULjHpjwcIK/ZLBfGxzwE2L03fgXn7CdZqLvu0=;
        b=a/Irntv3vZMG04qfJ6qS1B0/gOCnDeoYq8MvVjqejeN5GzTW1AlNlkGQzoA6ausk0P
         E1Z+skEKwUnipY1P/NKD/v8AFITfdsfEDGk1XUUBBDQXzRYcBcjwMiBBYVrctsnXYI2R
         tQIuCD44DYmYHvKZp3gxcNdjJjxfWpEuwJ2tDGt++gNLRHgwsct1OI5FHCS94FrXto4H
         yzw1Vjc1uSGgcpK9MdQM1YZoDAaCWiz+Dxwxwod7Qd3VaCubDs4QzeOStDcd3V5Ncsaq
         K4z1hMCBACfa7kuxSFM59XLXfeDfJ2bPvL3JVcWUfF4G7i58uA2qRwdqy/2a8fMbLRR3
         IGkg==
X-Gm-Message-State: APuU4Z+VhuJYafnZnVuC5guYMqSgOhFQimcsQz/gdpbGxKnpbzsyT2jY
	KHHb/X8IJHD0B+qSgb3/vx6lsPI3vBmP8lI+Zq4n3hxkTYLDLY3p34KS79ZaJp59rA==
X-Gm-Gg: AYBFou1viXvEeRExaoZ3cPkEOoO+TFZYQJgtrdffJLE3h6dfdhCQFGtwGuOLtN9wJ+s
	b26a43+vjw0pJbB9WRjThcRv6cmluxGA+772GWmxunxYEytHjJgmH51aPSEXQ45SKDZ7S8/bGZx
	trtVfI0psMM/jJDnZ5eq/DXIYDiUszmh6hTxd08sqrCFiwRP4TZUz08xfKiLMteeDclVhYkYK/H
	xWDhqdEKI+dozu+ntnG8KlHTKaxk3oDIPpsPKHx/v0pibHzgzHVU25lMluU7anUflqf/z2KwkoX
	D1yhbO/hvpNXBt8qqutjNEsIykkKiPkTypsGRC3YGokqA0eZ012HQyGaRrFAVYzJQFCmCQUoevK
	IK73dwW2WwVQ+xTuXZsOuL2iZFKGCPIQoIQXF2UuA8Jz+PMaiNAwDCVWqwSPNjk4Z3O4jxCgbRe
	mos2NA1OsdK45CWulrFBFzalsxut/pXzJoWNn2EdmHoR372xHT/JiFfd0yKdVnAUhEBUmhimUv6
	I+4nrLsSM8Hi5Kbqza73vSe1K7TjM6DG4VHbdUJyahFnHJqs6rpZGNEdQYuMBRA2LRiGZs4w38D
	ELWPqt79qqJbL39Rq0trFKlT13UOu3qF/Y/0/r0+87GTX1QT4ekBlLQYvg==
X-Received: by 2002:a17:907:160f:b0:c48:1977:e1bf with SMTP id a640c23a62f3a-c5096317224mr800110766b.24.1794819344945;
        Mon, 16 Nov 2026 00:55:44 -0800 (PST)
Received: from vschurink-Latitude-5550 ([178.224.169.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8eb83sm382693466b.79.2026.11.16.00.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:55:44 -0800 (PST)
From: Vincent Schurink <spam@acio.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Vincent Schurink <spam@acio.nl>
Subject: [PATCH rtw-next v5] wifi: rtw89: set RA init rate level when the station RSSI is known
Date: Mon, 16 Nov 2026 09:55:34 +0100
Message-ID: <20261116085534.66746-1-spam@acio.nl>
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

Move the mapping from RSSI to init_rate_lv to a function. In a test on
RTL8922A, the firmware used init_rate_lv only together with upd_all, and
upd_all resets the RA context. Thus, the RA association sets
rssi_unknown in the RA info when the RSSI is not known. When the RSSI is
known, the RA update sets init_rate_lv and upd_all one time. Other RA
updates still send init_rate_lv 0.
The flag is in a struct_group at the end of the RA info, and
rtw89_phy_ra_sta_update() clears the RA info only up to this group.
Thus, the flag stays until the RA update uses it.

Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at -34 to
-40 dBm. Each test reconnects the client, then sends TCP from the AP for
60 s.
Before: 6 of 8 connections stay at VHT-MCS 2 and 20 MHz, 36 Mbit/s.
After: 8 of 8 connections use VHT-MCS 9 at 80 MHz, 671 to 683 Mbit/s.

Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Vincent Schurink <spam@acio.nl>
---
v5:
- Set ra->init_rate_lv in the RA update only when ra->rssi_unknown is
  set, with a local variable, as suggested by Ping-Ke. Other RA updates
  send init_rate_lv 0, as before this patch.
- Tested again with v5. The client is at -34 to -36 dBm, 60 s per
  connection. 8 of 8 connections use VHT 2SS MCS 9 at 80 MHz, 671 to
  683 Mbit/s. PMF still works: the client accepts a protected broadcast
  deauthentication.

v4:
- Move the flag from struct rtw89_sta_link to the end of struct
  rtw89_ra_info, in a struct_group with a comment, as suggested by
  Ping-Ke.
- rtw89_phy_ra_sta_update() clears the RA info only up to this group,
  with offsetof(), as suggested by Ping-Ke. rssi_unknown is a plain bool
  and not a bit-field, because offsetof() cannot be used on a bit-field.
- checkpatch --strict reports "Alignment should match open parenthesis"
  for the member in struct_group(). With alignment to the parenthesis,
  checkpatch reports "Statements should start on a tabstop" instead.

v4: https://lore.kernel.org/linux-wireless/20261116081741.51039-1-spam@acio.nl/
v3: https://lore.kernel.org/linux-wireless/20261113080731.30155-1-spam@acio.nl/
v2: https://lore.kernel.org/linux-wireless/20261112075622.32785-1-spam@acio.nl/
v1: https://lore.kernel.org/linux-wireless/20261108131723.206533-1-spam@acio.nl/

 drivers/net/wireless/realtek/rtw89/core.h |  5 ++++
 drivers/net/wireless/realtek/rtw89/phy.c  | 36 ++++++++++++++++-------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 7f84ee59f82..df702f4420b 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -4626,6 +4626,11 @@ struct rtw89_ra_info {
 	u8 macid_msb:2;
 	u8 band:2; /* enum rtw89_band */
 	u8 is_new_dbgreg:1;
+
+	/* keep driver helpers below in group (not cleared by rtw89_phy_ra_sta_update()) */
+	struct_group(helpers,
+		bool rssi_unknown;
+	);
 };
 
 #define RTW89_PPDU_MAC_INFO_USR_SIZE 4
diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index 795920b899d..365357752af 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ -343,7 +343,7 @@ static void rtw89_phy_ra_sta_update(struct rtw89_dev *rtwdev,
 	bool sgi = false;
 	bool fix_giltf_en = false;
 
-	memset(ra, 0, sizeof(*ra));
+	memset(ra, 0, offsetof(typeof(*ra), helpers));
 	/* Set the ra mask from sta's capability */
 	if (link_sta->eht_cap.has_eht) {
 		mode |= RTW89_RA_MODE_EHT;
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
@@ -510,6 +524,7 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 	struct ieee80211_vif *vif = rtwvif_link_to_vif(rtwvif_link);
 	struct rtw89_ra_info *ra = &rtwsta_link->ra;
 	struct ieee80211_link_sta *link_sta;
+	u8 init_rate_lv;
 
 	rcu_read_lock();
 
@@ -519,6 +534,14 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 
 	rcu_read_unlock();
 
+	if (ra->rssi_unknown) {
+		init_rate_lv = rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+		if (init_rate_lv) {
+			ra->init_rate_lv = init_rate_lv;
+			ra->upd_all = 1;
+			ra->rssi_unknown = false;
+		}
+	}
 	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
 		ra->upd_mask = 1;
 	if (changed & (IEEE80211_RC_BW_CHANGED | IEEE80211_RC_NSS_CHANGED))
@@ -733,7 +756,6 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct rtw89_sta_link *rtwsta_
 	struct rtw89_vif_link *rtwvif_link = rtwsta_link->rtwvif_link;
 	struct ieee80211_vif *vif = rtwvif_link_to_vif(rtwvif_link);
 	struct rtw89_ra_info *ra = &rtwsta_link->ra;
-	u8 rssi = ewma_rssi_read(&rtwsta_link->avg_rssi) >> RSSI_FACTOR;
 	struct ieee80211_link_sta *link_sta;
 	bool csi;
 
@@ -747,14 +769,8 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct rtw89_sta_link *rtwsta_
 
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
+	ra->rssi_unknown = !ra->init_rate_lv;
 	ra->upd_all = 1;
 	rtw89_debug(rtwdev, RTW89_DBG_RA,
 		    "ra assoc: macid = %d, mode = %d, bw = %d, nss = %d, lv = %d",
-- 
2.53.0

