Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371179;
	b=IvyLiaL2X70fo730hTf9SkPiqEaXJEVdGI8JEBR+DgAQOIKcipDvhBiYnJjbEbhrIHI5
	 Zd0pciy5YJLpEG3R+uNqb1QtQ1JH7acx0atrgDv/Cd/JtYrFdo3G1Yj7v7uNOgfAfi/+f
	 9ie9ohcD//zXJa6nHwOZVyLrAiPwUwqKXMIUxh0T4fMX4hft9NaRhMafeX4TBiywUM9Cp
	 64VSVkNgsDrHMDUFf/irnzCb1AhokwboCNI/LNyIZXwJswAZlkrjJx4e7QYwje3m3Y0fK
	 TB/kNvZptZc+eVLOTjxjPPCKZ0VtEVngifoSWGlX9NG6GVaW5g7vTAEGJNT1JNKTl/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
	b=b/5I/IZSFatwEICj7LoEE1qPP6JwR+I/+6PZyzTSfTn+wlVZlqdVZfFEiySCqBnrsPC5
	 Q4whm7kAwKJ+/gUZPLeX4lvb9hON8SFv7lkxkEGhytpqEfDISskRU2qlQtjRENOA8KK31
	 C4bhyPdIT6bNHKGSiE8Vc8sPhJixlQVZkIyBcTohcNUCKqhK7QAxEdvdPiZQUiqHZ37vq
	 jVdsPI+FfWY8MGriliRAnXUhl0/+9IhyJ02CFVB5F/Q429x2XEczeo+EVPCh/Bb8MLio6
	 VGbB+0e9ONS0jbL1uN0etBY03TxJzEkgi3pP3/4jE+/JUA2C2X/L0hdWitpUm2sADeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pNEtn/VP";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C77860A3825
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C77860A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNEtn/VP
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b1535be329so1484736a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 20:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371178; x=1794975978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
        b=pNEtn/VPs/gPgU5UwEwcL5lWla3PTU98T4FxNoJMYT0yZl8UlFQ10uIZzuh56zhbnf
         g9EQDHYF3lxzOKcIxKR93UCgHZMv0czCDXFs7pNhDCU42E/17eynBwJKVelSvdPas84P
         AIbeqq4Nf2KrimggLf+uKChWPmGAMamU8SxgNzcCpLKy4zpVbH6dKXHXVVrgsJaSkcph
         TgKK5O53NfupYv1MXq81N0qoT2WapKulQzbvFzyaSXIi39acCCWNdmg4lQqKCNzqZ+Lh
         cytOyHXFdzPzu0ouQu1TonbTizWyzisXfRHVxmlzU1FQodvzHHrarvGY5fj+/vNMOkxG
         tqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371178; x=1794975978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
        b=ykBnsAdijhJHdAsQtlX4Cjc06+Tz/pbZn0ROJfznyHv15gu03zsazftqTAKKpG8c9s
         QhQV40aR63sZExOj+kTTp9n2AHpkVRBuMkrkkUD7h11prtoCG16MVz/vYFVz+avMD9uB
         iX9eeJnmjfARi+OlfjE0FLbUzwgVY2y28nticOPysy22AoTpSwIT55BZdXHKovWakuvz
         xnKNMTJ3Mud96PZnIRaPqN1PEMYBn4NhMMF173WM1rfiQTqzNESs0ku3fKMDAfovz0y0
         9Tsm62nWFNnHaYIFTsOFjmsMBQr0W2evHDu/UJeO6cQsnvFqsvqeIWl6vAFRtC3QfstC
         wuRg==
X-Gm-Message-State: APuU4Z87q2ZxmceDjbzqDGuW16wcPMD1MlpvVNDb81mXbbVeoRIz47ij
	HhwtmX/nvlAhJp5a4cFLat8xzeEU1K+AfDuEFFI7yvQIIw1k1heCBNeG
X-Gm-Gg: AYBFou0bRwf2SkO625cb/WPWrZB9YDrTcwQd318YcXAvIvDlVQn9FNPkKDfZO8m+wI2
	VTRCH1DlYV/L4wh+OwxaYlYT//y1IAYZDweDjgtrXTmAdoA5x6WP+TsOJDl4dcFsVjlOQ53n/nU
	0s6ivnrCrLqPZOeOB4rJGr1TEqKZ+eeuw9SWJ501JhZL59f4lzGO6mfPkl/7BBc4D/7G+o/zQA9
	ZJW5hY2ZQ8P6abhk5krIs8rpmN8ERgm/oDm9LI1Ym7q/y0Vfceu9wboSJX3Alcp3nmatKLxqVFg
	GMfP1ejeIkbjnL830adRi3oyUPW2ee14NWdaQPDkENCrb12y+p6FfdjNPB9t2/ltyjg885IMOkI
	i1H66v74zZ0YOmN+7fYtmSCKO2N2sHGrTyO8Oa4L38JH9ZPcoDKCsUm+f3ajac6g+KX7nqd4DWF
	XIEZS9P94Qyc0AndkjbpHxPFgh0273rEHvFHiNoJPe/xox3LMtYeeRJ0TGBnFngdBa7CI85rr+E
	pqZF7L/v2UD5/Y80zjYzNj9IHfJ6/z2J2JUBamj9DSQeRIhFmB73TqWZpR5gPRX17ryeMBBppoQ
	ouekMkCHTR6afazYJ0OUiKeMpJ7lHYNSDxGU97JRzTp9M6dMDdbsSDZrwYQpNfYilCBo3+7Snxm
	HE5JNeNv5C8mivGufFKbgFHnfY1cm3PORdj/QpFYEf4FrSNmvanORkNN0drPvR5uItNawKmJBbV
	+Hf96tPtI0fkCXjIzzObN+LJ8=
X-Received: by 2002:a17:90b:2e83:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b182f26e45mr1260122a91.33.1794371177905;
        Tue, 10 Nov 2026 20:26:17 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:17 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:52 -0800
Message-ID: <20261111042554.232998-6-rosenp@gmail.com>
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

The protection settings (struct brcms_protection) have the same
lifetime as struct brcms_c_info. Embed them directly instead of
allocating them separately, removing one kzalloc()/kfree() pair and
its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/channel.c     |  6 ++--
 .../broadcom/brcm80211/brcmsmac/main.c        | 31 +++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
index a5c1c4d45683..b4c575f8c0f6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
@@ -312,13 +312,13 @@ brcms_c_set_country(struct brcms_cm_info *wlc_cm,
 	struct brcms_c_info *wlc = wlc_cm->wlc;
 
 	if ((wlc->pub->_n_enab & SUPPORT_11N) !=
-	    wlc->protection->nmode_user)
+	    wlc->protection.nmode_user)
 		brcms_c_set_nmode(wlc);
 
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_2G_INDEX]);
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_5G_INDEX]);
 
-	brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+	brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	return;
 }
@@ -387,7 +387,7 @@ brcms_c_channel_set_chanspec(struct brcms_cm_info *wlc_cm, u16 chanspec,
 	if (ch->flags & IEEE80211_CHAN_NO_OFDM)
 		brcms_c_set_gmode(wlc, GMODE_LEGACY_B, false);
 	else
-		brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+		brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	brcms_b_set_chanspec(wlc->hw, chanspec,
 			      !!(ch->flags & IEEE80211_CHAN_NO_IR),
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 2140feb86964..bd1880e3738f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
@@ -466,12 +465,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->protection = kzalloc_obj(*wlc->protection, GFP_ATOMIC);
-	if (wlc->protection == NULL) {
-		*err = 1016;
-		goto fail;
-	}
-
 	wlc->stf = kzalloc_obj(*wlc->stf, GFP_ATOMIC);
 	if (wlc->stf == NULL) {
 		*err = 1017;
@@ -3878,37 +3871,37 @@ void brcms_c_protection_upd(struct brcms_c_info *wlc, uint idx, int val)
 
 	switch (idx) {
 	case BRCMS_PROT_G_SPEC:
-		wlc->protection->_g = (bool) val;
+		wlc->protection._g = (bool) val;
 		break;
 	case BRCMS_PROT_G_OVR:
-		wlc->protection->g_override = (s8) val;
+		wlc->protection.g_override = (s8) val;
 		break;
 	case BRCMS_PROT_G_USER:
-		wlc->protection->gmode_user = (u8) val;
+		wlc->protection.gmode_user = (u8) val;
 		break;
 	case BRCMS_PROT_OVERLAP:
-		wlc->protection->overlap = (s8) val;
+		wlc->protection.overlap = (s8) val;
 		break;
 	case BRCMS_PROT_N_USER:
-		wlc->protection->nmode_user = (s8) val;
+		wlc->protection.nmode_user = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG:
-		wlc->protection->n_cfg = (s8) val;
+		wlc->protection.n_cfg = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG_OVR:
-		wlc->protection->n_cfg_override = (s8) val;
+		wlc->protection.n_cfg_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_NONGF:
-		wlc->protection->nongf = (bool) val;
+		wlc->protection.nongf = (bool) val;
 		break;
 	case BRCMS_PROT_N_NONGF_OVR:
-		wlc->protection->nongf_override = (s8) val;
+		wlc->protection.nongf_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_PAM_OVR:
-		wlc->protection->n_pam_override = (s8) val;
+		wlc->protection.n_pam_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_OBSS:
-		wlc->protection->n_obss = (bool) val;
+		wlc->protection.n_obss = (bool) val;
 		break;
 
 	default:
@@ -6800,7 +6793,7 @@ brcms_c_rspec_to_rts_rspec(struct brcms_c_info *wlc, u32 rspec,
 	if (use_rspec)
 		/* use frame rate as rts rate */
 		rts_rspec = rspec;
-	else if (wlc->band->gmode && wlc->protection->_g && !is_cck_rate(rspec))
+	else if (wlc->band->gmode && wlc->protection._g && !is_cck_rate(rspec))
 		/* Use 11Mbps as the g protection RTS target rate and fallback.
 		 * Use the brcms_basic_rate() lookup to find the best basic rate
 		 * under the target in case 11 Mbps is not Basic.
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 94966418b069..266fe7825042 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -549,7 +549,7 @@ struct brcms_c_info {
 	s8 shortslot_override;
 	bool include_legacy_erp;
 
-	struct brcms_protection *protection;
+	struct brcms_protection protection;
 	s8 PLCPHdr_override;
 
 	struct brcms_stf *stf;
-- 
2.56.0

