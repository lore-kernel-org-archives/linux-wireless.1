Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982805;
	b=e2OoEbJDFAxdRrwTFYTQyLmtCMKYLOm4n7DRIsLMRC6Ym0cmLremmEmFI3uRfYd2HQgA
	 VwCSwWkLoHsY2erJzkqVQWi0nXhbBl8kkZaWM/X/b78mnJ1l243zzMvXZf3KJSxmBhUle
	 q/0g26vex0e+JieM9gV9S2XBuuV1bzOMqrT45NduCeu398MOrPDJpkvX67xv851QhTr14
	 6ExJlKTyNBwY4xn/y0IewntdNLHR5IGSnhus0lkPFp8C3JvJQS9XkHgttk8qUKaeQN+P3
	 xAIKUUdHedD/BCMmaWprUkJwdDLCFk6TmoBxDKBWUyrgczjn1vSPJvlt0mMC93lXGGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=NliBmkXbXEVM7O9cI5FMZiHhA/cW8CPeAk2QD5vWPhuou78bn/pUJk9v+QhhaME/C5eY
	 hn6ie6mgA6r9OQlhFqU02Fab/odIz2/XbMlRxfAiJwcK3a7Rq+AkPYWVpKGA46GEL9dHB
	 hvzB7ngxf/yI7cwBewSTxSNc7rwxf2TZZ0IoKSASaxc8Hkuj0zxOWm+wOTCyHCKzpcBW1
	 eKs+HlswiUTNp9OwHmDC4kqCkec/79K+9sAfHgJc8GybOlNP/BFA6zTIlJAyDtUcENwrg
	 2Xu/0r9chlgHaRGmwnyVpFeGtSyyD7RyTQ7kVOyElaeRFaIEmG7gzCLFPyWVDFtpYhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdDHqycK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cXneoRfr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8240606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8240606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdDHqycK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cXneoRfr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvCh3121699
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=bdDHqycKeNp830rw
	4GqOPocZ7c1YohlPh9QZTQDWVtfTfNcZVlFLEDdZPfr5wAW9vIcLDjUJsA83SOut
	wBF9VRaPmnf3a0kpy+6S/N2sgjuy2IDb81BzOzhE05Nyz+nqAStVZZjGkv5u7O7x
	uBJFrVNnSkSk7vZlMOl7U7GThTaT3q9GD2YR5lOMMHW3MJ0XE/uQJNIL1FtlKRDv
	qLG6nn3j0JQ3q5uggqGsNMnQhMWNW/Ma2waVInwLlqIdA6JCNrgtm+wW65tC2oVM
	KteKAsQRU1+fAcrBvYVZVd3NM0NQ/vP5YaK6t5Zg9K71NKo8BQYexnBKB52eNRHT
	f33i7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hgeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso536964a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982803; x=1795587603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=cXneoRfr7Y4UifxB0c/7BLtl3Ovlt6XHefETj1rQZWIRZG41hsKAIKNsaCYxg9vIE9
         2r7I4DDbsDTkrdzQzGACHKnDCmXp0SMFdmAe1v5WG5/g6UFcBrxzbwNqvrK8bxfqrND6
         DtUktjkm6NBuBD0WWVXR3sK6RLvqiKACQgyt+u0RDJxM1ZT1idgljr6MB28doZsZW1Qx
         d0dHynQgSueR3WKNkZayl7v7eCD43RzFjJFXD8jmqmvsfN0LMa8UOa8eSRw1mChb6kij
         rq1G+x7+WffknTiLb1P1A1ISoUIHpAe/wIKY9kwv52Asj9uV8zdXL0PHfhKKfzz2udae
         siXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982803; x=1795587603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=z9+v2lF40pyClfDgD4cYCKNoEQXXyzq+2ZZ3qIxanI5a8RaNqfPD5r0M3yPgULe5nA
         OVYhIv1DtOtiPzP4gd72pdR3G4jll16lBf6T0sscZmFUcLBq1NeCba8HPdsMExySoeCE
         7C3p7RWbSLX1R6/UCj/jdOofYrInoLz19A3BoJcSgfDJAMYkAjki1HFPIFCZ24F+HPME
         4R5oc7AFG3hMhs+zq4e6C9YuHmvEzAC0FHE9P9qnhmYTMaevF7WOJPJth40AwgnVKeBk
         pI6HT+a1aY+c/15iEYUo2pX9j1zj/M+LdkyyRR1OjvaHbbPHiM+SD219kt2JG4FyM6Wb
         HZWw==
X-Gm-Message-State: APuU4Z+XV9EiPTqqQDaHXgTeyNYsO9ykJheQ5E32qCVIcF6Uu/9TapJE
	9UJE0F5tsAf9CvWFKLJuAjsacaYDz0NGPu0Jz1byBYVnPM4ldgj7BP2gRfFSObtVLzEb/OlaiPi
	2pTIBH8ZCPx0hzP+Z0BJKwI7ZhxRyZBN65RCGIKygKQyQyT5+7nGBn1Z5Q2y2wfN7214DHA==
X-Gm-Gg: AZFdTZcJQ1rgZHlUkMT7sZkZ60/ggnK2oYSbcmSqnijDaVHTyUMM5lJ/Aav0beJTp1B
	hw15pyKdfGphnb+xfXxjUzJhnjm0DvBVQu6HEjFgMz381wPlHLDgxWxHxIOX9sxWn58mebHKGua
	EJzGIf6x8O9JYt8ci9Q5pKjz2qofyvJfucgkZAVmiAgJWS8rto/OA/6jGg71ImEIrFCuHph9q8I
	ITJp6kgIzHsq1J+GGTbtIfFgfbVXBTnQ5X7attrODSMTJqVYAH3gx0EbZ16ZQICarLUbJ4YSb3R
	NENrwTje7PcdIfDq/8KmfPgqg15sxo2byrvzOsE9rUNP3FNfJK4BwQapQmBXJVDrssKC0co9/Qy
	Ae99f6ZcYH7WkuWAfwG6CRrP/pvBmVm1teuYqUF2vS22Lva0ICSraNPMN/E3F/86ECPatuyxRus
	0fvPupN6zrUxhKcam6tpJ4MQ35HR53u5eTM8ASBX3KEwwtszmorB5e4la4viNyHpZZtRgO3H4fr
	YU=
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762544a91.52.1794982802652;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762502a91.52.1794982802139;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:01 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:13 +0530
Subject: [PATCH ath-next v2 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-10-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: C0ekteFz3SqPYFEFcQS8WNCyHEgtMmfv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX8+D3aGlZmzyY
 /e9hjiLHdKrR2H/N3TAio8qDWnb8pioFvugPO2168oaiTwaozvi/4DvVjRijMfsJFuLU9227CTq
 wu4Vi/o/MQ/D4iRnABqkHKGvrf8c3u0=
X-Proofpoint-ORIG-GUID: C0ekteFz3SqPYFEFcQS8WNCyHEgtMmfv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXyXG+z5o4i95O
 vjOmOIblKbYrmCphqa34uHH9O5GxK6JuoKvl4KlL9WVHHH2xik0Z0taHVFJupgZi5Y3K8zSy2a9
 998NUu5U1/cJ7BOQDWutbMv4Fago+BGuyXzw7ZLd8seo05tltTXxg1i03rv4QBdjPwn9RhRUjas
 O4f41KxnxxuyC3mF/gWxyftXmZ//mTnkaSr8dtPiTGJaSH2J3hqopPIpM1rm/5e6btpiVSEecVd
 5LJAryHYt6iV5mN5dImFRUR050+X+v9e1PATpUTyEq6Pn8n+z8rgBIdKTrrIlKcX5oV2kbyGGc8
 xGIPKVUM7+6n+lh8wQsBh6mgfY6UBj/CTwPIMjgA5DC32dYrKC6DACgs55aDz9eNXY9987JkXuf
 ZGRuw+uGLLZ9T+KtDKFGag2UmwQ1QgUhvv+vy+A8isrssHdPIidyH74W/99b3SRyEooLh/897wb
 0l6wCOoxKIMLh1j5TsA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd4393 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

