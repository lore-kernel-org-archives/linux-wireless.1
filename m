Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122378;
	b=h9VnmkStQrP/w1jHEe+8TUXd+eKYk+7gUdIHBthMsuiEcENmH24XK8f8PKPqnVW42YmQ
	 v9rmd8Ljo/2yQTTuQscMnd4z3SyESKIThrMYttCaaF2jJ5Z8KiOo+YszhFQPjW+FdEmZX
	 TJJzf8qrlSiardR7/bC1OY2FPAkQFjnTfDRgNNo0nEKnVUw2fCAnv8q9/uMt1JnLAoUej
	 40ntyfL2dwtIXeOX2ymhPttY/OwlfjcONluaYP1d1Jni6jNm5D3vU086euMMfyasZR48x
	 QXzQx2cBbq2eYenXWtG/F6WBUes3G+vBobpwNlbhVDNGLmrF8HFUdF0c9x1KorHMH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
	b=utL/NpNQWf6U6TD/lG4ctw1osww1+hFgCSdRsBSugDvon6DxcfRk8AyATZJ2k7AVG/lD
	 pQ20ozHfcRq3uFVKhQb0Zblvr2Gmx0hSBJ88sazi83wSREBfuTT9Z1wRVAj8b7w1FvvEZ
	 mgmleiwI7W3ozYE9y4JvE0IHrrDWpI4bgsmHnbochDbk+XtuF3pJtfxAK/PpItQRU5egG
	 8DN6ojZ82ex4vAWvE6P+U5eAV9dy4BAAGdhdUTaDgExScVL8iXTBU8WiQE07XiCehhNlb
	 5X1FRvxRurHk1OEmxJ4F4B36Kd/blNtMRWUe55XK/g2ThKKaTaMXu2q8kMLDq3OfzpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIunIJod;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00994606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 07:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00994606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIunIJod
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37000e7234bso829447eec.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 23:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122377; x=1794727177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
        b=WIunIJod53GohmJ24fGH0/xZydu9uCPXQeoc8r1VuQH1mOV1UGotZ5VWeNnYmDhnJo
         jdQ+PG1eGcO2Pkj1SigV/6eBWO7t9gIoJa3SnrmH9pz+WaiVVHC+h2I13vk5ICg9LAUw
         OljboNDwihSZSBy/oP9pWQc2F8CxwXwMQWRoIapJchtnSX4CCWE6L61WNu7WF6WmyWvl
         9v51/lkZRCIE1JNZpehSXtTbLaW8l8qwWgIQveFXGwCyfTTmj8g7+A6Sokzv+t9Mcn5U
         HOM8cjEPVccx2HX1NLpUrs4EYzTJZmzim7g8hq3GRzo5Euf1fl47rL7MM4WFrCpUVtZs
         0qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122377; x=1794727177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbPgMV5JpZj9v253RKm3XzmKplDOYUSJil3USPkP+2k=;
        b=xMS04ijCwTdjsBLheDgOGd99RHGRSdNYPa1HM4y1JtJp21EvZ1MU3lnsb8q153toka
         +d1cv/nXr2VoT6BBWUWyKEMjtk9hbo1rPUKG/SwzkiXpDU80Y1qVQHUEiGnrjNhHqFla
         YtdU86WuBWWsfHYHZUql6aCjVRmbqzF3kvegeoypOKdMDV6Y2peZOAcfbo5WXp08j2Q8
         NA/gS9xYLq748jrsyFYCitO08CkTt6+2Zi+5haOwn/+wB7fKXmw7XtXkwVHGKkNoZYB0
         px3GYEoUyyDyDHtozLVrW7CZjnPnZNKUcwZBKKQf6+ileimkfNqsOkvyQ2Y9yMRoGjhq
         Nrxg==
X-Gm-Message-State: APuU4Z80TRvHRqmpAnau9rzxr7WM3xAHLLzExrMGsPZRrADarXbyDBAp
	9tuKluQNBjaurmgP9oN2LkWnUinNOWu7hO1LRabuosxcnSgorypCgnnDpvyp94J1x9o=
X-Gm-Gg: AYBFou1hwWWa7fdK/O8vvuwYa77oBA5xWe+Gd1MAf4VE4ukb4wy+V+Ng8yUQGkcjHBV
	XkKRTZnb8TELe0BW/jTWJIR4mrKGjcUnC4JJbYwSey/K9SGYy2JNZQ3CTrKRe1nifGq82QaXZvO
	ollA0zWzVoUfGe/LCIOHC0Dd4V6r/w/4eutdojyyUbdzE6Nnnb8XbGKthMLC16HI2x5k8FWwWvO
	zl6cXGVSSFpXvDdkreVxuZdHv2/qmYmzczM4P10iiDMzBKaqp77nYNuNOGH9eaLqqFyE+RT/H+l
	vCHhHkFEiRg3P5wZVDq5i9N3k322JEvQl4Tyfug9xuLkwrzOBOxeAl3tZWi2rcWNr7i254QHdYF
	T71QPgBEsfrhZizuPlj/N4dEoxZoeZHXhJDRsxINBG+mZjuurKMDdXlASz0aTFZwg2sRRIlznvv
	XLOPBqwSsKlzmBCnwkeoga4b/q0FVpcZdYQl7hCPSygxMJadb/XLRX73RMsXSbckSabYkifSzAD
	LZQ4vQTN+AUV4BsXyjMaPbVgUMMnrGWKUO1VVf4mE4QAQOQMPIICfU3AjqZv8CK19JQxUCU7Avb
	pGks6UELV+HQ9gmKX2jwq9oWHnovwPH2iulRWdLwfb+0lA==
X-Received: by 2002:a05:7022:3b87:b0:165:aced:1fde with SMTP id a92af1059eb24-1b39fdad047mr1551818c88.0.1794122376963;
        Sat, 07 Nov 2026 23:19:36 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:36 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 1/4] wifi: mt7601u: fix out-of-bounds access in rate index
Date: Sun,  8 Nov 2026 12:47:43 +0530
Message-ID: <20261108071820.35303-2-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
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

The rate->idx value can occasionally exceed the supported band's
bitrates array length, leading to a memory out-of-bounds access.
Add a bounds check to safely fall back to CCK rates if the index
is invalid.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/mac.c | 32 +++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.c b/drivers/net/wireless/mediatek/mt7601u/mac.c
index ca9cf628eb10d..bf485dabca745 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.c
@@ -118,19 +118,27 @@ u16 mt76_mac_tx_rate_val(struct mt7601u_dev *dev,
 		if (rate->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
 			bw = 1;
 	} else {
-		const struct ieee80211_rate *r;
-		int band = dev->chandef.chan->band;
-		u16 val;
-
-		r = &dev->hw->wiphy->bands[band]->bitrates[rate->idx];
-		if (rate->flags & IEEE80211_TX_RC_USE_SHORT_PREAMBLE)
-			val = r->hw_value_short;
-		else
-			val = r->hw_value;
 
-		phy = val >> 8;
-		rate_idx = val & 0xff;
-		bw = 0;
+		int band = dev->chandef.chan->band;
+		struct ieee80211_supported_band *sband =
+			dev->hw->wiphy->bands[band];
+
+		if (rate->idx < 0 || rate->idx >= sband->n_bitrates) {
+			phy = MT_PHY_TYPE_CCK;
+			rate_idx = 0;
+		} else {
+			const struct ieee80211_rate *r =
+				&sband->bitrates[rate->idx];
+			u16 val;
+
+			if (rate->flags & IEEE80211_TX_RC_USE_SHORT_PREAMBLE)
+				val = r->hw_value_short;
+			else
+				val = r->hw_value;
+
+			phy = val >> 8;
+			rate_idx = val & 0xff;
+		}
 	}
 
 	rateval = FIELD_PREP(MT_RXWI_RATE_MCS, rate_idx);
-- 
2.56.0

