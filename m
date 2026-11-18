Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982784;
	b=t8brd4F1yXy6RyTO9f1Zub6ivNmfcvQu4ViVryfKm+xIFdjelf+t0fmBZWOyayUMwCh2
	 5leFb9LLmCICwNvYD/PRMZUxprZDOIQIvBmviUPP1Q8kNzANKvCc5z1p3CfWie1QccOdW
	 7K4EZb21zSqtGw9yMriP7Iry3RHi8T7ULEJOu0Edrl4gaQxzMbb7nQk9IvFCcyh4Qw6P5
	 ZATVVJvt70u1jcB9F9S9tz6BM2CdzJufU8+GLqLRnPdDxKGqBQXs59rSNlP1GLO8TVgMs
	 S+EFT0cYHjcvZ9W/C6fh2/Uuwg4B4/IZdgdQJt1BrB9dE+xPv9cUqkvjYWtK9i1f13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=xW2DPAB6IaWKZtpRVhexcrb2Sd+51RBOZfYgelk8ZwfqcK5bQtQGe6H54No6zkxC3PW1
	 z/2FHfp7RDN94X6t6nL0ZFca8TDOdjcgwv+x4Jf1rO5LKDGJT2VyccINUXi3H/Sk1Bwmk
	 O5TutrLHTmv22le2V8VOg1HxYZzbEKnrSEPTphndQc/tJroIITHOhYe4SC+tNxAj6nHnv
	 GwflBbElRzASNvjT0MRrPeSCZ84/+qG/gU9A7XyX1O7jg5yFhkABBKjhvVq4VCcVRbTjz
	 Wq7R1tADreE3Z+IMvVRlm5n3jjZxduRF+ejQYr7lyPSA+zlw9nIl7w1C1YCIsLihq3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grcbm2Xq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uKcgPV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20EC606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20EC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grcbm2Xq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uKcgPV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Um5O3371225
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=Grcbm2XqdikCIFC6
	9bohMJTNmk66EgQmWKXYo7hkfBZiw9FLCRsPDAQV7RhojP/P/Rzd48UiMangWNcm
	MLAhQCnV5bEcu7s9Oph7fpO+RvTKsxVK6KisJg8/Ve0qQ8C1lHzor0ABfPhxKeup
	allGGuO8E/L+zW26h0DVfpe0YZd7+eAGM+chuJkePB5XF0NBGCNFRBXAaOz6ctfW
	XS5a4xjOGSIqHZFLfuom3HBb/pstpwB0aEwykyO/IXJ4fNft1t+xRcGKZ8r1F7wG
	/uIr0pFNVhb8OMBRhjuPqImtw58toemSiWvAjxNpRR5JuF+EmakBzxJc/2Gq/FFN
	lWMguA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sgyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so589504a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982782; x=1795587582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=D3uKcgPVIpg2Jq2Pk/3J93PWIO4D//WmFrLcd3+Hm00X+CF4p6ZZFlSJkNQu8ny/Ro
         gSmpqHRTjF6m4o/PuiwBmNbECYSBwD8c+yJXvTqx8u34a+/o87+SM4OVdT4aq6jTUGTY
         nsh8EJ0C05dvyF7n2+ojwoUuOH1l1XmTBx8/G32d+cDz3wi47hkhYRPfsdjg5V1RR+97
         5rGv9A5cyzPuBxuK9Gy4V5lC7f1xALMc0B2GRovePsvaluML9CQ0Wln59yOm9Zx/sjmR
         t2c2GV2XAOTM9EWepTshNWIXsmOyrQOhg7cK+d7C36X7K7T7EOchGDtHXEWWeA2VB6+2
         Tg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982782; x=1795587582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=kKXOd9rd6MpDAAG6l10MuOHCOGbcWPuOn6DT7MWOSfiq+uoL28vgnafM2hTLlZyndp
         NH86NWPA+aE3JeHQB/gu5jGH1I5klJlwzZqKJtKCxkkiyRYlD7sEat0txpnfPEKn/HKm
         sYJbSCfDwqN9EGj2ImfAd1+K0+3lqbn8A2nPZPBrrouPW4IneL6DrHiH7TyD5a8JBCdH
         7ylBmyJ3QOvXh84HvvtRNbU65EXBUamILIja9PMfyfveWCu9PIX6EmQtUigsgsCi7kes
         v70jI9EtVmwH7rQ3RBj7GvaiAV/r+cbI65k788wI6w9DCaKnl7+ft9ZlObynlcsRkfbR
         5ZtQ==
X-Gm-Message-State: APuU4Z+FLT8UrYprWicsTs715GdkySf7l+RS3R4J2BTCgtLpoFm01o62
	3yyvon3WbwMVEyyuBRKzbOeJvxJM5UDRAAPJPrSWouQIZSTH4gFnfDjRhICcRBtOour+oENBueK
	eV7ziB4lJBOljKyTgHt/Kp8cfE24dh05yyvRTZpKX501THe8cjpW4yONaopNZKKiN2IWISA==
X-Gm-Gg: AZFdTZdIiY8PL88nvpo67OaSgKDRP0YxBhFmxMYrB2P1vVN+cAlZNXfMEagFEdUk3zl
	hRMe4x7NxKDSXhHEBDFojXBf5V7QHoNo5BVHPSGPBCVxFmOKstPG68R8F/QSRb0ehL1EeewHbEn
	iGD1JHkWD0PDBTxw2IRQUwT0H70ICF16ZTvdFHDTYGU4qwKlE5aNjQ/8ZSApbh/oxRvWpPd4vuM
	BBok+W8WHWywNIfphklZdPtHy1HGcLoGFLq7P2wjqZxlsHmx05jsupUekCYUrl7/LrG3l4Tf0Y5
	CU2KoRIex1EqwOzUg7WCf9TBimRivIdHm3awW0qsRqxIQ0kfyPub05XGg+WUweKPI5u4ASM0K2+
	Bv4iLmBpWCpO2fhCs4klmZLe2KUY0RGgI688TfB1oRYzZN7uLX8yszi03emRTuMp/p3mJRxwjMl
	VJA2VBuBYUGRxQopbp8OGUC3IOhUAqadyL2RyKVnouPfZ6bNqJRJ+HdWvToK+7U4jnK7SqgmGzi
	e0=
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509075a91.21.1794982782103;
        Tue, 17 Nov 2026 22:19:42 -0800 (PST)
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509048a91.21.1794982781577;
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:09 +0530
Subject: [PATCH ath-next v2 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-6-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd437e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Bny5_ETo2tOK8Qwevs3_2u7zJsZ6Ddhz
X-Proofpoint-ORIG-GUID: Bny5_ETo2tOK8Qwevs3_2u7zJsZ6Ddhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX178JWaMYw/rJ
 ULBMQHR2dQmaK6hfQKdnf9sQYfEkISvm/IR7EiBDE5TE7wiDotclIyHsOspE59b9gLePzeWGj66
 wP9Gnh5FIIhLqu8YRYTHsNos5XtFkBTZvB/qMg8S2Q4cSfrWrt7tSg/paBbuMr2ThZn1DJpvnV2
 9wqltYyvOxVZsNTgxyE1lUjmrm3EJ1d3bDbTG3qrb6FAPTBDiEoawGz9sTuc0xnARad/cepLhcf
 BCW4fKgI/SXthrwEtByVVXsSOkZtiV3ozk5e2q3nDRTyKp1REbW6aQzv0fQHuq8CmFYPzknIged
 cHpYZB/zd1U53gMApdeA4IFTmH+JY+SXxut50mQ9MMVxIX7GdR8Rcj4DOZNHVNITDKhtUsZWDiO
 6ryUDcWp5mZ/zj5ZX0rYqsuzhZ91JmCcohChduT6jM91B/e5LRrFBzKnfwU98/wCX9qPuDhgOSx
 0zjKDsryVXFOG5RvXTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxCekDjv88S3m
 euwLVyde01kb8YdhMI+djEYbpjR9ruN3x2/04+AOKM+PVYeutN0Gi4NWSLD/BeLxu9Sito+AJFM
 /qROCQlHLSwI3Te2J5vi0SVUlNWGDjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180024

QCN9575 is a Wi-Fi 8 target that requires its own hardware-params entry
to be matched at probe time. Add ATH12K_HW_QCN9575_HW20 to ath12k_hw_rev
and populate the initial parameter set in wifi8/hw.c. Introduce
ath12k_wifi8_hw_init() to walk the Wi-Fi 8 hw_params table and select the
matching entry at runtime. Hardware-specific operation pointers (hw_ops,
wmi_init, mhi_config) and CE config tables are left as NULL placeholders
until the corresponding subsystem support is added. Explicitly initialize
every top-level member of the hw_params entry, including zero/NULL/false
defaults, rather than relying on implicit designated-initializer
zero-fill, so the full set of fields is visible and easy to audit as
later patches replace individual placeholders with real values. Add
wifi8/hw.h and wire wifi8/hw.c into the wifi8/Makefile.

Define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB with the correct OTP
register address 0x1F90070 and set it as the otp_board_id_register in the
QCN9575 hw_params.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h         |   1 +
 drivers/net/wireless/ath/ath12k/qmi.h          |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     | 135 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h     |  14 +++
 5 files changed, 152 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 2a4b5e5e1af3..56b509841126 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -159,6 +159,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
 	ATH12K_HW_QCN6432_HW10,
+	ATH12K_HW_QCN9575_HW20,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index fc68ff649352..438ab92802bf 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -19,6 +19,7 @@
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b8c5b6d3a7bd..277b5f13754d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
new file mode 100644
index 000000000000..6e89a42111b6
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../debug.h"
+#include "../hw.h"
+#include "../mhi.h"
+#include "hw.h"
+
+static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
+	{
+		.name = "qcn9575 hw2.0",
+		.hw_rev = ATH12K_HW_QCN9575_HW20,
+		.fw = {
+			.dir = "QCN9575/hw2.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 2,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575,
+		.qmi_max_chunk_size = SZ_2M,
+		.internal_sleep_clock = false,
+
+		.hw_ops = NULL,
+		.ring_mask = NULL,
+
+		.host_ce_config = NULL,
+		.ce_count = 16,
+		.target_ce_config = NULL,
+		.target_ce_count = 0,
+		.svc_to_ce_map = NULL,
+		.svc_to_ce_map_len = 0,
+
+		.rxdma1_enable = false,
+		.num_rxdma_per_pdev = 0,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = false,
+		.supports_cong_ctrl_max_msdus = false,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = false,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 0,
+		.max_tx_ring = 0,
+
+		.mhi_config = NULL,
+
+		.wmi_init = NULL,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0x600000,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = true,
+
+		.iova_mask = 0,
+
+		.supports_aspm = true,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+
+		.dp_primary_link_only = false,
+		.client = {
+			.max_client_single = 0,
+			.max_client_dbs = 0,
+			.max_client_dbs_sbs = 0,
+		},
+
+		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
+	},
+};
+
+int ath12k_wifi8_hw_init(struct ath12k_base *ab)
+{
+	const struct ath12k_hw_params *hw_params = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi8_hw_params); i++) {
+		hw_params = &ath12k_wifi8_hw_params[i];
+
+		if (hw_params->hw_rev == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath12k_wifi8_hw_params)) {
+		ath12k_err(ab, "Unsupported Wi-Fi 8 hardware version: 0x%x\n",
+			   ab->hw_rev);
+		return -EINVAL;
+	}
+
+	ab->hw_params = hw_params;
+
+	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.h b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
new file mode 100644
index 000000000000..ad11370f9752
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HW_H
+#define ATH12K_WIFI8_HW_H
+
+#define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB	0x1F90070
+
+struct ath12k_base;
+int ath12k_wifi8_hw_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HW_H */

-- 
2.34.1

