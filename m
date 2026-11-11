Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371179;
	b=sycE5HRUA4vSfipmw7baWTmMeDEalDknU9AHkAsEbjAVoasNSrpwSz5lZLRW8vugEyTc
	 0yVsgW/liUKOv4L/NLuCy+xNcPY7xKJUP3nbSYwu2c9nsfXfx7QVT/lgREHSxaYsnRw1K
	 0hAvuqymz3UbEngV5GjtZ6uEz3ExNkUBycOd7V/DK23XLItnbncR7OFAlW9VyfXyTLBT6
	 qgVx+BTXync9menR/TSz/rOLSZZ+QLK3faYz4LGoAQJNrJIlDmU9U98t9J0M+IYxX7yVh
	 PX1aTvpvN5hrr1nJKji3xwnZG802Bpg38b38dDQ+Y7xB//jGdzf80DC5jcwQ0jzbdvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
	b=kT9UzhdYl+bjPDcgjpxMcm3/gSFKa5zke8C6bmPP41SLVphsMGwfVQ/fYioGmQuIl/VO
	 itI7L9p5PgQZMMorCVCvlNP+wNoknJuUk3V7LzWpRozKo9j7E65sVRQegXe1dOhaFzUUp
	 wbw8tUqUV5HrOsg1W5igvsSAAe6HpNWGdLy1UO5DiUDv5zXcM4EsCSAHiZ7Urtq4prGk3
	 9Wnf/Pp0MlSipJAz1rJ7Eh8IxE3eJD9clF8BZgdRo4NtBxjql6DYqWqc54jbB6s+RLAZh
	 v6L+1b1ysUMxRa1STDnhkCpZcoodsfSp/H8lj7rdFUfoWmU4a0+Y4MmdTsSWYL/qb/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ2Wnibv;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202560A5BC6
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9202560A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ2Wnibv
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1725544a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 20:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371179; x=1794975979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
        b=SQ2WnibvnR6k9rn6ywG7p/z+QIyMVtY0crToDcKT9cLsIHHzdA9w2wIzcLlg79Uwll
         hVwa99umDpmZ9fsK3GSKbkHOAB++9YiQQ83M07FoCA5tIQI7rbae7eDNeLzttB4cf6rH
         2YwVdwGjTIegMBw/3U9Z1zSKxifPSn0H1or2sCa3BuOEOBTTdzto6QTFKZ3TzUn8jLJ/
         VzvKQGEjHgXzB+LmcvxFqV37sIBiSguiT2cZKkhcvYVH+HvRPPSMWeZJ3z15zmruWwq1
         tgidEV6LobWJqWvdJYWOZiULPvZb3LtulLFi6XeQNv2IQCRRvebvIoycAmBY9A+uUZ3/
         Helg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371179; x=1794975979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
        b=ZUapV6s9CV6swKPSoTFdRa+62Vg+PvEfIAs2HVoa7m/QLLltRPwWhDtyVFrbaTEx3l
         thJ1KMGWqwik9OAH8MT4kDyoawHdRkm9lnlCVf3P1UBPNmY3dYHAostDbzztSZoUUqHN
         T8XgIAdNRPcRfVQBl3llfVw5EPYus4VQunmeEMIDDxeEqYa439Z88cA69ohR7QlJngVc
         +yxvTAelCiF47gB3hpmtVTgdPDnfGVMIlAJ2zzBKsIOrb5uj1E0oFt1spO8MsaCY/pfs
         E/18Jiwferads/qpbY9IcgoOP6Q3aTUPUx3cPIwB8A9Y11oRtvs0/AP7hHQ921SpIuPn
         koug==
X-Gm-Message-State: APuU4Z8TGNR53KrhCe0X0YWgMjj6KDvWpzHA6kPOXWlqfZSau8zxhetD
	1fiuHExJ0zAOB87GhNoGbda/zhOUNKX5PpLDjzLXECXSRAyFcwolIPs4
X-Gm-Gg: AYBFou1LvxmgwiaP55axeDIUqEMWqkzu+9R3SAWUKfJpeVPWoCvpH8h5txF5ujeBKUw
	LIjCeflEUBNxByjjmOUC+8sfJJAqV12ckMRENGS67xNbIIXgHPDn+d3gfAi7f0QD7txWxpJxbJx
	yzLxjutYi/k5v6BQJVurPOUuVswluQvpEnJVxiCj8PI/LyZMZsskMMn4qtLCezSvnAPPkP6uNQi
	MHoRyFQf5pvsS10MSJr+yyX+aGPxlDHwnXNjTzYn/pFd0BZaJr2O+IVG5TeAIy/TpbHBP2Nhsa4
	jMpNs7cd1Pbp5YyCOPljSum+PXVB/S0AJ+Y2LmDoVJFkaYTbk6pvUO25FAa+Pq3wAKITp+OqSem
	wIMOMPwCQyQ1O3Y0co3Muqypu1zrBdqiaGwp4+xpeY0J16CgM3PDfTmCi8VoZl4OSBilEmWAKfk
	M2iXNQuMIlQjPw+ieXodXCt4yYJ2bGqv56JuNEfOY1dVKnxwmXFS6lRSC+Tk1o6PfShBPwihrlG
	jabdMV9XocGKSoyE38G0IqyQFY9w6Bi7pNYV1ZhEtr2c5SK0l7hlazDd5/W3It+1jX3Fl3c+vPm
	Y42RGMox18lY74fpnHzOKQK/jVn73vyYTz+vZnktbp5g1GcrjtcAE2VXPicgm6pbvJM2Zua1T7I
	Y5WuwcTl6/q5hj20iQEk6GRIeDa6955asbsXrcZePPj0Z7OXLtJ3wijj+XMT89wJfo1Squ9rr3w
	xmSw==
X-Received: by 2002:a17:90b:4e8e:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b182f66064mr1241539a91.16.1794371178951;
        Tue, 10 Nov 2026 20:26:18 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:53 -0800
Message-ID: <20261111042554.232998-7-rosenp@gmail.com>
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

There is only one struct brcms_core and it has the same lifetime as
struct brcms_c_info. Embed it directly instead of allocating it
separately, removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 9 +--------
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index bd1880e3738f..8c3048082fbb 100644
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
@@ -7808,7 +7801,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	pub = wlc->pub;
 
 	wlc->band = &wlc->bandstate[0];
-	wlc->core = wlc->corestate;
+	wlc->core = &wlc->corestate;
 	wlc->wl = wl;
 	pub->unit = unit;
 	pub->_piomode = piomode;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 266fe7825042..72720b9f9b35 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -470,7 +470,7 @@ struct brcms_c_info {
 	/* multiband */
 	struct brcms_core *core;
 	struct brcms_band *band;
-	struct brcms_core *corestate;
+	struct brcms_core corestate;
 	struct brcms_band bandstate[MAXBANDS];
 
 	/* packet queue */
-- 
2.56.0

