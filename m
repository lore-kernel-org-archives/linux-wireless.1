Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794130970;
	b=2lgnxsYgZWPCbfOMpCG3vvj0/ItwEBVvwQ8V+pQzS6o5hvzOz5KCihqat4peDuWN85Ic
	 mYQw7DZF1Q9hFn6jiO41DArOFK1OKWdkPzFOupxCDUT5zVS7fA7tJVc/HSuLt2VSPGuwg
	 fNFCykbZBE/vl/7Seusu2xljlEqFppd1jIbPE5QXfk+Shj/lgALyYMcijTzULq2sbyqcM
	 arilBAGqHqKUySKb5hHvE2GL03iPS2P3YEsfwJzgAZbtcmB+jlOhj/XxNqG8ShW+ZBsa6
	 0chE98l1uWydLfuJacJMeYEaKYclo7dAjw4jYZ+nl0+n5l6wVIMj6wn2BgIS0vAchIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130970;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TNxrxA8H/0vsXBYqV7zmnmSWX4moNrkvAsa4iARD+vI=;
	b=i1vJpnEI1bmtQRUXLaih0PgQVQRIj+hb40RI5Kv58KbnXY0SBJWCzjX91G6TqQy+8ifv
	 2SCW8+UlnBqGj/kFhTAMFBnseyZBAun8eIqHoFrmCFIxYzjgTxFTusVELvSpbR8tLUwhw
	 8GH32ylyp36kKWdmOfGtYrauorfsFaWR9RZybaar0/0RjfoWG6SG97cq0/622AsMLDsrs
	 Hek+vvg7P8xYa2wzabfn7tNuI502jYRIN/7tzIzNBcNcHHEeA8xbZnZU0ED3ljHvdlIp3
	 L20RZdWs44vZ5RQV/ipDZ8VPUhDSum0jTelcxwyXWLMWIkRnAKQ4A4P2QzDJhUa4gUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQpirjeI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72093606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQpirjeI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794130970;
	b=fFyAK3rtIM7LZrn7eeNTTrWbAh8Abgn7Vi3laxjjeo1qNhTTCw6Mi3A813RSlSG3R4Q0
	 Btuc9NJgICfurCgd9paXcwPmmBJHVwMjVO9D/fo4ut364BDZj/iNr8+HQbj6lSpG/REK9
	 qsXoBzQ9ckisqTzqNrtc64aUwdFQAdtPcS8d56rdyKYw8nzpPInbe+uR0UnGpG/WnSYqk
	 W8CHwnrLT3JDv2LGeh9s0/if4QXRlrwk46phk4vfJI3PhdXJY/IF8jB8+FS+W6RTl2zQ4
	 1abIlJBI/lw9jkm1R31ky3pNFxh6QqqiHa3fQNO6BXRRHyGCh3vnnAgiIa6boY9Jxjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794130970;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TNxrxA8H/0vsXBYqV7zmnmSWX4moNrkvAsa4iARD+vI=;
	b=WHvXnnebcLNxCH65+4wMl0nlYzO+h0cXgrqpWla7ULjsZbJFpat6aM1DpCki649Jc140
	 EBrqu7bnqewB1ewi/si1EARybp4IDw1RwK5Wvj3CmDUGVKyfxxiLIyjfm8HZiFbT1TOCG
	 sF7z3+GssC1jJMl3D5UfOvRkRl5vtYvCDEyW1KhkBAV3H0B7gDs9jBLveH+9jIgdL6iBY
	 QNfPLMbmzhv/fP/GxdZUSDATeot8Ujla/PzIN3YvPlAjb8xLYQSZnif2jXdky82KQInhK
	 aERdQtNtnTfwHFJrp22+GtcjQeEcZ4SkrFD7y4HoBfoZvOVQguXHrbpA6iZfczzJboA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52A221F0089F;
	Sun,  8 Nov 2026 09:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794130970;
	bh=TNxrxA8H/0vsXBYqV7zmnmSWX4moNrkvAsa4iARD+vI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XQpirjeI06z8tB9dPVRp6NyDp2YxIny/uOoRcoK8WeoJLlJBPO9XS4/Ed1JtMnjoa
	 p+r2gkzbAT2XoR1oYHMD7Rvt6OaciUJhr+QgHy3NphH/vnPIaF8Dzh7BiEW6/6yxEA
	 c9MSguFYGVzEo/+zcKRZt6OT85+RxPln1tzWnQKFGGWF/XZATkjzCRzjWBsHZ1QqCN
	 mIoftQj1j24uzFqySlZ1u7MymTOfj2/HYV9rqYhT5Felpj1pzrd+fUMWEcqRYrSeb+
	 vPeaYdbAB1MpYwj8jl1AQKJMCMlo9++4eR4D4HSUxGAAOq+PvqkVAues4Up735zU3H
	 z9pIMwByBITjA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A406A47EB2;
	Sun,  8 Nov 2026 09:42:48 +0000 (UTC)
From: Tapparit Rukthawornwong via B4 Relay <devnull+lnwgorou.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 16:42:48 +0700
Subject: [PATCH rtw-next] wifi: rtl8xxxu: Allocate the USB control buffer
 separately
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-b4-rtl8xxxu-usb-buf-v1-1-ed021a85a2b9@gmail.com>
X-B4-Tracking: v=1; b=H4sIABdE8GoC/y2N2w6CMBBEf4Xss03aAhX8FcNDt120RkB70SaEf
 7cqj5OZc2aFQN5RgFO1gqeXC26ZSxCHCsxVzxdizpYMkkslBO8YNszHe5dzTiwFZJhGRjQS7ww
 iHQUU8uFpdPlnPYOPbzZTjjD8m5DwRiZ+pfvW0zOV47gDqAMxs0yTi6dKdbJtRqksStNbpbWty
 fatEjVXupHatMYKiRaGbfsA+TnT1s0AAAA=
X-Change-ID: 20261108-b4-rtl8xxxu-usb-buf-eefe08cbbe71
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>, 
 Tapparit Rukthawornwong <lnwgorou@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794130968; l=7286;
 i=lnwgorou@gmail.com; s=20261108; h=from:subject:message-id;
 bh=dNjnSq3N4Mwjn9G3t+fdLPbx8SBCNF4piGdeLekO5SY=;
 b=T88CJu+VwV/CCAN+hTy0JGXA5qeoBnLBUC91EI5bzRIjkBiuU6GmJJz0PE0PLhXw+Cw7yrnGu
 8WclYJNUbndDw+Yujh+CuYGXb3KJI6jx1J5fgjy9ud73qBKXThyx9c0
X-Developer-Key: i=lnwgorou@gmail.com; a=ed25519;
 pk=8WEwKHBIASdtw3lGPDNcE6GtCKtJk8d5jPGcCN/n4z0=
X-Endpoint-Received: by B4 Relay for lnwgorou@gmail.com/20261108 with
 auth_id=1452
X-Original-From: Tapparit Rukthawornwong <lnwgorou@gmail.com>
Reply-To: lnwgorou@gmail.com
Content-Transfer-Encoding: 7bit

From: Tapparit Rukthawornwong <lnwgorou@gmail.com>

priv->usb_buf receives the data of every control-IN transfer used for
register reads, but it is embedded in struct rtl8xxxu_priv directly
after usb_buf_mutex. On CPUs with DMA-incoherent caches the two share a
cache line, which Documentation/core-api/dma-api-howto.rst says can
corrupt data.

This happens in practice. When another task contends for usb_buf_mutex
while a read is in flight, the CPU writes to that cache line, and the
device's data can be lost when the buffer is unmapped. usb_control_msg()
still returns the full length, but the read returns stale buffer
contents, typically the value of the previous register write. The driver
then writes that value back in a read-modify-write.

On an RTL8192EU, a stale read of REG_FPGA0_XA_HSSI_PARM2 (0x824) during a
scan is written back, after which the chip stops receiving and does not
recover on its own. REG_FPGA0_POWER_SAVE (0x818) also drifts away from
its init value without obvious symptoms.

Aligning the field inside the struct is not enough: the struct lives in
the mac80211 private area, which is only NETDEV_ALIGN (32 byte) aligned.
devm_kzalloc() returns ARCH_DMA_MINALIGN aligned memory, so allocate the
buffer separately.

Tested on a Raspberry Pi 2 (BCM2836, dwc_otg, 32-bit, 6.18.50 with this
change backported) with a TP-Link TL-WN823N v2 (RTL8192EU), triggering a
scan every 15 seconds:

  unpatched:  599 scans, 9 receive hangs with 0x824 corrupted, plus
              2 other connection failures with 0x824 intact
  patched:   1200 scans, no failures, 0x818 and 0x824 correct at
              every check

To look at the reads directly, a test build put a sentinel in the buffer
before each read and re-read when it came back unchanged. 300 scans per
layout:

  buffer next to the mutex (current):  72 of 193 contended reads stale,
                                       0 of ~260000 uncontended reads
  buffer in its own cache line:        0 of 214 contended reads stale
  buffer from devm_kzalloc():          0 of 270 contended reads stale

The re-read always returned the expected value, so the device answered
correctly and only the host-side buffer was stale.

Signed-off-by: Tapparit Rukthawornwong <lnwgorou@gmail.com>
---
priv->int_buf has the same layout (embedded, next to CPU-written
fields) and is used by chips that set usb_interrupts. The RTL8192EU
does not use it, so I could not test a change there and left it alone.
---
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h   |  2 +-
 .../net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c  | 30 +++++++++++++---------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
index fd92d23..de5d9a7 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
@@ -1875,7 +1875,7 @@ struct rtl8xxxu_priv {
 		__le32 val32;
 		__le16 val16;
 		u8 val8;
-	} usb_buf;
+	} *usb_buf;
 	union {
 		u8 raw[EFUSE_MAP_LEN];
 		struct rtl8723au_efuse efuse8723;
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
index efddbe4..9af0b0c 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
@@ -663,9 +663,9 @@ u8 rtl8xxxu_read8(struct rtl8xxxu_priv *priv, u16 addr)
 	mutex_lock(&priv->usb_buf_mutex);
 	len = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 			      REALTEK_USB_CMD_REQ, REALTEK_USB_READ,
-			      addr, 0, &priv->usb_buf.val8, sizeof(u8),
+			      addr, 0, &priv->usb_buf->val8, sizeof(u8),
 			      RTW_USB_CONTROL_MSG_TIMEOUT);
-	data = priv->usb_buf.val8;
+	data = priv->usb_buf->val8;
 	mutex_unlock(&priv->usb_buf_mutex);
 
 	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_REG_READ)
@@ -686,9 +686,9 @@ u16 rtl8xxxu_read16(struct rtl8xxxu_priv *priv, u16 addr)
 	mutex_lock(&priv->usb_buf_mutex);
 	len = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 			      REALTEK_USB_CMD_REQ, REALTEK_USB_READ,
-			      addr, 0, &priv->usb_buf.val16, sizeof(u16),
+			      addr, 0, &priv->usb_buf->val16, sizeof(u16),
 			      RTW_USB_CONTROL_MSG_TIMEOUT);
-	data = le16_to_cpu(priv->usb_buf.val16);
+	data = le16_to_cpu(priv->usb_buf->val16);
 	mutex_unlock(&priv->usb_buf_mutex);
 
 	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_REG_READ)
@@ -709,9 +709,9 @@ u32 rtl8xxxu_read32(struct rtl8xxxu_priv *priv, u16 addr)
 	mutex_lock(&priv->usb_buf_mutex);
 	len = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 			      REALTEK_USB_CMD_REQ, REALTEK_USB_READ,
-			      addr, 0, &priv->usb_buf.val32, sizeof(u32),
+			      addr, 0, &priv->usb_buf->val32, sizeof(u32),
 			      RTW_USB_CONTROL_MSG_TIMEOUT);
-	data = le32_to_cpu(priv->usb_buf.val32);
+	data = le32_to_cpu(priv->usb_buf->val32);
 	mutex_unlock(&priv->usb_buf_mutex);
 
 	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_REG_READ)
@@ -729,10 +729,10 @@ int rtl8xxxu_write8(struct rtl8xxxu_priv *priv, u16 addr, u8 val)
 		addr |= 0x8000;
 
 	mutex_lock(&priv->usb_buf_mutex);
-	priv->usb_buf.val8 = val;
+	priv->usb_buf->val8 = val;
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 			      REALTEK_USB_CMD_REQ, REALTEK_USB_WRITE,
-			      addr, 0, &priv->usb_buf.val8, sizeof(u8),
+			      addr, 0, &priv->usb_buf->val8, sizeof(u8),
 			      RTW_USB_CONTROL_MSG_TIMEOUT);
 
 	mutex_unlock(&priv->usb_buf_mutex);
@@ -752,10 +752,10 @@ int rtl8xxxu_write16(struct rtl8xxxu_priv *priv, u16 addr, u16 val)
 		addr |= 0x8000;
 
 	mutex_lock(&priv->usb_buf_mutex);
-	priv->usb_buf.val16 = cpu_to_le16(val);
+	priv->usb_buf->val16 = cpu_to_le16(val);
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 			      REALTEK_USB_CMD_REQ, REALTEK_USB_WRITE,
-			      addr, 0, &priv->usb_buf.val16, sizeof(u16),
+			      addr, 0, &priv->usb_buf->val16, sizeof(u16),
 			      RTW_USB_CONTROL_MSG_TIMEOUT);
 	mutex_unlock(&priv->usb_buf_mutex);
 
@@ -774,10 +774,10 @@ int rtl8xxxu_write32(struct rtl8xxxu_priv *priv, u16 addr, u32 val)
 		addr |= 0x8000;
 
 	mutex_lock(&priv->usb_buf_mutex);
-	priv->usb_buf.val32 = cpu_to_le32(val);
+	priv->usb_buf->val32 = cpu_to_le32(val);
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 			      REALTEK_USB_CMD_REQ, REALTEK_USB_WRITE,
-			      addr, 0, &priv->usb_buf.val32, sizeof(u32),
+			      addr, 0, &priv->usb_buf->val32, sizeof(u32),
 			      RTW_USB_CONTROL_MSG_TIMEOUT);
 	mutex_unlock(&priv->usb_buf_mutex);
 
@@ -7882,6 +7882,12 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
 	priv->udev = udev;
 	priv->fops = (struct rtl8xxxu_fileops *)id->driver_info;
 	mutex_init(&priv->usb_buf_mutex);
+	priv->usb_buf = devm_kzalloc(&interface->dev, sizeof(*priv->usb_buf),
+				     GFP_KERNEL);
+	if (!priv->usb_buf) {
+		ret = -ENOMEM;
+		goto err_put_dev;
+	}
 	mutex_init(&priv->syson_indirect_access_mutex);
 	mutex_init(&priv->h2c_mutex);
 	mutex_init(&priv->sta_mutex);

---
base-commit: 68254f26db2c9d6aad3ed9561306a42ac5cd12bd
change-id: 20261108-b4-rtl8xxxu-usb-buf-eefe08cbbe71

Best regards,
--  
Tapparit Rukthawornwong <lnwgorou@gmail.com>


