Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989786;
	b=qdr9MYvC8D/LgNSYi5LbezZZYsEzBIsFO5esl3+ephrPPZYPG+oe5nN0uI7olw7djfJn
	 qpG21CFwlUsHCs2/4/bt6JCS6u35JoRdGpzWWwR9WF/hZTx2/USFvSFcxF3pk406IpmJG
	 HQQ/idtrJFfbqL4QBAY5aDniTCBH+TQABZjKk4mZy2dsKKJxWlQxwimbAyryO2OJDGAx8
	 dMmPjqo0rfDaGkzjUEu9vJR7ivFhN+tgMY2e1EgOZT7iAz9ra7WZcMz2lKJwaW4pBlMzt
	 TRa6WfNtraEkHK+UiRqDBbM85OcXaUArvZ1XE8xHWnxh56DQVTfnelg7WT1giPHseTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=D8Xp13upsTXqKu/sSelV0pAyIPjhs2Eo+Cc4OmI0YbSCPwIMr2wuYs2ahyG5aG39VjYB
	 YJ9V3GPsM9TTiE7ZD/rLwGdJMEPOMpqKTu0WhqX2OaCfPX9Hgs4RH4v1Kr1XloOsaB9eM
	 +ffFUX7cNIMRGsb/AWmCn9yJSr8+KDUqyh3lwTSq1/73YU0P+W2TJa/91Tla1cdSOr8yO
	 z3iDcNhON1ITSIBIwoHlXutKxttgGCxpGtlHiLTgiVnq1wZcyPhpyOuZNdTSC+YFA+Zyz
	 uo4JkZk/uoLtRDTnUneUhjQATIbDNYRnJnBczgZibqsMrqjPXztiOEceMwG1RHh2q8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqhfalMR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F171606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F171606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqhfalMR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2qo2106321
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=DzCboT7Dhn4gGb+i
	TKOVZRY4KjDy1mBZpGu3EEkyjoEsvlCkOvJksE4Rjgq5yUOJHiEDO7cUGcbMcdLU
	YDu7rJfTvsgwFBD+IipYzt4X3XhRNfgcjPC8e0JXIBpU3v3Bt/EaLN3/xHOAE4t2
	gAA0sk8RB8umQ+qZ3mJHt0gWfYHl8Ni8EfHuyj54kpTTcPvkwoa+TcrleTNl31Ai
	IQ0Z2Fs3XXOqRhEupUNC7Wd4mv7jdt7xfwIiEcp6rot7Xu5oP6jwJY7cc/k/H2I3
	MpkVyI8B1Zm/PnkPp3UXkoY0JUzHfS6zhWd+zMNsVy067//RjR2PTXXXd9SIXHo4
	TDcMVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sxmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b74351a4so767002a91.2
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989784; x=1795594584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=ZqhfalMRIVW9zVTEZ5bAp2qwag2BL1ME8zRXHJ7pl3oShz5HizaCfg1/DVt77l6s0q
         9zm8fWVxQM4z+rpixI01305IxCoXSZPj1I60CQXLWuOJ7lJfmTO4FteXzWKSM1IdzRg3
         NJbZsePll4JGgDD0KMyZkc3m5PE8UL25dHXC/kZTm2RKZGWy4/+bouen9jpnpEsluvyt
         TbxRyrhHVFef6IwsiuVSMPsHh76ni5z3qctlKZvrXsybhHM332aVG4BjHHGDuLD+nFew
         vT7UR/JCVDHet/rOztERk/Y1r3bYDvGyOsP57RWSUsyxZqZAe2BF1rH2fciaBax8wf07
         FYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989784; x=1795594584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=Cthg6Q2sX/y+jT1aGjB8HC61zrtExZgCYR9q9AYpD8ao2ipKznH7ZSxjaqJ4lCzlLE
         mZzL0pVbamIptzzXl0kbFgTZA1N9Oy6Yu5jc6LKddCHmjy7/5LDAGgJI+ozg2tyAze+T
         ghSE9p5IJNIoFDmop5ixbKwVLOHSHzHJ4DVR5iP57s3diD3q5i6O8Z3NoVFf3VnJyrdN
         4Hm8fbuadm44+H4e7ucw+upVkzDZXs5YSN4ROozDKElzpRcTQyWiqadJItUiJi5YGSIG
         TRG1fEvkLvhHayyvQ7ZrLerudJIJhYAFBW29WmskDWjTLHPsqHnODhWCNx1mOMoXIDSh
         06tg==
X-Gm-Message-State: APuU4Z+Ed61OnyLdXvwCG3oqdm8TXUpkJ6oPm/tBUmzT8eemLtRycUUb
	X0ak5cAx/1C1vZyDMRYkvrD+RHp1hDDvPHfDYWqMG0I3H2TlvBIAntUjSd8+JxTVzhxcmkRBm/U
	zGAKqzH3rDNqwl57q4P/kuMDsM9BQwv8HkRcKdA2LOZMaAns5OibuZu4TGorar7izM6f3Ig==
X-Gm-Gg: AZFdTZeWjCzQjysqXiAMvc/a4w0WLmMOZbNaP6rbbP835frUA81kxEAP1oZmeIRldog
	aHTG8ZrFLRC7anYPxUF8dnvTVfN1wdvq+9fTGqMPj1sjFxqzUTcpZbURsdJwVZT9PatIM5EJy+E
	T/f7PxpIpll91qjXbxF8nHF59q1QjrWE7xg26bQP2enwTx2HxiFwQmKXvoCvXprILvDRHElzD07
	ZFSuyUA52vBwlqHiwigqAyfnOX/6CXP2vRd4G4hBxrAnYm6UbIq+3kviFpfyFjSoaxM4PXeQnM2
	aYlZnCy6KcQKLFm/ce3pfphULLqZAPZ+jajTaHs/SdPfzouLU6q7DxSZ762rIDmbwEH3beekf++
	DW+e/x9AKNV+beEOGenADIslRJDgC9gqGkOHIniJPIAmnyw1DAyd7tWxzrM38Z9qnTzR4Mo94KS
	Q/r0YGkBhbgLqCbZeBzG3e4QTKMfDuk0K+yYi6M1HykhghNF7tajLDD+/9s3FtS2Kn/L+jhid1Y
	A==
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897024a91.60.1794989783721;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897016a91.60.1794989783284;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:33 +0530
Subject: [PATCH ath-next v3 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-10-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HewPhcawoxmHwHeRlLafMssIk3iaFLMt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX7C06k/qp7Crs
 8So+VsLlP/nC8Nxrho9Tr97r9JFiFS6iaZPuQH+39ZgeBxQq9gSmblsFuvNY8LkRczWtHx4Mt/X
 mVmwNeyKudL2o+kAkoEywpA4IFvo0ds=
X-Proofpoint-GUID: HewPhcawoxmHwHeRlLafMssIk3iaFLMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX2zZlbxzKRbQM
 M4OcFoPi+Tc13bhzjC33AsQgdxR7wbGHY8Ru182ik/iqip8d4I5YGOAA119sRMOr6mW39U09XQZ
 IDKv8aV/2ZY7j44rjFLLVF42Pk56KkCFyXLKhr5K4dIUu1tbdqDBforPIaieJ20L78qcRORlOyP
 xoaq1LwG4In3tgXSLXRu35KSQIPM0K/Rj6TdZPC2qSjQWXfk4cF7xhYAwJqwWpgeqeJNkDmrsRK
 05kWlk/CGhADwClPHN5e55xCpaDBj+ybFv+WOL6b7gP7gFPhKT07Bxus8lkwW5oMU6wVQgEluON
 G2rqjBvWrmuALRd1QViRzW8LrTppRdCGxTPNkTMwA3X/qjZ1E+EEDPeBC8FEdTPXCc8Kx98y0RD
 yZHYtz3pADAhiXFxIopgjWIVhT9t0ym4S9Rb0IuD8SIv2/hynDBSes7Em6VhJo3jNyTYcsQz9wG
 Y724Y3G2qJRN67F+stQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5ed8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1

