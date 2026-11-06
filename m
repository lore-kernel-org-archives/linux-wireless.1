Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999737;
	b=WvXh3qsCxBLHTWj2YYuIgzkd9uZGfDI8yVNROvM60CeY368ok3VAr+f14cis7bvGybLX
	 A5qX5af9Og9FVHDQvVNQBxN6jp46v0KjeTwGAdqj4pXRci1JDppW0epb4T+jQBGnBwCg+
	 7RF+71NOTlxLb3wxXhHMU8bzfcPyUMyF9YwkDdrXyAeV1ximbU0E2uh5sPfugoK7dhSCG
	 znZqGoobk+Ro5RcljRYGiT1ZIIdP4iOc4uHxvBk5DeM9LEnZtaCBBoRwqxrNEgyjEvP/0
	 ucZWomUeyQ4pj+0p3ySZ26g+gMMvhe6LJPwIzELDnnliYZcGUEwGQjztjrZZ64XjBdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+4ehktDMYHwu9bJdzFTo4QfdTRsY0mtmI49Ie+yd+jU=;
	b=GXTO6TBt/oeYXrUuH2lUZZxzs3meANS6x4lqII2K8a+uXJJZnjuo15I0GPM77ARFit/i
	 x3JoQGvMgx4jTomG8BtE5/tYOVXOoT46UxY47Hw+/sBrkZ/9Bsl8V7N9F0HFz/hIP9Pyf
	 6Kcs+EkesAlu9UU9m0IK7HokAis5KTvlvDsWV2oCizZ3hRWTyuVEXgdKIhpQ2f9BSxFLV
	 fio96JhhUINUUGv98wuymUljl4Ommu5PE2/2kAySC7ab59Jjn8+71IX2oCGuguDfNrPsZ
	 C5dIR2yrpbmM4TmKN/FZ5EWhLfwECZQw5f9wSdAnh0Lu9w7JYeBv8U1fwiOdPAArXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hLv/WNHX";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671EF606A335
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 21:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671EF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLv/WNHX
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so7945715e9.0
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 13:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999736; x=1794604536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4ehktDMYHwu9bJdzFTo4QfdTRsY0mtmI49Ie+yd+jU=;
        b=hLv/WNHXXhmji70IPD3EXpi+E6puetaAoGN9abiY7OXzQuBeX2rquxlwsg4mf3OZyY
         m1CrCM3zNxH4leoQWFPUBtXypawBMWRYBghn+v4AGwH3p0TjwR7lnj2rUYBRJhL+3qDA
         tl7k+5LAV0UkmAG5FZi0I8SSkxoMyjKCu7WdvUwg6dATQkaKMojjDRM610iutINqUT3m
         EkDgC8F4PIwOve+9hGLeYtG2JZ2as86C6obm1uaGVxjRSQc53RjYFPEwNk+4yHYW9hoK
         AWnsPN8kT+h/1wmBQzXhVY7t9WcNCB4Eg0HlqCrgj5ubjL/ZHytJZMSLB1XVq3PqxeBt
         aacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999736; x=1794604536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4ehktDMYHwu9bJdzFTo4QfdTRsY0mtmI49Ie+yd+jU=;
        b=NsXeRxGJ99pSA3pUYn3BHJ9A4M5HT89ZV0vmamLHEX8wkody8b/2YSaoN1l/31DmCg
         ls2S7B7NTi2eQVTMTGklCU4WMktXiIXrRSn7jwlZk6uSCVk0fLvaG/4qL82gG8WlAeqT
         7DpUmhxZtGA+NWrD4I8GN5cGqqR0YDckiS1t9rdHouHkL3ab8I3kJzZjRfPuPIkAqSg5
         70qA0jbBJmnpfPmVKMLtSGfW5S9QbfBHO2gBCHupTGazXuASwgNHcOrdJ9AFg8dTNgtv
         UnRVpuRVMtpaDo7FS2RzlzZarvg7AYxzh4Zp97C5Io8OGsYezwafE+4zu55TaOoXm8wF
         fiTA==
X-Gm-Message-State: APuU4Z+8MqeC+mFRlNBk3NCLbdE/VfsynTCNZIfei6aclwu3nFyf75WT
	nc/zA8BT6d9QoN2saSyRg3/5lUoBtImR+zwNzxqWXm5x+8q3d27urI4s6Gu+D2ri
X-Gm-Gg: AYBFou0NZ6CRRhqZR61fJcbQEpauuxp53jJj7B2wrTBkIFUZFxEmAM+gEqWjWEzGbJY
	6ey62SF1VCz8aKH8B0dM9gDeS9buEO3gXEdI9WVqlMTXxz/eCqm0rmEkwKZEp4HweZf0Av+Oiy2
	g9+qXIAWhD6mh4Ra0WeZvefOkfA+p8fePVw3Qgktowpzb13jYkXz3kTFXtEYALxZQT6sSo4pQBp
	6lY+onAQyL/PiGxF+xpY5+xdfrR3o2bFtG/ju/3agCsBmbHoXOPKHIrIJPcPKwtD5zLDYbHA1Xk
	j7upICM1iQxeHaChlrVS9bhmI4IJQhjcBoV4mazBY2go3NBPyW5WIjr1VGr27LtlwEVENPg3E/p
	Ghx/ExT2Kzt05O5BobiD6wnI7tPo0AUfDz4+B0p4f6ayOgz+N7fRlwtLj5n1OniKqPVSf+XodG5
	nPlDxOw3NS1RlL0usdtCW81Gmgcp+jIHaHvkdHVzbtCxE5L6OM83fyJIV6FsPNFxnFtl9nOUADr
	yS7Y10OGpv1LI284NIz31rP4puG3vqqru3NXIlsRnx7Km559ub+/WtlwD6xS/XZ0KOa8CaoCZKf
	4BsJKep5GrKMgJRHYl7vbU4y+e90Lx4Ct6vdRItcNl+CpiDCKEA=
X-Received: by 2002:a05:600c:1552:b0:4ac:b0b2:fa12 with SMTP id 5b1f17b1804b1-4b6db4a9a1fmr62927835e9.1.1793999735689;
        Fri, 06 Nov 2026 13:15:35 -0800 (PST)
Received: from luca-HP-ProBook-650-G1.lan ([2001:b07:6454:c33e:970a:d82:3e9:48ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm18070765e9.3.2026.11.06.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:15:35 -0800 (PST)
From: Luca Casati <luk00casati@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	arend.vanspriel@broadcom.com,
	b43-dev@lists.infradead.org,
	alessio.ferri@mythread.it,
	Luca Casati <luk00casati@gmail.com>
Subject: [PATCH wireless-next v2 2/5] b43: N-PHY: fix TX IQ/LO calibration
Date: Fri,  6 Nov 2026 22:15:13 +0100
Message-ID: <20261106211516.273791-3-luk00casati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106211516.273791-1-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
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

Several bugs kept the TX IQ/LO calibration from working, and on rev7+
it left TX dead afterwards:

- The busy poll on IQLOCAL_CMD was inverted: bits 15:14 are set while a
  step runs, so it stopped waiting as soon as the step started.
- The final copy was reversed: it wrote the stale buffer over the best
  coefficients (table 15 at 96) and read the active ones (at 80), so the
  result was never applied.
- TxCalPhyCleanup lacked the rev7+ part of brcmsmac's
  wlc_phy_txcal_phycleanup_nphy(): the 0x80 and 0x8 (PA power-up) RF
  overrides set up for the cal were left in place.
- There was no counterpart to b43_nphy_tx_cal_radio_setup_rev7(), so the
  TSSI/IQ-cal path stayed switched in. Add one, following
  wlc_phy_txcal_radio_cleanup_nphy().
- The TRSW override for the second core used 8, which does not fit the
  2-bit field on rev7+; use 2 as wl does.

With these, on a BCM43228 (N-PHY rev 16, radio 2057 rev 9) the final
coefficients are close to the proprietary wl driver's, though not
equal.

mmiotraces: https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch2-iqlo-poll.txt
            https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch2-trsw.txt
            https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch2-coefficients.txt

Found and fixed with the help of an AI coding assistant (Claude Opus 5.5),
by comparing mmiotraces of b43 and wl on the same card.

Signed-off-by: Luca Casati <luk00casati@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 73 +++++++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index c4e6c1ac0..6b0140f05 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -4775,6 +4775,32 @@ static void b43_nphy_tx_cal_radio_setup_rev7(struct b43_wldev *dev)
 	}
 }
 
+static void b43_nphy_tx_cal_radio_cleanup(struct b43_wldev *dev)
+{
+	struct b43_phy *phy = &dev->phy;
+	u16 *save = dev->phy.n->tx_rx_cal_radio_saveregs;
+	int core, off;
+	u16 r;
+
+	if (phy->rev < 7 || phy->rev >= 19)
+		return;
+
+	for (core = 0; core < 2; core++) {
+		r = core ? 0x20 : 0;
+		off = core * 11;
+
+		b43_radio_write(dev, r + R2057_TX0_TX_SSI_MASTER, save[off + 0]);
+		b43_radio_write(dev, r + R2057_TX0_IQCAL_VCM_HG, save[off + 1]);
+		b43_radio_write(dev, r + R2057_TX0_IQCAL_IDAC, save[off + 2]);
+		b43_radio_write(dev, r + R2057_TX0_TSSI_VCM, save[off + 3]);
+		b43_radio_write(dev, r + R2057_TX0_TX_SSI_MUX, save[off + 5]);
+		if (phy->radio_rev != 5)
+			b43_radio_write(dev, r + R2057_TX0_TSSIA, save[off + 6]);
+		b43_radio_write(dev, r + R2057_TX0_TSSIG, save[off + 7]);
+		b43_radio_write(dev, r + R2057_TX0_TSSI_MISC1, save[off + 8]);
+	}
+}
+
 /* https://bcm-v4.sipsolutions.net/802.11/PHY/N/TxCalRadioSetup */
 static void b43_nphy_tx_cal_radio_setup(struct b43_wldev *dev)
 {
@@ -5033,7 +5059,9 @@ static struct nphy_txgains b43_nphy_get_tx_gains(struct b43_wldev *dev)
 /* https://bcm-v4.sipsolutions.net/802.11/PHY/N/TxCalPhyCleanup */
 static void b43_nphy_tx_cal_phy_cleanup(struct b43_wldev *dev)
 {
-	u16 *regs = dev->phy.n->tx_rx_cal_phy_saveregs;
+	struct b43_phy *phy = &dev->phy;
+	struct b43_phy_n *nphy = dev->phy.n;
+	u16 *regs = nphy->tx_rx_cal_phy_saveregs;
 
 	if (dev->phy.rev >= 3) {
 		b43_phy_write(dev, B43_NPHY_AFECTL_C1, regs[0]);
@@ -5047,7 +5075,37 @@ static void b43_nphy_tx_cal_phy_cleanup(struct b43_wldev *dev)
 		b43_phy_write(dev, B43_NPHY_RFCTL_INTC2, regs[8]);
 		b43_phy_write(dev, B43_NPHY_PAPD_EN0, regs[9]);
 		b43_phy_write(dev, B43_NPHY_PAPD_EN1, regs[10]);
+
+		if (phy->rev >= 19)
+			b43_nphy_rf_ctl_override_rev19(dev, 0x80, 0, 0, true,
+						       1);
+		else if (phy->rev >= 7)
+			b43_nphy_rf_ctl_override_rev7(dev, 0x80, 0, 0, true, 1);
+
 		b43_nphy_reset_cca(dev);
+
+		if (nphy->use_int_tx_iq_lo_cal) {
+			if (phy->rev >= 19) {
+				b43_nphy_rf_ctl_override_rev19(dev, 0x8, 0, 0x3,
+							       true, 0);
+			} else if (phy->rev >= 8) {
+				b43_nphy_rf_ctl_override_rev7(dev, 0x8, 0, 0x3,
+							      true, 0);
+			} else if (phy->rev == 7) {
+				bool ghz2 = b43_current_band(dev->wl) ==
+					    NL80211_BAND_2GHZ;
+
+				b43_radio_maskset(dev, ghz2 ?
+						  R2057_PAD2G_TUNE_PUS_CORE0 :
+						  R2057_IPA5G_CASCOFFV_PU_CORE0,
+						  ~1, 1);
+				b43_radio_maskset(dev, ghz2 ?
+						  R2057_PAD2G_TUNE_PUS_CORE1 :
+						  R2057_IPA5G_CASCOFFV_PU_CORE1,
+						  ~1, 1);
+				b43_radio_mask(dev, R2057_OVR_REG0, ~(1 << 4));
+			}
+		}
 	} else {
 		b43_phy_maskset(dev, B43_NPHY_AFECTL_C1, 0x0FFF, regs[0]);
 		b43_phy_maskset(dev, B43_NPHY_AFECTL_C2, 0x0FFF, regs[1]);
@@ -5102,7 +5160,8 @@ static void b43_nphy_tx_cal_phy_setup(struct b43_wldev *dev)
 			b43_nphy_rf_ctl_intc_override(dev, N_INTC_OVERRIDE_PA,
 						      0, 3);
 		b43_nphy_rf_ctl_intc_override(dev, N_INTC_OVERRIDE_TRSW, 2, 1);
-		b43_nphy_rf_ctl_intc_override(dev, N_INTC_OVERRIDE_TRSW, 8, 2);
+		b43_nphy_rf_ctl_intc_override(dev, N_INTC_OVERRIDE_TRSW,
+					      phy->rev >= 7 ? 2 : 8, 2);
 
 		regs[9] = b43_phy_read(dev, B43_NPHY_PAPD_EN0);
 		regs[10] = b43_phy_read(dev, B43_NPHY_PAPD_EN1);
@@ -5480,10 +5539,13 @@ static int b43_nphy_cal_tx_iq_lo(struct b43_wldev *dev,
 			b43_phy_write(dev, B43_NPHY_IQLOCAL_CMD, cmd);
 			for (i = 0; i < 2000; i++) {
 				tmp = b43_phy_read(dev, B43_NPHY_IQLOCAL_CMD);
-				if (tmp & 0xC000)
+				if (!(tmp & 0xC000))
 					break;
 				udelay(10);
 			}
+			if (i == 2000)
+				b43err(dev->wl, "TX IQ/LO cal step 0x%04x timed out\n",
+				       cmd);
 
 			b43_ntab_read_bulk(dev, B43_NTAB16(15, 96), length,
 						buffer);
@@ -5500,8 +5562,8 @@ static int b43_nphy_cal_tx_iq_lo(struct b43_wldev *dev,
 		last = (dev->phy.rev < 3) ? 6 : 7;
 
 		if (!mphase || nphy->mphase_cal_phase_id == last) {
-			b43_ntab_write_bulk(dev, B43_NTAB16(15, 96), 4, buffer);
-			b43_ntab_read_bulk(dev, B43_NTAB16(15, 80), 4, buffer);
+			b43_ntab_read_bulk(dev, B43_NTAB16(15, 96), 4, buffer);
+			b43_ntab_write_bulk(dev, B43_NTAB16(15, 80), 4, buffer);
 			if (dev->phy.rev < 3) {
 				buffer[0] = 0;
 				buffer[1] = 0;
@@ -5540,6 +5602,7 @@ static int b43_nphy_cal_tx_iq_lo(struct b43_wldev *dev,
 
 	b43_nphy_tx_cal_phy_cleanup(dev);
 	b43_ntab_write_bulk(dev, B43_NTAB16(7, 0x110), 2, save);
+	b43_nphy_tx_cal_radio_cleanup(dev);
 
 	if (dev->phy.rev < 2 && (!mphase || nphy->mphase_cal_phase_id == last))
 		b43_nphy_tx_iq_workaround(dev);
-- 
2.43.0

