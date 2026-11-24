Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557051;
	b=s+bKI9llCgUUuMWclehYvprLwzd1LEODjqgAeSjgXA8CvdBWivJZ/4HBjb7vFXcoKZyq
	 bK3KSXN3hJ5g933hGgRahoZ+Ma6U7M33T16DnCpV6AeFB2H1NWC5RTAUib2PkHZqRjBKR
	 +yEhUI1DfCdIPDEYWW9ochAWCwOZRw7FHP9t0PrCRRxtlRCa2u2kD6uyah9Za+BN4Vngz
	 QihPYFRsPGqLKsdJWkvtJK3QY32H55sXC6Qg3z6LTdmSqKNIHw1QNdL/AmGfT0z4AOHwc
	 S1RRZbJFyKDJTmwvVelGNZpvIFREQ61TXYxeBq++gAEg7eET/DXPefMo3RFlkDqVN0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
	b=mIf0JYwHhl5nnlUcnA/ryfWS+sAmVwwzUe9CEYapzB+bUKax6Oep2y6gUb/T3rBE9qja
	 vll1KAaouHXi/VX4aXahOB0Vic4DPdt7Y3QzoJQHTDaeS5i7LNCEcSdfO0KcU+B/78Odq
	 Hl+QtcnWeQw6CDPytiTZXUgPom9MU3CiGVk0bFJUAt0AMQic3dQZ1YmgW7HKKzBtrPZVi
	 HtQXDN2Z44MMuc6KJJbq9Sv0624GwXDjSYk8E3eprGIoiTbB2OIcfl31GZohLWgUBkR7V
	 MZo74qws/uZDSDojRmuj5kQ1u1V/12sJNxjczUbXcciZ+ChLRakNkqAOVWNCiRmGEYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g42p8l5s;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA50606A326
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g42p8l5s
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f05b465cd1so25965965ad.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557050; x=1796161850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
        b=g42p8l5sKyK4BP75jcuAgmPsEdg3uHGDyxeN60a9e3X5A9KoGguPhwv+Fe2LayF1K3
         T/UkrOPs+y/Yw6qfIB6Ul8UO0zGVeAGi1a197VtQXOKt7WUc2xs++WlqtERdGgAbj9b6
         FFmJMLhTajfYvdhY15Ry2uRol7KGXunI0RdNzOUjh7nmBMmm0BZ97rz0c2ExS32nuNHA
         6hiZMRvPHeFxXvKkN0rQx7K83cPf0F9xmWhidkqFMd2HJF80MeHeYIGhGJlOfxKJXJTm
         ZuwdB1fwLJL172ey/FSSKxUpG2rcIyiq8mOTQWUJIJv5BdvIx5dEcKZvJ/uZqrZeS2t/
         hLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557050; x=1796161850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
        b=jNy+6m/iVWPSqZpCt00bOW4iGL9Gp/GL7qH7AVZX1hAabsI/QgsZm3SibBTIejclzp
         tHmIWv27btrj+AldKaxi7+ZzJIBnNVnf5xeExXZOh1gJ+VJBkwc5tFVNJQ3eeP1YcxNN
         f9qVN4rkzbeBU5VVwsQRygqJsOS7NH5ONo7etdWCh9OuSpCHk2ZkeVE556c6LfWSNiMu
         TDRx65SJonRsEKdnJIilXYjNvxL6pdp9VPTJ8jmvZsWU1008klbrKlpV8DPQk6uUrpbq
         dFnphN+XX8/Fga6TnA+iN1SddGWxNUZHJVr2Y2Nfki7g3gSdy1sCUgl4pdVzBMW5KjfF
         LBfg==
X-Gm-Message-State: APuU4Z+c/Xe3uxUWDzQ1cF8uuvz8EbUilv6icqrLsrLnZGfbdO6uugL0
	+RAv3taH7lLJpQG+Jr/PWKWkXFTnUmRoM3olTPh9sW7lQEjW6SbJhK6L7yNxBw==
X-Gm-Gg: AZFdTZfY5BrUl5WyNY3dkm94MPOAflQZ/7bSIMnq3nBMEqPEdur8ZnlFWVzRAtHwnId
	ry+Bn6VOvs4QeiHr8QcyGP8JxjnVKbNDTeAqBCSF3xRkGCSRFyUUYorIIh2XE214uF3YB+CpwyA
	hQExyIkKV5Cn12Ct5lnpSxVm7sp5BPifh+uKUHJgPtsKC/FqG1ac0lmZjrZf1E+otO58wdwxGir
	ptOdMqCWtkbAqwfXK6DTXMFy7+6RhNpOS+Bog1Ljc9XBA+WJWuDVxwG89LpDLoQ57qn64Op9TrM
	WaeCDl1/ZmiQ22wOO9rTEzUkHCbbB8FmgoVIVX5mwcvl2TsIYL9wfQB9sJwuX+1SzH82rpjE/PR
	sZK55h1Iz2xfOtE54FLEQpGq74+DdjhOcodtN+Prg0tdA8V+05lZ98U6cH5YiMisynlk+9cEeCF
	ecfeKZ4ogmHJrH3bi37g4BXvUX3Y4SSGcvLdqDP/tzoexn26vI/4gPSB3qUFXrb8MnhV+6zpQeQ
	aIMjTDEf9KFycJCpoy9PAI5MBVKvO/95ISSrbevt+2iM75d3SwRfKURgItcS6+3AAhXHSIDxF/+
	CrjI4s1h3ua2OhZttHkCNWYwPdZzCgkIAsDJa74Ykkbvq5n5vbXBU8NREc7AeWVO0uQKWIw2f2h
	atfWmvFY9nsQ3NC2FOuB2/FhJ+RTnkqCTNcGpdaR84rnKZJqJXfsPkXmbAB9YeUs162mdSGYWg3
	VDvmDxbdrM6ZzWKpeDDoZY8vQ=
X-Received: by 2002:a17:902:e847:b0:2ed:a66:cc7c with SMTP id d9443c01a7336-2f03f169619mr149288505ad.40.1795557049990;
        Tue, 24 Nov 2026 13:50:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:49 -0800 (PST)
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
Subject: [PATCH wireless-next v2 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 24 Nov 2026 13:50:36 -0800
Message-ID: <20261124215040.1261999-4-rosenp@gmail.com>
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

The MAC statistics snapshot is a fixed-size struct with the same
lifetime as struct brcms_core. Embed it directly instead of allocating
it separately, removing one kzalloc()/kfree() pair and its OOM error
path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
index a1888ff02d08..711e994dd04d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
@@ -98,7 +98,7 @@ static int brcms_debugfs_macstat_read(struct seq_file *s, void *data)
 	int i;
 
 	spin_lock_bh(&wl->lock);
-	stats = *(drvr->wlc->core->macstat_snapshot);
+	stats = drvr->wlc->core->macstat_snapshot;
 	spin_unlock_bh(&wl->lock);
 
 	seq_printf(s, "txallfrm: %d\n", stats.txallfrm);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index ed022fd2613e..d000e2a70870 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -423,8 +423,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
-	if (wlc->corestate)
-		kfree(wlc->corestate->macstat_snapshot);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
@@ -493,13 +491,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate->macstat_snapshot = kzalloc_obj(*wlc->corestate->macstat_snapshot,
-						       GFP_ATOMIC);
-	if (wlc->corestate->macstat_snapshot == NULL) {
-		*err = 1027;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -2997,7 +2988,7 @@ static void brcms_c_statsupd(struct brcms_c_info *wlc)
 	if (!wlc->pub->up)
 		return;
 
-	macstats = wlc->core->macstat_snapshot;
+	macstats = &wlc->core->macstat_snapshot;
 
 #ifdef DEBUG
 	/* save last rx fifo 0 overflow count */
@@ -3054,7 +3045,7 @@ void brcms_c_reset(struct brcms_c_info *wlc)
 	brcms_c_statsupd(wlc);
 
 	/* reset our snapshot of macstat counters */
-	memset(wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
+	memset(&wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
 
 	brcms_b_reset(wlc->hw);
 }
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 8af883e40876..0e6a5edc74c8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -240,7 +240,7 @@ struct brcms_core {
 	/* fifo */
 	uint *txavail[NFIFO];	/* # tx descriptors available */
 
-	struct macstat *macstat_snapshot;	/* mac hw prev read values */
+	struct macstat macstat_snapshot;	/* mac hw prev read values */
 };
 
 /*
-- 
2.56.1

