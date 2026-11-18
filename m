Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034619;
	b=wAlh1N1XwuoVqoHYgxN22xGsmE5MKybjn/tsySEJH0p5h+5aEvS+9EseRg8u5FSgGsTt
	 ra/cjCMiM6TDH+ai953t/ukW8DheL0AiQxcda28SXqSntmE4sRCvlNTMdUHvgo/Ya2gVR
	 sgzDSOU3GMP61uV5ULXHe8YGTXcgAA5DkO2QzSTfm3Ibn6k19sMxVockuPZ8RM2RgzTu0
	 Lkuokuh1PDrR/Ey0Nvkx6uWa4MGarz52yRY3StTTCDnJUTB0Q9ZaYsNQP7qAl/JjBh7T+
	 TfsC7bFtUZ7wu4FaPHssKU+VegqRAA9TXJIxExVt1sfw6PkNiY7wZAB7X6VCoPrw3/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2pYlTwk2wGwugpvwvlYaqR3MfohcECSz7ZDOgYENGZs=;
	b=lCM4bu2hXSMLQE8HQfcRv4Ve9iEVEPsEypPmscWQ9Ajt+Abo6OGTBvxj4+hkNW7Nc9xb
	 QGERyzAXDXykUQegXmhAOmoENP1JaEk537FPvcxMELDBl9MZD0JEVgYJ9Lr5S37HW/Lff
	 FhyW4Ut1Aq9cXJ1Tzgjv2sl7HeQ6nXi1vBrlO20A0IS+uqQkfitB7NaH7MMFbn2vg87qe
	 rq3V+uDiBSUtXgpAVnrShUjj9vUb8Gp0Ajd/EImWoOBuFAwmeiMPfjpexLq9EOdny7rGn
	 3kDNeTxDtJd4F4RlAI1hFpZ4auRVijPyMwi17KFZxG1AcF8hMvp1rQ1Fb+wAhSvR09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pi0.com;
	spf=pass smtp.mailfrom=domojo.com;
	dkim=pass header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=Hu2Vh4zd;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38E60A2628
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 20:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F38E60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pi0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=domojo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=Hu2Vh4zd
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b37951a397so1228872a91.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 12:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795034617; x=1795639417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pYlTwk2wGwugpvwvlYaqR3MfohcECSz7ZDOgYENGZs=;
        b=Hu2Vh4zdjpMRMU6OX+ynjKRrhdFqV75wUyAamRdFTh3RfA6oA5fCqZ1r9Sn0OHrJpd
         cucnqGsy5ruxaCzYEWYxEBwdIndxZzJTzcgH76AXEv8ySOmNmBBp31jkinPNH2R2QX5i
         0IJCyLrlmWhYDBJYCgEMmbbuMGxwcFHpd3HyeChPZ/PHDDiByg+fbGaYbeCfVAG/oT2b
         u8TsVL/53FPTy7O53+bGi/cOnwz+VhNi/O9+7uaRCacjocMp7MpcN3AMZDg1srXpfl8Q
         nI5rWJtMeWY0FW0OMpTFPxvqLzQCBtCsKV0jlUxki9QVPakqXYSJdokxBWpcJtP70CXV
         C0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034617; x=1795639417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pYlTwk2wGwugpvwvlYaqR3MfohcECSz7ZDOgYENGZs=;
        b=2kbkw/hVz/xpN5mjQSUKed3ItmmadcNFPr6qy0rq1TXGY6y4ua5a9s31QJa4E8yZax
         c32u2Tkn77PYoN6ItEq5/Vy4H1/I5iZRo+USlzIm89BLRZuXrsyC7y/sdf60OTw0gDLD
         SNIYmlG67ENs+ORtrOdzGDXMI4ShIhp93sdZZPC/a76XKn/zetv6STir+dAzs/Y4LccD
         NG7MB5W30H3wS7FDhNXsWOE8T8oYGd/g2IzUr8w1sr/Bh7zUKXdKz+MIKIVutAP6KLJJ
         hk7y7yb1oV2FIxXnb5gLyIm6aKzfsqI/7aKoQE3LNcfKIBWUNUTKeu3dsPaDV1wKFF5w
         95FQ==
X-Forwarded-Encrypted: i=1; AL+hErF5/h80TX4igv5H52K4Gp0e/HqOu0ciWfy1rL9BwGVneVjJe1pG7sYpo6aajTPHbClrLhYYiubgpEISp0962Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kwurf5tzUY7FiGVsiIkbLMYtcEbasA/t93GiabwqBOauR3giL
	fpBCspA5TyY3WRwaXU6Yid+7oPgmEF+3KDzoMDCGrAOSIr8L1KJTfYWpdPdIhwwYLkQ=
X-Gm-Gg: AZFdTZf8dLHenx+7YBi7yE9a1tUqN+8vi5vAkKoH04L5hzfKSn+u6rbhvqj62UAMuod
	T8N0LUObbjmptPUWFiGDez3L4fgogPUcgYABSBImuQ5j5QLg3bKpDq5Uq5mZTjC4gafwdLUCRqP
	USK3JUcEhSjkjVjmfRHi4Tw2+prgSoqdB4LmqiiB8AilAipY2Hx4PjmcHQk62bGtO9NMrwywKdE
	J0423qK9Ry6v7Waa+iaQp13zjWtAeyy9HXNAwn1Gge5i2M5URT97EY7QRgEUjPPBVRVotg8pyP1
	MhD2G8LAE/q17IvOhwdvt46hUvdK1sBNoBgYrg7xaZVdsMw3H45/kBgeiflUuEKs51QqiV1dxnP
	IQ4ecstbvspl0sQYK40MqOxRxszCejf17aCdVaP79pV654B8fKNS5bHt6zEwONAZdRA8X82ixm0
	JtnC00Cjx3m2PUO1HRxFAx4ONlC+A7aHyl0bIHbbwHBm11Vgr5oWfugjN5P3k+JYn1hDDjnojUN
	gDRIKdgFIg8wS+/n3SpSBUvUsTSKNDo0KOCLEWuds3IpjAiE9AwnAouHn690jC/Q28OAoa6UmvQ
	TRa3P6eUZHR3bxR+UWKQnAkF+ppYT9nQomBF571ekBG14OdPxCdBNYI9lRoEY94sNDJ/yW9IsF7
	mEZpOh5pZGwppOUFEQQA+s9LTxlDHIvfgm3Cliy2CSWHM3sOqTJMQV5KN3L+aItMv2TIEWiCxcA
	qCjQ==
X-Received: by 2002:a17:90b:1846:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b3d07a23d5mr3555145a91.14.1795034617294;
        Wed, 18 Nov 2026 12:43:37 -0800 (PST)
Received: from apex.localdomain (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56a3f93sm2631601a91.2.2026.11.18.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:35 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current v2] wifi: ath12k: parse nested DBS/SBS capability TLVs
Date: Wed, 18 Nov 2026 11:43:01 -0900
Message-ID: <20261118204307.3154270-1-wolf@pi0.com>
X-Mailer: git-send-email 2.56.0
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

The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
therefore points to an inner TLV header, not directly to struct
ath12k_wmi_dbs_or_sbs_cap_params.

Casting the array pointer to that structure reads hw_mode_id as
sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
partner-link deactivation.

Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and reject
unexpected tags and payloads shorter than the capability structure.
Use the first record, matching the vendor host extractor, and leave
the cutoff at zero when the array is empty. Only store the cutoff
after the complete array has been validated. This leaves the existing
hardware-mode and link-selection policy unchanged.

Tested on a Steam Frame with WCN7850 hw2.0 using Valve's matching 7.2
kernel source. MLO advertisement and radio-mapping diagnostics were
enabled separately. The revised parser reported a 5900 MHz cutoff and
the driver mapped the associated 5260/6295 MHz links to separate MACs.
An unmodified upstream kernel was not boot-tested.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
Changes in v2:
- Separate Tested-on from the official trailers, as requested.
- Log DBS/SBS capability parsing failures before returning the error.
- Move cutoff storage and debug output into a dedicated DBS/SBS parsing
  helper, following the existing capability-helper pattern. Commit the
  first record only after the complete nested array validates.
- Remove the evidence link to the repository that is now private.

Local validation: 15 SERVICE_READY_EXT2 parser cases pass with ASan and
UBSan, including malformed later entries preserving the previous cutoff.
The failure cases also check that a parser warning is emitted. Strict
checkpatch on the code diff reports no errors, warnings, or checks.

v1: https://lore.kernel.org/ath12k/20261118012321.2861920-1-wolf@pi0.com/

 drivers/net/wireless/ath/ath12k/wmi.c | 47 +++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990..0cf6e1eab 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,47 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+				       u16 len, const void *ptr, void *data)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params **first = data;
+
+	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
+		return -EPROTO;
+
+	if (!*first)
+		*first = ptr;
+
+	return 0;
+}
+
+static int ath12k_wmi_dbs_sbs_caps(struct ath12k_base *ab, u16 len,
+				   const void *ptr)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
+	int ret;
+
+	ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+				  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
+	if (ret) {
+		ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI TLV: %d\n",
+			    ret);
+		return ret;
+	}
+
+	ab->wmi_ab.sbs_lower_band_end_freq =
+		caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
+		   ab->wmi_ab.sbs_lower_band_end_freq);
+
+	return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
-	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
@@ -5840,12 +5876,9 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
-			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
-
-			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
-				   ab->wmi_ab.sbs_lower_band_end_freq);
+			ret = ath12k_wmi_dbs_sbs_caps(ab, len, ptr);
+			if (ret)
+				return ret;
 
 			ret = ath12k_wmi_update_hw_mode_list(ab);
 			if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759..94bb6854b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
 	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD = 0x3D9,
 	WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD = 0x3FB,
+	WMI_TAG_DBS_OR_SBS_CAP_EXT = 0x400,
 	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM = 0x427,
 	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
 	WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.0

