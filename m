Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719760;
	b=Vmepfn9PbSLoQMyhIuXP8uWGvBbSPJEP142FtcaJnJu8G1PS6peKdGUSkhkBhKx9PO3m
	 ZM7SBKkTHKZSoyCTfRb7UH/MkOu7U+YfIiiflqiqB7UoSf4aNZgydgvZU0H2Jdhi27xSl
	 s26wSsdfe9p12gEdQXM/bSJwM0isCWX9Z80Xv015HuX3DraEf6DTp0SldbXY011zkDr2z
	 29wYH5fG0VNfT/Meksk9Z0wi4b9wIvo0xg+mns8YhRgPpOY4Ck2RAU8CONRNgIbOIVtos
	 v1Ws19s21tqRiGVXebKsyKgVk6Q6QCBqei97y9ltk5g52ItTj5XQuMtkJYAYABA2CsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719760;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=IRp/vUgSx3siqa2r4tlj5wIoSALSm2Qw/PThieRVmsE=;
	b=aRQXrgqNjtLODUcQt6586/jYJyCOu5CIGAdC/ZDswDexYoaQNz2NsTCVmtvN/Tz0+V4w
	 e0d1LcszlpK4hrc7yD6gVqcOKRAn9Kxw1SnQy0xHE2NV34Ek/yi/7Ne9Eo7y74S5xp/iK
	 mMSzLOFZpdIogAjZi6EnHQeKjeBVAWmIu36rAVvCRMTjHwl5vEeecYAVptZnOLnanMqAN
	 4RwKoa21G6eTS2aPrDfj8Gh01j5Y4qnePvYP47JV0W9cbzgT8LL+vjSTlKQ/IAC0pu2Jp
	 0I8J6mdHTBhlcH4+DnaOSe2YSG8VY4ziB5fbf8YSxTKUThZwn0RyDGWJi04C0nBJy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b="kG7ks/YY";
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B787606A323
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 19:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B787606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=kG7ks/YY
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id BB0DC61997
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 20:02:32 +0100 (CET)
Received: (qmail 23979 invoked by uid 990); 26 Nov 2026 19:02:32 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Thu, 26 Nov 2026 20:02:32 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: leonard@lausen.nl,
	Luka Gejak <luka.gejak@linux.dev>,
	=?utf-8?q?David_H=C3=A4rdeman?= <david@hardeman.nu>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v4 2/2] wifi: rtw88: sdio: combine free TX page register reads
Date: Thu, 26 Nov 2026 19:02:15 +0000
Message-ID: <20261126190217.1151186-4-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126190217.1151186-2-leonard@lausen.nl>
References: <20261126190217.1151186-2-leonard@lausen.nl>
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
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.599999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=qUALKTmSC/uEQSZiUUS1VM4XTS7tHiQdmA98qD9QLjc=;
	b=kG7ks/YY1rdD+9jZU/qASISGhQWQXYS8JujWvarqU1HpDVgEXXv4zqe9ubCp9W/HiR9U1LUOAh
	KbCr4w2hxxPj9uHlgT/pQbF0c/inahg2bEhHF9jtNOVrx8edC8jySMrXe05XXpMiGClP1thKqBq+
	igVT2OXycpZ/TgX2WxN8LXSU4ZwwO5o564dK0/1XWL2GisVeU3i3X78P5CMpY5TbhlGMcALaf+9V
	MUr+uHWm551mEObNUPqS6RiB8zdW5+Ux0r6djx8SagvTuie0RY2Pv16J3XeJ7C8XghKfaQVl99Pn
	ND2eJb20cxEQJzjvGvbe3NlnlZAez5o9ejyG6mioSpX2yE472swwtOVcTHvpXXa1sFvxiRbPDZYN
	cc6hhJ2T0cmftMsfCCSVgbiXG0pXpViWNC8+5ttX5IQL883MeBzq/XH621tf+BiprsPupwKGin9U
	fUvsJ6WVvt7sQkVzE9OIYF9TzleirbX91LE1U6Q/LH9mS1Wrnqg+jOrCjfLcAjHJC4JPdi2YBfCw
	Z66FdFqO+/+X3dyyZUqD4Fr1oDfpVC7WpErzQD89TOknjADhntmTSCMIkxg1hUHkCiaSiSNG3zr8
	Ckj26N9EMEx7YR13ooDVW1Ue9zq8GVnbeBeIVlA86jssX87RkHdY7dVJlEXwyjmmiFQLuKmRDOFg
	Q=

TX capacity checks on non-8051 chips read three adjacent 32-bit registers
in separate SDIO requests. Combine them into one 12-byte CMD53 read when
the existing power/alignment check permits it, with the per-register
fallback otherwise. Propagate read errors before checking queue capacity.

Allocate a DMA-safe buffer at probe and copy its little-endian values
into the caller's array before releasing the host. Holding the host
through the read and copy serializes access to the shared buffer.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 64 +++++++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/sdio.h |  1 +
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index ecd4d751c05a5..09337acb76749 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -26,6 +26,7 @@
 #define RTW_SDIO_TX_FIFO_HIWATER			16
 #define RTW_SDIO_TX_FIFO_LOWATER			8
 #define RTW_SDIO_TX_RETRY_DELAY			msecs_to_jiffies(1)
+#define RTW_SDIO_FREE_TXPG_COUNT			3
 
 static bool rtw_sdio_is_bus_addr(u32 addr)
 {
@@ -675,6 +676,43 @@ static atomic_t *rtw_sdio_8723bs_free_txpg(struct rtw_dev *rtwdev, u8 queue)
 	}
 }
 
+static int rtw_sdio_read_free_txpg(struct rtw_dev *rtwdev, u32 *free_txpg)
+{
+	u32 addr = rtw_sdio_to_bus_offset(rtwdev, REG_SDIO_FREE_TXPG);
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	bool bus_claim = rtw_sdio_bus_claim_needed(rtwsdio);
+	int i, ret;
+
+	if (bus_claim)
+		sdio_claim_host(rtwsdio->sdio_func);
+
+	if (!rtw_sdio_use_memcpy_io(rtwdev, addr, sizeof(u32))) {
+		for (i = 0; i < RTW_SDIO_FREE_TXPG_COUNT; i++) {
+			free_txpg[i] = rtw_sdio_readl(rtwdev,
+						      addr + i * sizeof(u32),
+						      &ret);
+			if (ret)
+				break;
+		}
+		goto out;
+	}
+
+	ret = sdio_memcpy_fromio(rtwsdio->sdio_func,
+				 rtwsdio->free_txpg_buf, addr,
+				 RTW_SDIO_FREE_TXPG_COUNT * sizeof(__le32));
+	if (!ret) {
+		/* Copy the shared DMA buffer before releasing the host. */
+		for (i = 0; i < RTW_SDIO_FREE_TXPG_COUNT; i++)
+			free_txpg[i] = le32_to_cpu(rtwsdio->free_txpg_buf[i]);
+	}
+
+out:
+	if (bus_claim)
+		sdio_release_host(rtwsdio->sdio_func);
+
+	return ret;
+}
+
 static int rtw_sdio_check_free_txpg(struct rtw_dev *rtwdev, u8 queue,
 				    size_t count)
 {
@@ -727,11 +765,15 @@ static int rtw_sdio_check_free_txpg(struct rtw_dev *rtwdev, u8 queue,
 		/* add the pages from the public queue */
 		pages_free += (free_txpg >> 24) & 0xff;
 	} else {
-		u32 free_txpg[3];
+		u32 free_txpg[RTW_SDIO_FREE_TXPG_COUNT];
+		int ret;
 
-		free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
-		free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
-		free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);
+		ret = rtw_sdio_read_free_txpg(rtwdev, free_txpg);
+		if (ret) {
+			rtw_warn(rtwdev, "Failed to read free TX pages: %d\n",
+				 ret);
+			return ret;
+		}
 
 		switch (queue) {
 		case RTW_TX_QUEUE_BCN:
@@ -1782,6 +1824,7 @@ static void rtw_sdio_deinit_tx(struct rtw_dev *rtwdev)
 int rtw_sdio_probe(struct sdio_func *sdio_func,
 		   const struct sdio_device_id *id)
 {
+	struct rtw_sdio *rtwsdio;
 	struct ieee80211_hw *hw;
 	struct rtw_dev *rtwdev;
 	int drv_data_size;
@@ -1805,6 +1848,19 @@ int rtw_sdio_probe(struct sdio_func *sdio_func,
 	if (ret)
 		goto err_release_hw;
 
+	rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	if (!rtw_chip_wcpu_8051(rtwdev)) {
+		rtwsdio->free_txpg_buf =
+			devm_kmalloc_array(rtwdev->dev,
+					   RTW_SDIO_FREE_TXPG_COUNT,
+					   sizeof(*rtwsdio->free_txpg_buf),
+					   GFP_KERNEL);
+		if (!rtwsdio->free_txpg_buf) {
+			ret = -ENOMEM;
+			goto err_deinit_core;
+		}
+	}
+
 	rtw_dbg(rtwdev, RTW_DBG_SDIO,
 		"rtw88 SDIO probe: vendor=0x%04x device=%04x class=%02x",
 		id->vendor, id->device, id->class);
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
index 6e7e6009744b0..5c2337ccffb2a 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.h
+++ b/drivers/net/wireless/realtek/rtw88/sdio.h
@@ -181,6 +181,7 @@ struct rtw_sdio {
 	atomic_t tx_oqt_free;
 	/* one writer at a time between the credit check and the accounting */
 	struct mutex tx_credit_lock;
+	__le32 *free_txpg_buf;
 };
 
 extern const struct dev_pm_ops rtw_sdio_pm_ops;
