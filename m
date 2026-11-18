Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989797;
	b=EXhYUyUtFwTy6p1PzGE3uJbVZdrluSrzfsn7yRI3fT6xhmwP04r1R0RbIlUu5L6XAiy1
	 vfIa06qoYdqniGivEGNAS5oQUJqbBqOYdixR5IMyTGrhRmlfqj6HH2jz9pkDii+snIfir
	 8lr+1gp2xPWpM4GShoZFMYFxeg5pIxvQ2+P/DT5DeIj/y3J4rjW75I4WN/KPbwQDbEAV8
	 EtHGc+PnvLgPrrBKRYF35MLlrQAYCQuNByHGvhNkh3+9iQaUULa8IxrIPEnXb8vejnGPq
	 oM5tAa62IvEhVOlvBs2HmzPDhV4AbM8P1fg9LiQ9m1recyabrDQFXlKtGx2Ec1wmdSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=ywDqYtVxLBieC+pcYw+6WnLhaMDpmAc0RGlZwoA89VGaH3qs7t2klRFGgUWqjGZP+jl1
	 NeCO5Gji0lAA2qdoCU51pvTD5qIoT5GSfSwZcpyxHniPZ/1LXC9TH8REgUI68gybCM4io
	 eQOugUnmfz7TV20svnq1B/wreiNj+HIX5lLlpo43YQ5y9Z7V5GnnHyrgdauIavPgJ17Aj
	 K5lc6RJdtG66avFqljjgsQL1droigMquIxOgsL4/R40LWvemqXMaaOEsi86DA4T4es/0c
	 i90p6FL750/loSw5wfzNF160NrfnyIVrpThxkAFvw6mJzt3BsCUQalwNgJVjAWiZueA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM+xRzUP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQaGH7Vi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3BE606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F3BE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM+xRzUP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQaGH7Vi
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvYw4059968
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=NM+xRzUPozTCkio9
	Ga3Or0rnc0N2U8LowpUKl9AV6iCNmh7Jkua+sQSU2SfgCVGJOjeb/6eaxUL8QCsf
	A2Hk5eLWetzmefWWNBPqjHHd2W+Qpr2XqRdP0VV7MzMlurQWshTgzoUKV6SdgZwe
	o4z9P1FxfdiyhS6pmqrAF5ZY7Ny8bz5hp39QnyGwWrRlz9dtXQvRdV8D8B7dsFnL
	q4Wg4QnQof2oyi/wxAGZHQA7w5rkl5+Ih22cXn0y8iJHT2Ub/sj0nPk0Tpa+audW
	ZxwQBBJokqCqdiIJwNafszWCEeTkq3ixs6E4BMQbXq/4MP/8DoAIfHvb9gFMI9dP
	OnWRsw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcj10a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so734926a91.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989794; x=1795594594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=aQaGH7ViNv7diuxnBbpQghYURthZs8p9AFsNuxUmvXazQJclgDJZpFhWf7OncudN41
         hG9BhtiEELCOmi3twDYRLeje+f8udHNlMk9QAEymcru4e4KfJJzv5hCOu2GbFFNj1myg
         Jj0242Q3YJlmUrTU7XGmSLWa8WlzdFqXq7t4zJgs8cTiSUqQ6TnnZHz8RY5TZlCfbCRW
         +W3MaF0kxbf2Gmmi6nuwzkfZP9sBj/ypEPIrKsp0BGpQcuxri53QPlXc2+INEp9YIGWU
         73zDuhBr7oBgFQtdlclr2GW84SP6jVK/U4xvMpHxA9UbhjFdDqNd/5lw7DsR0ZNupggB
         KcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989794; x=1795594594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=1545RCvXbIM3o+NvkXCgYverKIPAb1+S13HzDvQiXkQOTbJXV0vOTqu5Wc3r+UU84H
         qTgnLI8A2PoJ2v99uelf9SKRKuP2yCDgGJo/oyPrVlKSXQINGmE9A8UvqYzHADa4sfQ0
         sKBBaQEbZWAYq0h0cQPE7c3vr+6fj3wBIcYXruNPqoV7KBJcm1EpBalvTeSz4fdpuxwM
         JhYIk4mKEZDV39kKD+FGsXoEzvL8HvpaKTZDIm6+QAFgdavjVH+o8h2BuqItIA9ZyzTk
         w+SlW65oW11TofhZ4eNhdT9AMt+g3uJX4k+hXWSRHGuj3to7rbnGHkM/0J+NAL2a9zWc
         uJtQ==
X-Gm-Message-State: APuU4Z+MTgfnnVbzqBZnKhePpGwXzFpU+ZF6LUcZ5Zvi5HZbkhsUD4Y8
	rKb/H4SJiNnNe73W3z3F88RykCfOdPq0ZdVpMH8xbdfsJ5Y5nwSOUrYaXB5/ZTeVDZMpfFYY/9c
	uGC2Z4an/EjifHSOx0uB6uZ/S40OcXXsxT4yU/kqLDjlJEhZrkE1gEfFsLhzJSvhpMY9H9g==
X-Gm-Gg: AZFdTZdIzt939NJyJ325LCz8DSlMVHRb3ReF9AvHdZD1Un4U/P0HowySHYiY3qkA1Pw
	DCObrtuYMLZWDKTvjDktpnFaO4ug2GDViEwidMgPW4HZtEy4BlfzgQkrp/9CF4NKuOfeF4Lg3t+
	oQeWbteCCAOyltU20s8Leb1pafHv3JgvocAjMpie0eMaF8RnmruLoEmqyp81r5IGUSA8r0KGYrO
	4q7GyqtAY5M11s39h3bJ9Q6HiiDUt4CsUhE8hfAiR95PUWrxRbcVHhepQglKjqZZ/w3djQJmxVJ
	0uLP6cxuMTeNcmGXQHpEKCDsObdbhMW3zkKcz5QqYwlWVITiVJEEU69pqOXOlbFuYEWRMqih8Ri
	ryunVCHByqtgD0gkVLkGxVpTd5UKQTqK5uxkq1pNBuCPGq/i2rdkVIkSrTYWVtJGKLtPCbCpRRq
	s9OGriQAD8Mqw+C0uKVXds4Srw398upQEpQ5wMhHgMb6yBZELwYUHnwr/m6d+thrYJDx37Mj8c9
	g==
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312794a91.0.1794989794270;
        Wed, 18 Nov 2026 00:16:34 -0800 (PST)
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312777a91.0.1794989793795;
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:35 +0530
Subject: [PATCH ath-next v3 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-12-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5ee3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Q5McqBllqg-Ov9kN2spWjpvr0dPv4kUL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXwEEzdtdDTxXi
 ULFACEWXWtM+GViqycW0SvIu8VChKqQ1vnb++G1dqHivpO3IW5TECNGefjKHGDcjFJpuoOARR99
 rFpbGNCYn32ahAgu6qVV0xVENIOTdxc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXw+q+nnYVkvOH
 /MsgaYwvsLrDuXYsIuAnkZXqBeykvG8waF7IIzj72v4DosjQZOV/IQxkHm206015z3oH4fdDveL
 2RrdFXedtC32JoTU1FVrODGrVhr2apfppoquvE465S0HF8uvbRvWqKH3RuxQl2S1DXM+rG6TJeC
 0FJurewvFoX8/Bxn66uAkmlSlqC9f3S4xl0NeEuCBKSkLwDefFZPSgx9RXbKssTVSTjz7625omC
 yU18JJPT0alAQkXtv1m+St0694WXibEgsmcPd4lsTnrDcWvbDEUO54NJ7DHMAICh4FTZN46j29S
 C5OupxlFeWa9f/NS7/xXaFOV6phxoyQgoi0ksqTBTEv5bSPYIWz8awOIJzB+cn3Ci4ASI9akjAV
 ixKkmYIzsgOkpE/FVB/hRB4kKgfFNiq3nza1BfU3NhqVkVBLCqL6Ul438DCF2kLNTyQgtj+fbko
 LXCRroiVF7ZTY+ncNqQ==
X-Proofpoint-ORIG-GUID: Q5McqBllqg-Ov9kN2spWjpvr0dPv4kUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1

