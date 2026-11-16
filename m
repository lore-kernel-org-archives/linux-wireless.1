Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871143;
	b=QQ8iVqTFMuCt/er7nFaHyB2VepB+z5Fo5NqS7/eTer+VDx3l9HRvjEnsx204JdMhYTyw
	 EgG7djrglkI4ir6s/OU/qzTZNnuOBgslYygNDaxC30CrXPM+KxLFHy6dniPHDMvnlzjTA
	 b7meLAslQygDC59+MXUE7zkflKAcSrVnGGNCLA2EwvtaXLLCFZd6tMCczawyjGsicb2S4
	 ELM7I9+ihSw7kHFPLernFpWJ92yNHc4LfGdP5/kKK9CrXRwlwjm/mmSQRCbB9RjpFySVR
	 2afD0yujH+MpuuZ8jCyRiXJAcbZbwv5PySlWL21CH6vYRTlc3v+4m5L6GQ/Zax9LpvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871143;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pgZv5fz4JauIRnSeskFB3jlJVm7Slh3mCCf7c9hqyD0=;
	b=C4YGWvDxz3xgOl5GvGylZPdzi33qw76ZkT3wUSTPrah/vQRIe4SebimQaTT1Y+I/BKjB
	 cdpvj3IeTmfsaN8qdEZ2yJdI5bZRBASg5BOaWHlBB2rUbeq4yt56BYcAD4cFLn8qlDUC4
	 wcJau5O5La2GbqakFV4CeiMHS+j8bikocEgNrJmvFBDpCL3tmcK49c2Jr+ZwDfz0NCrRA
	 GOnzlcIqq07bo0XdurKZksN9X1S6zfEhLPsx0gdBAikMGLLBgKnJD+ZNhBJgwZpFlnHhI
	 IdfH+iYpQC5jGvFp1pcVRFiX+z4Nlk429zOHjmh49A/HX//P39CxKr1mYmMOCuB1zTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889DA606A330
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-571eb508edaso856091b6e.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871142; x=1795475942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgZv5fz4JauIRnSeskFB3jlJVm7Slh3mCCf7c9hqyD0=;
        b=OIrI8DvE6fD8K9IOiYtILxZn1YjfnKxNj5Z8XtSb2kICZYYjCHxlMxz3MOYNDros2J
         OWVY3A6v6q/npSSStJHmxPds0kCiuy/keOWBLRt0pC0vFpj4TevNmq+zUtZOfyokMN/P
         Rit/RGP20VwDGtD+fSbBA1NPnVZ5U4uyhteNevMvYAqRI7oMFTrEZzFoL1EHaRHhpANl
         R0yI70FW1ZunvzeDl5h7uOucoYc6idNqUlHBjsfyiK5vl6Hl6SHHexKno16diUAoQrK7
         mdc65SAf1Ar1tljz+jCXBaC2anDDarsbE69IHQtOsFpSbRZDLHcxXuR/VlNJh4iIXY83
         XmgQ==
X-Forwarded-Encrypted: i=1; AL+hErFbzLQjHNw6wMa+IgNzIhZ+eCeU+XTy/TCkVKJZLAp5dR4CwXAiVu4BgplhYPPmo4WQNc3KKoAqc7Yi0tHn9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wl4Kefjrx0OaeSzbZ+M1qBFSXU0qUn7iJ05D1C7f+vzKoCf3s
	byKXKZFTrTCT6vvtNrUhNi7mWx4zSEPYWyNotTa+F+s0V8p/HQYn/rGE
X-Gm-Gg: AYBFou2JYwUHZuNV5PuTZseg39Y+Y4geNp/F8+IZnMPu8WrkKiLLm1MVN0d3au08510
	6rRcSSFmUFKJihwjXXbf6OpzzjA0hyeMbjGUmMJoduM78fx/3KQGnxGNpjh82NYWGWiC2ti+6aQ
	47KeSJaODG34uIql1R+6Xok5H5q7Iw/bhADfI8PV/wEQeGFlyQ9/MNKqdNXzQxAEC7tuimkcfXu
	1QhcqsiXfiz+booaRNdQ/03iq2ZrgNtbmSILYxcHvgRd7I0HH7g97Cgi4mZS4bKCEJ8ybgeVrj+
	98Q/6JoizIw76VdrxhTkTXYJwr/nYyzOMM0hdL5zCpmvbcdsMJ3qo5GxEExnDrwRED/UgL08zVj
	vVeKd2TbciZv/1JP1sVQlgN7Ff2ehSiA+FKcUoROuVMQT3lmhy67PAysftlA+9UhA8AEGwsErUX
	q0Z5PLMAQKUa+mB+iA0hlmahOeC8sywGhLHUmDlf39C2dCPcrUFUJIQvmrH4Zt5wcGvY79Xbl23
	rth6uZMsREgX07Q6BBlPwzePnf6mDZ+FObUgnuX10zScM6mA8xHcBo4eryU+/P+7G7cBk+mIE7R
	8O8Vz+FHXLM+7MFnuAqI9TUkoCozYGaUyJR+h8aIOG3vm0++1NJJHr8aPQgnqE6dEKPTW+WsCRs
	n7Ky/xQKL
X-Received: by 2002:a05:6808:4f5e:b0:53b:11c7:2da0 with SMTP id 5614622812f47-56e63285bd9mr12458314b6e.21.1794871142127;
        Mon, 16 Nov 2026 15:19:02 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:00 -0800 (PST)
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
Subject: [PATCH v2 06/19] wifi: mt76: mt7925: do not disable RX NAPI twice on unload
Date: Mon, 16 Nov 2026 17:16:17 -0600
Message-ID: <20261116231630.1733906-7-sean.wang@kernel.org>
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

mt7925e_unregister_device() disables every RX NAPI and then calls
mt792x_dma_cleanup(), whose mt76_dma_cleanup() disables them again.
The second napi_disable() spins waiting for NAPI_STATE_SCHED, which the
first one already set and nobody will clear, so module unload hangs in
D state and the module refcount underflows to -1; only a reboot recovers.

Drop the redundant loop and leave the RX NAPI teardown to
mt76_dma_cleanup(), making driver hot-reload work again.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0d477dc1086c..8d0f8f72d2f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -97,7 +97,6 @@ void mt7925e_axidma_cal_cache_init(struct mt792x_dev *dev)
 
 static void mt7925e_unregister_device(struct mt792x_dev *dev)
 {
-	int i;
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
@@ -108,8 +107,12 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	mt76_unregister_device(&dev->mt76);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
 	cancel_work_sync(&dev->reset_work);
-	mt76_for_each_q_rx(&dev->mt76, i)
-		napi_disable(&dev->mt76.napi[i]);
+	/* Do not disable the RX NAPIs here: mt76_dma_cleanup(), reached below
+	 * via mt792x_dma_cleanup(), disables them as part of the generic
+	 * teardown. Disabling twice makes the second napi_disable() wait
+	 * forever for NAPI_STATE_SCHED to clear, hanging module unload in D
+	 * state with the module refcount left at -1.
+	 */
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	cancel_work_sync(&pm->wake_work);
-- 
2.43.0

