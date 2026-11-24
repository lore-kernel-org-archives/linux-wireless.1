Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538665;
	b=Nv61giE14waUQchIq93jm3Q3AQ1V80nl6E1p7LNS50cyEhvTg02T3aWUOPBCwBCPG1R5
	 89btAcZGh1hKINOiITXEv90BbGbDpS3vFO6W3Ai4UFSDBbEov3eJakm+K3TuwGU5kqmK9
	 eEUb1NMvXq6BErndho6U+Ynb0VDlIjHZw95RlM2QmCHL86mxvy5tKPzYab0iKY31Zlhtx
	 UAle6UK1SDoJmYI4C6wHGONSetFAvIELsTsb+OZhSRj5nIGSEgrAnbo09stwVNn6QGEwN
	 ofM6Nwp79YQzkeAD2pizCdaH3hnxLw/7J36TrYswGSUolsdDz8SvR1JxcLVZ66FZTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=T2sI/yTpRrH2M5+tl3ZhgffVUL2VxQDF1lGFfU1iyvRIFVpsK6qTeTVQjkoVUfZOX8bU
	 hWK1E2MlvlBW3N5o5Qr/YqpNhiUH5IaSRATGJ4gDLmbLdwJ2i22TJc3/zg+Q/wBTDsi/Y
	 1LtzCIpnpl0VaeFn8F3DM9hCYOA2tqXUcsSq0+Wf8YbGLmwLm+MgIs8Qsg56UiBwHRyIP
	 64cr19Kzdnoki7/OmmdUGs4OdFa7TEg3kOE+0iB/YVfwdGxNH3S/8pMH7ZG2mGXWmLxzk
	 XZMwiLtvev/N0wSNS2jmos69KXmqSPy1DVVZMtuz8v0kgc0MS+RFEQYy/HkjKFE3YmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iXwnYJ5f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTBphieR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A40606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A40606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iXwnYJ5f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTBphieR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL1AH4124031
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=iXwnYJ5fW9xOmc+g
	7aXFmwPg/z5qHfsqTJt3QKfvtf5geKOF4Hjp4kZrPtqRdGHL1c/uw6pySXrhFq6L
	gFOPW98tSyYWj86I8kqjdfMMqNWRl1TGXCpTBUXzZ55hMPsCfDGEfAG8rNcSleAi
	Lfe+pnyy1kIeDk7ElD+WzxC1C4mE3Wk/GnKG9qJ69f981dT8lqfJxGkGfxVq62dK
	oIswBrUR6p7V63fKlQQMPkMyeiyIYQfRk+NO4BUVmNe+2aHM4WMAtJIHOlMCWTcW
	452W2WbZFRp4qNIPhgT9kbaFeTDWeHqtnhwnE8RdBKqUnDfgKAY7xDjN7uL8c9vl
	WZES7Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhatdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso5363441eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538663; x=1796143463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=jTBphieRKM9DWjQPcry07R7dklhxSZzKOu+UDJfU/Uhm9LoVPn2TdTCVM7FBMprRT5
         H7XXlfKr3mU7VQJFXFXXf3Qu61Qu9jzHTvlK5I/R65O9mPhf2V4mD9AO5BGN9RuodWQP
         qWp5EFj1Rx37hIV/O5nXsTxnF9Sbid7MTpz32feIQwlFDJXT25PLNGTBbpqHnsVrjELY
         mifVlFKbfeXVLYkRWv7zbvxwyRStU6FFO+jeNOG6ZKNmNDwoda1sGL0H/bd9pCAqlUFA
         1kiuye7/lblHtlu/RRBk3koxbFAlqIWqlGMe00MbGPS56lVzXYeQD3JBQ/ZLPa3zK9W6
         AtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538663; x=1796143463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=dBmn5sZ+RDRIWs4rHI15ewwpZJqeGjVT/DgAFTq5Iq6MYGOWVvGOTahycaS1wEyQPJ
         sc5uegB7R7nxYjgn55MjsAaSiaMoVwGxHdqxxaqoTdF/F/esRS2Z3U4fIpJmZ7lpN8OU
         L6tWkJlxqL4uFiXyp0rXrzMgNCmlda5vLtZCjQ1yE5c+FPtn5y9u2FCYCFuKpeyq8O0K
         qBLyPRimD4Aa+cQU1LQS3a3UbrK3I+h/xpeiLXv6fr1b25mtx2zDOMda5XDNq8mILUCn
         3GwxLhBsYZpBwtzMISdzevnGyzC0nvO5f1tWqev1DEZMXePv0w8p5TxSFDIPNbtda8jD
         i0aA==
X-Gm-Message-State: APuU4Z/Vl0F5ON+p020yHpzacp5MWYHyGt4AM7vhOEFa/aB8buMDT1/s
	zANwhngktZXnsJL/9b7dHNbBvZJMFGdzhBi8UqoKJsRyJWijPyELK9qJ33MVW1wazYw9Espscye
	PHHY96EO3xlz3yynvcQ1Z5kE/SSoX9jPIJ1UGkJBTQ3yz0IDcpcmdFISE1k8tXf2BoqggaA==
X-Gm-Gg: AZFdTZcxRVtwj3cpBfp2rlsdVnaFz/0MC0DKVBN19TdPgYEhpWLpZqk/k/g/H7QTLHl
	IwMtyOskTwIrR566cbED2XiQuP8GXo4gCxaD3Qh1rk+DiTsJXLhcrUm1eD5qhWHcAzK7km8QqKL
	Sd/Hh5FdamzANoPYViEcYpAMDImbe7kbIRi5UIp2ZaVEqjN7YGKhi8XCNOP3h7yuB5mOwzGH0jw
	66PUi0pKgvV9zSumSM+9Slz50DoqgeW+7bGfgyfCcDKU7euytvG2ds2Wp3CYRiFRXJiho6vOp5n
	Ebg0DzqhC4LcxW+sXfQw4xhFK4ypERJfMmsQ1kxpz7tpXJkqKWzfdhcLN6nnA+mWgmbSNtCcAq8
	yzr+2+m9TiPYzc9M8VTME1zQQFh8S2Z/8s5H8lDpk9OHcCnnK6Mph6l/FbSw7LUxL1M04+Ub4tY
	inBIWb7xOEKFAKHWNz/1Om4pZkUSTGzn+WOiGX4+c2wuMgkAZsXImZNfr6Sk8oTqjcYUcZaYLiy
	Zo=
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781551eec.33.1795538663039;
        Tue, 24 Nov 2026 08:44:23 -0800 (PST)
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781515eec.33.1795538662394;
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:35 +0530
Subject: [PATCH ath-next v4 09/14] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-9-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05bee7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX34++wUil4w8N
 7TG7cd4KdBVfil+fNKdKKNdXEOdV25oqvHK7RYTxXRQsaF67691aqqbwGAo2wilt+NaA2L5m4c8
 Sxu9HcqIDKPJB80Lbn2Rn7Rp6pIcZ0U=
X-Proofpoint-GUID: vhJpWYriZqVuvaaPhZADaXi4AFQOxjE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX7hIPEgnxwY5X
 x+3mp4lki7Qv9ryPmSHQrsTOqRLX12jA7LEZFH4vnYjbUxhexu7PqdDRLDo0XTIc1GUK52IyG3v
 OxqvKTTNhP/O7D7V0zOlY9+pcjAdCZ4URbq5ksKIcfxSzgiXpRTKxq4d7mXVjf1xXfilpeQYHvr
 EYE/YyAUDFkuCeyyEZx43RybgXnQ0FPMCSdONGhoX/jL7yGlnDVzJN+TyMAmPruq/HobBvy7Ae8
 0SrBfLtyuudnXwKfoqDZI5P5pjVRX2s4O7JRZSpmUZkgcqJYJ4uMjpTMCn0atUwrPaE0VAbQqIv
 lxsGd1s+o2ZQtHg8Ep4ZkGdG8dX5oIPzdvpg3x+70QdeLnpTwh2iZutAtqooQmyxxSBGib+SW7C
 mKIjFftn1I36CQ0TWzZVXs9oxOOQjJQ0HlNtnUMkNfhf3mXjf6wPbiAqFV4MMEy8tARPQcis1xt
 4dWjNvOpSG7lHMqYU/A==
X-Proofpoint-ORIG-GUID: vhJpWYriZqVuvaaPhZADaXi4AFQOxjE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

