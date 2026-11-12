Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460178;
	b=k/wFTUrzIEv1Q9OLZA8AjAMpQrqR8VgXGc2T5YTovBMpkRL322x6Ky9QmymNOv1MWKOh
	 sDObLvxBVqvbIpwng8bz20s9Ze8crnYEAxkgKfBxiVXh3X0TjsMQ4iKEF4cBLIAzNtbFj
	 iXWhMGeWOGh5HpqfckkeI2mGw05gQpHfJrdi45hwdcV5FtNonEWENSJItB+sAKlDMNigu
	 o99qcNpJtdecrlsHb/Sw9XKgDGbPxm6qkT1wSyMP4Xf9JdD8YMT+bnjwTWfJxTmjLLQPC
	 2JeUzgABfy+1ATPcqof2aw14Manqqd+ueYX4S8h/9kOdvUHpZtEW302c2ySq1NA5lfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
	b=PVbfpvBOEOMXOMOXLUGZ0RWhWMuQWajx4dfvCJHT29ugQnsY0C1jdlXIEAj2hKdmp/Zk
	 YRSjWBzawdYskqGa+P1QjXC0WJIiLyoQAK9RMS4kFItMcv4Ng3oEL/BSvII36Jw7NxkY0
	 nQuoMgrpSFLibsOn9B0OMVnkXX9Aca4XScCuOwCsdMqCkvv6bzu3H6q2cfCEvE2AQuTK0
	 msvF0WtzXY83/jtfAYUt7HaBvgPSzAVOkj/CE4IE7UkE28LhOQCq8H5tccM1jHTXXEi2m
	 IUGO/13v4Rxg8njzkn6rqheZLopK1Nf0DGpM8p/rPIKsZvrR+672GeOW7hDcvqKXbrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvEgGSAJ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7903606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7903606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvEgGSAJ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso4943561eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460177; x=1795064977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
        b=uvEgGSAJdPlE+0MbfNEHzpFg9qOC+Z5pg1ohg/tyFdZoj3SQRH/5iqUEQFcL0J/EqF
         BLqPwIeXiU9TnULiEHHHKOp4U/IbJOcVeFMEgXf2eF5Z3idUzzH/GIJSeRsRdURcSmN+
         A0yoqh2Y1JyYYTcVH4chUFmZwMcqEs2s2QTZB821tlZo85XR/5uXGHOhcC93i9q/FR0E
         eR1DUNR2zRvulBBzCuBc/R2ZS/GVV5aeV+mK/iNV221j91cfyTbZNjtBkNIAER/JzCvI
         4KujnxLVtVVraJ93Mm4qhyfJIn6B6TgREMaCD+ywiIjYjlKRx/6xNuXHB0vIExJpW43X
         aNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460177; x=1795064977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GX4UBF4+o9VP0UVeZf0hRho2t5z7boGHcIQ9wJV6Itc=;
        b=slJ3c2KHz3pma1BiajgLy1D7CXxjwZnXVRmgxyWHfiTmQ8Z/OYpnv1j7bic/YgRBw0
         rXa2Rc3MoZBXO/Pw5MQKxC/zOCpnhmuq8hvzgI7OhjGkY2+FQFuU6FINRdPsfUC838i9
         EvwEgCv1m5dOFxBn6O9o0LYgDcvZ9s/7RNMSJDUfBcEa5R2MPM9tYfqEubbosQZYn2z4
         T8D5bA609G8HvEu6KlEoGPm3kt9e7anMarGUibWn+ez9N6V6QW9WhM5nS85Qd1q9KjgA
         WaOOpef3ZbMAnDq4zu7Sii3BpI4YAZldDw80jG63/b2Cm24eDyW5Gf3mw5KtR15BK0Nc
         vaBg==
X-Gm-Message-State: APuU4Z/UM5fWAio1oWCqlXVijwoi0O7Mb6DvLUKxJKN9ukPTsIjmT+J3
	Xa1eHQU5dvQSwBHaTP5OI7OP3tKUbleGROe2FlNBaKu4cN+DUOE2I7QfN2sRr1NK
X-Gm-Gg: AYBFou2XXrUU6p9oVHux3IkwBwisCtew/cXYTQXLJXiSeSFisxmrPPgq0jiu6ySbz/F
	3UtW53aY+mHblNxE13Xb/XoRhy8B5tPExgGzg1DFsIPHVp2wYZ20KpOiLscs4eVr/2tjH2InHE/
	kzY0pRu2qOXulLinwQSdp90UsUOpuuzn7GBuLTeGaxpHpJfE/96reqqedh/jFks6CPm/kp91R3H
	h3ksJalaTM8UZ7+7+VVqgBWgDYMr67x8v7OCND+z3KW21qluOZuWi4RDYs8InRL+N/oakNo7K4T
	RBnQj2KYasFsr2itzgrFpICrysigczd1m40qJalpE6KDtcc7ZLIKnkwSchL8m7INH1+jt5DWrrx
	4hMtRyyN53tEpaCoZr2TVZgenIWlgAzK/4VdVL8RluQvBiCnUAIXoma8P/FFyx5ty8LBKTmlRYz
	jSvLEL8RJlzJg8qmFRZmk5tf5mFvWeAvVschZIsnIjLS02csRaaUg9rKu7FOKUjTXs59LH5CDtx
	Qzvu29Hf0trVNiPAcV0xIC4bg2Girl6sXPxXPiXVANLaZzsfRUOtuszwJhn5sIieYrwQQajHsIh
	y/cmAgWyfaxu5HSkdZoucO0r5BIfXyIICAWuQobnN9IBa1TUWQt5zbQ=
X-Received: by 2002:a05:7300:d404:b0:372:32a1:b384 with SMTP id 5a478bee46e88-3768695036dmr4937182eec.33.1794460176694;
        Wed, 11 Nov 2026 21:09:36 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm19537627eec.13.2026.11.11.21.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:09:36 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Thu, 12 Nov 2026 13:08:15 +0800
Message-ID: <20261112050816.2795512-1-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Broadcom USB bootloader downloads firmware the same way for other
USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
firmware header and response layouts from brcmfmac's usb.c to a header
in the shared include directory, so that other drivers can use them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
In preparation for the brcmbmac driver.

 .../broadcom/brcm80211/brcmfmac/usb.c         | 68 +---------------
 .../broadcom/brcm80211/include/brcm_usb_rdl.h | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+), 67 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
index b41949a9bd..e48f064682 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
@@ -12,6 +12,7 @@
 #include <brcmu_utils.h>
 #include <brcm_hw_ids.h>
 #include <brcmu_wifi.h>
+#include <brcm_usb_rdl.h>
 #include "bus.h"
 #include "debug.h"
 #include "firmware.h"
@@ -26,8 +27,6 @@
 #define BRCMF_USB_RESET_GETVER_SPINWAIT	100	/* in unit of ms */
 #define BRCMF_USB_RESET_GETVER_LOOP_CNT	10
 
-#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
-						   has boot up */
 #define BRCMF_USB_NRXQ			50
 #define BRCMF_USB_NTXQ			50
 
@@ -52,71 +51,6 @@ static const struct brcmf_firmware_mapping brcmf_usb_fwnames[] = {
 	BRCMF_FW_ENTRY(CY_CC_4373_CHIP_ID, 0xFFFFFFFF, 4373)
 };
 
-#define TRX_MAGIC		0x30524448	/* "HDR0" */
-#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
-#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
-#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
-#define TRX_OFFSETS_DLFWLEN_IDX	0
-
-/* Control messages: bRequest values */
-#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
-#define DL_CHECK_CRC	1	/* currently unused */
-#define DL_GO		2	/* execute downloaded image */
-#define DL_START	3	/* initialize dl state */
-#define DL_REBOOT	4	/* reboot the device in 2 seconds */
-#define DL_GETVER	5	/* returns the bootrom_id_t struct */
-#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
-				 * event to occur in 2 seconds.  It is the
-				 * responsibility of the downloaded code to
-				 * clear this event
-				 */
-#define DL_EXEC		7	/* jump to a supplied address */
-#define DL_RESETCFG	8	/* To support single enum on dongle
-				 * - Not used by bootloader
-				 */
-#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
-				 * if resp unavailable
-				 */
-
-/* states */
-#define DL_WAITING	0	/* waiting to rx first pkt */
-#define DL_READY	1	/* hdr was good, waiting for more of the
-				 * compressed image
-				 */
-#define DL_BAD_HDR	2	/* hdr was corrupted */
-#define DL_BAD_CRC	3	/* compressed image was corrupted */
-#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
-#define DL_START_FAIL	5	/* failed to initialize correctly */
-#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
-				 * value
-				 */
-#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
-
-
-struct trx_header_le {
-	__le32 magic;		/* "HDR0" */
-	__le32 len;		/* Length of file including header */
-	__le32 crc32;		/* CRC from flag_version to end of file */
-	__le32 flag_version;	/* 0:15 flags, 16:31 version */
-	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
-					 * header
-					 */
-};
-
-struct rdl_state_le {
-	__le32 state;
-	__le32 bytes;
-};
-
-struct bootrom_id_le {
-	__le32 chip;		/* Chip id */
-	__le32 chiprev;		/* Chip rev */
-	__le32 ramsize;		/* Size of  RAM */
-	__le32 remapbase;	/* Current remap base address */
-	__le32 boardtype;	/* Type of board */
-	__le32 boardrev;	/* Board revision */
-};
-
 struct brcmf_usbdev_info {
 	struct brcmf_usbdev bus_pub; /* MUST BE FIRST */
 	spinlock_t qlock;
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
new file mode 100644
index 0000000000..bf6665d33f
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2011 Broadcom Corporation
+ */
+
+#ifndef	_BRCM_USB_RDL_H_
+#define	_BRCM_USB_RDL_H_
+
+#include <linux/types.h>
+
+#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
+						   has boot up */
+
+#define TRX_MAGIC		0x30524448	/* "HDR0" */
+#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
+#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
+#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
+#define TRX_OFFSETS_DLFWLEN_IDX	0
+
+/* Control messages: bRequest values */
+#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
+#define DL_CHECK_CRC	1	/* currently unused */
+#define DL_GO		2	/* execute downloaded image */
+#define DL_START	3	/* initialize dl state */
+#define DL_REBOOT	4	/* reboot the device in 2 seconds */
+#define DL_GETVER	5	/* returns the bootrom_id_t struct */
+#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
+				 * event to occur in 2 seconds.  It is the
+				 * responsibility of the downloaded code to
+				 * clear this event
+				 */
+#define DL_EXEC		7	/* jump to a supplied address */
+#define DL_RESETCFG	8	/* To support single enum on dongle
+				 * - Not used by bootloader
+				 */
+#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
+				 * if resp unavailable
+				 */
+
+/* states */
+#define DL_WAITING	0	/* waiting to rx first pkt */
+#define DL_READY	1	/* hdr was good, waiting for more of the
+				 * compressed image
+				 */
+#define DL_BAD_HDR	2	/* hdr was corrupted */
+#define DL_BAD_CRC	3	/* compressed image was corrupted */
+#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
+#define DL_START_FAIL	5	/* failed to initialize correctly */
+#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
+				 * value
+				 */
+#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
+
+struct trx_header_le {
+	__le32 magic;		/* "HDR0" */
+	__le32 len;		/* Length of file including header */
+	__le32 crc32;		/* CRC from flag_version to end of file */
+	__le32 flag_version;	/* 0:15 flags, 16:31 version */
+	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
+					 * header
+					 */
+};
+
+struct rdl_state_le {
+	__le32 state;
+	__le32 bytes;
+};
+
+struct bootrom_id_le {
+	__le32 chip;		/* Chip id */
+	__le32 chiprev;		/* Chip rev */
+	__le32 ramsize;		/* Size of  RAM */
+	__le32 remapbase;	/* Current remap base address */
+	__le32 boardtype;	/* Type of board */
+	__le32 boardrev;	/* Board revision */
+};
+
+#endif /* _BRCM_USB_RDL_H_ */
-- 
2.53.0

