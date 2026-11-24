Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557056;
	b=Ps5acQ10PrXZRNp68xmLyNiYqHQu5T8lOoQFhtPYOlXbSbwANkqpeoMtYZRWv+sctSet
	 NbC78X0A8gDD2BOSgOtDsHncBNK6+gC6UqJrbUlihHBzAgNGll98UE3rBW8BhgQ81I6EE
	 t8+7Da1GEZTa1EdqCJ1KCQb8W0M07D7cgePkKw1/trUXnLFcgLiw6u+n8F8EvRkD0Sp0F
	 pVaDp46dUsR5sLctMBIJm1h/mHuryhv2H2YOuyCkl4Vfq3EHeN0OxnnkMDLmkc0xaLsqr
	 G75xcHsjwShw+6aZ/v53BbFBoeTEwSHq33sNiCCUhpAKQCxnHc2O+cemjS0eY3hr2gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lhC3E6j9bmGggUmcCK8Ii/A2YIIhfQwfAVP2Vr2BAu8=;
	b=VelzlOdXk7mEV9L/kof0wdieXEgr6hpXuiw8zvtxP0nG5e94BSYpxiK4O1C6jAiAsb7n
	 sPYcCQgLLfBRpnyc+n+MerY9ph5JfKavlkvuz6AvALHIm/QzZbzBgD+/0ZP5JpyzUeUdf
	 8dAlGSjyIOaYv+0dktv/8gtSELleQHLXpakY947ZyL6OprgZHdOG5lxTVyMs+SUxtgQjx
	 Dx2ltBaTBcXfQvG5Kj5LCHRZEXnRbNRIpzrMeUgKA3+cutUNFZbgmb9BNhjrzsibuwA03
	 9mb6FzUlrh/CYexjxDMI6ztFSROlr0nbBcf67iQubAj55HcpW3ECoJoO+ZNRx/5tm4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZN478tkF;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D100606A33E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D100606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZN478tkF
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f02ee04378so39855985ad.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557055; x=1796161855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhC3E6j9bmGggUmcCK8Ii/A2YIIhfQwfAVP2Vr2BAu8=;
        b=ZN478tkFYuwiUDVa5N1CNDsE6A6iolBfE+IbhwiThkfKfsWt1i7gIWBMtu1qfPF+/8
         bC2NXg9lzt5sss/gQbJ2JSJyu+x+KibdSgLt8wpHHAfhVNNDhMBpGZj0BU/UIQpdXOvy
         Tw2RZhXXNxIv+Rr18KqUih5wmfcVvprzxeo0zc6Fqc/yDW2xj53aGwhr8xup1iuHWju3
         7WkpUTGtuxgQZpOmNkEr53FvXn0WCsKF3U77Hb9BGIOxLFMSK4FN6aU2/RVJCfBEZZcU
         EZdj9g9VHL6JzcojnI4E+G0JBmo8I/t0p7IpiqE02PwKgnSxxzUlJkhkISdJCENuEW4/
         TTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557055; x=1796161855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhC3E6j9bmGggUmcCK8Ii/A2YIIhfQwfAVP2Vr2BAu8=;
        b=eC/b3ZexpRYa92qoDE8u/M8bJz566sBxpBxvDgcNtK8GOnmu5ze7uWejUBNlfyRGfe
         k65A2cWf0i1DCTYyhEPhOFyD50HxzJx1Rlyu5sbc2XeSHvraVCFJklfAn9/r1uBZEAeo
         jgct9ezTeP+Ua++EdlA6wdOVQvsm2tHbdO3cS163v03IAOAHvTp/DeYKflm5nTSOIfcY
         GygFs+DAeWIKgQC3oIc/YpyF/v9EX7FwJkzJ3F9bp4pwOr6TDSyB6M1ZUtS4iDq2mBAU
         JDpnJKhVL84ZrI8dHFcPNywc/qSG3tiG8KXFAV6+mW4T45+uDjnePoPwg79JdWcpJ5GI
         GGJA==
X-Gm-Message-State: APuU4Z+tUZ4OWl0FOKQlU13A6ftRUpxqzvKGS5F8ncWzqSOEAXdAKyZP
	J+v9X6nOwaS6Ia9Ju8mPcfR4rR+3dE3fMhR+nDNTr26TdUivhc6WQds5NTYc+w==
X-Gm-Gg: AZFdTZc4hV2JAi0zTIK1XLAXEh/q2msfVCYZfxo4Ajp3PCtowBftJqOm5KNNiVFvLwS
	XspE0dnuaLKfgsRUQ3ynIz8DMAXGoDg4EiD+GEOlDB84WgX7VSePVeRW+RYNdaWOGpWdyBoAGPq
	GN021djF+Ugv4dPydUBCDRSuFMrsQPPX47FEzCqXnWrjq3yLTcVxu4NcEsWZvNXLTp6ZBwoErZx
	BzKwEb02Zfa2ryY2F+fWVJ4WbOM+ZcoaAWwbOcS5xm4xVnnJr2So8sy+Uvs8hEwv9iQQAAfOaDl
	rLcmla/7QE/t0ubNO2XzeWMtyHEOln7Zz7wjdp7pNfD3ObOgaJKCIXQXsYLk0Lmt6oE0L/te1HU
	GDyzuWzCbWE0PlXxoB3AttqYqbQ6zYU77AM3i1tF3X5WxfrxEJKGdmaPdQSirGuJrPLtrq49h1g
	btar6+pmnDBYKi4t92+5Q3H3KbwHbgJj7YloK84svOmDnvlSIBnk8cI2DUSYaxlTtElZF+uKgSb
	bREsmZMOnnFagdDSUHULgMGM7pRGxYmVpKi3P650KJZSM6TgOcDaWNL6eF1XqJ9uIqHnadGKG6a
	mqlEks9n+HWS2/o+zGjrf9NMnkdMWK2BlPoPugzF38QLNeqEZbB2AG6X7NMypdxZqAV0/gXSgbo
	mXBTj6fRTsNyf/CUYKVE7JIhgKdO/mpERb8r/xophwFiu7BgV3qDUFm12etyToT+slJL0YSU7wY
	1c9Wk=
X-Received: by 2002:a17:903:298c:b0:2ed:369a:42d2 with SMTP id d9443c01a7336-2f03f218049mr157938935ad.40.1795557055598;
        Tue, 24 Nov 2026 13:50:55 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
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
Subject: [PATCH wireless-next v2 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:39 -0800
Message-ID: <20261124215040.1261999-7-rosenp@gmail.com>
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

There is only one struct brcms_core and it has the same lifetime as
struct brcms_c_info. Embed it directly instead of allocating it
separately, removing one kzalloc()/kfree() pair and its OOM error path.

Remove the now useless core pointer. It always points to corestate.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/debug.c |  2 +-
 .../wireless/broadcom/brcm80211/brcmsmac/main.c  | 16 ++++------------
 .../wireless/broadcom/brcm80211/brcmsmac/main.h  |  3 +--
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
index 711e994dd04d..76f9d20f0d1c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
@@ -98,7 +98,7 @@ static int brcms_debugfs_macstat_read(struct seq_file *s, void *data)
 	int i;
 
 	spin_lock_bh(&wl->lock);
-	stats = drvr->wlc->core->macstat_snapshot;
+	stats = drvr->wlc->corestate.macstat_snapshot;
 	spin_unlock_bh(&wl->lock);
 
 	seq_printf(s, "txallfrm: %d\n", stats.txallfrm);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index bd1880e3738f..422452b8a832 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -421,7 +421,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->stf);
-	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
 		dev_kfree_skb_any(wlc->beacon);
@@ -471,12 +470,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate = kzalloc_obj(*wlc->corestate, GFP_ATOMIC);
-	if (wlc->corestate == NULL) {
-		*err = 1026;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -2974,7 +2967,7 @@ static void brcms_c_statsupd(struct brcms_c_info *wlc)
 	if (!wlc->pub->up)
 		return;
 
-	macstats = &wlc->core->macstat_snapshot;
+	macstats = &wlc->corestate.macstat_snapshot;
 
 #ifdef DEBUG
 	/* save last rx fifo 0 overflow count */
@@ -3031,7 +3024,7 @@ void brcms_c_reset(struct brcms_c_info *wlc)
 	brcms_c_statsupd(wlc);
 
 	/* reset our snapshot of macstat counters */
-	memset(&wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
+	memset(&wlc->corestate.macstat_snapshot, 0, sizeof(struct macstat));
 
 	brcms_b_reset(wlc->hw);
 }
@@ -4453,7 +4446,7 @@ static int brcms_b_attach(struct brcms_c_info *wlc, struct bcma_device *core,
 		wlc_hw->band->bandtype = j ? BRCM_BAND_5G : BRCM_BAND_2G;
 		wlc->band->bandunit = j;
 		wlc->band->bandtype = j ? BRCM_BAND_5G : BRCM_BAND_2G;
-		wlc->core->coreidx = core->core_index;
+		wlc->corestate.coreidx = core->core_index;
 
 		wlc_hw->machwcap = bcma_read32(core, D11REGOFFS(machwcap));
 		wlc_hw->machwcap_backup = wlc_hw->machwcap;
@@ -7808,7 +7801,6 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	pub = wlc->pub;
 
 	wlc->band = &wlc->bandstate[0];
-	wlc->core = wlc->corestate;
 	wlc->wl = wl;
 	pub->unit = unit;
 	pub->_piomode = piomode;
@@ -7849,7 +7841,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 
 	/* pull up some info resulting from the low attach */
 	for (i = 0; i < NFIFO; i++)
-		wlc->core->txavail[i] = wlc->hw->txavail[i];
+		wlc->corestate.txavail[i] = wlc->hw->txavail[i];
 
 	memcpy(&wlc->perm_etheraddr, &wlc->hw->etheraddr, ETH_ALEN);
 	memcpy(&pub->cur_etheraddr, &wlc->hw->etheraddr, ETH_ALEN);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 266fe7825042..5e2052bd913a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -468,9 +468,8 @@ struct brcms_c_info {
 	bool clk;
 
 	/* multiband */
-	struct brcms_core *core;
 	struct brcms_band *band;
-	struct brcms_core *corestate;
+	struct brcms_core corestate;
 	struct brcms_band bandstate[MAXBANDS];
 
 	/* packet queue */
-- 
2.56.1

