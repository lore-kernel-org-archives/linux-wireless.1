Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371174;
	b=NSx8nwOYaW+6Am2KRLPD4ay4qsnMR8fPHsC81/S69Hr5aVkgOKj8Yt7UtNseAWwT1pQs
	 ItS/7X3sD5v7iPAfzbhbbGx96xKVP143sP2/GF0AM/OaKiOKD2jZr/55O6H95tv+fnrEs
	 YcDX8Z+GcfVRYZL2+NdN/10CHgkFBaq/uXfNNJoCvDBXyHSfAhhsR/zcGYzzQtZ6r99e5
	 kqJBLAvUHNmLmlBi/cB3Q0nJPO6yO3zom1K70Xdocrnn9vDdJfYo58vw+Nrr7QH1v5fT3
	 cpmA3EhpA+o2pGXccs1e7b7T40QmQfBxULwfi7LkBWpgtD1Mb1YhQPFWU/ssgB2UVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HtuV2zBE5qohX/irIEYawMNpQUuTbI7ESmHJSqctTBk=;
	b=qyTFogGTWu+z51vNZP/bJc//HNhWhQ9665vtk8N5H2ycMFxBOR+B7vLvIr3RJ3XXdV7k
	 KnOi2Dn8kn5qBUtG8t8rN+Z8eOjyKIzt6UFB+dUbXo22IP2yBhrg6CmzfyXwd9YS5Iidi
	 +vBn8Z6To3YFA15KNauCXW8oWU7+67BGbtAYBf0eZyRS1pmwLkT7OS20WlwcT7AJa/hTx
	 yBHXdJqOMbrcn1iyxm5UffMvL/unNBOqDHDt6pyuxY5aH+MiygCS+JPNV+NkdqPaeVmK3
	 VanslPtRAGjn6hEjlTmUGHgAIFpNvW7PH3kOVvNYB7rC6V+Vz1ykylTvRjpMP9ecucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGjrfhAg;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20B9606A33C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20B9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGjrfhAg
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1592508a91.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 20:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371173; x=1794975973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtuV2zBE5qohX/irIEYawMNpQUuTbI7ESmHJSqctTBk=;
        b=sGjrfhAgL8LzYxGCfCdsxOOYifVmirT4gS5SjSErIa/3Ex+xrnJ1xoHAMb2Ev/BWPZ
         o38/333YUYsrrVUTA4RnUlJ3qx/mqLFMAadxEaZkzuqermriVXZRtaP+c+H7FNbIdakw
         Oj44Dl4QPkgCX8nZRXt1sUg0nYeGf36gcbwB3/0NfkyRWvNy4Jou3ybqPpT59q0ymL9c
         YdS2T2pNOC8QM8QUmbE0aZuD36Sm2AW3RbucruGHjAcEIGe3WiFCMTJzm9uc6kBVC5J9
         9Vo2/I4H6nCqAQlxOcJI90IXjUDSM6GZeIfCCeo1fduZqbiIDCI8Wbjqvhz+9TsNlWFF
         MLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371173; x=1794975973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtuV2zBE5qohX/irIEYawMNpQUuTbI7ESmHJSqctTBk=;
        b=Spq0+aGlidjLQw2nCQYLwQzmn389+qrbPTD6gZKpEDVMj899+5GY5zY5svqCqjpQpm
         +d/EhhIJ4M+jGTgd3AsT8yR4XO95Lafhxl8AKhU1tX0qATIwmQB14HVU36deEiWCag8q
         CMSqgMntl+9K/m+IWSpAFxnBkdSwz1xSyS/Mn4f9cJdq17ppmc/ZSXK0/gbOCzNy4X6M
         dHKUEHE7XSAb36p3WgMr6Qd0Sp2fguZwi6mfSktCSrDo6HtwhPFrmKWUNTxP62SAtQ2v
         d8zHth45AWiUxoUoLuTh2+EGJbWOn339DgfCSMdg+Z2mKSAlEy/Kz7n9R+lJKFrc7XrY
         asAA==
X-Gm-Message-State: APuU4Z+CwUtVU721zzQDafBp1EtHDthxv927i7RKg8ou+XsNeaKURO3Q
	JTBKKeMEXeGCi34op2JytFqcsVxRJn5BWs2M5foBkf72/djKL7rxKgFd
X-Gm-Gg: AYBFou3FIgfWazm5QS7Iio3jARNj9eiCeaT/PEE8NYiPCdhmx+nY3cNaGnIxQ9+5Srm
	HcE3Q/4q2MVYmVD00H+/B8R77CrqIn0E9/EdyvUOJ0XlbnoSkM8vl3kiUcWTyuvKvSvYqcAta0t
	I94vcN1nCbcLckmAODWQ0loIlaVTpZbRP/L//ZkL8LG/q3i3Wj+ERVJiBI+bSjLgA3GpMRmA/Py
	vLZqLvqxelPY7ZWUNSeJ0l4Tb055cHbOGoH9bhp8gsHWNc3BMd8gQWvRNHz/5vdHNO4RVqnCKKt
	gwHPWcd9dY+QCd8zxWHvdgvmrKgRkSBbHy9Anu6FJZHus0b4c8NBRNBR7st58wcSGKzeEFaE6bX
	eFfGsCp/ZfqY4lrAUwlh3cyZcD/vQQ1JNQT/lzPYPjFsSqbBLtItA0Uyl9b9a/8s3amXOrjycqM
	WR3UwcFoI6+wlg3rXhJh2LyEGr5qA+WmnzzKWjxAgBREBOdT/1L/tzQ87AU62ZjF8c+fbZDev3G
	Ar4sYiPXCrbpQ6WZnouwXQ5BtqCwas2ZIhG+ZOCK6h5Fm26Da9ADryuaQNedAFGODVMkZIjVezt
	q923lOhyRROEeCPLgsfDJo88xQgDvwWCJqsjaj/majpQwe31VfcQXvvASFZMWV2MQmqKnPxCOnP
	RriMueEYgFpJVU1I0B0BT6CTxvefhTD4puzt7Bkiej+zE0QSoZbduqwuCs9aGBH8U0LrSMRDdra
	nq+Q==
X-Received: by 2002:a17:90b:4a87:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3b182e10779mr1304123a91.9.1794371172912;
        Tue, 10 Nov 2026 20:26:12 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:12 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/7] wifi: brcmsmac: embed bandstate arrays instead of separate allocation
Date: Tue, 10 Nov 2026 20:25:48 -0800
Message-ID: <20261111042554.232998-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111042554.232998-1-rosenp@gmail.com>
References: <20261111042554.232998-1-rosenp@gmail.com>
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

Replace the separately allocated per-band state (struct brcms_band in
brcms_c_info and struct brcms_hw_band in brcms_hardware) with directly
embedded fixed-size arrays. This removes the manual pointer arithmetic,
two kzalloc()/kfree() pairs and their OOM error paths.

MAXBANDS is 2, so the embedded arrays are small.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/channel.c     |  8 +-
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  4 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 82 ++++++-------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  4 +-
 .../broadcom/brcm80211/brcmsmac/stf.c         | 22 ++---
 5 files changed, 44 insertions(+), 76 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
index 5ca8a0735398..a5c1c4d45683 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
@@ -315,8 +315,8 @@ brcms_c_set_country(struct brcms_cm_info *wlc_cm,
 	    wlc->protection->nmode_user)
 		brcms_c_set_nmode(wlc);
 
-	brcms_c_stf_ss_update(wlc, wlc->bandstate[BAND_2G_INDEX]);
-	brcms_c_stf_ss_update(wlc, wlc->bandstate[BAND_5G_INDEX]);
+	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_2G_INDEX]);
+	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_5G_INDEX]);
 
 	brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
 
@@ -420,7 +420,7 @@ brcms_c_channel_reg_limits(struct brcms_cm_info *wlc_cm, u16 chanspec,
 	country = &wlc_cm->world_regd->country;
 
 	chan = CHSPEC_CHANNEL(chanspec);
-	band = wlc->bandstate[chspec_bandunit(chanspec)];
+	band = &wlc->bandstate[chspec_bandunit(chanspec)];
 	li_mimo = (band->bandtype == BRCM_BAND_5G) ?
 	    brcms_c_get_mimo_5g(country->locale_mimo_5G) :
 	    brcms_c_get_mimo_2g(country->locale_mimo_2G);
@@ -748,7 +748,7 @@ void brcms_c_regd_init(struct brcms_c_info *wlc)
 
 	/* Disable any channels not supported by the phy */
 	for (band_idx = 0; band_idx < wlc->pub->_nbands; band_idx++) {
-		band = wlc->bandstate[band_idx];
+		band = &wlc->bandstate[band_idx];
 
 		wlc_phy_chanspec_band_validch(band->pi, band->bandtype,
 					      &sup_chan);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index c1a2318d7ea6..5946a0e133ee 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -1059,7 +1059,7 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 
 	phy_type = brcms_c_get_phy_type(wl->wlc, 0);
 	if (phy_type == PHY_TYPE_N || phy_type == PHY_TYPE_LCN) {
-		band = &wlc->bandstate[BAND_2G_INDEX]->band;
+		band = &wlc->bandstate[BAND_2G_INDEX].band;
 		*band = brcms_band_2GHz_nphy_template;
 		if (phy_type == PHY_TYPE_LCN) {
 			/* Single stream */
@@ -1074,7 +1074,7 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 	/* Assume all bands use the same phy.  True for 11n devices. */
 	if (wl->pub->_nbands > 1) {
 		if (phy_type == PHY_TYPE_N || phy_type == PHY_TYPE_LCN) {
-			band = &wlc->bandstate[BAND_5G_INDEX]->band;
+			band = &wlc->bandstate[BAND_5G_INDEX].band;
 			*band = brcms_band_5GHz_nphy_template;
 			hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
 		} else {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 7d000a2d033b..3834f2da5aa7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -424,12 +424,9 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
-	kfree(wlc->bandstate[0]);
 	if (wlc->corestate)
 		kfree(wlc->corestate->macstat_snapshot);
 	kfree(wlc->corestate);
-	if (wlc->hw)
-		kfree(wlc->hw->bandstate[0]);
 	kfree(wlc->hw);
 	if (wlc->beacon)
 		dev_kfree_skb_any(wlc->beacon);
@@ -467,20 +464,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->hw->bandstate[0] =
-		kzalloc_objs(struct brcms_hw_band, MAXBANDS, GFP_ATOMIC);
-	if (wlc->hw->bandstate[0] == NULL) {
-		*err = 1006;
-		goto fail;
-	} else {
-		int i;
-
-		for (i = 1; i < MAXBANDS; i++)
-			wlc->hw->bandstate[i] = (struct brcms_hw_band *)
-			    ((unsigned long)wlc->hw->bandstate[0] +
-			     (sizeof(struct brcms_hw_band) * i));
-	}
-
 	wlc->modulecb =
 		kzalloc_objs(struct modulecb, BRCMS_MAXMODULES, GFP_ATOMIC);
 	if (wlc->modulecb == NULL) {
@@ -512,20 +495,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->bandstate[0] =
-		kzalloc_objs(*wlc->bandstate[0], MAXBANDS, GFP_ATOMIC);
-	if (wlc->bandstate[0] == NULL) {
-		*err = 1025;
-		goto fail;
-	} else {
-		int i;
-
-		for (i = 1; i < MAXBANDS; i++)
-			wlc->bandstate[i] = (struct brcms_band *)
-				((unsigned long)wlc->bandstate[0]
-				+ (sizeof(struct brcms_band)*i));
-	}
-
 	wlc->corestate = kzalloc_obj(*wlc->corestate, GFP_ATOMIC);
 	if (wlc->corestate == NULL) {
 		*err = 1026;
@@ -744,13 +713,13 @@ static void brcms_c_setxband(struct brcms_hardware *wlc_hw, uint bandunit)
 	brcms_dbg_mac80211(wlc_hw->d11core, "wl%d: bandunit %d\n", wlc_hw->unit,
 			   bandunit);
 
-	wlc_hw->band = wlc_hw->bandstate[bandunit];
+	wlc_hw->band = &wlc_hw->bandstate[bandunit];
 
 	/*
 	 * BMAC_NOTE:
 	 *   until we eliminate need for wlc->band refs in low level code
 	 */
-	wlc_hw->wlc->band = wlc_hw->wlc->bandstate[bandunit];
+	wlc_hw->wlc->band = &wlc_hw->wlc->bandstate[bandunit];
 
 	/* set gmode core flag */
 	if (wlc_hw->sbclk && !wlc_hw->noreset) {
@@ -1298,10 +1267,10 @@ brcms_b_mhf(struct brcms_hardware *wlc_hw, u8 idx, u16 mask, u16 val,
 		band = wlc_hw->band;
 		break;
 	case BRCM_BAND_5G:
-		band = wlc_hw->bandstate[BAND_5G_INDEX];
+		band = &wlc_hw->bandstate[BAND_5G_INDEX];
 		break;
 	case BRCM_BAND_2G:
-		band = wlc_hw->bandstate[BAND_2G_INDEX];
+		band = &wlc_hw->bandstate[BAND_2G_INDEX];
 		break;
 	default:
 		band = NULL;	/* error condition */
@@ -1321,10 +1290,10 @@ brcms_b_mhf(struct brcms_hardware *wlc_hw, u8 idx, u16 mask, u16 val,
 	}
 
 	if (bands == BRCM_BAND_ALL) {
-		wlc_hw->bandstate[0]->mhfs[idx] =
-		    (wlc_hw->bandstate[0]->mhfs[idx] & ~mask) | val;
-		wlc_hw->bandstate[1]->mhfs[idx] =
-		    (wlc_hw->bandstate[1]->mhfs[idx] & ~mask) | val;
+		wlc_hw->bandstate[0].mhfs[idx] =
+		    (wlc_hw->bandstate[0].mhfs[idx] & ~mask) | val;
+		wlc_hw->bandstate[1].mhfs[idx] =
+		    (wlc_hw->bandstate[1].mhfs[idx] & ~mask) | val;
 	}
 }
 
@@ -3486,7 +3455,7 @@ static void brcms_c_bandinit_ordered(struct brcms_c_info *wlc,
 	for (i = 0; i < wlc->pub->_nbands; i++) {
 		uint j = band_order[i];
 
-		wlc->band = wlc->bandstate[j];
+		wlc->band = &wlc->bandstate[j];
 
 		brcms_default_rateset(wlc, &default_rateset);
 
@@ -3803,9 +3772,8 @@ brcms_b_set_chanspec(struct brcms_hardware *wlc_hw, u16 chanspec,
 			 *  use light band switch if not up yet
 			 */
 			if (wlc_hw->up) {
-				wlc_phy_chanspec_radio_set(wlc_hw->
-							   bandstate[bandunit]->
-							   pi, chanspec);
+				wlc_phy_chanspec_radio_set(wlc_hw->bandstate[bandunit].pi,
+							   chanspec);
 				brcms_b_setband(wlc_hw, bandunit, chanspec);
 			} else {
 				brcms_c_setxband(wlc_hw, bandunit);
@@ -3833,7 +3801,7 @@ brcms_b_set_chanspec(struct brcms_hardware *wlc_hw, u16 chanspec,
 static void brcms_c_setband(struct brcms_c_info *wlc,
 					   uint bandunit)
 {
-	wlc->band = wlc->bandstate[bandunit];
+	wlc->band = &wlc->bandstate[bandunit];
 
 	if (!wlc->pub->up)
 		return;
@@ -4363,7 +4331,7 @@ static int brcms_b_attach(struct brcms_c_info *wlc, struct bcma_device *core,
 	wlc_hw = wlc->hw;
 	wlc_hw->wlc = wlc;
 	wlc_hw->unit = unit;
-	wlc_hw->band = wlc_hw->bandstate[0];
+	wlc_hw->band = &wlc_hw->bandstate[0];
 	wlc_hw->_piomode = piomode;
 
 	/* populate struct brcms_hardware with default values  */
@@ -4704,7 +4672,7 @@ static void brcms_c_bss_default_init(struct brcms_c_info *wlc)
 	band = wlc->band;
 	if (wlc->pub->_nbands > 1 &&
 	    band->bandunit != chspec_bandunit(chanspec))
-		band = wlc->bandstate[OTHERBANDUNIT(wlc)];
+		band = &wlc->bandstate[OTHERBANDUNIT(wlc)];
 
 	/* init bss rates to the band specific default rate set */
 	brcms_c_rateset_default(&bi->rateset, NULL, band->phytype,
@@ -4722,7 +4690,7 @@ static void brcms_c_update_mimo_band_bwcap(struct brcms_c_info *wlc, u8 bwcap)
 	struct brcms_band *band;
 
 	for (i = 0; i < wlc->pub->_nbands; i++) {
-		band = wlc->bandstate[i];
+		band = &wlc->bandstate[i];
 		if (band->bandtype == BRCM_BAND_5G) {
 			if ((bwcap == BRCMS_N_BW_40ALL)
 			    || (bwcap == BRCMS_N_BW_20IN2G_40IN5G))
@@ -4784,7 +4752,7 @@ static void brcms_b_detach(struct brcms_c_info *wlc)
 			wlc_phy_detach(band->pi);
 			band->pi = NULL;
 		}
-		band = wlc_hw->bandstate[OTHERBANDUNIT(wlc)];
+		band = &wlc_hw->bandstate[OTHERBANDUNIT(wlc)];
 	}
 
 	/* Free shared phy state */
@@ -5187,8 +5155,8 @@ int brcms_c_set_gmode(struct brcms_c_info *wlc, u8 gmode, bool config)
 	if (wlc->band->bandtype == BRCM_BAND_2G)
 		band = wlc->band;
 	else if ((wlc->pub->_nbands > 1) &&
-		 (wlc->bandstate[OTHERBANDUNIT(wlc)]->bandtype == BRCM_BAND_2G))
-		band = wlc->bandstate[OTHERBANDUNIT(wlc)];
+		 (wlc->bandstate[OTHERBANDUNIT(wlc)].bandtype == BRCM_BAND_2G))
+		band = &wlc->bandstate[OTHERBANDUNIT(wlc)];
 	else
 		return -EINVAL;
 
@@ -5275,7 +5243,7 @@ int brcms_c_set_nmode(struct brcms_c_info *wlc)
 	brcms_c_rateset_mcs_build(&wlc->default_bss->rateset,
 			      wlc->stf->txstreams);
 	for (i = 0; i < wlc->pub->_nbands; i++)
-		memcpy(wlc->bandstate[i]->hw_rateset.mcs,
+		memcpy(wlc->bandstate[i].hw_rateset.mcs,
 		       wlc->default_bss->rateset.mcs, MCSSET_LEN);
 
 	return 0;
@@ -5298,7 +5266,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 	bandunit = wlc->band->bandunit;
 	memcpy(&new, &rs, sizeof(struct brcms_c_rateset));
 	if (brcms_c_rate_hwrs_filter_sort_validate
-	    (&new, &wlc->bandstate[bandunit]->hw_rateset, true,
+	    (&new, &wlc->bandstate[bandunit].hw_rateset, true,
 	     wlc->stf->txstreams))
 		goto good;
 
@@ -5308,7 +5276,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 		memcpy(&new, &rs, sizeof(struct brcms_c_rateset));
 		if (brcms_c_rate_hwrs_filter_sort_validate(&new,
 						       &wlc->
-						       bandstate[bandunit]->
+						       bandstate[bandunit].
 						       hw_rateset, true,
 						       wlc->stf->txstreams))
 			goto good;
@@ -5320,7 +5288,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 	/* apply new rateset */
 	memcpy(&wlc->default_bss->rateset, &new,
 	       sizeof(struct brcms_c_rateset));
-	memcpy(&wlc->bandstate[bandunit]->defrateset, &new,
+	memcpy(&wlc->bandstate[bandunit].defrateset, &new,
 	       sizeof(struct brcms_c_rateset));
 	return 0;
 }
@@ -5766,7 +5734,7 @@ static bool brcms_c_valid_rate(struct brcms_c_info *wlc, u32 rspec, int band,
 	if ((band == BRCM_BAND_AUTO) || (band == wlc->band->bandtype))
 		hw_rateset = &wlc->band->hw_rateset;
 	else if (wlc->pub->_nbands > 1)
-		hw_rateset = &wlc->bandstate[OTHERBANDUNIT(wlc)]->hw_rateset;
+		hw_rateset = &wlc->bandstate[OTHERBANDUNIT(wlc)].hw_rateset;
 	else
 		/* other band specified and we are a single band device */
 		return false;
@@ -7870,7 +7838,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	wlc->wiphy = wl->wiphy;
 	pub = wlc->pub;
 
-	wlc->band = wlc->bandstate[0];
+	wlc->band = &wlc->bandstate[0];
 	wlc->core = wlc->corestate;
 	wlc->wl = wl;
 	pub->unit = unit;
@@ -7918,7 +7886,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	memcpy(&pub->cur_etheraddr, &wlc->hw->etheraddr, ETH_ALEN);
 
 	for (j = 0; j < wlc->pub->_nbands; j++) {
-		wlc->band = wlc->bandstate[j];
+		wlc->band = &wlc->bandstate[j];
 
 		if (!brcms_c_attach_stf_ant_init(wlc)) {
 			err = 24;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 2d133264f4a7..425c867964e9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -335,7 +335,7 @@ struct brcms_hardware {
 	struct shared_phy *phy_sh;	/* pointer to shared phy state */
 	struct brcms_hw_band *band;/* pointer to active per-band state */
 	/* band state per phy/radio */
-	struct brcms_hw_band *bandstate[MAXBANDS];
+	struct brcms_hw_band bandstate[MAXBANDS];
 	u16 bmac_phytxant;	/* cache of high phytxant state */
 	bool shortslot;		/* currently using 11g ShortSlot timing */
 	u16 SRL;		/* 802.11 dot11ShortRetryLimit */
@@ -471,7 +471,7 @@ struct brcms_c_info {
 	struct brcms_core *core;
 	struct brcms_band *band;
 	struct brcms_core *corestate;
-	struct brcms_band *bandstate[MAXBANDS];
+	struct brcms_band bandstate[MAXBANDS];
 
 	/* packet queue */
 	uint qvalid;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
index 79d4a7a4da8b..6e31be49f83c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
@@ -136,8 +136,8 @@ static bool brcms_c_stf_stbc_tx_set(struct brcms_c_info *wlc, s32 int_val)
 	if ((int_val == ON) && (wlc->stf->txstreams == 1))
 		return false;
 
-	wlc->bandstate[BAND_2G_INDEX]->band_stf_stbc_tx = (s8) int_val;
-	wlc->bandstate[BAND_5G_INDEX]->band_stf_stbc_tx = (s8) int_val;
+	wlc->bandstate[BAND_2G_INDEX].band_stf_stbc_tx = (s8) int_val;
+	wlc->bandstate[BAND_5G_INDEX].band_stf_stbc_tx = (s8) int_val;
 
 	return true;
 }
@@ -285,8 +285,8 @@ int brcms_c_stf_txchain_set(struct brcms_c_info *wlc, s32 int_val, bool force)
 	wlc->stf->txchain = txchain;
 	wlc->stf->txstreams = txstreams;
 	brcms_c_stf_stbc_tx_set(wlc, wlc->band->band_stf_stbc_tx);
-	brcms_c_stf_ss_update(wlc, wlc->bandstate[BAND_2G_INDEX]);
-	brcms_c_stf_ss_update(wlc, wlc->bandstate[BAND_5G_INDEX]);
+	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_2G_INDEX]);
+	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_5G_INDEX]);
 	wlc->stf->txant =
 	    (wlc->stf->txstreams == 1) ? ANT_TX_FORCE_0 : ANT_TX_DEF;
 	_brcms_c_stf_phy_txant_upd(wlc);
@@ -336,19 +336,19 @@ void brcms_c_stf_ss_update(struct brcms_c_info *wlc, struct brcms_band *band)
 
 int brcms_c_stf_attach(struct brcms_c_info *wlc)
 {
-	wlc->bandstate[BAND_2G_INDEX]->band_stf_ss_mode = PHY_TXC1_MODE_SISO;
-	wlc->bandstate[BAND_5G_INDEX]->band_stf_ss_mode = PHY_TXC1_MODE_CDD;
+	wlc->bandstate[BAND_2G_INDEX].band_stf_ss_mode = PHY_TXC1_MODE_SISO;
+	wlc->bandstate[BAND_5G_INDEX].band_stf_ss_mode = PHY_TXC1_MODE_CDD;
 
 	if (BRCMS_ISNPHY(wlc->band) &&
 	    (wlc_phy_txpower_hw_ctrl_get(wlc->band->pi) != PHY_TPC_HW_ON))
-		wlc->bandstate[BAND_2G_INDEX]->band_stf_ss_mode =
+		wlc->bandstate[BAND_2G_INDEX].band_stf_ss_mode =
 		    PHY_TXC1_MODE_CDD;
-	brcms_c_stf_ss_update(wlc, wlc->bandstate[BAND_2G_INDEX]);
-	brcms_c_stf_ss_update(wlc, wlc->bandstate[BAND_5G_INDEX]);
+	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_2G_INDEX]);
+	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_5G_INDEX]);
 
 	brcms_c_stf_stbc_rx_ht_update(wlc, HT_CAP_RX_STBC_NO);
-	wlc->bandstate[BAND_2G_INDEX]->band_stf_stbc_tx = OFF;
-	wlc->bandstate[BAND_5G_INDEX]->band_stf_stbc_tx = OFF;
+	wlc->bandstate[BAND_2G_INDEX].band_stf_stbc_tx = OFF;
+	wlc->bandstate[BAND_5G_INDEX].band_stf_stbc_tx = OFF;
 
 	if (BRCMS_STBC_CAP_PHY(wlc)) {
 		wlc->stf->ss_algosel_auto = true;
-- 
2.56.0

