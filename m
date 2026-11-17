Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875606;
	b=ndW0Uoez7N87laWtN3WwhnIgyFsbW0HJ5NX3B2/zZAKRGx7cxSqw98UOgQ/2SZBGmvWL
	 tkYkwOgvG/pT7emLsr81/tNvpdMe7SR9R2HwHN6FSK+PruFGsWl628RJz/HEq+i6C+YnN
	 jVYBIZ5WDJ7cU5Wn15TUUuEXxaSVKuGAiWPdZYiecOgrqi0Ce5cA3Rnn0Tu/Yyg3fba+u
	 Et+wegq5Lj+GJ70zrD16Cvt51vxZrLW6DSSOerCFM1LeD7YxoipXNX42ivYVH6i52MKtv
	 gx76AlV6Mtlw2MaP1W0bGNl4HKkj9fBtIkvo1wExAu08tQ6wQTYleLXz13FtPBpTbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PWFLgn+UrW3Q/e1aua+nWEyEf3+A8WLg+hRWRw9fbeU=;
	b=nhl8JjFO3KRJmdfN5bQHS5XahyZiAZRdfb7PCkXdk4O6CKBth91Tpm+cjBJeIQ+T3027
	 NP7ffWH7sdQ4yifJbzbKKqda6+PXHlb5H7N3f4/EbX9Ob3tsUT8W5yQa8RBm6PdGBuEc0
	 tLC2FO35OASpfJA9v7wg7CmHCIY9f0G4PLYEIxBrRCnUngklc4MqE3kaHTFdo/sG3gtET
	 TotjYjZAU48zJXfExr2snRKK6KG3trCoAeKCEAnzu2k1urerQAg9eQMgvbecjQOrwWLfk
	 uxOuxXuOgm3W9hWtM1tiF3tOmEGsSKXnp2ys60/9NCXZT1amMO+CKLhT7oiCBFVOL9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XgtneGet;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC8606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XgtneGet
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso2240636a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794875605; x=1795480405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWFLgn+UrW3Q/e1aua+nWEyEf3+A8WLg+hRWRw9fbeU=;
        b=XgtneGetX5v6r6W29QyDq4trZPOkFso024ewciq0WFsXz0j5MQcYGyTUMBBvocWdf4
         WO39vWU487YxFldgQZJrCUb+PIXNiixMhVBmPZE/2m2klO+L+aEVCICd7EZE5KBAQM5h
         NZlTEo5xdpKSU0epMBtoOjFGhWONMfJvMofa+SE0KcbUvArmx8JtTn+Ub0G2PEEydJz5
         o66qax6TgtpQagf4N2IIJ3bYdmPfPoKNTO6muVzAQ5F4xC/ygdfmnoVvNVrtACknhZAV
         i18abO0mAsVsEPsi5KG+50lj5f9prr+pRb5zVySw7Pm4kAIgZ7GfQaErga8LcqEQUMJW
         tiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875605; x=1795480405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWFLgn+UrW3Q/e1aua+nWEyEf3+A8WLg+hRWRw9fbeU=;
        b=xF3yeT5/SN4WeJn5o6DGxn6p4rMgryW2XO9fUm+kf1onhPMlnk8BqcZmX8Kh/2ToS+
         e5TYAUgwL7P+/kqrEW+HDUoYyUXwmyyZ40p1VwuRIJ+A5DNScnZkUhZaO/1rTNnVmPGd
         CDcOD26mIiEVOoRmxMziE/WhzVHzcEK4hXibkvXSkT2pZDb0aA1vWDXt0J2CWSJdmDDC
         R8AJLEuLW7s+riikur0BIcxbeJXD4Rj7LOWU58AW8MbuX2c2tRvcq780UpDIJNHSvg6j
         cHh2CkCcnLh0nwmedQvcxSXhVngrrEWfATFQfWC99bN/LL5dF56bNP88Yvu5F9S3xoEZ
         LAKQ==
X-Forwarded-Encrypted: i=1; AL+hErHrFUrTajJKwEcBoJLskR95WVQq/eE/A+BQa3zQVYLGri4PeEndQ7+DgK2pb8n80Lv7nr+R+Qfl1mB/1hBcEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8S33XDCOVdDILvPTh8fC0I+I5ouzjnXrIdHp8GbJRsrOfWd5mI
	qeByGRSICrVZjWjgoyyDMC+zXD0x503EPXyoJc/uCaWCLU4i4Gd1GqJrBQOKUAaayKY=
X-Gm-Gg: AZFdTZf3OsNMoWWiOE0AFAxmQuBVh7M4fqtvFtwxCXJ3weC8jy+gN+F98Hp66cfzIHx
	G2fej8WtZ8Ua7IpwqrDtmHyQuc2E4OjpzIGdpF6u5wB3k6AwKq8MqKlbf1ufPLwC75JGg5niUwP
	YxE1imwJTZhRukGaDhyIrEdw6L8kTmAlQcmQl11n0TTCAY9qqxGqLa5bRl4r+hpforOYj1rYbMB
	XoHKTveXCjvK8g0l2YFOzv0CUip4wrIsRgx+puAWmQaL437oREE3sUcaJhN9wyPaw0sgivGWxDD
	kQqkJtkkYCy2hfngfyk7Y++GIe/dFdQ4+z9ZkfJ1IL9w4pWlXxyyTLvLzSOctih307afWo5LcIn
	FXmIW4ZnIsZWAoBmjKr3TmthZIAWJMvqoEWEiqJsvbZtuwcao8i+4tIUWtiXxgPuIA3rWMcZtbn
	tbYYlBtWjYvIu4lCodJ0NK39FvqKZH4EBIj++DZaSYFEnQubjWUP4Wq0+tgDg8DdChhLCEkX+HA
	WUqZQwD0w5UcX+rPMPj8PaiI7xCXgyA+ckLrOPfvG/jenhjoAcoMRII+//Ga+7bd1x5ibvalBqV
	tlmu5Vl/fB/Ds9e1L6EMkBkVc40gXlZlHz65EqWMfJnThNKx7b7AISynv/N0BOJUFyWjFtCRGYq
	RV6ia2dMTPApdc9PbWkPf+XI7eBf1wHcDr+Fxcup2h7UfdYQ=
X-Received: by 2002:a17:90b:1647:b0:3b1:2d60:66cc with SMTP id 98e67ed59e1d1-3b1b07feb76mr11367299a91.8.1794875604969;
        Mon, 16 Nov 2026 16:33:24 -0800 (PST)
Received: from mma-H9MHD44.sydney.mm.lcl (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm1214868a91.15.2026.11.16.16.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:33:24 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 3/4] wifi: mm81x: support v57 firmware
Date: Tue, 17 Nov 2026 11:33:09 +1100
Message-ID: <20261117003310.1032097-4-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
References: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
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

