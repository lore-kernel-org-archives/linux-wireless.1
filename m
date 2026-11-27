Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760003;
	b=p+AzSGUe6BUgSN+uuNPFkGuAy3bqupu/UMf9xBErawUVVEWkem2Ac28p8AZfKPfIlYiW
	 wEIrvCY1Q/R+icMRY72DCLbDZamOzx2q5ocIAMRnkwIrbk9ndzSnoNHl24vpuNV1VT4Br
	 xE7O+qls6eWs33KU/D8niYrYH/1f3Vt3gCaSvgAtjWivYlfwBalPkTUgk8zrbeaevWbh8
	 WNQB9I9JG3AfmQKUGx2q8cNfuZJV5o9m5WFrN8UZ7qG3wZqnbg5s65N6hdyBVtZ3z19Tk
	 DdiViUnCN/4zCTZDf+q0UEkBLONcxJVKZGn/VQxGBH+ct+LueBiJ/vfmWJQEXfsrE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
	b=yCnhzAfEsulVvxavHVJfPMfFYkcnnfPHjVZsHtO99PwyiSGVhkPkJYPM+XDmeNV7/ATV
	 zObfsrzaTLqlPRqu4LRViUQ7EpIqaC9GplLh+RLIjpHxRkFTPmTwpQ1hQ7Dnk7blOKVmO
	 fTQ0hctmp8cd9ZhJAERH1OxiTajl2toA7XIZLhWawb0Ohnn9T32KE6yLwsMGllh7ncAiI
	 Fl2JwHfnusEp6yMrYFhS4DzEVI6r/lKxma664ldKCvtsntn1j7MkvzXhNKa0LjQE71IZM
	 QlQUBeG2sZkilZ/l94h/kasZjJuoxI8cz1DxiYiKe00t9osSanl9S/yx6b4Ta83t0mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSeGwnzV;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B78606A335
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B78606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSeGwnzV
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385c497bf94so7186448eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760003; x=1796364803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
        b=PSeGwnzVTHfa7NXqVA873vxteYeEAy3zovwziF7dQNQa4GE60Sbf+r4JnSXEgfzuI0
         uxwoPDCISq+WgNmcrOJKnnaonjuqELyT0+DJoUGRc1Q1BEgsuCp2EZb70vrfCYlSHRPS
         rjULwcuxH+0REWFyTVMa7/k3Rzw5yPfAFjTLKJmTHNXWWJ2QJ7paFOa5wtnZb+SipzIR
         pbgNghnLvEM+ni29MKsuPIV2SBGvyxecKwYqqWGK5ARMUjCq0Y4xV05tvSZINbZOkcUv
         gZDzurcKg00epHSIQ/SNNXvqbPpkdH9Evas4Kyh9WLK3oP4io9Yl898XhJ/toH7oVFQn
         qC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760003; x=1796364803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
        b=ygD2gek5xTbxfjAZ0UGyghh02qdBAeNqxDWyinWJVoiRkETAMXpoa3DUpbtRJWyDPh
         bJUR8erXoOvULYAUSkE/eOxQkIOCT3jsgN4wgAg4iG+kni+r4ZmXQWIwHD82PIrXedbf
         qOKfQcu4zAAB30q3iEaEqYrt7J9cxVcX4BpXe/8Rhr3ZNMkh+InfnKpf3+VSH54CHnCa
         1e7QPJnba08OixLUeiu7ZM88EFja6kSXyCCl9IIdq9xQVlhqZ1kE/8ddwklFlwp1SfEq
         QSM7rjYYJPaOHLJIgzg76YUrVQLZrUzsABFpzCJszXrGWJxGDPyB2hAZjQyV68FoW04j
         hG0g==
X-Gm-Message-State: APuU4Z9fPMoSUvNgj9hke6xC0WsOlkgXeSc5UfS8xRQ4UquAvfFUDI8S
	Amfy1xSvA0ujhKk4vit5jJ24rjvnZLPp06XV6rjtNDcBLekjWH3ZK7KxmhTv7UulXtc=
X-Gm-Gg: AZFdTZdWjrf/v4DYD2puQKt4dmQm1s3uHLupJSkeUJRRMafv2U39svRYFrS0XDH2EpZ
	yQJBhRG1QafQ7V9uKP0viFoylag44g3eAOqsHs6/KXnLOB5wLrUXg5VtZ919ndS+RU3EUDL+9It
	9HSRENibK6SBUI5fJNKwuelHJjyYRlhh7fOtvral2RG+OE6zdaEoEaLzqRldSM2emIcGHbObYt1
	dQPUPoBMYUg0aqS8qKYfAEhZ20mZG7YmW6lnoJzl2I7lVCH/rlafqpXiKZvADLVTHuwq3ATLg/B
	ETxw4KIfKwvGsJkJrKAo/izruumx5h94tZQG/f0pmRnjOLpW0TJWkq+pEzFX4mNAe0YbZOWP4HB
	tD0L8QDWubVIat03jyOEBfCce2dbCkcRs6OoaosR+Zx+q8N+8XSG0d+4y1wzyL3qocuibK/6onM
	hwgiSsmXftG6W4Lq9tribc1dGAUZ/vIBaM22maBCSds6P3dTSdVrwSSuJDgIsAtp5P7HM1ZNSR6
	IqW53UYouIc2HJ35AtPDEbenLQe+PDk8OhAQ7VlLrbxsvN/QwkRx2PvSg/7V4Ej0vPUwMbyu5VY
	s44GIAXszrKsSVSc1lJscV8MlQ+AMhdG1ybvBhjWPomd3v2J/mWVNnKOO3wgF6upZ7dZ0PCV6yv
	6X4BjGuLvCR6TD+c=
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr27521180eec.24.1795760002833;
        Thu, 26 Nov 2026 22:13:22 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:22 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 08/11] wifi: brcmsmac: move the RTS rate selection to rate.c
Date: Fri, 27 Nov 2026 14:11:38 +0800
Message-ID: <20261127061147.506129-9-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

Move the RTS and CTS ratespec selection of
brcms_c_rspec_to_rts_rspec() to rate.c as brcmu_rspec_to_rts_rspec(),

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 62 +++----------------
 .../broadcom/brcm80211/brcmsmac/rate.c        | 49 +++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        | 10 +++
 3 files changed, 68 insertions(+), 53 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index cd80155a5a..4be0bb085a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -325,13 +325,6 @@ static u8 brcms_fifo_to_ac(u8 fifo)
 	return fifo_to_ac_mapping[fifo];
 }
 
-static u16 frametype(u32 rspec, u8 mimoframe)
-{
-	if (is_mcs_rate(rspec))
-		return mimoframe;
-	return is_cck_rate(rspec) ? FT_CCK : FT_OFDM;
-}
-
 /*
  * Detect Card removed.
  * Even checking an sbconfig register read will not false trigger when the core
@@ -6164,15 +6157,15 @@ brcms_c_d11hdrs_mac80211(struct brcms_c_info *wlc, struct ieee80211_hw *hw,
 	txh->MainRates = cpu_to_le16(mainrates);
 
 	/* XtraFrameTypes */
-	xfts = frametype(rspec[1], wlc->mimoft);
-	xfts |= (frametype(rts_rspec[0], wlc->mimoft) << XFTS_RTS_FT_SHIFT);
-	xfts |= (frametype(rts_rspec[1], wlc->mimoft) << XFTS_FBRRTS_FT_SHIFT);
+	xfts = brcmu_frametype(rspec[1], wlc->mimoft);
+	xfts |= (brcmu_frametype(rts_rspec[0], wlc->mimoft) << XFTS_RTS_FT_SHIFT);
+	xfts |= (brcmu_frametype(rts_rspec[1], wlc->mimoft) << XFTS_FBRRTS_FT_SHIFT);
 	xfts |= CHSPEC_CHANNEL(wlc_phy_chanspec_get(wlc->band->pi)) <<
 							     XFTS_CHANNEL_SHIFT;
 	txh->XtraFrameTypes = cpu_to_le16(xfts);
 
 	/* PhyTxControlWord */
-	phyctl = frametype(rspec[0], wlc->mimoft);
+	phyctl = brcmu_frametype(rspec[0], wlc->mimoft);
 	if ((preamble_type[0] == BRCMS_SHORT_PREAMBLE) ||
 	    (preamble_type[0] == BRCMS_GF_PREAMBLE)) {
 		if (rspec2rate(rspec[0]) != BRCM_RATE_1M)
@@ -6418,48 +6411,11 @@ u32
 brcms_c_rspec_to_rts_rspec(struct brcms_c_info *wlc, u32 rspec,
 			   bool use_rspec, u16 mimo_ctlchbw)
 {
-	u32 rts_rspec = 0;
-
-	if (use_rspec)
-		/* use frame rate as rts rate */
-		rts_rspec = rspec;
-	else if (wlc->band->gmode && wlc->protection->_g && !is_cck_rate(rspec))
-		/* Use 11Mbps as the g protection RTS target rate and fallback.
-		 * Use the brcmu_basic_rate() lookup to find the best basic rate
-		 * under the target in case 11 Mbps is not Basic.
-		 * 6 and 9 Mbps are not usually selected by rate selection, but
-		 * even if the OFDM rate we are protecting is 6 or 9 Mbps, 11
-		 * is more robust.
-		 */
-		rts_rspec = brcmu_basic_rate(wlc->band->basic_rate,
-					     BRCM_RATE_11M);
-	else
-		/* calculate RTS rate and fallback rate based on the frame rate
-		 * RTS must be sent at a basic rate since it is a
-		 * control frame, sec 9.6 of 802.11 spec
-		 */
-		rts_rspec = brcmu_basic_rate(wlc->band->basic_rate, rspec);
-
-	if (BRCMS_PHY_11N_CAP(wlc->band)) {
-		/* set rts txbw to correct side band */
-		rts_rspec &= ~RSPEC_BW_MASK;
-
-		/*
-		 * if rspec/rspec_fallback is 40MHz, then send RTS on both
-		 * 20MHz channel (DUP), otherwise send RTS on control channel
-		 */
-		if (rspec_is40mhz(rspec) && !is_cck_rate(rts_rspec))
-			rts_rspec |= (PHY_TXC1_BW_40MHZ_DUP << RSPEC_BW_SHIFT);
-		else
-			rts_rspec |= (mimo_ctlchbw << RSPEC_BW_SHIFT);
-
-		/* pick siso/cdd as default for ofdm */
-		if (is_ofdm_rate(rts_rspec)) {
-			rts_rspec &= ~RSPEC_STF_MASK;
-			rts_rspec |= (wlc->stf->ss_opmode << RSPEC_STF_SHIFT);
-		}
-	}
-	return rts_rspec;
+	return brcmu_rspec_to_rts_rspec(wlc->band->phytype,
+					wlc->band->basic_rate,
+					wlc->band->gmode && wlc->protection->_g,
+					wlc->stf->ss_opmode, rspec, use_rspec,
+					mimo_ctlchbw);
 }
 
 /* Update beacon listen interval in shared memory */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 1c0259139c..fce98dd4d7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -903,6 +903,55 @@ brcmu_compute_rtscts_dur(int bandtype, const u8 *basic_rate, bool cts_only,
 	return dur;
 }
 
+u32
+brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
+			 u8 ss_opmode, u32 rspec, bool use_rspec,
+			 u16 mimo_ctlchbw)
+{
+	u32 rts_rspec = 0;
+
+	if (use_rspec)
+		/* use frame rate as rts rate */
+		rts_rspec = rspec;
+	else if (g_prot && !is_cck_rate(rspec))
+		/* Use 11Mbps as the g protection RTS target rate and fallback.
+		 * Use the brcmu_basic_rate() lookup to find the best basic rate
+		 * under the target in case 11 Mbps is not Basic.
+		 * 6 and 9 Mbps are not usually selected by rate selection, but
+		 * even if the OFDM rate we are protecting is 6 or 9 Mbps, 11
+		 * is more robust.
+		 */
+		rts_rspec = brcmu_basic_rate(basic_rate, BRCM_RATE_11M);
+	else
+		/* calculate RTS rate and fallback rate based on the frame rate
+		 * RTS must be sent at a basic rate since it is a
+		 * control frame, sec 9.6 of 802.11 spec
+		 */
+		rts_rspec = brcmu_basic_rate(basic_rate, rspec);
+
+	if (phytype == PHY_TYPE_N || phytype == PHY_TYPE_LCN ||
+	    phytype == PHY_TYPE_SSN) {
+		/* set rts txbw to correct side band */
+		rts_rspec &= ~RSPEC_BW_MASK;
+
+		/*
+		 * if rspec/rspec_fallback is 40MHz, then send RTS on both
+		 * 20MHz channel (DUP), otherwise send RTS on control channel
+		 */
+		if (rspec_is40mhz(rspec) && !is_cck_rate(rts_rspec))
+			rts_rspec |= (PHY_TXC1_BW_40MHZ_DUP << RSPEC_BW_SHIFT);
+		else
+			rts_rspec |= (mimo_ctlchbw << RSPEC_BW_SHIFT);
+
+		/* pick siso/cdd as default for ofdm */
+		if (is_ofdm_rate(rts_rspec)) {
+			rts_rspec &= ~RSPEC_STF_MASK;
+			rts_rspec |= (ss_opmode << RSPEC_STF_SHIFT);
+		}
+	}
+	return rts_rspec;
+}
+
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec)
 {
 	u16 phyctl1 = 0;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 401fed6939..9f517be0c7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -212,6 +212,13 @@ static inline bool is_cck_rate(u32 ratespec)
 			rate == BRCM_RATE_5M5 || rate == BRCM_RATE_11M);
 }
 
+static inline u16 brcmu_frametype(u32 rspec, u8 mimoframe)
+{
+	if (is_mcs_rate(rspec))
+		return mimoframe;
+	return is_cck_rate(rspec) ? FT_CCK : FT_OFDM;
+}
+
 static inline bool is_single_stream(u8 mcs)
 {
 	return mcs <= HIGHEST_SINGLE_STREAM_MCS || mcs == 32;
@@ -279,6 +286,9 @@ u16 brcmu_compute_rtscts_dur(int bandtype, const u8 *basic_rate, bool cts_only,
 			     u32 rts_rate, u32 frame_rate,
 			     u8 rts_preamble_type, u8 frame_preamble_type,
 			     uint frame_len, bool ba);
+u32 brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
+			     u8 ss_opmode, u32 rspec, bool use_rspec,
+			     u16 mimo_ctlchbw);
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec);
 u16 brcmu_calc_lsig_len(u32 ratespec, uint mac_len);
 
-- 
2.53.0

