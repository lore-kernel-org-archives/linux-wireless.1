Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115866;
	b=XIlDmoiF4L+bzBu6h7PEN7rTHWuCz9GQozd0m50QU+A4M45jp6tVXeSap+12QY9UsmON
	 xA8wu2iUdSar36vIm3//OmeSPDYKs2LCO75L3ffLeKVNx9FfZLyHPg3snY4nZpsmlL+Rf
	 0Fk1nVuaFHThgYdcQga9iea7IW09duSMc4LTWl/RTOx9JUpUPF8UN0CHAjqDdouqm6Rsc
	 136sIQ6EnMq5sOCMAFIUH6owZNyTPq2Wls3iR1iwgA6NVlqw4nYeGafA4xBZwkDGvpvgw
	 BZD28HhLdCVNQOkbri118SsG4t4cTuJrBsiUjaJQFJad2vh/J8kNnDAEM5q10kXvboA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
	b=xRG53MohvXKRsMJ+LrMHCMuNl/NRrYq0E4wEJXzwhW4AZdjY8QFfXV0ikWQ2r2heM+Pj
	 yjYbVTJkC/Q1m0jI8RAEvzQIDIOF80ugtyhG3mCxpeigEkv3GGdtav6REzjiQGMmp5zLw
	 lPy59hMuhcLb0CDAJLZZbd95u6h54bVNm4y67BJEHLYBabJVaZdkbZDh1mBBbuMzMQi/r
	 jit2WvdcigC/G7BgMkVoCM8GaIv6oJTgD4Dht8fJ+3ZIB2JoUFeUlaT4W2rWUWzrH7mzI
	 Rce0z2l46z1Y3W5jZo64PR0frP9dHhQ8tk0DmnqYoSe4+2wnnEPFn5IxdEfpzOLoo9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pi0.com;
	spf=pass smtp.mailfrom=domojo.com;
	dkim=pass header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=L9PefKkt;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6583460A2609
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 19:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6583460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pi0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=domojo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=L9PefKkt
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02ee04378so624895ad.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 11:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795115866; x=1795720666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
        b=L9PefKktCIxPn7EjNDggL5GXv2V0u5eRM/43RbHzPOmc8s0tnYTjZmCqDXOzLgtsDh
         Cz1CxzzUj7Jc6mhyAzjzJPkkTHIMxfW9NzTb1ORDuhrIFBmtOziC5vM6ycMk6sP8ME6J
         +P2FjsdWhaY5i9l4Gq5y4nZceMC+koijIZbQbkQB65m01c/TRAZ9MVTn6pWoEUaGQBM2
         C0m5y0+lTJ1xGDKvF/xDeg1Cn3m2ec57NDaac8ilnvKMG1pY5QAaBhakTY9Xd5CfvxOP
         GoLBf8AYPu+7ZKAlTNAyZiHP2ncto3iIhO/X3RliacSSkqzS2z5qj58RGURFq8464Jyq
         JFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115866; x=1795720666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
        b=eeoPVxTvsYnlwIGnQaVMFaZXX5Obr6+A4BiM/iyDNMpUmdhzutT16W7C60rEcJ/6ZB
         tbEk59etpiCxzIdIO5QS4/BQFFweuHVC7b4Ab/imeeqT+WbFI3yVbSTU2MTLe/QXbO9d
         KE3gR7djHD+MEdx25gS5lc/3yeoYRG5b88Tdfo7/KoxYUoKFIyoqTztq0PHXifZdqFt8
         FL2UnQeJy4jYkMN/ZeZ8eiZJ4Y2+T7CYVENqRrCPJELcguJEHQMK6ehzNLZe78+a7r2m
         uv0bU+/55WvlPVCKmGoO4iuidkPTprcH3hT0JvN9WlfB09qxarEv7jFiiyI2MbzCk3eT
         z3LQ==
X-Forwarded-Encrypted: i=1; AL+hErESL2g2HS/ZrUcV/dt2yW77yDhk2rLOexR3qhibx8q8rJLQepUAJ6FSqrLnQSiGZwXJkNmHYKJKuRKLYvTFQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZhPSqMZReGiKlZYytngyaBMcKL7hGEFXRI8S4OUhUM4h50OL1
	oJTkJCh9l54wsJQ5InuAD7LAuvt0rZmIMYEeqfoLDZUnb0FLSKbbKxccjtZlVHbs7Tc=
X-Gm-Gg: AZFdTZchETmsuWZ2If40dqGa2Xvr9yPyF7wPQGWbWSMtWm9zTBE8Nd8AIUAdXkSrJmx
	DcKuWAFVZrr7lxhxoAR3qFuNQ1Dmn7j6u3l6honp98PZzkFClRKzXCUC34c82On3lOve/W4Jy6i
	0NZCNyfb8temC8Gz+40NqzBOI8YlDThBP0XV+IkJuj9Z83L/eqavdkz2D0FLenIYSbTElvQe6Dl
	PqnDLMnvtELwtEYJWl7sHHCbNEBjWzVkFqBJiC34NAE2D41cnaZBD0eaTEZVU2N+PTAxaLmv22y
	MKCdgVo8IpIBcuW7ovaAH4I4NFQ3HsohvwgbbVyVL5ggD4DJvT3D2FF5ia0LMu6FhKAq/vTudqf
	x+SaxUZBnAjaYgldklUc2OytuXQ+8iN4ArSrUbYyW8TrbYp9T3sNQYotA5LsCBroQINrdYhaq9y
	YBkLP/yvCf2MyIWober6DDaGLoYvH2DZ0XR9r6+S8CBwyDHjx5fqRW/u6AqQs3B2YqmMvhuogRi
	tvx0C7T5xpmRzHnqA+kLKkqrGLXYBo/qMXp/kFzNt4DEH0dZYsd4wvpQyUsMiRcKMfGtfVdZ2vS
	67gkOwMBtRotl3jckR9gE/OwFqoNCo+xgbRdivvbztl83uwxn72HH5BrxyCFxGdt20CUiTHfU+T
	fqvfG+ASkaiPSygSpT8uDfzdZMIUCm1MmWhY9cfmZ1jKXh/H/tLczRShiDDjkyMFH
X-Received: by 2002:a17:90b:3e81:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b41c9559f5mr292265a91.41.1795115865629;
        Thu, 19 Nov 2026 11:17:45 -0800 (PST)
Received: from apex.tail2509b0.ts.net (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm3809796a91.14.2026.11.19.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:17:45 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com,
	jjohnson@kernel.org,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current v3] wifi: ath12k: parse the nested DBS/SBS capability TLV
Date: Thu, 19 Nov 2026 10:17:16 -0900
Message-ID: <20261119191717.215161-1-wolf@pi0.com>
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

The DBS/SBS capability in WMI_SERVICE_READY_EXT2_EVENTID is inside a
WMI_TAG_ARRAY_STRUCT. The array payload starts with the inner TLV
header. Casting that pointer to struct ath12k_wmi_dbs_or_sbs_cap_params
makes ath12k read hw_mode_id as sbs_lower_band_end_freq.

On WCN7850 with hardware mode 5 and a 5900 MHz cutoff, this gives an
SBS frequency range of 4900-5 MHz. The driver can then map the 5 GHz
and 6 GHz links to the same MAC and request deactivation of one link.

Use ath12k_wmi_tlv_iter() to reach the capability payload. Check the
tag and minimum payload length before converting the cutoff to CPU byte
order. Clear the cached cutoff before parsing so an empty array leaves
it at zero.

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
Changes in v3:
- Follow Baochen's suggestion to decode and log the single capability
  in the iterator callback. Drop the first-record pointer and wrapper.
  Clear the cutoff before walking the array to handle an empty array.

Changes in v2:
- Warn on a nested parse error. Move the cutoff assignment and debug
  message into a helper and separate Tested-on from the trailers.

v2: https://lore.kernel.org/ath12k/20261118204307.3154270-1-wolf@pi0.com/
v1: https://lore.kernel.org/ath12k/20261118012321.2861920-1-wolf@pi0.com/

Built ath12k for arm64. A host test of the event parser reproduces the
5 MHz result on ath-current and gets 5900 MHz with v3. This revision
has not yet been run on hardware.


 drivers/net/wireless/ath/ath12k/wmi.c | 32 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c..9b1de1ec06 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,27 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+				       u16 len, const void *ptr, void *data)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = ptr;
+
+	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(*caps))
+		return -EPROTO;
+
+	ab->wmi_ab.sbs_lower_band_end_freq =
+		le32_to_cpu(caps->sbs_lower_band_end_freq);
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
@@ -5840,12 +5856,14 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
-			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
-
-			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
-				   ab->wmi_ab.sbs_lower_band_end_freq);
+			ab->wmi_ab.sbs_lower_band_end_freq = 0;
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_dbs_sbs_caps, NULL);
+			if (ret) {
+				ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI TLV: %d\n",
+					    ret);
+				return ret;
+			}
 
 			ret = ath12k_wmi_update_hw_mode_list(ab);
 			if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759b..94bb6854b0 100644
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

