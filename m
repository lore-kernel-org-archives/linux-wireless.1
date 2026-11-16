Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871197;
	b=E2VTnCmx3NJW8Ys0vs+dVAV0d2DLPy2uHWuPKSwGuDxEy/XQ4Q1EmqaT9o6I8bcaP+Xi
	 BRl9J0gHLIxK1wmN5c9oiHLuhQEEHcDBdXOGMXoZmuXnCNcC6I6SUh4G0ny5qz+xzSxM/
	 M/4xN+31rGZAHRSiRlQLqZnSGwfpbX85OjdhaZKGzD71c2P4WplUn48MH2sVRFClni2Lw
	 tSAPpl1Qw8pvarUfJJmZDDbyXqzB18BzdSuH2dgHCq8kz1IS39yCiAxQzbfxNBxnmxdZb
	 4LpMgYKUC+kBLdGRH3paTf841tRjy9VwmaNFSRhDoQ8ihyPbK8X3sM9DDdcLcziwbzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871197;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=30mv0nAY+X0e7kbeDLKp5NE5Bmu3C/uzutIryO3Tepc=;
	b=DZzx49FnXdeRTY2xuEyJdWPYqmwwgejyJBUX4vm5D82UsnIsyoko8NHI5fqf03WT+4/F
	 8Mrfi48hYMHw/sGoVCyHyk9Tiv9HhzQ7LFbVu7D/m4rdPMPNKHd37cOleJOLLV3N4cFeJ
	 elz5dlFOlYHYFCKKHUkVSrooVIuoEJekMK3MNcA3YoouMABdRCXZbcYaRc8/XLp7Lo1QH
	 ku+LJUoEJgHDxVSQMKlvVTfl3b+L8o9/YYat9uMJ3BWP2fIyr5Z3KPiTI50k07ZX1t9aM
	 AnMbsCBL1s1doMcY/r+YwxK6HHK4Az/hT8iQDInG6HDniBZUG/miEBnYXXxg/8bqjWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451A606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7451A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4e4a4d77e5bso222834b6e.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871196; x=1795475996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=30mv0nAY+X0e7kbeDLKp5NE5Bmu3C/uzutIryO3Tepc=;
        b=q977k/vGQjgCyDuseKaVCWivda2FHTrjc7yU5LeyULlZ+2Ix5XmeUGVzUn2ctZe6Yy
         XjzcTvo8ZhMuLwxkDQyPVNukm4MLRJGVb8XuIILvdmB24yX38aLsiTWqR/kTgKwau2zo
         QQgqVeseUHTjtmqlRLCnwukp0xiYkhAnQsbkQVNfQnayG/3zENe+KsGEKq4Ieb2MTXJQ
         xTdudORWekhp5vCQG4kdK5FzOYPeHy71k5DyfFB9TFPtTwLIQST3tITc0dYb+169fVHd
         SqKjt5xEyF9U9X4u5kJ1+ZLNUEcU5T7Le8ncHtxcTzbQjPUrJtFDeX3w1tmdFSyZRMcP
         QhYQ==
X-Forwarded-Encrypted: i=1; AL+hErGndYD2L5M4OqRBy8XXDr2d5j9pFJ7/94nys16FPlTVN3Np9PQ8khXzq/i12zqvGnfniog1I93dxpuL0Bgrdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ElEO6DiX4XjndC4JFotiGS6wvK2gcJ1QcxaZr88/TC0nsVAiv
	TjN9eEPz2AUnvDPaolye/ReRZFE1yBtk41SjeFEsTNIhpCY0MpLoH+32
X-Gm-Gg: AYBFou3rSbWKzE221Nfv0WwILAxaCC09eUd8spORAHb3KdXOorWHl4D+qSd30NRp3Xs
	/PxbeeSfY04Xy8ERXmqNPt8Hr/Q9y5nhewBx3dDitNuAiCXRLgCIS902dNsdRG9npBqoT5Waaaf
	w2XzyivuYOllYnWExWQJEEx7Zll41FXouZ3dYq/mcy4q0t2ESIi5Lk5ya0D9thzgwODOegsnYBx
	blx2MDV3RlnBHDnpVCTl5wAfqXxiIirOcml5V37D5UFfaEpHuDG/Ufo5521xtNXgFFFEaPOlzve
	AXn7LXfwgk/MiUKRVDiSK26Iee63uAkEx62LJdRGnFNLmLlw9tWInWTQRCn1NwBteH3yHcgCoJG
	OIngQv3OV97ytEpaobcILm+iRBjPZgNSeGCRmVYEVk5fnHkU50aYtEJxAe8HXYV1OvhmbyLnruU
	8pvs5FNvSm6C/iTeFmkPYcSmto+i/mOHT6tBGbVn3Gr3/G4yZy/sqJbsWv2/ukub1vFHGg7r820
	SsLjW0eaMsYvgqx7WbpNjzzl7Sodbf7BBXw7gmiT+U0cZ8GD7cB3DfG9a/FY9xLB/eKRx9ADQwP
	8h7f2iWW7nhJQFkokUBVTqMcOT3vqVyHhjjwZpioRFWSWYBafFYpr/MZiYVkM7D9SNNIlfl/u2C
	j5U7PtAdK5t6TruF8leRC5Z++3y+puRc=
X-Received: by 2002:a05:6808:c1ba:b0:4d6:9133:cff1 with SMTP id 5614622812f47-575dc245878mr716250b6e.24.1794871196401;
        Mon, 16 Nov 2026 15:19:56 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:54 -0800 (PST)
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
Subject: [PATCH v2 16/19] wifi: mt76: mt7925: stop queueing resets once the device is being removed
Date: Mon, 16 Nov 2026 17:16:27 -0600
Message-ID: <20261116231630.1733906-17-sean.wang@kernel.org>
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

mt7925e_unregister_device() cancels reset_work before it tears the device
down, but every source that can raise a reset stays live past that point:
the MCU command path, the system error recovery and interrupt handlers,
and the MAC watchdog all
call mt792x_reset(), and the interrupt tasklet is only disabled at the very
end of the function. A reset raised in that window is queued behind the
cancel and then runs while the device is being dismantled -
mt7925_mac_reset_work() sets hw_full_reset, stops the queues and
cancels the PM works before it can notice that the device is gone.

mt792x_reset() already bails out on !hw_init_done, and that flag has no
other consumer: it is set once during hardware init and read only there.
Clear it at the top of the teardown so no reset can be queued for its whole
duration.

Measured on rauru with kprobes on mt792x_reset() (queue), on
mt7925_mac_reset_work() (execution) and on mt76_unregister_device(), which
runs immediately after the cancel and so serves as the anchor, while
chip_reset was written in a loop across the module unload:

  before: 205 resets queued and 415 mt7925_mac_reset_work() runs after the
          anchor, that is after cancel_work_sync() had already returned
  after:  no run after the anchor; mt792x_reset() is still entered but
          returns early

A chip_reset on a running device still triggers a reset as before, and
unload/reload cycles stay clean.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 8d0f8f72d2f9..fe168e00b9eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -103,6 +103,16 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
+	/* Stop new resets from being queued for the rest of the teardown.
+	 * mt792x_reset() bails out on !hw_init_done, which is otherwise only
+	 * set once at init, so clearing it here closes the window in which an
+	 * MCU timeout, a system error recovery interrupt or the watchdog
+	 * could still schedule
+	 * reset_work behind the cancel below and run it against a device that
+	 * is already being dismantled.
+	 */
+	dev->hw_init_done = false;
+
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
-- 
2.43.0

