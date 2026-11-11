Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371175;
	b=VNZLIdOpUTfMCDVBaFwpYp/NDi4Yd1g12oYY+LvkCtOcCVQRVidTwnhEYxoRIWghBI2I
	 cAYA+L1dWsgagCYf2mGTj1C0WtUH+XlLm1Vaocwh77Rk8KqknyMVR61EKVYLHo7Qo0mw/
	 F44+64arKsfGwyVYQ3MpPpeadnunnR+7TkAslMBN7OIxKqFvpkr+t64my8ICfvCy1OSCL
	 wXxjWZoO0DOAT3/DejvVQ1Eqwhn3GU8uFEYSviZ1rnsyjpfeEfXQxhcSBy1pml+6CuUl4
	 ynBym1SvAoDQl/f4Z9/b9XSO23F/oxz2zMnpOsDAztsAUi5mqE6ZKhOa7TTbR5fz5mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
	b=NWUpLlvjSPBJzhYDvkixu8sfaXzNrY11UI8ThUoKJCTsR38ViMrd6A8o1b/MEc9e/ejB
	 nmR1JifdzN4526c/c+EdP6q32hbVjByiBZfz2iGxYLnboQHHItfKglmMn73wiy8DCL7bj
	 0A5AbOpEzMjln/wmRRrBvo4CumoWDZelHKcm20f2eEt04t/l26obSfGPAwAuJ1R+XB6Wd
	 g+fA/N1SEEdCx5hZ3eM5mV96BtwEPqRwhIXrIj1/5cbhYhFeM6Su3d1jE37uapZCBbN1k
	 8M7c9oEgSa2iOAInnu+oFI0XJzYrmmEt2dxiMy0GKrAnPZrekfnQcPFS/6/vqcqBuWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be7IxUIO;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00F60A2616
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB00F60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be7IxUIO
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1165931a12.1
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 20:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371174; x=1794975974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
        b=Be7IxUIOwCtNlM4TvJ6SDhyoy8xUr/Qt+/vRN4RxU9t5865ONBmWcRDs43/OaovLbo
         fnyp3WZ4hG9Rk9ze8KhEjrJW0YHtl16HoOAn71N4zPSgk2Pxi+nhiAYfizgxNvibfLuT
         xzq9e62b4phF+XDx8ZdVuoDnM8Ijhrguut6hYc9Pf864RJ2BVWX7RYBnRE3Td00wPgyZ
         jNR7slRnKbOEcOL0+XEh971XVbcxU3sMCVv7uRGX8HVkDWNeRie1M0LSe1V60dJLg0A1
         ZbqbtlgLpxlMdsQjqfzvp3UiX6FhVNQXbvEcUHHjqdSHTnd3ZnrTcY6y9DAZU+IGW12x
         hmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371174; x=1794975974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
        b=E1TkyxRM9Biz+jljRwlGBvZDn7mJfk2Uzu1nkIB/SaVg9W0dSXlpdXyH5g7i5OOZcm
         8VnFMiB+Xf3jaOYTr/XvujRdFeHchvT5+9Uf94LmHJ2A5NLl2U2FNUcFk7YNXXMsfpX+
         YzJcWzWU3OL2MZsl5LYQszEVVqV7zBZZUpH5kqGCSHQeiwdxQWux11CbimS7cTsmAI/y
         4WlHL2M795P4FpzqViRqz1t6Fy1yed/ErJYh02+FoYywcPme/lM4RyfDiTY2pzsDbBeB
         qtrZeIwZpGkpa1Bv7o2gvkrndj0IEFiaCFQGbxF1e5+A3qijQDdf1sFMdNUJIrU3YDM1
         MVBg==
X-Gm-Message-State: APuU4Z+Be5AiWkH3phdgsIA58Pp0x5VH7xr+f6SjFnOE/ZRqO5+XOG/V
	Rs37ea9dzIq+A+JT66dAIyb9RgA/bGe72mfdBqFmTWu0KsUwzfxGLSkB
X-Gm-Gg: AYBFou3/uVw8CVmtLeSkRILPygenSv68lOk1KfXTNQdAt+BSzHDPBm2bZfnEWx1J2AR
	dpayaRM31Cza+aj1jNZM0wg6ZtMTQ/X1O9gMOE0t/ZlK8Qsc8da3zdFmt4tWca5rlFz0yHVShlt
	M1d0ply94n7WmNGJIiMwhtjtMErVMTATks2qBvXk8H1N+HTnCIvP+w0aBqRtI2P72JfVbw2nTz6
	GL51CVtw1rDWcrfA+SJc5lfoiAcnm68nLR8xcZNPV98IUEty1yIsFhbPO2tBPuElDmIF87AQpqa
	YnZJ8X1sgbe0Cdokt90NRJpQue7/oLUXCsNbsK3ziiufIDmN2P+gPvxO56qfgVZJvVSxnVSv7I7
	ZEQ2CkEYMkvBhLdFbT0rtnkW5PHsRnSBITD3niywzO+w+1pZrAiBZekwrKQrYivTgiXDThxup9/
	hmmfg6a44JYxZOVpIYYPu/glTjj64cW4ulVE6icCjwBf6ojGsRvIOUEkmJVgKpa3/j1rqiV/xrZ
	/lMWtfn8z+2sK35wHePPVpDZ8OwgpAG/7x8cYmKaq9jfy+Xembkvm/aQG65N22zoFt0MfZn1tMu
	Jfpuw62Jbd5KEXQEdNySZEyoRW/kNGYMH96V6WjLEtMj01egKvXr9tBytDWVOjvjwgzJ2nyN4Jf
	3THLEckLRfl4Jc03Od3hpZf3s9mP2MQLai4v+RgY+a6Io3EERxjjDN8pmQRSys/Zta5flD0oXHW
	EXsg==
X-Received: by 2002:a17:90b:3c44:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b182efb65bmr1197810a91.21.1794371174078;
        Tue, 10 Nov 2026 20:26:14 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 10 Nov 2026 20:25:49 -0800
Message-ID: <20261111042554.232998-3-rosenp@gmail.com>
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

Replace the separately allocated module callback array with a
directly embedded fixed-size array in struct brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
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
2.56.0

