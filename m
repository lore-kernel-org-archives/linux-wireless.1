Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817071;
	b=fbxchykMhx8z2ZUoAfb9wYNApchj4MGjNji4FqY8+VXuqid0F/FRS5FJPbMwr8hjjNo6
	 g+/lc4WnP9GCb+c3gDrUkCwwndUJ7hZPCq1ewdT66uKcSk5mI8DMEWLULUDOHWatAGB4I
	 gr8/FrRcQNc2GCrB3Z9V8yTCgxW7fq5MlZ18Ok2OsTtZyOfnhhCgtr2oH7Y0TER1+LGql
	 VUw/sJl4FVTBJec0QqYNEsVF9VcENdWLd5cy1RWIYROFInjgdxAeGgR0ayAAV7tC9paxm
	 oe5JdMDPUOowpL8+05Z47D1hBReQqXCZvAbI4mdfPBkc4nJJDEvf9EKGSo/3IoC7Uzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vS4ZBwjJkSSp2Q4b0PwSgI895+RDd6JFRrXwmtNijoY=;
	b=zMRCp0iCMxivh5LkjC044dXBVDY1SL3CoL2wCr0L5WwLCCL5WJCi+mn18FGCJOppeTyq
	 Ejl2N9PxfSXCIKyATZdXgpCpl1DA8oIzUIQm3obMjXxH3Kwa8khmV5P7FUW3fT5pJG4/q
	 CO5HM1yOmyMYO+t5b1KMZ+RGF65guQKM37B2nYZ7rKHm10VJrhANH0trTBfFeA9173aXQ
	 uC2EFynVH6fcc4XNDW3Ps0GUMyGnxyzVwP0Zn3TP8C+LyKvhRqe+oYVsilqMZ5eqQ6Uhd
	 h/X4Z3ahix5p+kN/AfS67f8T8dNaX4HLetVC5f6HqVLelVXxK9x8CWEjcfgiw032YAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p2oMAD3n;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D3606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p2oMAD3n
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4697404c2bso415850766b.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 00:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794817069; x=1795421869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vS4ZBwjJkSSp2Q4b0PwSgI895+RDd6JFRrXwmtNijoY=;
        b=p2oMAD3nWjLOeLMq2fG4Szb+6x66ESquVtU+tebgOxLx47TXdrg2scF6XhxKTKCQsq
         23X8zNez1Jj2q8SNyyB78XM7ZnIiR9jyI4+n1qyDAHkorWDnGJdMVE9fcnlrErAjThwp
         HmEOQbd3SxavQ9rNBJfS7Q0/HPmcDwSlosQ1u9FBhCeI9tx/w9Q/bELXAxJRY2j9Ow7F
         vYKIXhqR7g7t1W85g7wxvr9Bk90BLpt+RdwCgdRRTvVlF9I1oEug3RraeNQhqaZpxPcA
         KjHx4z5yZftvYWU0aCFytcdIM93XGW7r8CqhrDedQnGxCxZ1Ez0maEoe5W2KXjiJ2vAD
         2QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794817069; x=1795421869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vS4ZBwjJkSSp2Q4b0PwSgI895+RDd6JFRrXwmtNijoY=;
        b=KULRfjjU3pOxSKwTSubEwU1rEHbiAkR+qhS7g1Ijsxig5yrMt9A/TVDHJSQdOFn0La
         ZnYWm4OG1wuq30DwvMpv9boWCjtVHpGBbxkPyNsehTGROJVIBD8pI3sMYafdEvedhi0l
         KYqq6ip/2iH3HmxnE+pl0lNjshcG3qfeioHKp3rHzclHEFlp/ZnhrLR+ddSUQXL+JObr
         BqQCnLjVxuIDNT12Ug40AYXZEyC4FGFLf/NvHs13W+tQoS3UdAY29w13fjhVKF/M7d2L
         Z/rbOBlb5+JszByv7EOMX7/Ol55ikHQxIvbANuVR9/+0CvP6WHBQPip38EIsrCMaxzNm
         ulSA==
X-Gm-Message-State: APuU4Z/loJPtxL5eL50vAdLGlxvpRw3K2LqGEzdWrven+BlS8RaW7o4E
	Pnb0p3UNMU73fWVqvESerwDYrzc/Iygb2VCa2x8mcPiVMe//RXotyOZFyDgySBHF3g==
X-Gm-Gg: AYBFou3eptB6K6yCtU8oagx/Dv2tx1AVK44K5xW5zDxrTxyW+4wFb8ejOTNu3sXnzp/
	SLr3ObiXoU+7jGumP+Q9MRZSzWF6M+b848S114e2enXzGYAQpuTfp/YrOaBz7r9YMufa8SEWPZv
	EdqiTM7p85Xdh+cziDlYM060R3eOW4GWVXxcOsW+BMtJaSbKXLHB3XZ1xCmfFvzlSUHB5pqU1j/
	+B0NPjPRw/l3FP4Y/bJzVDUv/nPTOjEIZs0AMP2uS5Pl7cVGAvvkB1i0XJajvVh3HBWAUjQCSM8
	MewK+mOI5Ek9eWaMXkjv+k3PVRsqFic28r/G590ps5gyhE3DqPTad8DmolHY36FL8VP+zn4sFGH
	uVdpwTsmQTtKttOIj3crPeCveu4MK3aTIUS2ly0MSdbIKjaQfCLA3hse0p1dGSqab5hLtYSNOIW
	HvbjivWVOFaYjLMz8lZvHo+565Xi7L8jSKPxSasZXQ+GvLj9BBupbI1o76bpwRd6OI669Qs8CVt
	37lll6uhvjxN3ebgE8V5Bv19GcI+ZSXcTw87LvRvVBseETYXQzuhQD9l0wjXkn189JmurBLFCHR
	N7CM1SjvqsWSFN+oVZG90xiPqaZRDvLymo0X
X-Received: by 2002:a17:907:2d9e:b0:c31:e9b7:f10b with SMTP id a640c23a62f3a-c509664589fmr786681366b.42.1794817068613;
        Mon, 16 Nov 2026 00:17:48 -0800 (PST)
Received: from vschurink-Latitude-5550 ([178.224.169.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4289csm386251966b.37.2026.11.16.00.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:17:47 -0800 (PST)
From: Vincent Schurink <spam@acio.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Vincent Schurink <spam@acio.nl>
Subject: [PATCH rtw-next v4] wifi: rtw89: set RA init rate level when the station RSSI is known
Date: Mon, 16 Nov 2026 09:17:41 +0100
Message-ID: <20261116081741.51039-1-spam@acio.nl>
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
RA association and in the RA update. In a test on RTL8922A, the
firmware used init_rate_lv only together with upd_all, and upd_all
resets the RA context. Thus, the RA
association sets rssi_unknown in the RA info when the RSSI is not known.
The RA update then sets upd_all one time, when the RSSI is known.
The flag is in a struct_group at the end of the RA info, and
rtw89_phy_ra_sta_update() clears the RA info only up to this group.
Thus, the flag stays until the RA update uses it.

Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at -38 to
-40 dBm. Each test reconnects the client, then sends TCP from the AP for
60 s.
Before: 6 of 8 connections stay at VHT-MCS 2 and 20 MHz, 36 Mbit/s.
After: 8 of 8 connections use VHT-MCS 7 to 9 at 80 MHz, 668 to
684 Mbit/s.

Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Vincent Schurink <spam@acio.nl>
---
v4:
- Move the flag from struct rtw89_sta_link to the end of struct
  rtw89_ra_info, in a struct_group with a comment, as suggested by
  Ping-Ke.
- rtw89_phy_ra_sta_update() clears the RA info only up to this group,
  with offsetof(), as suggested by Ping-Ke. rssi_unknown is a plain bool
  and not a bit-field, because offsetof() cannot be used on a bit-field.
- RSSI 1 also sets the flag. As Ping-Ke wrote, this is harmless.
- Rebase on rtw-next 61a5eb87b2d.
- checkpatch --strict reports "Alignment should match open parenthesis"
  for the member in struct_group(). With alignment to the parenthesis,
  checkpatch reports "Statements should start on a tabstop" instead.
- Tested again with v4. The client is at -39 to -40 dBm, 60 s per
  connection. 8 of 8 connections use 80 MHz (VHT 2SS MCS 7 to 9), 668 to
  684 Mbit/s. PMF still works: the client accepts a protected broadcast
  deauthentication.
- Not tested on AX chips. On AX chips, the RA update sends upd_all
  without the CSI fields. Also, the RA update now sends init_rate_lv 1
  to 3 instead of 0 on all chips. In the v2 test on RTL8922A, this had
  no effect without upd_all.

v3: https://lore.kernel.org/linux-wireless/20261113080731.30155-1-spam@acio.nl/
v2: https://lore.kernel.org/linux-wireless/20261112075622.32785-1-spam@acio.nl/
v1: https://lore.kernel.org/linux-wireless/20261108131723.206533-1-spam@acio.nl/

 drivers/net/wireless/realtek/rtw89/core.h |  5 ++++
 drivers/net/wireless/realtek/rtw89/phy.c  | 32 ++++++++++++++++-------
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 7f84ee59f825..df702f4420bb 100644
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
index 795920b899d9..441568573624 100644
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
@@ -519,6 +533,11 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
 
 	rcu_read_unlock();
 
+	ra->init_rate_lv = rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+	if (ra->rssi_unknown && ra->init_rate_lv) {
+		ra->upd_all = 1;
+		ra->rssi_unknown = false;
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
+	ra->rssi_unknown = !ra->init_rate_lv;
 	ra->upd_all = 1;
 	rtw89_debug(rtwdev, RTW89_DBG_RA,
 		    "ra assoc: macid = %d, mode = %d, bw = %d, nss = %d, lv = %d",
-- 
2.53.0

