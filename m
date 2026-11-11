Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371176;
	b=ptPfhOOFak22TjMMZMocfdhQco7lyAsqk2uG2iFSNDhFacsb3CKFqyIs5Z+thSDt84f6
	 ausN8+K66pKPDjA4oZ5yF1nQkXH71Ie9p3BXbIVKssaWglPb5eSFwCOOUfWOzQK030Hj1
	 dJDLy7wQJWVvWF4cnA4GLqQze2+JHWXURDRe5h3VgLf4NVASDk4oWB/tLSYiyO5WTFW84
	 sRn4eu2v5s5p/FFa2HpQzI4+SmrQtPNdcfW97+AF/3hNEa0acAvGfsPGf1byJW9R2Apg7
	 UflAi4WIWYKTQVZ6CFeRmQIhswux6OLfZQi28dW6ZciYhu9/nMP6Cntkryowti1gejA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
	b=0SXa8Lpnq9rykdVExb9dlYP7gwMdpvw43vf5rMmyzzfczN17FtEgInanTfHtuydwFmsy
	 8cG5E2ev5yLlme6PteOOBIlmAyrMDeR2bZtfl7G6xzLSNrkeXJ/scrRK1HdE5gxVGtQn9
	 dBWhcizYzoGp9RBUn8Usg/Uz4vRGyvMgv133mPQ9xG8ENiMU9WpKaIN+blq8EzLEeEE91
	 tMVJNqf1cwMGB9R0PPLr1ghYTPyCIKrsjEcdWKXBfvjcuZXCeiaSpmixws+zCVV3OddUS
	 VXc6LtdpGeQCUoZv5VtrnGzAWS82JhA6UtlyOz3eE4fqMZKpnF6vtGdWkNCbTiwS3vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0W/AWA7y";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0A606A33F
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D0A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0W/AWA7y
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1402637a91.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 20:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371175; x=1794975975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
        b=0W/AWA7yrwT6LK9/iTfj941WJe9SgZReyePM1vYoWCRaX+2tfCp/QkZ88qwuLBlISB
         4UfVnMVEL4DaWnVqjdmYKEcjQJfqY+MdOmRsI57Y01yUt08GU/liJPXpNg2fO7znHQEO
         gbyqxckm3RqFHlYfOc4K6ZV2ye/JpzhKmucEzbNSxXlmMKW72Th+gyH8P6IcdRV3OS3q
         /3wwiIKk1LXnmUW5m8s5htGOKQ5QV0NlzS35HceaLotv3Cxdh/vJBGDY11CrEBgMOTC0
         soM/mJ24ssuRU6R/atRqseDOGRNGiq+mJkVNk3APdqbQHJHBflt4hhYh7OplrpCZFC3X
         ayHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371175; x=1794975975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
        b=X2YRZ3BvRgAh58YcMq85lK5j3forJDofjCOXdrys+PAE37/Jx5QRzOmd01/s7Xa6Fp
         7BFLDdGj3uH0qDOM1CT3p3N+najdZ7XTS3z3NM7m0bpRgeRE1K0lQqW3i8nOh0NcgWoz
         TQ5gb7Huxw9i09Ay6YeCQpPAZrV+pPt8PTAMv8qfst3RV+c1yJypS1SC+rThkdhbqNBM
         cU31ViXUnDYV6DPUsG89kVuygk2+WltaW/6OHdi/4PiboEXkooQsZrD1Rh5uuPQUMnRs
         MXlQ31h7GEbXLfrBzGDbl9ECavvJKnjUqebnhgQEcpTnN7q9csYl3z9H2RGQWEIBNMYy
         Q7Yw==
X-Gm-Message-State: APuU4Z95GmUeh3o1F7gVMI/bntXvALReU+kzNThOQ4eyWpXSNioI+ClS
	Dw0fy2EpNpCPyCl/HIkr9uMCDJb9OXXkeTIZaYDsUBlfTrfOhHHaqzAoSU9r4TE8
X-Gm-Gg: AYBFou3DwDb2PBsMXj0V98vUzhZJibwdRTwCtFA3HjXVzKh8n2a9eVa4QP9B5w3mUrW
	xQ383jmvPDJ3nAD1e3cceaCOASixwSXwp1il+FIcFyngnP7hBbmFw4cFQM2Z1j8uWbbN1bnVYtl
	oB89KvyOiI1U+1Yxp9Nqj0PjLuEXBbP/Dfv3dMLUuc83I//3FuwmU/ozu9f5vL/x3t8Y+X9qHOh
	Ga7YkbS5Bl6x25CFAQifE2wyBsuepUen7dRJQ6xv261hlCW35iLHzxUafo9yqBcYqmJ7mcpWLaI
	RcgbNe4p0BHAoCof2L5CccBeQAZmNS+Jw7Vknl90xCOZpYl0GvZEU4goNP8vOCPzvliU/P+XNtW
	ejGtT2npTm25IzrVQ1dqEXltGeA/c+j/gNaT3j8L0mqRpLM7aoK3vESoMLGVJBJMFqr72llbXvK
	2Pk8A+9XPjztU0Ei8fL1HQNgIpozUcOd6dQaethEvPnuOypA9us7FW3BUz3kM5y7e2S9vLzJEpM
	cJks0W7uU7XrtPnr86fGnXcnnqBhJ7qGcPkHSJwbLJpCjti5gbiCy0/jVg6ZWo3TC7+mi5UH6hV
	NFKnoEoDQiXV7VJU+2O91CR99c6rfP6SGVwOp/HfGoxOIhXxepnYbl1X5OKV5VdXPIYAD4tCys5
	WigGuULuLKgB1WRzCVYalf17fg6qfG+/eBojrSwJThxP2mAKQeAmP9DUpub3RWlQPElvpBiKnbe
	bavkCn+hCGMbce3HHHkkZrjTM=
X-Received: by 2002:a17:90b:2710:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b182fe0859mr1311724a91.62.1794371175217;
        Tue, 10 Nov 2026 20:26:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 10 Nov 2026 20:25:50 -0800
Message-ID: <20261111042554.232998-4-rosenp@gmail.com>
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

The MAC statistics snapshot is a fixed-size struct with the same
lifetime as struct brcms_core. Embed it directly instead of allocating
it separately, removing one kzalloc()/kfree() pair and its OOM error
path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
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
2.56.0

