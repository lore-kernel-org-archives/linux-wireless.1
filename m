Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557059;
	b=c95wG+VF0pi6S0kroYndZbsSu9xy2R7Y31vDTQUsN3FwbWM0sVShaSMtuUu4mOQeiqxi
	 7yDoOKxxdwBaM+nRA4yjwqEIbbhGUEJWQ7XXcCsxYw/xx3RwoX/kAziwO3t1cEo77Z5PT
	 yEmPgTVZlrzq/ersIKNweeiOwylP+B41gN/oiphjXS4pYIDb1dNT5uStR6Tzlqw2mHw/d
	 lMVU6xxRDpU6NP17+exWrhxScWiYDbkIHV3CEU9H3U2T7o/fNOJRtncSJhMplzC3fjp7v
	 cet1uw2JTKiVmqS2weFRRkpfJDQYPGwxHEotK7K115qEflHACymlf7UOinu3pAMGnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o4pGvAMXjcOC4SqD7p4YoLcU2/NkDU3u07H7Y6Y74K8=;
	b=IdexKohP28L1xBKhmJx5mn1OiQXe9ywt3XQ98kdMLfPEG4Jt5tPJ3xPIeKkczJSXCI+B
	 AYZQduRnggo5pdBTrxLM7gL7HCl89VDC9IDqZc6wmN9nA0cZgawx8N3BDf+H8GJTFMLU6
	 nCzb+0IOxu9Bp8VN6GVsJhstO0Dlp1Q5zLfOTDGUGXtZYkA02p59P4RnY0DYzXKefA1/q
	 2z2jcf0sw0BL+q7BRSfeXpWPXbqvUUSzPCS9A9DGHx4t8InyprauG9Vmy/uL5t0ZoCUI0
	 UM/Qu1SUPww+f9qEIk2ju/qvKiNRvJ926u8R8NbgfJoEcjt/1XnGoJonMvWYzOa9w+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNisbmrn;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D87606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D87606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNisbmrn
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f03920c477so42634215ad.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557059; x=1796161859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4pGvAMXjcOC4SqD7p4YoLcU2/NkDU3u07H7Y6Y74K8=;
        b=kNisbmrnZ5/rbnLsWbqbFGOPdWGJ+CkeZw4M1QhXX7Ucium/W8jyNyf2XsigJIg7mp
         OsgcbL/nwXdyrPv43e2wcSPLw8UcI9dSeBRFbTw45kICPtOcQR+2O+BZdAOlNDYpO6Dw
         xjMv+qjtYjVOhPzMtw1H5VKSE0wo2C7b2PSI+GA4dsM7PBEBkHWwJ+h9Jn2vYIUJ9qPe
         cZgccz8xN8jg4YnOqfoQ3qKeAsj15jOzX/hs0EDbBnhxZFTbdCI85Sg3LcCrfw+6aSox
         kpqBGfI1TRHQdQ/OnvhRvSrDbv8cOziOLjYkpqiRjxJHefNwvetqGju7KWRsp6YiSGHs
         6brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557059; x=1796161859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4pGvAMXjcOC4SqD7p4YoLcU2/NkDU3u07H7Y6Y74K8=;
        b=DWZywLu2kXweJ83DDfUrJi3WUDYNvJsRs9FnPzmhs0mHqS7l+zShZqRyZEjdw06nis
         KSsY8w0VlgMj2pxlx5VeZ7EqGrJflRXmHWLc0T/Pmo0xIhbsKopDBnwTWVuGqmsz/bp9
         +H4bdKuZXEkUGN7zuBhjfEyaV7vnHlB2mrsPtL1Q2FiEkU/o+g0ZHEmjnKVgCg28yYHk
         E8WnLPLAjOg0qP5q1sUJMDVI4xI4MizU/KITcs2fyzh31Q6rqLah1LhBFjxr4n4XzYiG
         RIKFciTY9Ets/NO3YFnZeKyJaz26wP+xjnLYXgoc+R9P5lcekS+Zpt395gJmZkva8Pi5
         GAnw==
X-Gm-Message-State: APuU4Z/V2W1IzbbytJUFDiUlB3VlTln+xhfK0tG9Lp0v99F3t4BUv9LD
	BaierNQN5dMHg+bLilatN5S4qe11A1jH47zdsHnAzUYS5iueMX1uiSMlFGBJpw==
X-Gm-Gg: AZFdTZd+L/cB8wPNJ11dpyvENOTrN023zpKHYy7qvmzQ4IIkaVegst4FQragXKe92lJ
	gQL504c/XXBzoGGfiZajiI1F+5e077wx9oQpYaywFUfHxcjlOVoP8VUUQ3oJzSRKXgEVaTZ1Skp
	65ek66V34d8SON5Dwk9yfEC6cMauHCXASU3R9Gu5IpPthSSE1JqNgL3nwW4pZR4lzkUHCKzWEmz
	qjLyLlDyOawq9F3+gIxBejdzFy0zPQFiJs9eUFfxQSyns5LeJes9dRFvEa+BpVdIAc9JSZVGVLg
	7zqsVCdv3YCcOD0bp50wXCEWN+LO6pVritUY71O/sOTmVgOngnLjPoDqDHaadSeS3VyRPDOi8IF
	nWwr6VeqQ9stIKuemMndqfIZYGX9bI3XhI5+D/xqasS2qnI4rNvrtnJ2W5Go018Mzelh08lLNP2
	A97dSeyHhlwG79zUOuDFocUppKsmdHogqF7OFzab+yG0AwjMdJK9KnQOT/4B17/tVDKmFL3hGaj
	1u8YxkJb52353B0teVH11tBWrhhjFLfhhQdqYzeLEhQl2P6Ex2bjTMwbruXv0Z35p2UL/Z41/tD
	N1OhYNb9nMWWLCJOzwe5M/DDzjxYPRGrufXEimjgZLw7jTJbFlq53cZ0wxihn6b2oh22sp7Db2x
	PBn2r72oYzDDSsHSW3Dl329+B9WpR/B8f+vDMaGqnW+jgKGHaZ55DDwN0DzSjPhgEitRLGbINDc
	RDL28=
X-Received: by 2002:a17:902:d2cf:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2f03ef44a68mr172906535ad.3.1795557058757;
        Tue, 24 Nov 2026 13:50:58 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH wireless-next v2 7/7] wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:40 -0800
Message-ID: <20261124215040.1261999-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124215040.1261999-1-rosenp@gmail.com>
References: <20261124215040.1261999-1-rosenp@gmail.com>
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

The driver only ever has one BSS configuration, and it has the same
lifetime as struct brcms_c_info. Embed it directly instead of
allocating it separately, removing one kzalloc()/kfree() pair and its
OOM error path.

Move the struct brcms_bss_cfg definition, unchanged, above struct
brcms_c_info so that it is a complete type there.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 48 ++++++-------
 .../broadcom/brcm80211/brcmsmac/main.h        | 68 +++++++++----------
 2 files changed, 55 insertions(+), 61 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 422452b8a832..dfd87a10cbf9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -418,7 +418,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	if (wlc == NULL)
 		return;

-	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->stf);
 	kfree(wlc->hw);
@@ -458,12 +457,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;

-	wlc->bsscfg = kzalloc_obj(*wlc->bsscfg, GFP_ATOMIC);
-	if (wlc->bsscfg == NULL) {
-		*err = 1011;
-		goto fail;
-	}
-
 	wlc->stf = kzalloc_obj(*wlc->stf, GFP_ATOMIC);
 	if (wlc->stf == NULL) {
 		*err = 1017;
@@ -955,7 +948,7 @@ brcms_b_txstatus(struct brcms_hardware *wlc_hw, bool bound, bool *fatal)

 static void brcms_c_tbtt(struct brcms_c_info *wlc)
 {
-	if (wlc->bsscfg->type == BRCMS_TYPE_ADHOC)
+	if (wlc->bsscfg.type == BRCMS_TYPE_ADHOC)
 		/*
 		 * DirFrmQ is now valid...defer setting until end
 		 * of ATIM window
@@ -2049,7 +2042,7 @@ void brcms_b_switch_macfreq(struct brcms_hardware *wlc_hw, u8 spurmode)
 void brcms_c_start_station(struct brcms_c_info *wlc, u8 *addr)
 {
 	memcpy(wlc->pub->cur_etheraddr, addr, sizeof(wlc->pub->cur_etheraddr));
-	wlc->bsscfg->type = BRCMS_TYPE_STATION;
+	wlc->bsscfg.type = BRCMS_TYPE_STATION;
 }

 void brcms_c_start_ap(struct brcms_c_info *wlc, u8 *addr, const u8 *bssid,
@@ -2058,8 +2051,8 @@ void brcms_c_start_ap(struct brcms_c_info *wlc, u8 *addr, const u8 *bssid,
 	brcms_c_set_ssid(wlc, ssid, ssid_len);

 	memcpy(wlc->pub->cur_etheraddr, addr, sizeof(wlc->pub->cur_etheraddr));
-	memcpy(wlc->bsscfg->BSSID, bssid, sizeof(wlc->bsscfg->BSSID));
-	wlc->bsscfg->type = BRCMS_TYPE_AP;
+	memcpy(wlc->bsscfg.BSSID, bssid, sizeof(wlc->bsscfg.BSSID));
+	wlc->bsscfg.type = BRCMS_TYPE_AP;

 	brcms_b_mctrl(wlc->hw, MCTL_AP | MCTL_INFRA, MCTL_AP | MCTL_INFRA);
 }
@@ -2067,7 +2060,7 @@ void brcms_c_start_ap(struct brcms_c_info *wlc, u8 *addr, const u8 *bssid,
 void brcms_c_start_adhoc(struct brcms_c_info *wlc, u8 *addr)
 {
 	memcpy(wlc->pub->cur_etheraddr, addr, sizeof(wlc->pub->cur_etheraddr));
-	wlc->bsscfg->type = BRCMS_TYPE_ADHOC;
+	wlc->bsscfg.type = BRCMS_TYPE_ADHOC;

 	brcms_b_mctrl(wlc->hw, MCTL_AP | MCTL_INFRA, 0);
 }
@@ -3669,11 +3662,12 @@ static void brcms_c_set_bssid(struct brcms_bss_cfg *bsscfg)

 void brcms_c_set_ssid(struct brcms_c_info *wlc, u8 *ssid, size_t ssid_len)
 {
-	u8 len = min_t(u8, sizeof(wlc->bsscfg->SSID), ssid_len);
-	memset(wlc->bsscfg->SSID, 0, sizeof(wlc->bsscfg->SSID));
+	u8 len = min_t(u8, sizeof(wlc->bsscfg.SSID), ssid_len);
+
+	memset(wlc->bsscfg.SSID, 0, sizeof(wlc->bsscfg.SSID));

-	memcpy(wlc->bsscfg->SSID, ssid, len);
-	wlc->bsscfg->SSID_len = len;
+	memcpy(wlc->bsscfg.SSID, ssid, len);
+	wlc->bsscfg.SSID_len = len;
 }

 static void brcms_b_set_shortslot(struct brcms_hardware *wlc_hw, bool shortslot)
@@ -3711,7 +3705,7 @@ static void brcms_c_set_home_chanspec(struct brcms_c_info *wlc, u16 chanspec)
 		wlc->home_chanspec = chanspec;

 		if (wlc->pub->associated)
-			wlc->bsscfg->current_bss.chanspec = chanspec;
+			wlc->bsscfg.current_bss.chanspec = chanspec;
 	}
 }

@@ -4918,7 +4912,7 @@ int brcms_c_up(struct brcms_c_info *wlc)
 		if (status == -ENOMEDIUM) {
 			if (!mboolisset
 			    (wlc->pub->radio_disabled, WL_RADIO_HW_DISABLE)) {
-				struct brcms_bss_cfg *bsscfg = wlc->bsscfg;
+				struct brcms_bss_cfg *bsscfg = &wlc->bsscfg;
 				mboolset(wlc->pub->radio_disabled,
 					 WL_RADIO_HW_DISABLE);
 				if (bsscfg->type == BRCMS_TYPE_STATION ||
@@ -5320,7 +5314,7 @@ void brcms_c_get_current_rateset(struct brcms_c_info *wlc,
 	struct brcms_c_rateset *rs;

 	if (wlc->pub->associated)
-		rs = &wlc->bsscfg->current_bss.rateset;
+		rs = &wlc->bsscfg.current_bss.rateset;
 	else
 		rs = &wlc->default_bss.rateset;

@@ -5347,7 +5341,7 @@ int brcms_c_set_rateset(struct brcms_c_info *wlc, struct brcm_rateset *rs)
 	if (wlc->pub->_n_enab & SUPPORT_11N) {
 		struct brcms_bss_info *mcsset_bss;
 		if (wlc->pub->associated)
-			mcsset_bss = &wlc->bsscfg->current_bss;
+			mcsset_bss = &wlc->bsscfg.current_bss;
 		else
 			mcsset_bss = &wlc->default_bss;
 		memcpy(internal_rs.mcs, &mcsset_bss->rateset.mcs[0],
@@ -7228,7 +7222,7 @@ static void brcms_c_update_beacon_hw(struct brcms_c_info *wlc,
  */
 void brcms_c_update_beacon(struct brcms_c_info *wlc)
 {
-	struct brcms_bss_cfg *bsscfg = wlc->bsscfg;
+	struct brcms_bss_cfg *bsscfg = &wlc->bsscfg;

 	if (wlc->pub->up && (bsscfg->type == BRCMS_TYPE_AP ||
 			     bsscfg->type == BRCMS_TYPE_ADHOC)) {
@@ -7337,7 +7331,7 @@ brcms_c_bss_update_probe_resp(struct brcms_c_info *wlc,

 void brcms_c_update_probe_resp(struct brcms_c_info *wlc, bool suspend)
 {
-	struct brcms_bss_cfg *bsscfg = wlc->bsscfg;
+	struct brcms_bss_cfg *bsscfg = &wlc->bsscfg;

 	/* update AP or IBSS probe responses */
 	if (wlc->pub->up && (bsscfg->type == BRCMS_TYPE_AP ||
@@ -7366,7 +7360,7 @@ brcms_c_set_addrmatch(struct brcms_c_info *wlc, int match_reg_offset,
 {
 	brcms_b_set_addrmatch(wlc->hw, match_reg_offset, addr);
 	if (match_reg_offset == RCM_BSSID_OFFSET)
-		memcpy(wlc->bsscfg->BSSID, addr, ETH_ALEN);
+		memcpy(wlc->bsscfg.BSSID, addr, ETH_ALEN);
 }

 /*
@@ -7698,15 +7692,15 @@ void brcms_c_init(struct brcms_c_info *wlc, bool mute_tx)
 	brcms_c_bcn_li_upd(wlc);

 	/* write ethernet address to core */
-	brcms_c_set_mac(wlc->bsscfg);
-	brcms_c_set_bssid(wlc->bsscfg);
+	brcms_c_set_mac(&wlc->bsscfg);
+	brcms_c_set_bssid(&wlc->bsscfg);

 	/* Update tsf_cfprep if associated and up */
 	if (wlc->pub->associated && wlc->pub->up) {
 		u32 bi;

 		/* get beacon period and convert to uS */
-		bi = wlc->bsscfg->current_bss.beacon_period << 10;
+		bi = wlc->bsscfg.current_bss.beacon_period << 10;
 		/*
 		 * update since init path would reset
 		 * to default value
@@ -7918,7 +7912,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	 * Complete the wlc default state initializations..
 	 */

-	wlc->bsscfg->wlc = wlc;
+	wlc->bsscfg.wlc = wlc;

 	wlc->mimoft = FT_HT;
 	wlc->mimo_40txbw = AUTO;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 5e2052bd913a..be40a0c008b7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -378,6 +378,39 @@ struct brcms_hardware {
 				 */
 };

+enum brcms_bss_type {
+	BRCMS_TYPE_STATION,
+	BRCMS_TYPE_AP,
+	BRCMS_TYPE_ADHOC,
+};
+
+/*
+ * BSS configuration state
+ *
+ * wlc: wlc to which this bsscfg belongs to.
+ * type: interface type
+ * SSID_len: the length of SSID
+ * SSID: SSID string
+ *
+ *
+ * BSSID: BSSID (associated)
+ * cur_etheraddr: h/w address
+ * flags: BSSCFG flags; see below
+ *
+ * current_bss: BSS parameters in ASSOCIATED state
+ *
+ *
+ * ID: 'unique' ID of this bsscfg, assigned at bsscfg allocation
+ */
+struct brcms_bss_cfg {
+	struct brcms_c_info *wlc;
+	enum brcms_bss_type type;
+	u8 SSID_len;
+	u8 SSID[IEEE80211_MAX_SSID_LEN];
+	u8 BSSID[ETH_ALEN];
+	struct brcms_bss_info current_bss;
+};
+
 /*
  * Principal common driver data structure.
  *
@@ -514,7 +547,7 @@ struct brcms_c_info {

 	u16 wme_retries[IEEE80211_NUM_ACS];

-	struct brcms_bss_cfg *bsscfg;
+	struct brcms_bss_cfg bsscfg;

 	struct modulecb modulecb[BRCMS_MAXMODULES];

@@ -583,39 +616,6 @@ struct antsel_info {
 	struct brcms_antselcfg antcfg_cur; /* current antenna config (auto) */
 };

-enum brcms_bss_type {
-	BRCMS_TYPE_STATION,
-	BRCMS_TYPE_AP,
-	BRCMS_TYPE_ADHOC,
-};
-
-/*
- * BSS configuration state
- *
- * wlc: wlc to which this bsscfg belongs to.
- * type: interface type
- * SSID_len: the length of SSID
- * SSID: SSID string
- *
- *
- * BSSID: BSSID (associated)
- * cur_etheraddr: h/w address
- * flags: BSSCFG flags; see below
- *
- * current_bss: BSS parameters in ASSOCIATED state
- *
- *
- * ID: 'unique' ID of this bsscfg, assigned at bsscfg allocation
- */
-struct brcms_bss_cfg {
-	struct brcms_c_info *wlc;
-	enum brcms_bss_type type;
-	u8 SSID_len;
-	u8 SSID[IEEE80211_MAX_SSID_LEN];
-	u8 BSSID[ETH_ALEN];
-	struct brcms_bss_info current_bss;
-};
-
 int brcms_c_txfifo(struct brcms_c_info *wlc, uint fifo, struct sk_buff *p);
 int brcms_b_xmtfifo_sz_get(struct brcms_hardware *wlc_hw, uint fifo,
 			   uint *blocks);
--
2.56.1

