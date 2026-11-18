Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044693;
	b=ReL60+Me4b8JFCNMafsifn5j0jHL0DRo3uRMukMqaeJdNUOGeF3g64sYZEVnxVPcc3CY
	 MW1sbLj4Q2fHfLrnWnYIbMq7Y2Nw1/zMbnu+GgzbdtdDUqtoGjD9SIDu8qerx1TeYLfSS
	 PIUpFOZDefupvyJsU87MkU1/yWbKDRG9aT3fMd1kyioW3NoW1d9oQ5cPUEyA5wuomNLN3
	 9afj57KKZJxD/nWSP7nPFRQ0ezx7OTVVrA1Hf1g7N5PKCMdC9mTF8MFmkiQqXzmsiZbDd
	 feI2VzDql2fxuA2BEdekHNFVs8rg5RR58Cv6d+dI6NVs/uqBBAW/SBUigG4oks66WeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PWFLgn+UrW3Q/e1aua+nWEyEf3+A8WLg+hRWRw9fbeU=;
	b=uPnUwiguBQBg+M85NVhr3hXx8fWbtGF3CIuhi1zTgorrKjOqLzLr1PNE28iswKwUHHsQ
	 TyDxUKYEHyH1g78BW1vWerNQWyi78VY5JVdfjwZGJX+Grr36owfxD/I7R4bqCeUrgc6sW
	 5zYuRT4EcBOJfDPq+AQi6fFPcIoZ3HbZrwHwNk4wc7GGv1BtrQsSGWsavJGUg37FPrhEf
	 +0TOY41nCMoS2EJy4Xn4T9JkoO4oVXcQuHsdoAo1SIBhs9usZIL9EHZ9my0/6TirCHVY+
	 0t0/14dUa7SAXJGof7Ezjd0OjxuUtMRPz6DkBrbIe5k4Vyv3eYkprv9A/wuPWajQrew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="c5/Rp72s";
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9965C606A320
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9965C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c5/Rp72s
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b2382bf051so1100105b3a.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795044692; x=1795649492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWFLgn+UrW3Q/e1aua+nWEyEf3+A8WLg+hRWRw9fbeU=;
        b=c5/Rp72sJS/iIb/JGODo0JLDEr0Jj3lsw8XS/7ZaN7aNVPYlqlr54wy1Msk279aN/Q
         6+kv8jOee/k+CAuvlzJmcc3y4bczKKArED6hK8V4OgSJEjnWm0QRoFyameTYD5dHrKBo
         tjn2k5cIWqw8XqxUlxPBvMOaYt/YMOPXoY3Tt4bx3d8RPZxe1+Wk2tqS4mG5tmjUFNam
         +8cByedGOpkUTiL5016K2elPxmlMoT0IZ5+Vgjc0uQNvcwxJOn7IK0Xad9FsGvDww4WB
         jpJu9m/7LfEQN+q7GBLfmx9OZljM8nkaxetOytRImUxS+IydK1fVGD10gjVtbQctKIBN
         Q6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044692; x=1795649492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWFLgn+UrW3Q/e1aua+nWEyEf3+A8WLg+hRWRw9fbeU=;
        b=CMXa8SZ3LxrMgb8z1GJqZjdHlBCX+0FvLzyTApiZYW2vcAEdMRDaUl9hJNLCAUoLlx
         ZiLKbxmBQXxjbVTK/GY/+9C3g9s/xcC9170Jqwis2BmlgGd7mEbsmRSN3cl513SSsBJt
         cwAKarWi2Swmh1x+wDOGF3tBX+9DZzDk6ur6viwZSI0Os5VvLDEQLCUuYLVqEf4RznBB
         e0d009i/aEcc/iGvmASDeEN7HED/C/Y3yn9Elu9zU9BduI+VYv4/1yednmGMp2BJY25R
         xDdGSh2VFctsroL2So+G8e0bfDECPsragjIGPPhRzO3E+bdZ1eTHEt1vrE9NGJ3RefbH
         HP6Q==
X-Forwarded-Encrypted: i=1; AL+hErFYdjoAktumGsC4VLEjsMLiKxbNycSttEYUGkOaXTaZi4LPCO8/QfJI+LKRdfhq1L5gxq66QiUj+3NvGvltFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8S7MJxZYdZycDgRlzliAyKerMveyUJ7qZKK1gbtYrI2UAR6kZf
	E/FHKt+YDFOnhl+wtetPAzRGbnH9D45l5RmywKS9sMiAfAd2E+vOd/WxOpVIpgT8iFo=
X-Gm-Gg: AYBFou3XC4n0sEk5QodrBQNRIEDopLSy9UfLMdoPnaycaIFpZapdJPJ52sjhhgwU5/S
	nXtvfS9wHMbojkODuvvGKI6Fc8odBgT+bgfx6XEyGuQwXedqZo7W5k18sh9hEocuY6P9Dn1xc9T
	TKqOPDwcgOG4AlGBV4rkKMz2lJwj0eBF6I+7ntYUyd+ahebioMiuMOGch0j8f0bUvxIf6CJnFzN
	XgtezE5G5x0izVvX8A+AryLJFrENAPz+a5AS0HEDUsDFmJG/davnc+SlQwapV31DBm2Yi1u6D2R
	RWIih1a8xGucJRuwXmWVxRQXCd2+ClWRzkvoIvNFH1HMrH34VCiDeqC54VcpX2vaGmHDIOJy7ID
	y7XUQrAetASOB0ydv+jJp/l0dEeOuGJgW49+SSgECROokwKhMyPUQ9ksIFfvyhN/khIURn8nOCw
	pV8x0KiPdgV/tVDRa/SgdnhgBy8NaTwNTOOVTneK4p7i8shanb1rqYkceX+7LBizrvO2nL8RxW9
	ITfzO0+RN9K+9vxEpo3Q4k/psf/wYancP3go00PwqjoPqCLzUl2NHZnDsuzxzly23hm4l17aGms
	tlMVd6g1YdI1KFpgZCAxwLHDwC+ehlEM+LKg6rsYDl/w6PwvpPz5wDRGcE2RTSXa2/qbqU+uICH
	SU8yQIQ==
X-Received: by 2002:a05:6a20:d509:b0:3fb:4a1e:2f82 with SMTP id adf61e73a8af0-3fe8abff694mr4573003637.61.1795044691876;
        Wed, 18 Nov 2026 15:31:31 -0800 (PST)
Received: from mma-H9MHD44.mymodem ([60.227.235.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1467822b3a.22.2026.11.18.15.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:31:31 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next v2 3/4] wifi: mm81x: support v57 firmware
Date: Thu, 19 Nov 2026 10:31:03 +1100
Message-ID: <20261118233104.1640855-4-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118233104.1640855-1-lachlan.hodges@morsemicro.com>
References: <20261118233104.1640855-1-lachlan.hodges@morsemicro.com>
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

Update the type definitions to support the v57 firmware and advertise
suppport for the new firmware.

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 .../wireless/morsemicro/mm81x/command_defs.h  | 38 +++++++++++++++++--
 drivers/net/wireless/morsemicro/mm81x/fw.c    | 19 +++++++---
 drivers/net/wireless/morsemicro/mm81x/hw.c    |  2 +
 drivers/net/wireless/morsemicro/mm81x/mac.c   | 16 ++++++++
 drivers/net/wireless/morsemicro/mm81x/skbq.h  | 22 +++++++++--
 5 files changed, 84 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/morsemicro/mm81x/command_defs.h b/drivers/net/wireless/morsemicro/mm81x/command_defs.h
index 91a4ac09ad80..779a6902086a 100644
--- a/drivers/net/wireless/morsemicro/mm81x/command_defs.h
+++ b/drivers/net/wireless/morsemicro/mm81x/command_defs.h
@@ -11,8 +11,8 @@
 #define __sle32 __le32
 #define __sle64 __le64
 
-#define HOST_CMD_SEMVER_MAJOR 56
-#define HOST_CMD_SEMVER_MINOR 17
+#define HOST_CMD_SEMVER_MAJOR 57
+#define HOST_CMD_SEMVER_MINOR 20
 #define HOST_CMD_SEMVER_PATCH 0
 
 #define HOST_CMD_TYPE_REQ BIT(0)
@@ -149,6 +149,19 @@ enum host_cmd_ocs_subcmd {
 	HOST_CMD_OCS_SUBCMD_STATUS = 2,
 };
 
+enum host_cmd_boot_code {
+	HOST_CMD_BOOT_CODE_NONE = 0,
+	HOST_CMD_BOOT_CODE_BCF_INIT = 1,
+	HOST_CMD_BOOT_CODE_VALID_BCF_NOT_FOUND = 2,
+	HOST_CMD_BOOT_CODE_BCF_LEN_INVALID = 3,
+	HOST_CMD_BOOT_CODE_BCF_CRC_INVALID = 4,
+	HOST_CMD_BOOT_CODE_BCF_UNSUPPORTED_VERSION = 5,
+	HOST_CMD_BOOT_CODE_BCF_REGDOM_LEN_INVALID = 6,
+	HOST_CMD_BOOT_CODE_BCF_REGDOM_CRC_INVALID = 7,
+	HOST_CMD_BOOT_CODE_BCF_PARSE_FAIL = 8,
+	HOST_CMD_BOOT_CODE_COMPLETE = 255,
+};
+
 enum host_cmd_headless_cfg_option {
 	HOST_CMD_HEADLESS_CFG_OPTION_KEEP_IFACES = BIT(0),
 	HOST_CMD_HEADLESS_CFG_OPTION_BUFFER_RX = BIT(1),
@@ -1211,7 +1224,7 @@ struct host_cmd_req_mbssid {
 #define HOST_CMD_MESH_BEACONLESS_MODE_DISABLE 0
 #define HOST_CMD_MESH_BEACONLESS_MODE_ENABLE 1
 #define HOST_CMD_MESH_PEER_LINKS_MIN 0
-#define HOST_CMD_MESH_PEER_LINKS_MAX 10
+#define HOST_CMD_MESH_PEER_LINKS_MAX 20
 
 struct host_cmd_req_set_mesh_config {
 	struct host_cmd_header hdr;
@@ -1587,9 +1600,18 @@ enum host_cmd_hart_id {
 	HOST_CMD_HART_ID_LPHY = 3,
 };
 
+enum host_cmd_crash_type {
+	HOST_CMD_CRASH_TYPE_ASSERTION_FAILURE = 0,
+	HOST_CMD_CRASH_TYPE_NULL_DEREFERENCE = 1,
+	HOST_CMD_CRASH_TYPE_HANG = 2,
+	HOST_CMD_CRASH_TYPE_HANG_NOIRQ = 3,
+};
+
 struct host_cmd_req_force_assert {
 	struct host_cmd_header hdr;
 	__le32 hart_id;
+	__le32 delay;
+	__le32 crash_type;
 } __packed;
 
 #define HOST_CMD_HOST_BLOCK_TX_FRAMES BIT(0)
@@ -1637,7 +1659,15 @@ enum host_cmd_param_id {
 	HOST_CMD_PARAM_ID_DEFAULT_ACTIVE_SCAN_DWELL_MS = 27,
 	HOST_CMD_PARAM_ID_CTS_TO_SELF = 28,
 	HOST_CMD_PARAM_ID_CHANNELIZATION = 29,
-	HOST_CMD_PARAM_ID_LAST = 30,
+	HOST_CMD_PARAM_ID_CRYPTO_IN_HOST = 30,
+	HOST_CMD_PARAM_ID_AUTOCONNECT = 31,
+	HOST_CMD_PARAM_ID_HOST_PWR_OFF_GPIO = 32,
+	HOST_CMD_PARAM_ID_HOST_PWR_OFF_GPIO_PULSE_MS = 33,
+	HOST_CMD_PARAM_ID_ALLOW_PRE_ASSOC_OFF_CHAN_PS = 34,
+	HOST_CMD_PARAM_ID_SCAN_INTERVAL_BASE_S = 35,
+	HOST_CMD_PARAM_ID_SCAN_INTERVAL_LIMIT_S = 36,
+	HOST_CMD_PARAM_ID_AMPDU_FEEDBACK = 37,
+	HOST_CMD_PARAM_ID_LAST = 38,
 };
 
 struct host_cmd_req_get_set_generic_param {
diff --git a/drivers/net/wireless/morsemicro/mm81x/fw.c b/drivers/net/wireless/morsemicro/mm81x/fw.c
index 2af7d302be2a..619b7d9068b7 100644
--- a/drivers/net/wireless/morsemicro/mm81x/fw.c
+++ b/drivers/net/wireless/morsemicro/mm81x/fw.c
@@ -384,7 +384,7 @@ static int mm81x_fw_get_flags(struct mm81x *mors)
 
 static int mm81x_fw_check_compatibility(struct mm81x *mors)
 {
-	int ret = 0;
+	int ret;
 	u32 fw_version;
 	u32 major;
 	u32 minor;
@@ -397,23 +397,30 @@ static int mm81x_fw_check_compatibility(struct mm81x *mors)
 						fw_version_number),
 			       &fw_version);
 	mm81x_release_bus(mors);
+	if (ret)
+		return ret;
 
 	major = MM81X_SEMVER_GET_MAJOR(fw_version);
 	minor = MM81X_SEMVER_GET_MINOR(fw_version);
 	patch = MM81X_SEMVER_GET_PATCH(fw_version);
 
+	dev_info(mors->dev, "Firmware API version %u.%u.%u\n", major, minor,
+		 patch);
+
 	/* Firmware on device must match the firmware file we requested */
-	if (ret == 0 && major != mors->fw_major) {
+	if (major != mors->fw_major) {
 		dev_err(mors->dev,
 			"Incompatible FW version: (Requested) v%u, (Chip) %d.%d.%d\n",
 			mors->fw_major, major, minor, patch);
-		ret = -EPERM;
-	} else if (ret == 0 && major != HOST_CMD_SEMVER_MAJOR) {
+		return -EPERM;
+	}
+
+	if (major != HOST_CMD_SEMVER_MAJOR) {
 		dev_warn(
 			mors->dev,
 			"Running FW v%d.%d.%d, driver supports up to v%d, some features might not be supported",
 			major, minor, patch, HOST_CMD_SEMVER_MAJOR);
-	} else if (ret == 0 && minor != HOST_CMD_SEMVER_MINOR) {
+	} else if (minor != HOST_CMD_SEMVER_MINOR) {
 		dev_warn(
 			mors->dev,
 			"FW version mismatch, some features might not be supported: (Driver) %d.%d.%d, (Chip) %d.%d.%d",
@@ -421,7 +428,7 @@ static int mm81x_fw_check_compatibility(struct mm81x *mors)
 			HOST_CMD_SEMVER_PATCH, major, minor, patch);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mm81x_fw_invalidate_host_ptr(struct mm81x *mors)
diff --git a/drivers/net/wireless/morsemicro/mm81x/hw.c b/drivers/net/wireless/morsemicro/mm81x/hw.c
index 9293f4094db1..8ee78bb7c6bd 100644
--- a/drivers/net/wireless/morsemicro/mm81x/hw.c
+++ b/drivers/net/wireless/morsemicro/mm81x/hw.c
@@ -365,3 +365,5 @@ const struct mm81x_regs mm8108_regs = {
 
 MODULE_FIRMWARE(MM81X_FW_DIR "/v" __stringify(MM81X_FW_VER_MAX) "/"
 		MM8108_FW_BASE MM81X_FW_EXT);
+MODULE_FIRMWARE(MM81X_FW_DIR "/v" __stringify(MM81X_FW_VER_MIN) "/"
+		MM8108_FW_BASE MM81X_FW_EXT);
diff --git a/drivers/net/wireless/morsemicro/mm81x/mac.c b/drivers/net/wireless/morsemicro/mm81x/mac.c
index 77c4d3358e25..86e7887c1772 100644
--- a/drivers/net/wireless/morsemicro/mm81x/mac.c
+++ b/drivers/net/wireless/morsemicro/mm81x/mac.c
@@ -2009,6 +2009,22 @@ static void mm81x_rx_h_add_rt_s1g_tlv(struct sk_buff *skb,
  * This is a hack to workaround how our firmware reports frequencies.
  * For any 1MHz frames report them directly (i.e during scanning), else
  * report the 1MHz control channel we are tuned to.
+ *
+ * Unfortunately, the new channel_info field reported by the v57
+ * is actually not what we are after. The part of the channel_info
+ * field reports the index of the _first_ 1MHz channel of the
+ * channel it was transmitted on. This is because the firmware is
+ * _really_ reporting the subband carrier offset, not the control
+ * channel the radio was tuned to during reception.
+ *
+ * For example, say an 8MHz operating on channel 44 with a 1MHz
+ * primary of 39. If a frame is transmitted on the 4MHz primary,
+ * the channel_info will convey the 1MHz index as 0, even though
+ * the primary 1MHz we were tuned was index 1. For a frame
+ * transmitted at 8MHz, the index is _always_ zero.
+ *
+ * This means we unfortunately need to keep using this for both
+ * v56 and v57 firmware in the meantime.
  */
 static void mm81x_rx_h_fill_freq(struct mm81x *mors, u32 rx_khz,
 				 struct ieee80211_rx_status *rx_status)
diff --git a/drivers/net/wireless/morsemicro/mm81x/skbq.h b/drivers/net/wireless/morsemicro/mm81x/skbq.h
index 9930493141cf..ec68c85e1a28 100644
--- a/drivers/net/wireless/morsemicro/mm81x/skbq.h
+++ b/drivers/net/wireless/morsemicro/mm81x/skbq.h
@@ -104,7 +104,15 @@ struct mm81x_skb_tx_status {
 	__le32 pkt_id;
 	u8 tid;
 	u8 channel;
-	__le16 ampdu_info;
+	union {
+		struct {
+			__le16 ampdu_info;
+		} __packed v56;
+		struct {
+			u8 per_attempt_ampdu_info;
+			u8 per_attempt_missing_block_ack;
+		} __packed v57;
+	};
 	struct mm81x_skb_rate_info rates[MM81X_SKB_MAX_RATES];
 } __packed;
 
@@ -150,8 +158,16 @@ struct mm81x_skb_rx_status {
 	__le16 freq_100khz;
 	u8 bss_color;
 	s8 noise_dbm;
-	/** Padding for word alignment */
-	u8 padding[2];
+	union {
+		struct {
+			/** Padding for word alignment */
+			u8 padding[2];
+		} __packed v56;
+		struct {
+			u8 channel_info;
+			u8 padding;
+		} __packed v57;
+	};
 	__le64 rx_timestamp_us;
 } __packed;
 
-- 
2.43.0

