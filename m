Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336255;
	b=PBVfMBL3CCgG4UBCChrmcTAb6wCxkGsxezdSOBmpmqGKsS01qhlULbaDkk9eERZGzJK7
	 zv9AKInAx5MdUh1BxeQGRyE0nlVWRyCtqWtZlUtuIZlLFdNuKM2vi/KGIWPxmEeCorKpD
	 G0TTpM0r7BZePu8oBzmtiBYtKQQr03Qy8btzupLsTRzdphkEcLmldDIybt70YR7B0ajde
	 ru328GJgUqjD6HEZ+7S5FqpRcO5/pixVbBXtBTU5JJkpPt4Sv9R2nffUIkVFpiv55quy/
	 REK0tvgkesCtRP8oK8rIZ1CGPx9ByNCA3Tm45+MZt2LmZa0UXA1XEgm/J8/NrwhFvzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v7IWcFa5bDcP/IkzkxLByxcvvcJCb0rVvXsvswLfU7s=;
	b=DzT++FPGa3HNEnVnnBvBzfD//ZhR8geWGPOvmZVs4sfBssqPAltfNysRoa2r7F05y8+F
	 J71HyNl0uFqZkA3oQhID+G5wNwf+XqHfarfeGQI0hHoNiLg5pxLeMq/Avk04O8EOXBOLP
	 ymTPiSPvZVju8n6ESO2RLduIjH4GPXdY2dn7ea9bahD8kOgAhzYM5LowQj5Pt7OMUr6+l
	 qEwzq97cQWVEbZl3pI6RyJeZ1YsIvEJEsUnkGsGBlDgnfVAtEB3TPv/gZjsnUodU5KYVg
	 agYBmjQCid6dv6HAAKbKcDG/NW4F3q7GbviHAT/3GEtS2OFQoGqfNL1I8ETCG7Nkrcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qWdeKnr;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3818C606A336
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3818C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qWdeKnr
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-704597ef1d8so873734eaf.3
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336253; x=1794941053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7IWcFa5bDcP/IkzkxLByxcvvcJCb0rVvXsvswLfU7s=;
        b=0qWdeKnroeIiQimwigDbxW6bnE3U8B7hRD6cLYGTqkKcCKTMsM+kta8mdjp7CsWONE
         kt6mLn3D9s/ZmZJNgmBKzIIqdTn7I2I5mCUZzgzw+3Z7fCVEHj5El3yFckAATc4bhlz7
         ppmaLXTMX2eTCX3gy/91noAsWoFALFLJpzgjR4ZvPccXmPAf90HcvHMP5xnhtj2Gwyfm
         hwMelOeEdszKv+89BQxo7muyZhsNAHczVJtlcHlS2IFEJKo5fDR2ZA/jN7P5VuuUb5fq
         LFb3hgY2JvbsEA87oF69RsDxiWH5mnzqyxCR9Wa3uGEByv1KaYOTsdQQR1k4r8E4Drez
         ju1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336253; x=1794941053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7IWcFa5bDcP/IkzkxLByxcvvcJCb0rVvXsvswLfU7s=;
        b=XPWuecn6AC1XS44mhfrLrknZ9rQYC3P0MvVPJzdF8wcEjC0AtbxvWrDgbR3gqffK2b
         BN/n5kPvLVfR8AjC5Lq/M5ejerrACcO/+7SGmtDd05aeYrgz5xn+8A9GI/Q37+2Nrslg
         wo3S0lKqYHpT86raEbj1beVrMYatrbv/9nIyedTRsiTKeMqn9mgwxcJctHYBYDbwa2b3
         NEsiR+fXtCla+RssyNt8poRolNyKMWPzGVlYd1/kxMGaWcynO3aY52jnUuoW4W2WRBnG
         1kTwUq3DMMnxl4OWiN1LEiMTY4Aj0vGVaUTialI+qT8nYOP/0Vbc+Rc5D5KGf+0xNiSU
         fq5A==
X-Gm-Message-State: APuU4Z8bZYFSZ7107TaJwHNV7q4Kl+oomQzntvxEblFgJ8RloBtm5KMK
	pLn8r/v0u/9XE2aDJ3AvDJkaojQW/zgZet6BTLzLIcRU62seoJ9yvjID
X-Gm-Gg: AYBFou2CN9sH8u3229Mk6P2b2yTscrOJ4oO6nVgGqptzgJI5JgP2PU1IJIdG0LeUKq6
	5YtWw21ksA5FYvAbcOmbIUpQKdBTiJ55weqk3VwmDKuNBEx7tCLiXqY+KlATLtgmOZ8CS5y6nar
	bNxeA7oOfFdNbMISl/ASK+zq81cVfrwMWHeoB46S7u9g4gzCY8nQb0Ay87199W0+AH+6AAsSNOt
	wYQlibWlLM2O92v1jwS66rlnDEyiaCqc2Rg9iyq7mVGE/E/hcsTQqt5lfFHGbieK0TG+16lCGiK
	5NjeCj2K38/oHyJ3oTJTE7e+W4xecWFk/7kWkhjV/b99rAYQrfbrMGqsoLdh8NYf7UpSxF+ubgh
	wZlRJmFr0LXysH1gev7JlmVF6tYCm3daLbdeVcWcPAS1Gm1ekvDEG+wLPSrpEtKjEvsV1vVNsXA
	tAFyadzNWYLBJrVLX4h2D5Mqf/wI8O6fLEo8PxVyCmpOIkLXQ0ap84sJ/YTmsgrlIutAsAfrwZm
	bEF71cVNSoym7oDRmbXIaFtU7Wi+vQ4sQk4TAlRiE3qf6vIh5hExJaq+WL1F6X3NwouhLobnYoH
	NBgi8BwZ61ipJqQIYi7YwLNrX5F21iCLAQ==
X-Received: by 2002:a05:6820:1356:b0:703:27e0:356 with SMTP id 006d021491bc7-718a5c5b594mr1498882eaf.73.1794336252916;
        Tue, 10 Nov 2026 10:44:12 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:11 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 1/6] wifi: rtlwifi: use struct ieee80211_pspoll for the PS Poll reserved page
Date: Tue, 10 Nov 2026 12:44:04 -0600
Message-ID: <20261110184409.42205-2-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
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

The reserved page builders fill in the PS Poll template with the
SET_80211_PS_POLL_* macros from base.h, which write at fixed byte
offsets into a u8 buffer. The AID macro stores a host order u16, so
the frame is only correct on a little endian machine.

Point at the template with struct ieee80211_pspoll from
<linux/ieee80211.h> instead. Its aid member is __le16, so the AID goes
through cpu_to_le16() and sparse can check it. The two addresses are
copied with ether_addr_copy() on the struct members. Remove the three
macros.

On little endian systems the bytes written are the same as before.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/base.h   |  7 -------
 .../wireless/realtek/rtlwifi/rtl8188ee/fw.c   | 10 +++++-----
 .../realtek/rtlwifi/rtl8192c/fw_common.c      | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8192de/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8192ee/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8723ae/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8723be/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8821ae/fw.c   | 20 +++++++++----------
 8 files changed, 40 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/base.h b/drivers/net/wireless/realtek/rtlwifi/base.h
index f3a6a43a42ec..870ca1dff3ee 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.h
+++ b/drivers/net/wireless/realtek/rtlwifi/base.h
@@ -46,13 +46,6 @@ enum ap_peer {
 #define MAX_LISTEN_INTERVAL		10
 #define MAX_RATE_TRIES			4
 
-#define SET_80211_PS_POLL_AID(_hdr, _val)		\
-	(*(u16 *)((u8 *)(_hdr) + 2) = _val)
-#define SET_80211_PS_POLL_BSSID(_hdr, _val)		\
-	ether_addr_copy(((u8 *)(_hdr)) + 4, (u8 *)(_val))
-#define SET_80211_PS_POLL_TA(_hdr, _val)		\
-	ether_addr_copy(((u8 *)(_hdr))+10, (u8 *)(_val))
-
 #define SET_80211_HDR_ADDRESS1(_hdr, _val)	\
 	CP_MACADDR((u8 *)(_hdr)+FRAME_OFFSET_ADDRESS1, (u8 *)(_val))
 #define SET_80211_HDR_ADDRESS2(_hdr, _val)	\
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
index 9a9f9e14f472..cda9388388ab 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
@@ -545,7 +545,7 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	u8 u1rsvdpageloc[5] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 
@@ -561,10 +561,10 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
index b618f07f29b0..3e8befbcf865 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
@@ -573,7 +573,7 @@ void rtl92c_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	bool b_dlok = false;
 
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	/*---------------------------------------------------------
@@ -586,10 +586,10 @@ void rtl92c_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	/*-------------------------------------------------------
 				(2) ps-poll
 	--------------------------------------------------------*/
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
index c8444a72ff69..23c7b088e8cd 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
@@ -260,7 +260,7 @@ void rtl92d_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
 	u8 u1rsvdpageloc[3] = { PROBERSP_PG, PSPOLL_PG, NULL_PG };
 	bool dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	/*---------------------------------------------------------
@@ -272,10 +272,10 @@ void rtl92d_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
 	/*-------------------------------------------------------
 						(2) ps-poll
 	--------------------------------------------------------*/
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 	/*--------------------------------------------------------
 						(3) null data
 	---------------------------------------------------------*/
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
index 3728e3ec2c25..e50db134682f 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
@@ -663,7 +663,7 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	bool b_dlok = false;
 
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	u8 *qosnull;
@@ -680,10 +680,10 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
index d1b50a80c191..63c55dae2aab 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
@@ -393,7 +393,7 @@ void rtl8723e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	u8 u1rsvdpageloc[3] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 
@@ -409,10 +409,10 @@ void rtl8723e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
index b3e6c91e26c0..33c8fb0c49ed 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
@@ -484,7 +484,7 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	bool b_dlok = false;
 
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	u8 *qosnull;
@@ -501,10 +501,10 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(2) ps-poll
 	 *-------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
index 4facbc0bff4e..ddae3a14f79e 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
@@ -1525,7 +1525,7 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc2[7] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *qosnull;
 	u8 *btqosnull;
@@ -1547,10 +1547,10 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet_8812[PSPOLL_PG * 512];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet_8812[PSPOLL_PG * 512];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
@@ -1662,7 +1662,7 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc2[7] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *qosnull;
 	u8 *btqosnull;
@@ -1684,10 +1684,10 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet_8821[PSPOLL_PG * 256];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet_8821[PSPOLL_PG * 256];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
-- 
2.43.0

