Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871206;
	b=nTpactgfLrd1Li/+gM3Liy8bhePlVejzig+BdjybAJr0Mgf4FBDZc9Kyy+J/yJ9zt68G
	 bJrZeROBId2IqxcHD1sXbGLVvvV2M+BzkojyeR6yRCGOeZ1cQGqYyo6v/7Qlfc0gPc948
	 AO0F7RF+twKw7uAfo1w4bbXI41d7WcR8dikBjkVw6zudK4nxZHAbTbm4Y8GgZPQaaoz61
	 pd91fVCJQPmAatzhjRjQCAsSMQ2wGSmTZX9yD/anODmhCJJ7r+3F1ecu8p8Kr3j7xdzV0
	 PlEaSlHedbv9ufEOgzJ1PBzGUMMh2AZXp0FtIjbUjAkfR1pUvQzDBMf2F0IZ9R74J0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871206;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aovF2yrGT1mwBB687PZlkCKn8D9c8kfCi3UtUzpVZCA=;
	b=sXx3kOKWZqFT2m/Ar/ATGonWuHA4GWdPqPvEHpPv3mjDwogobDxWaRVqMgXgLUoNAnJE
	 hepLVboW+yHUiEav1C+u9omJNEuIGZ5l4te6MfRrDsZu0CG2nXk5xknT4uCtCHp9d/fcF
	 JfzBo8g3DA2Q7Mp7CoIWxwcybNghTU38uJ5sBSbC94njyPwfXCoMWspMxOaRKIO/OGofo
	 Ix5g532bwIuElmgWcY07+oE2gAa07hXhxFy0iNEO+3kyqcJPZjPF7iaqwdibw5lTpKpGC
	 qTZtn8Zby8djtXtOSrSlekRaQoNj+srbD4tLnzeGW4yRw1qUPLtsbo8Rci/5i7ec7wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7A606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b190cdc9feso3281813b6e.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871205; x=1795476005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aovF2yrGT1mwBB687PZlkCKn8D9c8kfCi3UtUzpVZCA=;
        b=SqtcOEBqWFhqFWLqaFPT4WyEheM3R6M9Z5+Ayh1KPK67uIFXXDhnWqLpixysx3OMCc
         ijjMIu2jyKKjW8mOmNJgoKF/2nKMWZRE7jqUOT5tcU2aIUZnCexgQLqYScjhCZZdTYQ+
         Vhw9apEW1sd+7Ns2p3x8j+DRNhdkblwZqbSkOF/devez3RWh6az7vp4/lR0rsvZCYP52
         w8J+nAOM2UlVUe6KdE+TyqGAeg3aBvIjrqLPYQEMAWDBXqO5zm9vYelOCMcLbWAaxDdy
         liD6cjO9cO2CBKR2grZbfbO7hNiL8Q2l5euQS+OAV/8NOSrpO1Swcf0ByO9nYtorEv5h
         yszA==
X-Forwarded-Encrypted: i=1; AL+hErHntHkfyZxAA5cdkdjElyIc7lOVQbtBpWt2GyEtQV6epYuiaPM8JZGVwbOCGwZPf/O/Ug5SDaGLpcAHvzWTvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kD13tBv+4zkkJr1mUNPO//RjMcvMaMMyAWg7OKMbv+ND4nL2Z
	OWY+WE8qzI4c4jtGAwP8fftUVFzG2XyNeXZy1zcy39F76UTZZHJmzvis
X-Gm-Gg: AYBFou0+tq8I7a0MllWqN+Snx3xSeqM0Axmi0K7X0P9Xraw6ramwy3doaApRQ4USzYz
	MpY0Wz/x1MXTQCcvvJQr5fC9pdqyOjzPSfcYmVI1NorcOChqCoBE2kP+LFNTmtOVIprIF+ZmxMY
	MI9ajsmvRL0qJguDblcOzvWU7/7vQeEkmJmrO8N0REFza0KppM+iEZgzqnzs4gcpgUoamJapc53
	nPQ5gtj8eePpQG0/EXxfpqtOjXoAjP7YI7tWEU61MVgDHzun71gPof8wdsPXXb+e/l0wlS5kKry
	WGn+qQdvYo9Gh3VXlInLqz6Bv2uEv0zTg3RY+OWKrSY/esxf0mHeaByrNrqU7Ej4uQXPxY2L3f+
	KZAQhF4kFYbTW/ZsdpnIRnuEsjJ4fndmrCL0vGHA+kTe0QDvZluzAIgE1IJB5LohzH7aLI89aVJ
	6P+8uGzgC0vkKe9hzCrv85oR14d/rdhYLStn+yHoRH9wcg14XwG+Vh73ecxtGqDlAADY9wU90bd
	jVXriBNGUhtfLEDq8X5cCzj5ZZ5x8un3H1NH6e43X17rKRyDUzx2EE47aw+zpWdkPPeGxasQCzz
	QI4kDxpR/y8g0s7J0Qj++gqwKDTTS1ruGv2WtfcansklDHO31UtTptSg54U84gvTJvd39nxxL0r
	GRXE3s7a3
X-Received: by 2002:a05:6808:1584:b0:557:308a:9e9a with SMTP id 5614622812f47-56e63ba5734mr11364381b6e.21.1794871205155;
        Mon, 16 Nov 2026 15:20:05 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:20:03 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 18/19] wifi: mt76: mt7925: always deliver the joined-cluster event through the deferred work
Date: Mon, 16 Nov 2026 17:16:29 -0600
Message-ID: <20261116231630.1733906-19-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

A JOINED_CLUSTER arriving while nan.started is already set is sent to
mac80211 directly, but a deferred STARTED_CLUSTER may still be in flight:
NAN_START holds the wiphy lock, so the deferred work has often already
snapshotted and cleared its pending bits and now sleeps on that lock
before it can deliver STARTED. The directly sent JOINED then reaches
userspace first and the late STARTED overwrites it, so the supplicant
keeps the stale self cluster for the whole session and its RX filters
reject the real cluster's SDFs (10 forced-split bring-ups out of ~600
showed this inversion on the bench).

Route JOINED through the deferred work unconditionally. The work always
delivers STARTED before JOINED, so firmware event order is preserved no
matter when the events land, and the extra scheduling hop on an idle
work is negligible for this once-per-session event.

Fixes: a5487a682406 ("wifi: mt76: mt7925: add NAN MCU helpers")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index aa030dca7e01..f63e2d342eb4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -706,31 +706,29 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 		return;
 	}
 
-	/* JOINED_CLUSTER has the same race as STARTED_CLUSTER above: the
-	 * firmware joins an existing cluster from inside its start-up passive
-	 * scan, so the event can land while NAN_START is still running and
-	 * nan.started is not set yet. Defer it the same way instead of
-	 * dropping it - a lost join leaves userspace unaware of the cluster it
-	 * is in and service discovery never completes.
-	 */
-	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif)) {
-		spin_lock_bh(&dev->nan_deferred_lock);
-		memcpy(dev->nan_joined_cluster_id, cluster_id, ETH_ALEN);
-		set_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER,
-			&dev->nan_deferred_pending);
-		spin_unlock_bh(&dev->nan_deferred_lock);
-		ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
-		return;
-	}
-
 	dev_dbg(dev->mt76.dev, "nan: anchor_master_rank=%*phN\n",
 		NAN_ANCHOR_MASTER_RANK_NUM, de_evt->anchor_master_rank);
 
 	dev_dbg(dev->mt76.dev, "nan: own_nmi=%pM master_nmi=%pM\n",
 		de_evt->own_nmi, de_evt->master_nmi);
 
-	/* joined an existing cluster, not a self-anchored new one */
-	ieee80211_nan_cluster_joined(dev->nan_vif, cluster_id, false, GFP_KERNEL);
+	/* JOINED_CLUSTER has the same race as STARTED_CLUSTER above (the
+	 * firmware joins from inside its start-up passive scan, so the event
+	 * can land while NAN_START is still running), and it can also race
+	 * the work that is about to deliver a deferred STARTED_CLUSTER -
+	 * userspace keeps the last event it sees, so a directly sent JOINED
+	 * would be overwritten by the stale self cluster for the whole
+	 * session. Always deliver JOINED through the work, which sends
+	 * STARTED before JOINED.
+	 */
+	dev_dbg(dev->mt76.dev, "nan: deferring JOINED_CLUSTER cluster=%pM\n",
+		cluster_id);
+	spin_lock_bh(&dev->nan_deferred_lock);
+	memcpy(dev->nan_joined_cluster_id, cluster_id, ETH_ALEN);
+	set_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER,
+		&dev->nan_deferred_pending);
+	spin_unlock_bh(&dev->nan_deferred_lock);
+	ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
 }
 
 /* Runs the deferred NAN MCU events in process context; takes wiphy_lock
-- 
2.43.0

