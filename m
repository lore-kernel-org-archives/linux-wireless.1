Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760014;
	b=V38ZxWi9bxrTmVTtrcjJ0RAFwyKsC66vNO7ufWGDB/AxMI6OBKMGT5XJhOBVzR648SWg
	 Y8eE+15uxZdA1CdDJajAbnJxpeWcrqnCkNnd0vaBH7vsGntk7wcQLJAIRWfCCEpzjw4D+
	 G7orRXbofSzluUiyE2RaoZseBTCgV+PE3/ubr1ax7S+KzMc50KcLFgTKJCYW+rYYFsQe7
	 eGkxv6l83ki9hWYX+amDfp/4diRFIrUhNAnLOyW18n2R9pAjMAew8RUq83hgQxRRrloOk
	 R06Ok7EZhUWSEZCoRn4djf6yAt36eJIvRRTQIiPBbgTu3rUyMrc1thORdrkzJv1vjtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
	b=D8cv3/t02N9eh5ji1PqySj1mN3092aM7GODecIgy4WNwJJU4hX3EDuQHV+stUvVqbtCK
	 d0VUtKkHvcUIg98CPUO4GZe2VuBqH2qGJwC5A0Qn6rLbs4l16CzfyebivyJRMenixg6/c
	 WrnvEfsPJCKwbCNyKYXMKSaWRJBU2UUXbZ1XxnjxU16wADj8pmle+gQ2gM1u59D2qo1JB
	 GpfMKRZibA+xN4j1bBx2WBDr9qh6UWW4fw4oQYP9QGLcJLIy7BbrisYdoZ+rYcw1vRSTZ
	 QzN5dpvMrNdNsJkwAU4Xq32Ai+ipeQH2XrGxEhhlpvaHU6O8nDb6Lc6cV2FVAumcpjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8yuSs8o;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD39606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD39606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8yuSs8o
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386c336eab8so4177604eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760013; x=1796364813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
        b=B8yuSs8oKFBJPGU6HEjxReMKErXxYSXqhuTZ0ePKBcX7zIt64IASi5hFeGvY73O/xl
         uKOPuXywNBpf643aV17JRE3/RsCk85eUXbdX148kLlld9V9IDwnclXTGTTghgFWEtEUn
         sXBqRibNNyIjMttLa3KgwCYnSURRbyvaO/AM+8HbORyKWa+BHhGIWAd+MIpeSxuWjL/c
         icXeLJYgKrs1Bvio4/xU0Ab7DiYOvil40iqEvcqF87mDbXh3FNcuXSDDQ3R++V/UoH8p
         Pmq7W5uQMvaZ6G76fXWVeKr52dVbplKWqw3KsAiRkR9hHijcu2tbShi3FRU63eVjC9ya
         Q6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760013; x=1796364813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
        b=KjGFukxzWiliqW31M4+dxYD1Te+ebzaD8/IliI2y06JEfR8X7ZHXB8lhBjMBkReNan
         OGz/+LtkWUBAO5HQCi3JXxlZmOb+JWVbImtyrfY8ywAxv5OqI6i2XD2ld2Yw1DJczEln
         cL7PTvrR0jiNNJymeOlwTvLeEh+Vlf9uwsJV0Cpd4RzUvfAYgvuuski8D8CK2lhqyCHk
         QIiBxAcyCqGPzNpK8F7MK3fGg246gXsYw5NLnia8czZM/AibZvBTtEsR6HEPnqAyh3Ld
         Go1V/7B9hJmDv0YfdBrR/czvoCFBVQ6+5YUKYinRc4u9AWQ/9jLBtbmjZAufR0UO5klg
         wiFQ==
X-Gm-Message-State: APuU4Z925IScEkxoVxWW0e5atFM3vITICZz7R3b3T2oEmhXxd1/HPK7U
	ewniLvWyVxuRnUCEGkgHix/yoAxOYhDO2BYb2965kh+ELLFKUb7Y+aSdRJ9Sum+7arI=
X-Gm-Gg: AZFdTZcSsnxo/TWvYhzn0sJl5zT5tvXmSKkLECfCRlKkfV/XviXTKBXeM59A5I46RJP
	HS7yPH6zN2LU2NVkt09h6DQ+jiNZK27tuwl3uoKJOb+1fdvkURBXESsJjHa3FzA9EwPq5wkpqgm
	JbIrOqZmkDcVEX65R20Q5wIslwU+M7jd7zM3mKBcNJMCvuoCshNNw0zStCOLQXW38vdD3iUcesy
	UraqBP+E9KMK+CWLZNSm6xFdpEUl7uRAgmbx0RfaD0nIrPp8/Ptr3nQsdqCTvxo6EihSKD9IZ9J
	PPGECRmoE/s0szUDWdvlttA3I7Bz7c9faENbEwCrAA0PERcrE/D258UQi81aFKx+xCMoVaVd0rn
	UMMx2jZ3b9pu3ZyOCOk2PbLAT7Ha5c0Uux0yrguM+RCx2RX+SLBUyjwbpmWNXrbkBjSIV8x6ows
	nYTv0Kk9O4eeACK/AwBqBKKbnbcUDQafbwFAbzm9UG3GRVBfRpUAgs3eH66NZwpjKkcXxImTadQ
	/MPzG9LZnTcfV/EIq/l5Xr+LRwYJ+46Y3hkQ13ioYIvNc+yKoqtDtV+3kuHUQCYYlmIE2+lykwJ
	ibLYmDuiPubuAgLqmNuM7k6tJR48+r+d6FDLino+7Fbi8D3i+0H6wlil90QkP6IqQecDwg==
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr26535715eec.24.1795760013363;
        Thu, 26 Nov 2026 22:13:33 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:33 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH wireless-next v2 11/11] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Fri, 27 Nov 2026 14:11:41 +0800
Message-ID: <20261127061147.506129-12-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

