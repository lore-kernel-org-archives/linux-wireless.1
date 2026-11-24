Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557054;
	b=1lXx/C3OkGKj7syXBv1r+QG03s1qPAj1RMtlQDJ7kgUxBhA0hd5J9WMx2lpKQdnaCYVP
	 kDl1K/LVTmnerVGcSSFFQomLc7pdkVxAkAWqVGJ3cvlmyfjnqlgbEewpBCOuXqE9I8d/X
	 2M5osC8r9D6Gc5hKaSSDsmh5cxBflDL+szJ99bBO8xH0mlVV5d+cGh5WY5rd0dvQQUIcd
	 Cy2a1n89b34pep7IxP7HEk9Z5e9DYb9McHd+QSKNpYJC9ItFwpxCobfMoMElqYdm+NWOA
	 UDipXMqsc7SXoeiym2tcSdglXLAvgjKAw/zG39GEU9dCFERaqxnhUVHD5CORix1hpBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
	b=KQCAwRZE3nKZ6Y0mIb1YilmfQtllIS9IqRrUTSX/2oBkeaEQQT5zNCVLDYt7ch41RAs3
	 jkl3qnYJ6xFXKrRNAJB5ES0/E0YGZGsWcFQjPTCZpz4/Rq+AGQPT5wIgzX/Ie4YfoFAHt
	 AerP3M5tE69QBZUyp2JiCBNAkOkFr/Y7qboIUDh/mch9LyYrXxHMEvez1BAQPtIt7MTrm
	 kJixNt7eAnXlr1qr5kEVyaYHmWsYvRlWpqBjTyj58ug/mUl3mbRe8SkEI5XsnJsDK8FAb
	 yH5oHr3xWE316tLxLhovOnAvL2W5z7h/TJsBraLpVe9tWQizdByk4PvDyzdaNpqslpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3AfAqAj;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962E606A33C
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2962E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3AfAqAj
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9ae391a05so34282345ad.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557053; x=1796161853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
        b=t3AfAqAjxOfV/YxgxXN3elQ9pz1kyS7ZyfdFerthoRiXRVW2joso+Wb83+guyFF9NT
         l4b6RcPKrAKTOFpOCRyuUMsiNo0T7K1GkQsFKCut6LDh8Sg+2EQTDRGNP1MD628iIL0L
         KS7cqDSsLakUfFcsSsE3Iiq4D1wLJTkXe313F8o1vJErWmNqi8nKL5Y7hnSAqIE3Xu8M
         IxFXyJSgQIEGAzGZcvnZkeemGpJ3EXqVLVDNevwdQdXq7MDLgUaga7jcBZWX48RrX2Di
         NnTd5BzangsvXaW38T3bmx1kxSm1LfzGEB9VwaBy95XgBhJplAifwDnT1TsCBCuCzLIq
         1k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557053; x=1796161853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
        b=r9ekBAfKmT9I6PPlcixZKL+wg2TOVPVMIJZKIHJbrlvvY0v6WGxz9NEDKehm4DRoWd
         ZTh/8U7SvWO27UmTS/AaOLcFB0WnjnIP1dZGBbwzEbseYauN1jMQD9W06VuzQmvq6VSd
         hBPtu5jHNoqBCNMNW7k7pZDkgdFd0eqOUme7AB+5ibOcfOrT+4kCYZatXfRWyhI/MnId
         bPQpit0NTT7UEoDoi4V5ovKIZ3JaQDjShuyL2kxOsEcN7FTKhHjcAqvtGen69umqwAKz
         3zwm6yo+RqBahUbA6h8IAXSfXtMqvjmGinJtanOOzGsTyjNdTlysSmywZJeTZJl948BB
         76Tw==
X-Gm-Message-State: APuU4Z+biG+WFpQ7m1wAtWr4/oMmoYC/pqgF+62qs14V73A4y5Ccd0nn
	CP4yn7U/weDR6MLvONn/hVlonNWQAAtv3hadlcb2FmMvVdWuCI13x7L1X3dceg==
X-Gm-Gg: AZFdTZcSmwThk4qmbJ9irXEm9DDD0rf+ulEJ80JHPGd4bn/1EGFNeYRgsNRBoufqcYc
	k9F3sLCuk680XlDG3FfvL0v9JdrFbZEMuxbb63LdfggtZKnDYCnvxlixqESMw5dFLz0aJGNd5Sc
	j2FIo6btsBfuPW0Ij0mFh+U+9wIYw9PuScKZYMJniAZfDQJcn5lLUdSc2k9xaDr+WYHP0JNBs3H
	3vO86gMpKqZ19hAAzyA2LiqRfAmVjnTeJ/CeOaD162VbLTutA7UVefa3Bi600TgP5rPbDyi7F58
	fSaWpd1a5swMGoCnxF2MD1dXSFeaHdKWf1dr5pWhXO35lxv4KVJXGr97QBI/HYFAgTUGbXLvMfS
	SiSKevVQXHAUnyIS321eI2JtUB4hdx4t77Xft8vDTytt3F6Gu52L7xBpXM3iFdjbnJmgYjuy8Od
	ezB7z2pAgFX63ecWwjkNvWmVnc2rWDhHN2jf5Qba+JD0d/R8i3iSjEDefSZcvJ2dQ6IBy3pWzuw
	6tnId7QVP/ZFhw32JpusnwUGjoH6cVUSKwS4D2h/t9AxoEuQoAK0luHIbJJhCqYfGeQbwxEHwVq
	Efz7Jrv9GH/TiFGrQk4jy59qE4E5zj9vAiJmEZeqNmwI+8r7iMutTf+7hHoTnLEkBq7Rroc4un9
	8F5uqd0/QpVVRtmoK4aaMsW/3V9CmHT1c6YGsaXykpfIm74jX7djoSnqPPfwrXUVBaGnPTpglUi
	zfVw==
X-Received: by 2002:a17:903:1a43:b0:2e9:5ed2:c39c with SMTP id d9443c01a7336-2f03f1ba01amr108241825ad.22.1795557053457;
        Tue, 24 Nov 2026 13:50:53 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:51 -0800 (PST)
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
Subject: [PATCH wireless-next v2 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:38 -0800
Message-ID: <20261124215040.1261999-6-rosenp@gmail.com>
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

The protection settings (struct brcms_protection) have the same
lifetime as struct brcms_c_info. Embed them directly instead of
allocating them separately, removing one kzalloc()/kfree() pair and
its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
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
2.56.1

