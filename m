Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538661;
	b=gHsIijmvscO/JRSNhZttaTEKYQ7D80YG7Eejf8ZUQsGNe79bTiwWq4yPqp5PCYBF712V
	 iz/BMablWfVAXIA5GhdagS8Almr3Bc+oPXaQLgDEZPpuFQer0bqriAN2g32aV6rKEeukn
	 AvyFVrfY7oNrEf6s+ljPNYBSFx1MHsfuXMqGkQLQ3Oc2Fk6zv5CzEwgbfnJcPfSVhONNw
	 HZrlnO7z/ose3LrgrgaTM3kv41BFDYIIEdirc4EpSYXVQ0+KO1In/WSShB0mS2/9vbG64
	 oO8E8BcXDKNQaBtEB0M8j0Wbhv0vaQaNIPCPiD3m/Aam/VbDu+kvy4bGYw58qHjvARw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
	b=BYX3jKmvs9SMvhyn/R6ucGGJjYCmQfmKvsP+tiNgFVjT14XOSWz49+uIoOCx872hhhN/
	 CnexYDIoDtwQTK5jdWnfVRANAmHARv3+dSkYei3+rj64zN4LNBS5i/kxxb9aMexB+6LMZ
	 bP7AgYcQ/07jU2vtZnTH3wZgPvNYt5WBdJD48EvMyhT0EzLlEOSaU9dLYDLM1C81HudDX
	 wPgYPIdi8Q2Z40qCMA0n/rxCOjSobbddXBoEZcQxAAkbT6xzWZfhOPQdWoYL/ZZlTtIi/
	 N6JuBJ+PC56Ze9uG5muanTvVqynen4RLVESVnOGm1HzVYxwfCWV7SgxVekYQ1DMyUDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kcz4hHnd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eCR16Mzy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EB8606A326
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87EB8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kcz4hHnd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eCR16Mzy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKDV3267090
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=Kcz4hHndpHKEDaxl
	yWXSs/R9SJHgM0rdYX+S3A/PPXd7WESEmMygZfqCbxZfz3A0iCysr1+T80waZciT
	alyVlhVOaS2Hv/X3AoofdVyGJ5Ad8gTQVpWEEEARZ5ZlS5VNlezjLF2KsFtw9ozv
	/gmJlzWq+G45lY3nMMM63doVFNuQ1Nx7dCsudk5rJJFPxnf41reUS8fdtOmDzeW/
	bZyHW73VnvZmMnyp4sLpv/IYll4UNsULmmOUAXi9YSGeLnyZdEsQdeByesPsfKw7
	0crw9GItLmNUCsXQpokSJqjHje5IiL68YTx1HEjFw/E4+oW472ekNYmvOw6eJFi1
	x7gZnQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s7qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so4816975eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538658; x=1796143458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=eCR16MzyvmF6yixbgcFEh9T6lp3rVwsa4YnIpWq1gsn6471CJmcxET0x69VI/v4Kg5
         UChYC/RTKFqpW8knO733FimvsOozGVoVw8lOcia6uQPcv0jW+UBkUgo9P7WXwPDAVh7S
         1fkys27EV5czAcvYOvU6P4M2qoS0k/9VD4H5iB4QIXcJPS66skBFNST6GR7pYjKDchIn
         ZzWnZX2jK3qi2cGxzOh2O7u6gl76eEg8+Cc860S5bgSoLntTU2D5XCFYQ737OVT1aTi+
         ldErKURat0WFqw4mMRUK42O+4sCtghHuh+7jPm3U1WSwYkRWTCA1daLwEK0r5jOiNnNZ
         vsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538658; x=1796143458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=Ka2aW+YkpWn9h3cL5Fs0AYU32na/u3UoRLuZKyVaFzFzRPHXZI7+3VL6cdNeGm2huG
         cTuaYR4/QI2dUnIN/IpAgyBrhYBnNQFW8bZDGYDhQSYm0VI8NZO5TBjF8XC+ei7VF+ML
         KdweCy5wcC3oqo2MvGRDy2dyfXJbky1oZ7W3JkQx+HNcECY2KdPiuqnPTydvR11t9d6p
         bRFA4BjuiBmKOTl+wBQQFX87w0Wo2YvBsBBDAT/TY0DmaGTrmKL+L8c8LQ/ObEa4DM5V
         /F+06PmoELtQu11kGm1D71mxcpBipvHxdiUwjJJiFQXL4c6Gpe6W+uUDlSpHRB8MmBBK
         GhjA==
X-Gm-Message-State: APuU4Z/ZRbNT0uRYbxXOLkdqpFUqVOhR72NaMHH0oc3jdwPJNzUIbBC+
	UMj/OFjjUzl155o2yGQVLbpAXHeYhcsXTeF9C/svt5B+k+1E8sMhaEVmZWfmbjAQZiwZwviaQIo
	Pa5qKWafBV4BxWv/EbyUt5TrOl+j3s6nZgRYg0Z9hD+Pxd2pvxCrjsJP1Pp/H+A8sWDqrjQ==
X-Gm-Gg: AZFdTZdrM0Y7wgkEm20BCJA/J9PkjbmfJxnt2p6xf7MCM/wfgURMKxDJA+iQgmJehBk
	MyIgXUq5pDnhGS0qqX6bR9X9JoYrTHtPpHSRAbX3aj8QIRw7U2Uc3//Apkza2RErPAtjo0RRgyk
	Thr2V13+YGWp7VhspjRPfR+boBfkOKuUxZtTVDu5sip8r+Z30hjaIisBVBmLcRQyLhKGjqvJGkc
	UiI50GlLbCAMMLd+gle4wD6n9EeTpnDl/U6ykJOimHLBmOrhnS/6bE916HN5q9nMY9gtCRu3Jng
	k5CXmv9J3C5wqYuhyPHUP4e2/IQWgAha/m8CGTez4AwEnemrEJ1L8wn77JHMUqpPNIxS4ibFw/H
	uNsRl9sq6mu0OESGdnyXEI+LHbuqi6zU+2AwJ6I2Ao3t0D29/O0pT1jBi1c0+xOx7dtsh8SizVv
	LhZ6WutnlER2Kef7kJmDmXHF0XEEPMdprVGk/fDjJHxvC+chIoATvOkzTfZ2VI2zCKSBSw3VWRP
	Io=
X-Received: by 2002:a05:693c:69d4:b0:36c:a154:db1d with SMTP id 5a478bee46e88-3856c6b41eemr15643620eec.4.1795538658304;
        Tue, 24 Nov 2026 08:44:18 -0800 (PST)
X-Received: by 2002:a05:693c:69d4:b0:36c:a154:db1d with SMTP id 5a478bee46e88-3856c6b41eemr15643576eec.4.1795538657426;
        Tue, 24 Nov 2026 08:44:17 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:34 +0530
Subject: [PATCH ath-next v4 08/14] wifi: ath12k: add unified firmware image
 support for QCN9575
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-8-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX3ScnoMqREps5
 qgg5oSniiGbiwFK5AyQxtgZvLBiFhbCEiqVG5vfShoJMbnzLGsOW0NMCSdWmHAv3Lu14aVUfeKb
 v5BAlg5q6t6ht88WF/eyTDgf5NGqPgo=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05bee3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yptJjfQlWYdCmDOAxUgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX89GrXdeODzzr
 4g2fXkn5umRjd5QpK4HUAoq59JlIYjg8V5vzx3/Nwzenq85xqDv8WHllLfl7iylmO4IROPaTbuk
 PdQkJQ8S8lx8wIg3ZwQ0f0XSCf8QhhUFpdtPWZL0MK5/p8v11L2BT0OvKmGES99uXVKgpjoBweQ
 GmjfWx0sGFLHU0cO/QjyUrAknawo4TsUwQi5DESQKJCSkVcGs7CgXVjYmFbEQ7BILdDtKjld4uY
 /gRfeqKcP05k7CAhrVT0BFIhnMyWMWNvfvBo5/X5QaHK7lgGgCLjENY1HCGyH0qGQa9+sgABm3C
 mphUtt11NPSa05P5cZSq6loNwoAdMrUB3VETOnARs7VQZNVZhIZ7yiFTzQYkDooUQIDMXzjs3/R
 XKqptVOX3wVVbUC5d4oaIpxc4TA9xOgDZL70KF1TY88O7q5Ml9oYe7g1aZZPwZGNDsuHyiqTxC0
 ibzSeRf9kXXxaxoUSVQ==
X-Proofpoint-ORIG-GUID: hgQBqSL048QxBWWGD0XvewEMKVRrDqXT
X-Proofpoint-GUID: hgQBqSL048QxBWWGD0XvewEMKVRrDqXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065

Wi-Fi 7 chips select between single-mac and dualmac firmware images
based on the OTP board ID, loading a separate firmware-N.bin for
dualmac boards. QCN9575 (Wi-Fi 8) instead ships a single unified
firmware image for all board variants and expects the host to write
the OTP board ID into a PCIe local scratch register so firmware can
determine the board configuration itself at boot.

Add the unified_fw_image flag to ath12k_hw_params.fw and set it to
false for all existing Wi-Fi 7 hw_params entries, with QCN9575 as the
only chip enabling it. In ath12k_mhi_register(), once the OTP board
id is read, stash it in ab_pci->unified_fw_board_id for unified-image
chips instead of running the dualmac firmware-selection path, since a
single firmware blob is used regardless of board id.

Add unified_fw_board_id_reg to ath12k_hw_regs and populate it for
qcn9575_regs with the PCIe local scratch register address, keeping
the register layout per-chip and self-contained. Introduce
ath12k_pci_update_unified_fw_board_id() to write the cached board id
into that register and read it back, since iowrite32()/ioread32()
give no other way to detect a failed write. Call it from
ath12k_pci_power_up() before MHI start for unified-image chips, and
return -EIO on a readback mismatch so ath12k_pci_power_up() aborts
before starting MHI and firmware. Continuing after a mismatch would
let firmware boot with whatever stale or incorrect value is already
in the register and self-configure for the wrong board silently,
with no symptom beyond a warning in the kernel log.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h              |  1 +
 drivers/net/wireless/ath/ath12k/hw.h               |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c              |  4 ++-
 drivers/net/wireless/ath/ath12k/pci.c              | 31 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/pci.h              |  3 +++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  7 +++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  1 +
 8 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 4b0fbd6f4aea..9e88bdf4a93b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1219,6 +1219,7 @@ struct ath12k_hw_regs {
 	u32 gcc_gcc_pcie_hot_rst;
 
 	u32 qrtr_node_id;
+	u32 unified_fw_board_id_reg;
 };
 
 /* HAL context to be used to access SRNG APIs (currently used by data path
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 6fd87482425a..9c11edd2b051 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -160,6 +160,7 @@ struct ath12k_hw_params {
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
 		bool download_aux_ucode:1;
+		bool unified_fw_image:1;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 56e697fbdad5..90b7774ae6e8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "failed to read board id\n");
+		} else if (ab->hw_params->fw.unified_fw_image) {
+			ab_pci->unified_fw_board_id = board_id;
 		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
 			dualmac = true;
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
@@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		}
 	}
 
-	if (dualmac) {
+	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
 		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
 			/* use MHI firmware file from firmware-N.bin */
 			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6617440954b1..d238603f6075 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -976,6 +976,24 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 						   PCI_EXP_LNKCTL_ASPMC);
 }
 
+static int ath12k_pci_update_unified_fw_board_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	u32 reg, val;
+
+	reg = PCIE_UNIFIED_FW_BOARD_ID_REG(ab) & WINDOW_RANGE_MASK;
+	ath12k_pci_write32(ab, reg, ab_pci->unified_fw_board_id);
+
+	val = ath12k_pci_read32(ab, reg);
+	if (val != ab_pci->unified_fw_board_id) {
+		ath12k_warn(ab, "unified_fw_board_id readback mismatch: wrote 0x%x, read 0x%x\n",
+			    ab_pci->unified_fw_board_id, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 {
 	int i;
@@ -1484,16 +1502,27 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID))
 		ath12k_pci_update_qrtr_node_id(ab);
 
+	if (ab->hw_params->fw.unified_fw_image && ab_pci->unified_fw_board_id) {
+		ret = ath12k_pci_update_unified_fw_board_id(ab);
+		if (ret)
+			goto err_unwind;
+	}
+
 	ret = ath12k_mhi_start(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to start mhi: %d\n", ret);
-		return ret;
+		goto err_unwind;
 	}
 
 	if (ab->static_window_map)
 		ath12k_pci_select_static_window(ab_pci);
 
 	return 0;
+
+err_unwind:
+	ath12k_pci_msi_disable(ab_pci);
+	ath12k_pci_aspm_restore(ab_pci);
+	return ret;
 }
 
 void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 62b72558c0e2..70952a52a1b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -38,6 +38,8 @@
 #define PCIE_SMLH_REQ_RST_LINK_DOWN		0x2
 #define PCIE_INT_CLEAR_ALL			0xffffffff
 
+#define PCIE_UNIFIED_FW_BOARD_ID_REG(ab) \
+	((ab)->hal.regs->unified_fw_board_id_reg)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG(ab) \
 	((ab)->hal.regs->pcie_qserdes_sysclk_en_sel)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL	0x10
@@ -144,6 +146,7 @@ struct ath12k_pci {
 	const struct ath12k_pci_reg_base *reg_base;
 
 	u32 window_reg_addr;
+	u32 unified_fw_board_id;
 };
 
 struct ath12k_pci_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..282a41980d98 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -413,6 +413,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -509,6 +510,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -607,6 +609,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -702,6 +705,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -792,6 +796,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = true,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -891,6 +896,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -983,6 +989,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
index 076a5a609f8b..92ea24634100 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -68,6 +68,7 @@ const struct ath12k_hw_regs qcn9575_regs = {
 	.gcc_gcc_pcie_hot_rst = 0x1e38438,
 
 	.qrtr_node_id = 0x01e03300,
+	.unified_fw_board_id_reg = 0x1e03304,
 };
 
 static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 91d8f762e642..bffd1081fd2f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -24,6 +24,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = true,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,

-- 
2.34.1

