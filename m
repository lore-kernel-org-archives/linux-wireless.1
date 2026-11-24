Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557048;
	b=o2IpYEu3u7FLzzI+C7PacDW29WiHBl1FoNLr6TxBOmm9QpUjpQt9NRDOjZvUqovbQHEw
	 7sjdvpPB1EqhO9VQ2Gq62BSoNJaZGlNGzkuLjJaVpxNq4KhICqDacjBB5hgLm0Q3F8QAS
	 fOCNAR5ppQxi3XGOX5bH7D2dDA170HGP7qRukRT1dMNpqkavlHxucTVy75nsxmJiGnA8J
	 ZY9evrm90HeDLMQWWTr/tEQYDfxRvV6vsjE1fTVacSdp04494fKH0IC7ngi80dNXukE9G
	 lmym9NIZYYimMGdVYgunvEfy+dI0OxHch5MoAF/85vpZuM0EkDtwoMfoqsZ4GEVnRKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
	b=XIPDdIWaRGXG/zSY54/9RiRZIJm9GhmI8ogw8RqQBHVXciCExNOV/PPQLrE2Jl8lyuux
	 5cZgi4Y/ewIPgb0Etm8Xkz3hGb/doXQQOMDSwytpeJi8uNgC/8OoMe+3JkQGcwakeKNUp
	 Rd4JXxUzGDOcaxVYlOYqbWhL13EgfWzi4AoDTCWQnZIefUawlHTBY0YYh8e0W8Pej0XGB
	 QtBFzDy/N5Eue5ZjdvWmDaRKa3mpnKTXpeqY77tMZ1SlLGFvFFjJ6Zn87WhdRZ957cDWz
	 Rgoxrl/gIItgTeEYbFoT16qGckcNt8+sRUMJ6Idb+nk8m4OC42F0AguTDlOsT2dSNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDc31Bg5;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA35606A329
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA35606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDc31Bg5
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f02ee04378so39855125ad.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557048; x=1796161848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
        b=MDc31Bg59j6eBRFuxv2oV1J4C4myGmfU19thfmu3FkpcX+aNXKmw+VmHh2qzh3exjC
         7r2GEA2V/18zOsu4BlkXhrWMaEvwA/xcNNFfNbon3DmhLMXxRCjb91hnh9EG2X5qCIB2
         9T2+HYriBrgFTEAn7DwiUAqekaHRd2q18RnbDedMU7KOGRjLnj7qedDxK04uSGX+r0l2
         4F4aU2SirQH1NLXoQcgBvqujOS4GzlQ08FeTVJkGHXgk6GElVtiWf61PBwUypdT45jLt
         FAD48UcxAt+6yVgwsWC1ZWqueS4KEVoPIUBajGHW4o6SSudPMLQPRuhi3hL8us3GOUPc
         u20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557048; x=1796161848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
        b=BxoPitCo9pg8b+GVlAbP9L1AnmQdhb/y/oArD/zDtUKxQLM5p3Ea5DeNProwWNac69
         3bHnKk3zcOKsFJYm5L7AeB8saTMc8l0V2rguepMcDbGE7orMfmOzaIvZlYQUXKfeuMJx
         xiMgD9Jo0ex6hrpH7I3syRTmPT9/PpoOkzXW8kMobkS43Nwi8SbkikTfT4A+IRTgsvhy
         a+MUV2MFPO7dTVUpX94rXJmh2pxR2dsvH7iEhKN0qf/oPaCakcoA4Bv/WYNscLUIIGrE
         +G+PvI/qJBayJdq5Ch0X/v/pdr725laZpdPgxB1CRE/ZE2JO4yi5STLyJIJv2m5Leqs+
         t9Rg==
X-Gm-Message-State: APuU4Z9pVokGhxDrw4gEvEdSF0qDBV9yG51b/prIYGvVvE9IPDCgYq87
	pz2gGQK+FlYq/LLVXseCUL4iy4GZHrewGuYexq8ShULw1IhL1E3LmZm0OUSKUA==
X-Gm-Gg: AZFdTZfvw0fYjihbBau7VUCjXx2Q9ggpUFmkrpXQqrloaGqLNXrnAeIriRBz2226vIr
	14FEepeoydlzchNctvMkvpV4AmmwNQZ7wKJLPLXImcfSgJ9G74eZVvsE5eN0RgvIxkMf+kYFFp3
	3NpYZ7pN4yyM+WGe/POXiK1e8HtV6peqXLpOt+NkQDisrUUBdJWvoD7gjYD93o0VhwHO0bY5Rzi
	iTy7GQhdJ4N7+vKRcchZO6BMByGOqOT8c8KRy4qdvLva3qd5GzraTIWiEozi6DJt5HfrsLbaqMf
	u4amyWjWnfCNRokdu+G/inZwoPjblzeaF9DF5AhvC1UFu+Dd6zQvmNB5knK4h7YaXFajnx5SH7w
	T4A3i8NHB4NPU6AzqBmM9Sb0tP6BWHU8q4uHc9krYjV/5hEKIN4bib+MPS7lb1ewIN1DcMKbDsu
	hkkh4y0X6mLaHOep1R3fTxpfI7x97ZrqdhwNUUCrXUWzCtWqXOEdOEsk/roonlmvdQH2PPZcBTf
	g9W7TGX7zYaTHqxWnkE84KJS78v3DZuAyPJjaGB6nGZi/0yrcwwVrvLsUsvCmq2jOdDFSmf7QO9
	L1GRV3PaxEmcsY6/tVzqaqU+OeDHB5l6tpKJQOF9oV0CJdvVQDTbtl8XNOiU+DiMXgkmD9rMhbR
	hUy7J4m4G2zMDGi+GMDqqrh0x7pC3AgHAtxDNn6BF/savtJfp4Y7Ji6LHuNnoKhqpOCDPySxgG5
	4AgQ==
X-Received: by 2002:a17:902:f652:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2f03f1cee76mr168499075ad.18.1795557047737;
        Tue, 24 Nov 2026 13:50:47 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:47 -0800 (PST)
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
Subject: [PATCH wireless-next v2 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 24 Nov 2026 13:50:35 -0800
Message-ID: <20261124215040.1261999-3-rosenp@gmail.com>
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

Replace the separately allocated module callback array with a
directly embedded fixed-size array in struct brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 --------
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 3834f2da5aa7..ed022fd2613e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->modulecb);
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
@@ -464,13 +463,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->modulecb =
-		kzalloc_objs(struct modulecb, BRCMS_MAXMODULES, GFP_ATOMIC);
-	if (wlc->modulecb == NULL) {
-		*err = 1009;
-		goto fail;
-	}
-
 	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
 	if (wlc->default_bss == NULL) {
 		*err = 1010;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 425c867964e9..8af883e40876 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -517,7 +517,7 @@ struct brcms_c_info {
 
 	struct brcms_bss_cfg *bsscfg;
 
-	struct modulecb *modulecb;
+	struct modulecb modulecb[BRCMS_MAXMODULES];
 
 	u8 mimoft;
 	s8 cck_40txbw;
-- 
2.56.1

