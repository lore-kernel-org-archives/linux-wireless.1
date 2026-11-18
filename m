Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965008;
	b=XFiifp0BNBAQSapYc8abxgymXuBjXXS0zRFlILQAwm8sxSYA8ut8aXoDU66W7+WzYFYv
	 PNThGQi/1suCKvNz1klNUXdt9gg5cRb26TV55JvZt+jxoe+1cOcCJIn4/0ouJUhyH7K23
	 E6vvh9H49HZOuyQU8SZ0oNAHp6rFOzbp85r0mYa1pz1jR8OuGPWXvK3rvsorOngVMrs7h
	 XaPjKu//zbW+xTIrPOlLoV3V+1TcmUApu0WsVnZuIG/IeOV9bfavo5OwxO0/TIBPQwscV
	 5R1qahS2nNr4Y02vYZm1dAamrCvr0V0FcO3qDHWL81G47hwS7B9FH+8UUepImc7lkgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
	b=VQQ+PVWbiDz3kVBicdbOp4y7w82AB0G0IlreliInuhv6lhaiG5Z4X99MNgsRWlLjvqDQ
	 anORKNS1DbhdeVNDJcV1zEdbPt17g9ZulN0CjFjiLmMfR+nq7smk4UmDuiC/jgx4w/QhE
	 3gqxi12MTg/bK3DOPDVGCefYdJzQ9qxbwwSolGWu8Pg5xAFnzDg2HcnuREBLnspsbHORy
	 zPxwDGbBjzQah0g5YzMNEBR0s4mdIwFRjWWgUzHrxJMpb3GO39ODi0mlzf7FchSAeQNjO
	 EqpmriQnpzzSUxtTffTfrJD7pAbmSrQ3JJOIcHOmxwma08u0MzLkMDkzJfua/FVLPzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pi0.com;
	spf=pass smtp.mailfrom=domojo.com;
	dkim=pass header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=DZmwM0Z3;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B1606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 01:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9B1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pi0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=domojo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=DZmwM0Z3
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso305609a12.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1794965007; x=1795569807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
        b=DZmwM0Z3iA/PolSickj+gYPBKFp1C0Imn3q+48/u9uS6y/T5GG/wWsuZ+Wv4xmSZ26
         pSHoUIj4wGb3wKKLs00ufb8c1fKC/X03+98OJS8S+IPdQ3tMUDfJosjTFZb0v6l/pxnW
         zZKZOYWVUh69AtshRTs6y5mh9fZ6J8nxiym8IZtnTESJ/ehYyu7iGRgsqHCOiK8nNU4+
         +aDjxBr5zZQgSM79iK6lmWXWzkFyrGqnMs3CYT8JUxcOic/9kjv5/6yBcY3UiylJmhdI
         N3HhSGASLpf3TPnKEJqELtwiQrUTiCt+EMvdQ/eysciVe7P59DUnQpXl2N4LUsM7QqJ1
         LUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965007; x=1795569807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
        b=LXdxYFXsilSbwzSWknoO0WG+9mC+QuzG+H9Juzu0GJ4N0WxDsJKCRmaI3/2/Eapkq9
         4SybDrUHLk/dJQsyrQjtO3Ew8nlgZsuGOrToGCFq4bUJRznvp1QPh3v8hyi7eoPqMRW/
         clCiX7toRpeD0MNVO/DdnUbd0pnr690pZQwnPx7BTQS4wPdbjNgBeKlEtCGNF7i2/TbB
         pCGqgwdwVlRI6cSLh1izo84ejxML8Whp/UCJo2eFQR7/mDR3V4+1wi/iw6pVDLmHWA8x
         9JLN+QHnqBauLCXh3m04AvuVvd6lX2D9wfssvmVpnTxcnUez8pIdhokD/w6WlXTwdQtL
         wv1g==
X-Gm-Message-State: APuU4Z8/BMoVq0hDlt6Utt45l7s9W/61v4BgsCu6usd6dSnuheckX74O
	Ny34hw7womYaXhZdGrrG833KmsC9ioaZByBN0mui0vFDMIdQRKUcq0wMtzP/RuZPKwI=
X-Gm-Gg: AZFdTZfahNNk5Sy+9O5vqi4dOINgj4hAEChPXwkxWo18fa0qfsMwfR/cm7ivbz4o/MW
	T6wu6ZLDDHCLJKkfMUqJwLJLKzG6HpY88XKP68GyQzbIGXYwpuR5zBjOcdoWk/gagV1QLct3kZp
	SE90KSXONda9EY6h8whExFwRWvSb0Vn+ss6POL+2BsjsYlzNVjM8CvS5gwKJ1/qAQ0zW3BqtM6Q
	8K27cr0BDAARmIBoaPeH9cw8XicoHWtNUlB9DMVPVDeRhQZYgIxwJaWfxtipcdA4ufyV5LVatMq
	+rr8ZODiMcl7s2QOJr6EkMlAUqe1PixsfG4QkIYLezkJI5RgkYeM4oGKlyzu74oNhlwqe66Ace+
	3gY8oGke4gBdFXASciRRgblRG36ne+aWuXZrQ+McB6W3oa5SJFuMWuTVXQoO2MyGyJ/7fzxQVWt
	677n732YKkvWk8hp+VP8DhzHGkTGb6EpFhofku2lz3mc9dmMcJ3N7+k2nNCX6J5/m8gOj7T1JD1
	9Zb4PBnBIdzBesdugUiGpICVbx88dlTTCQZJDeOELbop/jjr9O4c17o02+9haajgV0q3BVBcpLN
	4yGQZxiz2j3gKwUHcNy7nPePeOGorCKEHYbERygY7/2Y6aOIc4CxSCGzgNWM+8TgpsY+2KBX2cI
	ARhMPaYM3e9dG5MIPrPOvL4uHiJ8xTqfu34MNOe5Wog7LlOB6GkEjIqsx
X-Received: by 2002:a17:90b:4c8a:b0:3b3:c998:6d6d with SMTP id 98e67ed59e1d1-3b3d07d454dmr1081904a91.47.1794965006850;
        Tue, 17 Nov 2026 17:23:26 -0800 (PST)
Received: from apex.localdomain (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187aa1esm1439308a91.5.2026.11.17.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:23:26 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability TLVs
Date: Tue, 17 Nov 2026 16:23:21 -0900
Message-ID: <20261118012321.2861920-1-wolf@pi0.com>
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

Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
patch to Valve's matching 7.2 kernel source. MLO advertisement and
radio-mapping diagnostics were enabled separately. The cutoff changed
from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
and AP-side data counters increased on both links during traffic.
No driver recovery or association loss was observed during the test.
An unmodified upstream kernel was not boot-tested.

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-parser-live-test.txt
Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990..f43c9a359 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
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
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
-	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
@@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
+			if (ret)
+				return ret;
+
 			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
+				caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
 
 			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
 				   ab->wmi_ab.sbs_lower_band_end_freq);
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
-- 
2.56.0

