Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506191;
	b=Y/jVf1jvDBvcvf41KaqraFWRQiaFhJYnaKo0O1qUgsp/fSwFt3Gi100Ih0NQGDFY6HEi
	 PW6l7vWnqRRzuBAfuf2sANSAoDLBQU615w9/wvzJUzdIMsjXvLjUV9oEGjjanad+HYHM8
	 OsHfD+LkKQY5oXgck30Nf6A15Dx3n3a7vhDW7/w2EDcn62+loJOFSb0vcbl0rJAOJcWge
	 dMrjXDcUoovsq1b8jmHJBS+Pw2Z2Lw4pnAFVKtNbKtyXEqW/WD04YIK3Emvzu+CUASuuU
	 3znXxK6n3rR5k2zOmrAebp66BB+HIf8/kKLpgKhmFnI/T+zmlrMSc+ZoVxI9NP87cRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rxPPAbo/wpfsLoPb8T1Wkn8fcPbXO27dt+TundwHSb0=;
	b=2jb5Ztb6DyI0wl2zZjX/DeWWhjsMZoTK90NWHwG0/2H9yOjwzMPvmFNgWo7wcG1GyDA8
	 bMo8SkPbK3x6EJ5NdDERk/39lGzAIhRKHWvKjU+rvH8xW8GKPsd2kcKt9fEJ3CNSxI4I6
	 Gu6XtPF3I+Nv2SVixJplUlAvgohiMd1Fjk8ROzEOgtIRouPdGigCVSqhHSzfLqULXUyUu
	 mggYh5pDlR7dtf+iCbwcTTEHMtSHoe/JP43JzZvwTLoqsc61DOmVPtdM3qUlSxxSdyEiQ
	 R3bX1Koh/kOkydbpjNpDTX91SHlUTUXsJsswlLP5o+1J3j09BucNCFxTx4Fy73eyWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDNZtbdj;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A2C606A895
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A2C606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDNZtbdj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so19414f8f.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506189; x=1795110989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxPPAbo/wpfsLoPb8T1Wkn8fcPbXO27dt+TundwHSb0=;
        b=EDNZtbdjt2CHUwQCW2zghy+S/t4JxC8uEVWKT4ziaP4mBVKGOmPyPMbHDMJMZsrDjI
         KF+03H0iVe6h9/7M0p7k7qJugBDeo+c8u1NV9KPouDXvX8bWetYr2Slw+ABZBnKtko/h
         RfLsIGupv2DiW7ey3yJ8+OqXreueiNq7IaPtz7O3WLtnrD3+WElOi2N7G713RPsJPt1I
         NLN5yN57NceJKLoi9D9HOfkyraSgUBqNouWWOasak2Q/vtrDg+1KlWg5q7hyBsIELqcM
         s8QNQODQHZ8TDQ0SDTAPuHt10rC2wH++B80S8/Jt97KeRX7gMbSsUmPZI20XcfhAbiw9
         iYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506189; x=1795110989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxPPAbo/wpfsLoPb8T1Wkn8fcPbXO27dt+TundwHSb0=;
        b=NN+jn4RH/XMzXw7vTDjnFUx7x5NBbyzHVgJNfQOdA41vF4bIEGVCEDUXLp5bt9Em69
         /0mA3D7QWTIwiZG1A04tmF0PNWKF4uIxDVnu0+76WrLSfmPHLzfO65WELHhrz4Vm46Jt
         WfII1WjD3ifeytwdj0Re+ilE0thEHQ2vfd6nylSE87cMVr7qWoaRNnTXK8yzB3CPdZ7V
         PZ2EeK1TKL8DqKN/gxIPbTCRFrUkHEOlF4CLAawHxvMXuaNJcyeI8zAU7V0R3SzvkaZK
         wCpIlvrew7mdnCM1WAJGlJhQLaO/r3dgZhCYpMs9z9De0zuJHiRXlxg5r8g0IWNS9pD2
         +JHw==
X-Gm-Message-State: APuU4Z9/wc6GMt2B3RVd0aGm4pBZqo6zbaZFpYmrRdOGvGoCE+qE2NyY
	+0GiqkQRPdz72oVuYxEye2DnEwMHZXGqF11l7L+m/5bBkJ36whzmYLcpJnl7Fa+u7gg=
X-Gm-Gg: AYBFou0BIkrgcSQRPMbvFle5xnNRadIdwkUmFBCfb23c6zNI5d0drweJjG8BVaQ5qoz
	fFfRw9xFm7e3LV8127BTG98cN28xMY7C8oy0C0aM5FDx6t/NZo/q92+muJFHBXOhZu5TCKilDY3
	wpPvOG2wBJHXYo1HTy1EWGkMe1B2nNo90d+0eXpQTXxfEHpWMBDa9o+8pt4O8rZF0zYZskBPVJG
	Xeo6L1/7eYVdi36KRBzuLVmAvW8iCpg5K6IKw1ktlQ/JWAij7s298cxvtv9PB9GYM20LiT77Gkf
	TSxHNFq9tusGcsMDtyudF07KGlbcs3B3d3llASYhozs6YLEOsdX079hBcsnpejn/crxoS5gfkLL
	7Fur0ZJL8/N0UkvBMsV1LulNYtZkHpLw9s2k/hxmFpDdMNGHPgZPghS9DNbOjxe6rzie/WBnSb0
	Bmth7T2GtElRSNrRzRUe7yL7taAs84JCBSZTTQ3X4Gb5u+svYL7siA42w+yhWiN+K/ExHHkmEfr
	D/9ozuR1iEKHhBIdZsRdS5JtmCxymCE7b7Rma0Ce1g2i2fA63lpjI/RwN6dVuR//kC40AxiqMFn
	Vx3WuDgvz36EPXIOUwjmemTTd8iPO6NxR+EWOoGbGKBJ8sa6x9tjie+NF4XsVUm1KnoYcRIWLCt
	ALQHYJ+6l511hU31dn/tqcJBmoCxr+1vTqDN0EpZtBUhIzG3PKWc2R8kJTMrEOkyJQzJimMcSvw
	EUAoEGqVZQ9uKF9sd8nYFP1YjvIToHawi17RPQ4Tcvr/wwxFWP5BOWs7/BAPyqctY=
X-Received: by 2002:a5d:5f09:0:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-49c72ba71fdmr253358f8f.46.1794506189143;
        Thu, 12 Nov 2026 09:56:29 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm438408f8f.57.2026.11.12.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:28 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 2/3] wifi: b43: MAC core setup for core revisions 40 and 42
Date: Thu, 12 Nov 2026 18:56:23 +0100
Message-ID: <20261112175624.40547-3-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175624.40547-1-gonsolo@gmail.com>
References: <20261112175624.40547-1-gonsolo@gmail.com>
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

The core revisions 40 and 42 of the BCM4352 and BCM4360 need these
differences from the older cores:

 - PHY reset: the reset is asserted with the clock forced and released
   with the clock free, in the order the vendor driver uses.
 - GPIOs: the pins are host driven with GPIO1 and GPIO2 high. This is the
   pattern of the MacBookAir6,1 (front end control); other boards may
   need other values.
 - The template and TX FIFOs are carved out of the MAC memory and the TX
   queue table is set up, because the microcode does not size them.
 - MACCTL is written without SHM_ENABLED, which the vendor driver never
   sets on this core.
 - The RX interrupt lazy timeout (register 0x100) is set so that an
   interrupt is raised after every frame.

The microcode (revision 784 and above, b43_ucode_is_ac()) has no key
table pointer at the legacy KTP word, it reads 0, so b43_security_init()
must not clear the "key table": that zeroed SHM 0x000-0x3a0 (rate maps,
ACK/CTS PHY control, microcode state) on every core init.
b43_op_set_key() returns -EOPNOTSUPP, mac80211 does the crypto in
software.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/b43.h  |   8 ++
 drivers/net/wireless/broadcom/b43/main.c | 101 ++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/b43.h b/drivers/net/wireless/broadcom/b43/b43.h
index 80b299b..92227ff 100644
--- a/drivers/net/wireless/broadcom/b43/b43.h
+++ b/drivers/net/wireless/broadcom/b43/b43.h
@@ -1030,6 +1030,14 @@ static inline void b43_device_disable(struct b43_wldev *wldev,
 	wldev->dev->device_disable(wldev->dev, core_specific_flags);
 }
 
+/* Microcode of the AC cores (revisions 784, 832 and 928). Valid once the
+ * microcode is loaded; only revision 832 has been tested.
+ */
+static inline bool b43_ucode_is_ac(struct b43_wldev *dev)
+{
+	return dev->fw.rev >= 784;
+}
+
 static inline u16 b43_read16(struct b43_wldev *dev, u16 offset)
 {
 	return dev->dev->read16(dev->dev, offset);
diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index e2e8ca0..205d429 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -1235,6 +1235,24 @@ static void b43_bcma_phy_reset(struct b43_wldev *dev)
 {
 	u32 flags;
 
+	if (b43_is_ac_core(dev)) {
+		flags = bcma_aread32(dev->dev->bdev, BCMA_IOCTL);
+		flags |= B43_BCMA_IOCTL_PHY_RESET |
+			 B43_BCMA_IOCTL_PHY_BW_20MHZ | BCMA_IOCTL_FGC |
+			 B43_BCMA_IOCTL_PHY_CLKEN;
+		bcma_awrite32(dev->dev->bdev, BCMA_IOCTL, flags);
+		udelay(2);
+		bcma_awrite32(dev->dev->bdev, BCMA_IOCTL, flags);
+		flags &= ~(B43_BCMA_IOCTL_PHY_RESET | BCMA_IOCTL_FGC |
+			   B43_BCMA_IOCTL_PHY_CLKEN);
+		bcma_awrite32(dev->dev->bdev, BCMA_IOCTL, flags);
+		udelay(1);
+		flags |= B43_BCMA_IOCTL_PHY_CLKEN;
+		bcma_awrite32(dev->dev->bdev, BCMA_IOCTL, flags);
+		udelay(1);
+		return;
+	}
+
 	/* Put PHY into reset */
 	flags = bcma_aread32(dev->dev->bdev, BCMA_IOCTL);
 	flags |= B43_BCMA_IOCTL_PHY_RESET;
@@ -2914,6 +2932,18 @@ static int b43_gpio_init(struct b43_wldev *dev)
 	switch (dev->dev->bus_type) {
 #ifdef CONFIG_B43_BCMA
 	case B43_BUS_BCMA:
+		if (b43_is_ac_core(dev)) {
+			struct bcma_drv_cc *cc = &dev->dev->bdev->bus->drv_cc;
+
+			/*
+			 * the vendor driver keeps the pins host-driven with
+			 * GPIO1+2 high (front-end control on MacBookAir6,1).
+			 */
+			bcma_chipco_gpio_control(cc, mask | 0xa7, 0);
+			bcma_chipco_gpio_out(cc, 0xa7, 0x06);
+			bcma_chipco_gpio_outen(cc, 0xa7, 0xa7);
+			break;
+		}
 		bcma_chipco_gpio_control(&dev->dev->bdev->bus->drv_cc, mask, set);
 		break;
 #endif
@@ -3245,6 +3275,53 @@ static void b43_chip_exit(struct b43_wldev *dev)
 /* Initialize the chip
  * https://bcm-specs.sipsolutions.net/ChipInit
  */
+/*
+ * rev 40+ MAC: carve template/TX FIFOs out of MAC memory and set up the TX
+ * queue table (as the vendor driver does it).
+ */
+
+static void b43_ac_fifo_init(struct b43_wldev *dev)
+{
+	static const u8 fifos[] = { 7, 0, 1, 2, 3, 4, 5 };
+	u16 total = (b43_read32(dev, 0x15c) >> 1) & 0xffc;
+	const u16 tpl = 0x2a, fifo_sz = 0x20, blk = 0xb;
+	unsigned int i;
+	int t;
+
+	b43_write16(dev, 0x542, total);
+	b43_write16(dev, 0x540, 5);
+	for (t = 0; t < 20 && (b43_read16(dev, 0x540) & 1); t++)
+		udelay(10);
+	for (i = 0; i < ARRAY_SIZE(fifos); i++) {
+		if (fifos[i] == 7) {
+			b43_write16(dev, 0x54a, tpl);
+			b43_write16(dev, 0x54c, tpl);
+			b43_write16(dev, 0x520, tpl);
+			b43_write16(dev, 0x54e, ((tpl - 4) << 8) | tpl);
+		} else {
+			b43_write16(dev, 0x54a, total - tpl);
+			b43_write16(dev, 0x54c, fifo_sz);
+			b43_write16(dev, 0x520, blk);
+			b43_write16(dev, 0x54e,
+				    ((blk * 2 - 4) << 8) | (blk * 2));
+		}
+		b43_write16(dev, 0x550, 0x740c);
+		b43_write16(dev, 0x548, fifos[i] | 0x10);
+	}
+	for (i = 0; i < 0x2a; i++) {
+		u16 end = min_t(u16, i + 2, 0x29);
+
+		b43_write16(dev, 0x534, i);
+		b43_write16(dev, 0x536, end);
+		b43_write16(dev, 0x532, end + 1 - i);
+		b43_write16(dev, 0x530, (i << 4) | 0x8007);
+		for (t = 0; t < 20 && b43_read16(dev, 0x530); t++)
+			udelay(10);
+	}
+	b43dbg(dev->wl, "AC FIFO init: total %#x, 0x540=%04x 0x530=%04x\n",
+	       total, b43_read16(dev, 0x540), b43_read16(dev, 0x530));
+}
+
 static int b43_chip_init(struct b43_wldev *dev)
 {
 	struct b43_phy *phy = &dev->phy;
@@ -3253,7 +3330,10 @@ static int b43_chip_init(struct b43_wldev *dev)
 	u16 value16;
 
 	/* Initialize the MAC control */
-	macctl = B43_MACCTL_IHR_ENABLED | B43_MACCTL_SHM_ENABLED;
+	macctl = B43_MACCTL_IHR_ENABLED;
+	/* The vendor driver never sets SHM_ENABLED on AC-PHY cores. */
+	if (!b43_is_ac_core(dev))
+		macctl |= B43_MACCTL_SHM_ENABLED;
 	if (dev->phy.gmode)
 		macctl |= B43_MACCTL_GMODE;
 	macctl |= B43_MACCTL_INFRA;
@@ -3275,6 +3355,9 @@ static int b43_chip_init(struct b43_wldev *dev)
 	if (err)
 		goto err_gpio_clean;
 
+	if (b43_is_ac_core(dev))
+		b43_ac_fifo_init(dev);
+
 	/* Turn the Analog on and initialize the PHY. */
 	phy->ops->switch_analog(dev, 1);
 	err = b43_phy_init(dev);
@@ -3325,6 +3408,10 @@ static int b43_chip_init(struct b43_wldev *dev)
 	b43_write32(dev, B43_MMIO_DMA3_IRQ_MASK, 0x0001DC00);
 	b43_write32(dev, B43_MMIO_DMA4_IRQ_MASK, 0x0000DC00);
 	b43_write32(dev, B43_MMIO_DMA5_IRQ_MASK, 0x0000DC00);
+	if (b43_is_ac_core(dev)) {
+		/* intrcvlazy0: raise the RX interrupt after every frame. */
+		b43_write32(dev, 0x100, 1 << 24);
+	}
 
 	b43_mac_phy_clock_set(dev, true);
 
@@ -3529,6 +3616,15 @@ error:
 
 static void b43_security_init(struct b43_wldev *dev)
 {
+	/*
+	 * rev 40+ (AC) ucode has no key table pointer at the legacy KTP word:
+	 * it reads 0 there, so clearing the "key table" zeroed SHM 0x000-0x3a0
+	 * (rate maps, ACK/CTS PHY control, ucode state) on every core init. AC
+	 * has no hardware crypto support yet, so leave the key memory alone.
+	 */
+	if (b43_ucode_is_ac(dev))
+		return;
+
 	dev->ktp = b43_shm_read16(dev, B43_SHM_SHARED, B43_SHM_SH_KTP);
 	/* KTP is a word address, but we address SHM bytewise.
 	 * So multiply by two.
@@ -4178,6 +4274,9 @@ static int b43_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	if (modparam_nohwcrypt)
 		return -ENOSPC; /* User disabled HW-crypto */
+	if (b43_ucode_is_ac(wl->current_dev))
+		/* no AC key table yet, see b43_security_init */
+		return -EOPNOTSUPP;
 
 	if ((vif->type == NL80211_IFTYPE_ADHOC ||
 	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
