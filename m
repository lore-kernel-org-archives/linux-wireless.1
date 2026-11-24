Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538646;
	b=jfPTG08BglBRGjV6wKFcZ7al1yjFL3hOn86nPunPSvvLw4wKmH+pE+9ySo+E5XSjwXqr
	 lY5s1qRbPZavOZspq+3DSXhwqmU4wl1O4b3kcZOtGZhN5dXiKqpTz4aYOQyx8C5zKE+qi
	 dVy2gfnRA6X+quqLwhk3ksccqQnhvOcfMZgTbXMY5Fi/8zCHlr/hUjNevgAAgx1CZODT6
	 PIUeae6kKcQTtbbNLLrorusZddII6HUpMbpI/E3Cr+X9ozdWhLJ7d08neq9L2LPCbjmHb
	 pGsjmTBcNfvhOqoWOhdUy1fg1NpNCVFn9wffdGEIWobE9iXI5WfyTSycqmJ4W0jjA1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=X2ClN6dxgpfxrImzmhJ/GA+tFdbVecW45+tpa0cKbPVU0y/Xtm6zmUKRIhq+klFp2WIH
	 jOcvJoXJ89L5ur6aV5Ia0dil8Lt5/63+5qAg8rzRI0GWlHD5z/pYCAb1tRlyYaZ3+f582
	 7WsnzwAVI4ZXqnhJ6s893pk+pKeZ4FqaojzF9x3dlkY6TslNpfvyWGgsxK6Ra5ox9G6xZ
	 uh7+6BSnnUdnUnoHr/w6vsr6t7tNP/GhIYhj/o2OCZi/fPGrDbJ7j/3XsFpdkRqxxBpI/
	 C8IQoSXd6/0KjIqaYI0B5AzbDE7fZXxjSiCDxrQIPyEg2obbuAKHcVf7ZGhBT3j0InA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNVvFusJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXmcbagS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569D6606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569D6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNVvFusJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXmcbagS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLCF61215403
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=hNVvFusJ3kuKBjTW
	hRHLsDJjEyLz784A7pZiQjf9pialRZETnvetRZpwRukEOp1hBr7E85hxcTK+NwPP
	lh/qrDv9CM2QFZeiCUaHWBISHskzJaF7ugPNHz38yGlfpZyJdezRICclL81j5KaP
	V5Fe32hGI3QW7imhswH/p25qWBydwNaGLY61/qp+mlzbUHn58OacKiaskkvfuIjF
	n1lDMS1G+aCrTQEK6CrlMr8UXd1Y+hO2FrhV2/cadZ0y4Ne2fp3P8n115LDq40jX
	SIOB8qXJ/Sc1aDF7oPwfiqed5yDu9dXmzPSzJUsfrnFtWM/tsxiPJgpTAh6uByL/
	YekWEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpju8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so2648278eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538643; x=1796143443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=NXmcbagStF//KS5IkufVosfb6igdEsSdeP1HtHmjhLFWCFLDSmaAlhQ89jhQ8pemBf
         et80nEYRxC3F+/QDSN/B8emEgVxPBXDvyeDfqSh6iXd7cWcB2wkyMcR4/JSAkIwgU1/i
         UzWXWoUt8ZnpLYtctoRogg+pAxEUZkxetp21P87LTrPDyCSbJFAmwWD6x4Zv7yAexLoO
         rpw11fSSSv7pe6PSTSgU3rHC/W3amSz+TZWjOK+Uj4KaafWQoQjYVSwKdAcTI8TfwXsi
         kQF5cF9Vfxij0Jx51k0YAIotWzNGi5yAMq+3v4oZ67T2zC8VMTQHCylLgpP8QM4HsKed
         /CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538643; x=1796143443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=Kn6JgXoM11x8H3rPWSM1UrkMPqtrZnucMB6BwwGb/PAjiciBzSbQvuSfalUCwJ/xFc
         oo+FCRZNXuGN1LxwXmb3zufyiyATXwGXcEYdpJMM+4pdcAErbojlfTtm7IvdNbAHoFjn
         ppLWewFmV5lqEc+O9vnD0XADM/0qSxswfq9i8dwdPvB/Pxo7liF1grlwfEZfEZW9gjn7
         9GnAvY/8z+6s+eXiLUlWC0yrhuWj5G8FLEiWXtrHX3xUyFuyXr7exdPq6QpV8NZStpZP
         5f4OdY1qtDz3MavWKb8q/qf0PA/4CNp9mOzDqrcwSkE+lpDC220HvTAi/om3J+qsU7LK
         EWVw==
X-Gm-Message-State: APuU4Z/eZpCL+LbMi4SVlEtMudQ01JQfU5hMdR30bb/3v/2wI1hNKs4u
	TfPXdYQOI0O2KqPncQATHxIYFfj+kOGpQOKc16qeDNRuOAtciaSA6O9lygm2jz8EQf3Pv2X6RSs
	42OqW/v6E0lgOYpIqaGuuVYMMqQk1KsZSFT4mk1gW9pDkvP0hmMeUbJZRDyUb7iPrNJh4ng==
X-Gm-Gg: AZFdTZcy3fR5j+7YRiG3tP+2KRGwULvtyrIEbLPUUBUCn2hrt/CrGvWcu2QvjNRxX6C
	Hnb+I9ggZaEw1yF6pCfB0qeP9jaNasdmQguwoODmwgMlc3Dvc72sm5uXf+D2UEaW2tPiey4HFJz
	ZcK5tF5geCRl2i6sDPSnArUj2tqCjmW9YsoBGpSlJMQk3+sjnk5ykgk8vl4n7Dw5BHdAWDXLuGC
	D2VuPaueNsAFUXKXzlIoyPStgUh6XhzXVei8oS//CImWpOigcldwf8+FTDcadFVYj0ljh8p5VeW
	LkLI/UlbKSsqAfuzoV/RGboluVlY9W7UraL1t7Ge8Op8T/pfeFEozOzDFPq2gfFKekc/3Xxwx7K
	p/Doagj4LAApWIZL+kCKyuhl5MivWqa9tTR1LecXxvEkGWY9N9qwsQXeJmgMgk7Oj4wQR8WUS7q
	cy0qHo0qNQAJvW4NmtPtWmkMX7KAOLLX0HgWnXovSauO1HQlvewkaSh2+yflSvw4Y0FpVgMEody
	YY=
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id 5a478bee46e88-3856f859121mr17415998eec.27.1795538643134;
        Tue, 24 Nov 2026 08:44:03 -0800 (PST)
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id 5a478bee46e88-3856f859121mr17415963eec.27.1795538642407;
        Tue, 24 Nov 2026 08:44:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:02 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:31 +0530
Subject: [PATCH ath-next v4 05/14] wifi: ath12k: add initial Wi-Fi 8 hw
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-5-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX02pZftOj2ZYD
 5ZltSGxm4OSr3rHDze7DLIQRxUsWeTqSKfUHhuOCwXfXBErHfF+9QURcqxwS9zPJMHC9MxlWcue
 k3ANBJoke0+ctOZS/zYxIdALFHrWDUgt+WDMfJS9Aj+kjhGparW1F8G3SFsgwN43+oDJhQBegLm
 iR5enMkIzuqiJracdTjqiOC5pFcNqodx8haqmC2CHvc1GD1HZWfYTMJc+zawKlP/Aakf7U/KCeX
 ij0HsPsiFgPBq3joCIU9Ts2WraeTWT2PIK1sYU1dNkZTM83F3KnSFcj8g/mp6niai7XFT1JkZO8
 pbUzDw3D9HKxh20f7wEvdTllQmgXN/S8R6W7ytbn1rSizeXUoNjGVsROEhnU0GzPKOs6woFtlqd
 wrFU5+2MHve1oRrRlUegcYVCK87IqAtw17Pait37xWL10MYzp0epzEoZ6jcLSX3+6ktPVBz14rT
 ci85uqRDsxXoDvyydZA==
X-Proofpoint-GUID: BKlJjzRS13J00HU7b0HqTbOCGwToNWWl
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05bed4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX5TxUAvou+PBq
 wRRXY66iA1qwJAxdIyKOpv4EJ6I5klHaxTJiutigcCFXwre8+du+c/xEzS/B3553XqnRnbUptr2
 rmCi8zV3MdvpoS8Jc9I+5DfTUsDQkPY=
X-Proofpoint-ORIG-GUID: BKlJjzRS13J00HU7b0HqTbOCGwToNWWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

