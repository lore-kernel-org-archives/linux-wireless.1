Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557052;
	b=n+tzwyJGDxqplz9Lgtxnzo8Ii5JjqAxZJ6qdIur/k2HpMZaTm7HSv8VAYx0+M36XjYnn
	 hkkmehlSgjTu/ab3TKW7GK9dglx0KVvFZssZ5/bPQqFBNPTOnBl5oCalpb2CDHw90HU0s
	 Z0PmBVnSvtzG9USCFw7ResvUbL0gZIJng5I72W5Ce//BSnaZcqKNksZ3eWkaou0MhtlHi
	 1MC9Mx7ZQ7/3fLsMxY/agAEUduXv9p1ia9CzeFsFmJbuz+JMvbprp3AOIwJ91rbBD8kOi
	 WWHeS7BEriXoHXsmU685nzOkr0WLXBqI8FVls9u48CRu5h3nWHblyejrtNx2Y/KdFRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
	b=aTye5C8dAWV7kYXkHQhYOiv/8N/uToAHe4gwnzC/QwWmeG/iWoBib2al/6CSFEwU9bxk
	 HBhG5vlzhohYFrb/dVtbZBtD+zGHm+xOKXhVKOBYgMPsiVthEt+Jp8nZSnqLiydM1tPGn
	 ekTECjv77RcTjIElnr9hcUbB0unFujfuPm3MBRe8XUuAP2HIspZeGYoWJq7IbbNc64Mgh
	 lcNz76jbXdzlPZJQn3ik4k519tkhBDuYGu+WmT5nBy9IteJBPqth8H9iHBPO/50lLMxJv
	 UT2wNWLkkw6dhjA6/NamiGDcW4L2+1p4tGyaz8+M+01/nCCb+5IhVuxKU90kSKAbufQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO2rDp6Z;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00900606A323
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00900606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO2rDp6Z
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02ee04378so39855465ad.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557051; x=1796161851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
        b=JO2rDp6ZMlA2XTHCjjvc1yCnZ8AFRZgMXVCj5XgnOs2Iv/0gJXlpy3o86YJg6UY8i5
         bej6DMHXosxtkQnMIZpvvXYWBfvHbW/G112UiUMripQt8xrAqfqReQLx9glEIwBAMz+V
         kmvYnzzlgTyNaebBtbJjm+IkWqzEHA5I18P0eEpWtgdbTeTP0FcfaqTfeALeo2Gp85ov
         eQjmNJwriCDyw+WIHT103OXgzt0P42hGNL7hJgKbQ8p05wYlSn6UB0Mkh5IrlDOUJdj9
         1NLxOkmwJX5QijmCxUMyD5l7H/lfTOsUj5twq0ClceWd0LVmmaSajwQmZlBjpjwxXcxo
         g0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557051; x=1796161851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
        b=AEABAyvPMJhpcUr53aNZlki4FBQH1hyfo02YVSQRhEukjNyvfYNZpkyCcOvy9IHJOm
         jrh87qU4qC0DiaBvnM4yBZk8PqwmaH4/gXaSVlm/VKWGeo+saeEtcdxKeqTTtTJcXLHr
         p4F4r6toc/noiAb63vXM0h4OnYxvlm65fbmF77R61MVNl+uEagXsC0rrSn0XQ5RNZuOq
         YjmQdlIl74IwGi9owDZ45LsA77NoHdWEerbW9uTZrVPD/0lczEDc6fW/uaYsByfp9qhF
         da3i1VC3W2oayYoCc+HDqUFNBIgvYyPYMC4c/8JPPa8UfeLoHvPasPJ+YIenwzCcfdA9
         jfvw==
X-Gm-Message-State: APuU4Z+h4IVN0wsZol6RyyanOE5rnS6pgpN2w+vNxWn09wTN1v78JJfN
	e0wnto4tAet0zZY2b7syRoM6cNikvxeK8FeZKtfBT/0az0XulrU6CnHSjVgd7A==
X-Gm-Gg: AZFdTZcTBFf49m0Ku1227ftLBlvGYAijyiwzp9+Tj7lTfJMx7GY4Wirz/utPqnrUznR
	ILvQO95olU8wlpbbCeHmq/OXFmhNnncs2LSckmK2nmXvJPKCSk07IX6JHv4ofodXTBrGbXTaMiP
	jUjuMycmbPZ5FZ761GhHkyFsKQAlrDQ77HU5yKMUB2oJoVqUhsc0CKh2VT83R8xcz1rsx1VMBT5
	FAfBOqWc3duV2MQYDRufNnKYUC6hdE92VfPZmYyFQIdEXQa+oaK+Y+RvkITAYvoSL2+Op0QaVHT
	aWVOpVnSE68Sf2MQeZ0RGb48stwlOQ2Q7BXJtL7kTmEgDi91xEmerVxlxp/OicApdZKlwowk12h
	BkIWiYC1LF2Wno2SfMuuiiG4CkwIRbYfoxgi3pS0rMHGi3Jpv0ryv0RiHnShpCqHe1RBIF0e7iQ
	Bzz4SXBy5P+tGNAezYxLVi7+/5PXONnHeW9J4W5+ORVypNNBERc02rF/yMSrRuW2q6NSN6l2JNV
	6Sl9Q3gQAq6JvCZLuBvbbuJ/a54Wm1OOOGI9W2gDeHR84BL4gGY50IYZEBA52Hl8WHgrBZIB3YX
	IAbxB4VoABS7KRbljk9xooWOPbDhC39x+SdYN7licomq+HggE3zk7IKYL652ARbHIRyKUHK+npi
	/6lT4XAJWb0WhF63hZUkmBRHlJwjoqGDFt60sUTlMPFeQoCbbJUrkrWeySvBHTD9kXc1Be0Ywn8
	K4J3VmKP78QaNxZ8wUTFavB5s=
X-Received: by 2002:a17:902:c402:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2f03f211b8emr172219685ad.34.1795557051242;
        Tue, 24 Nov 2026 13:50:51 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:50 -0800 (PST)
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
Subject: [PATCH wireless-next v2 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:37 -0800
Message-ID: <20261124215040.1261999-5-rosenp@gmail.com>
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

Replace the separately allocated default_bss pointer with a
directly embedded struct brcms_bss_info in brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |  2 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 35 ++++++++-----------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5d8..b40761e571c2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -862,7 +862,7 @@ brcms_c_ampdu_dotxstatus_complete(struct ampdu_info *ampdu, struct scb *scb,
 				brcms_dbg_ht(wlc->hw->d11core,
 					  "%s: Pkt tx suppressed, illegal channel possibly %d\n",
 					  __func__, CHSPEC_CHANNEL(
-					  wlc->default_bss->chanspec));
+					  wlc->default_bss.chanspec));
 			} else {
 				if (supr_status != TX_STATUS_SUPR_FRAG)
 					brcms_err(wlc->hw->d11core,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index d000e2a70870..2140feb86964 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
@@ -461,12 +460,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
-	if (wlc->default_bss == NULL) {
-		*err = 1010;
-		goto fail;
-	}
-
 	wlc->bsscfg = kzalloc_obj(*wlc->bsscfg, GFP_ATOMIC);
 	if (wlc->bsscfg == NULL) {
 		*err = 1011;
@@ -822,7 +815,7 @@ brcms_c_dotxstatus(struct brcms_c_info *wlc, struct tx_status *txs)
 		brcms_dbg_tx(wlc->hw->d11core,
 			     "Pkt tx suppressed, dest chan %u, current %d\n",
 			     (xfts >> XFTS_CHANNEL_SHIFT) & 0xff,
-			     CHSPEC_CHANNEL(wlc->default_bss->chanspec));
+			     CHSPEC_CHANNEL(wlc->default_bss.chanspec));
 	}
 
 	tx_frame_count =
@@ -3311,7 +3304,7 @@ brcms_default_rateset(struct brcms_c_info *wlc, struct brcms_c_rateset *rs)
 	brcms_c_rateset_default(rs, NULL, wlc->band->phytype,
 		wlc->band->bandtype, false, BRCMS_RATE_MASK_FULL,
 		(bool) (wlc->pub->_n_enab & SUPPORT_11N),
-		brcms_chspec_bw(wlc->default_bss->chanspec),
+		brcms_chspec_bw(wlc->default_bss.chanspec),
 		wlc->stf->txstreams);
 }
 
@@ -4639,7 +4632,7 @@ static void brcms_c_bss_default_init(struct brcms_c_info *wlc)
 {
 	u16 chanspec;
 	struct brcms_band *band;
-	struct brcms_bss_info *bi = wlc->default_bss;
+	struct brcms_bss_info *bi = &wlc->default_bss;
 
 	/* init default and target BSS with some sane initial values */
 	memset(bi, 0, sizeof(*bi));
@@ -5198,9 +5191,9 @@ int brcms_c_set_gmode(struct brcms_c_info *wlc, u8 gmode, bool config)
 	}
 
 	/* Set default bss rateset */
-	wlc->default_bss->rateset.count = rs.count;
-	memcpy(wlc->default_bss->rateset.rates, rs.rates,
-	       sizeof(wlc->default_bss->rateset.rates));
+	wlc->default_bss.rateset.count = rs.count;
+	memcpy(wlc->default_bss.rateset.rates, rs.rates,
+	       sizeof(wlc->default_bss.rateset.rates));
 
 	return ret;
 }
@@ -5221,13 +5214,13 @@ int brcms_c_set_nmode(struct brcms_c_info *wlc)
 		wlc->pub->_n_enab = SUPPORT_HT;
 	else
 		wlc->pub->_n_enab = SUPPORT_11N;
-	wlc->default_bss->flags |= BRCMS_BSS_HT;
+	wlc->default_bss.flags |= BRCMS_BSS_HT;
 	/* add the mcs rates to the default and hw ratesets */
-	brcms_c_rateset_mcs_build(&wlc->default_bss->rateset,
+	brcms_c_rateset_mcs_build(&wlc->default_bss.rateset,
 			      wlc->stf->txstreams);
 	for (i = 0; i < wlc->pub->_nbands; i++)
 		memcpy(wlc->bandstate[i].hw_rateset.mcs,
-		       wlc->default_bss->rateset.mcs, MCSSET_LEN);
+		       wlc->default_bss.rateset.mcs, MCSSET_LEN);
 
 	return 0;
 }
@@ -5269,7 +5262,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 
  good:
 	/* apply new rateset */
-	memcpy(&wlc->default_bss->rateset, &new,
+	memcpy(&wlc->default_bss.rateset, &new,
 	       sizeof(struct brcms_c_rateset));
 	memcpy(&wlc->bandstate[bandunit].defrateset, &new,
 	       sizeof(struct brcms_c_rateset));
@@ -5299,7 +5292,7 @@ int brcms_c_set_channel(struct brcms_c_info *wlc, u16 channel)
 			wlc->bandinit_pending = false;
 	}
 
-	wlc->default_bss->chanspec = chspec;
+	wlc->default_bss.chanspec = chspec;
 	/* brcms_c_BSSinit() will sanitize the rateset before
 	 * using it.. */
 	if (wlc->pub->up && (wlc_phy_chanspec_get(wlc->band->pi) != chspec)) {
@@ -5343,7 +5336,7 @@ void brcms_c_get_current_rateset(struct brcms_c_info *wlc,
 	if (wlc->pub->associated)
 		rs = &wlc->bsscfg->current_bss.rateset;
 	else
-		rs = &wlc->default_bss->rateset;
+		rs = &wlc->default_bss.rateset;
 
 	/* Copy only legacy rateset section */
 	currs->count = rs->count;
@@ -5370,7 +5363,7 @@ int brcms_c_set_rateset(struct brcms_c_info *wlc, struct brcm_rateset *rs)
 		if (wlc->pub->associated)
 			mcsset_bss = &wlc->bsscfg->current_bss;
 		else
-			mcsset_bss = wlc->default_bss;
+			mcsset_bss = &wlc->default_bss;
 		memcpy(internal_rs.mcs, &mcsset_bss->rateset.mcs[0],
 		       MCSSET_LEN);
 	}
@@ -5403,7 +5396,7 @@ int brcms_c_set_beacon_period(struct brcms_c_info *wlc, u16 period)
 	if (period == 0)
 		return -EINVAL;
 
-	wlc->default_bss->beacon_period = period;
+	wlc->default_bss.beacon_period = period;
 
 	bcnint_us = period << 10;
 	brcms_c_time_lock(wlc);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 0e6a5edc74c8..94966418b069 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -524,7 +524,7 @@ struct brcms_c_info {
 	s8 ofdm_40txbw;
 	s8 mimo_40txbw;
 
-	struct brcms_bss_info *default_bss;
+	struct brcms_bss_info default_bss;
 
 	u16 mc_fid_counter;
 
-- 
2.56.1

