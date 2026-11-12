Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472401;
	b=fLuWPMAD0qNazq91a1Bd8G1ypUsuRqDXDtC1C2c0Dl7exTYb5Whzis1nkdkK9SL4wCWB
	 BdkdR81qnh2czdSyRIwvkWzpLrcwaAMVoBUmo0eqRZiE+vSXllHFrUltnIKqsTdVfT4sy
	 QR6HoInXAgSi8zqQpmBTnBqAvKd5R8fc4VzPdNfDZAHp7qhMlzJu0IoY1mtulsTV6HCGr
	 /hH69PZtoygFQOqHGnxaCE9RqD5CzEXEKoDfCz38qk2gu2nrdMT+UaKAxIg2trPyeqyCl
	 7wBdiJYJNLTj/YU9E4Cb+WMAWqW0p4yZpYd2RT2OEsPgcG7lDEb3y4wvNR1Xs1eT6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=Nh8XOW+WBMu3l7gA1opF+zQb8UXgT6fWgrJUrNoEOW1oZGQMZSmHK5mpwV8lr1PxWSc/
	 b7o+54idOlz4YmZUG/smoe1S0tK6tjxFZIxvKD9eNar0KvChfOs1UEqjiHvuANxvhdZel
	 Aobu7fHeY/Efgt/QbVNbF4ljF6WtRO9egoK8bpB8apvm/EOXES0+p5UHgexzY+8NHlPCY
	 kOUG0Uj9m/VREFqGZHtmSumr/NLfrpZXIKHYPqxzb5jWWKDo9Ps8EFWeMqyG0dp/WK4Xu
	 2gVGr72YkrLfw4/kZf3/HGccyW0xHvg8RedMyZq+G7buPUvCplysCfwBX618n/nVt/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mS57UF3t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=deHAO5QJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71F60707A3
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A71F60707A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mS57UF3t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=deHAO5QJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aUHj1475361
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=mS57UF3tUgxFrlxj
	xB1z4moWrZ/cepUsWIaj9Xw4c6DddzWGrWZ5DN3zr0NQZUhDRUr22twDmG1EZFY1
	LeTcCeOKTsdTpFAU7H14mr/i1GzX+0G6dUcQIPT+XI2ROlQcZLiZ9uC+hg1x2RMZ
	RwSgCOMRN2cPqipFt0gpaknCXNO8ErZ0g8xpNrGrWzumyQMTrsU7/SleTwJomSSv
	q2KeSy5KdoAOg2B3QjmkcAP6W5+52pQlX6chy3AOiMSiJs0lpUJ1ppqzz1XjOyPF
	zbTI59XXvaL9zAs7VaqRL2EWi/HPBSyfcBzTbDMs15Y0/NZTBuEcJ5eo/WZnMcN4
	bsnKag==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymug5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4242494a12.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472399; x=1795077199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=deHAO5QJdC7izzzDIrwzT1rO5HAJPJDzT2o7VL41v/IZ/CcOGLssP0CvZkMUmEDPFw
         ZegcWUOo0n/y+cumHkgVn6YYqUeuW7QQMfqblCD9uUWgy7R4kAZ2qhSNypfhecKZ6Qb3
         +hZQ3xCZTnAl2AVADlXr0d4RHKnTiU6Ck6AtvBHW4LRC6qMMU4HvUwq33WmZly87wxVf
         +Z6ytCMH/zIEQW04OGLhqoXtjl2WZUh1AP5RHfSZ86hLdUKVaZCXy9Ro2E7mMOU9vX7P
         3du4QclaoEJcT/lDy2WNS90xDGWZQGDDgU5/2C44cq63NPyHBAXY7K2un+vMbHLqHzXa
         SG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472399; x=1795077199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=u/VQsoN5lwfMbDT7mWGClGGs1oBN2/4NjOmLcWuHdrBHwrhDSQ2TOWeKdAmPpomUNr
         fH5gHpoUjBEy5w5ZLM85iUviFFvE9XF//jHdww+HmVP566MQlvrpbIa7oaWIpjqKHs/0
         H6Iw17FNf2N+R/YaUqAms+Bu2BhPks6FX94sGsEF2WjKTuMyBm524jVzVLM6g4Sjc7zY
         G5uLQbOGsENIJ50DivFBE0vZNkBYDk+rSjwHbpTROUAGUmeuTVESNbTsTWUAWfLyRQvP
         W51QaKPU++yjI7Dwfckd6kiUjFTUkFf7xkf/+v1n88KHru29qIKm1up7hnol6wusux25
         w0VQ==
X-Gm-Message-State: APuU4Z/cgfilBrLxA2wg1ln4/6cWGCklnDm3GyjxCB4+6pPoXNXcXeOb
	f4gocP7sbhkZZrYuxQK/f+UXRipbzYmVgTO5+9Pdr+4jNGJ4mQXq6twHBgoWiaJJclqcVFc4wQz
	PGkAPwiHgcuIzQvDNIPX2o39FAbOC1zFNsywM2FTJ8U4k11raJ2G9PWIwAK1cXYr4oc/5Aw==
X-Gm-Gg: AYBFou2Z/qnef1lr9LTgwgtZrXsnzEx34P/egmarqzdltM7C+KlP+0ZJSiOFgmhwvvN
	OLallq9E4TnGyoV2sq9JgEp/lPxwo10UqkNvIdcl56Hu2e+SjEAlXPdZ9+LnmAd6+l1OZEACPBC
	iTyRC6PExp5bE8jyagHk7xn5xhotEeFNov7Fyxo8wMtSVP3XjcBuZ1D/bCdzAHzc7AJgyLX9/v4
	m4sH2dkEGVNaNTPZ3RrCSkpkrpEJDbRYNnaC3KTkuvIYEJDze4MH7ywE3y2SVI/3eRQEZb9Zdrc
	j7iLhUdRzYw26qNXw2CH/0QfJ+ftQ3SJaDZqHbTg3Qx9ALRSStn6SPlFKk2JNy3EqRF8RbWrG0L
	zlxr3BYlSOyktRSAcdMBhjd4/NiejYnkiU4M7L3RFW23xjWDxL9xOrjfRPAjPsiOP5L1A5IMs6d
	IrGZZW7MKmqygvIJMTIzxDfOmgOGNCfWoASnNVlpFt1iACexE1VrLDZwVdNKDlVVCU0JtrnB3vA
	w==
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885534a91.7.1794472398766;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885514a91.7.1794472398263;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:24 +0530
Subject: [PATCH ath-next 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-10-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-GUID: nbH7pMVlFmgrUYn9ZWlJqDrtpgkDT7GD
X-Proofpoint-ORIG-GUID: nbH7pMVlFmgrUYn9ZWlJqDrtpgkDT7GD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX6bCEGgXSm5fN
 1UpATSXbQxjJ6+awNFx6UUdpcl4rWuX7QmXlH65th+WqV8UuNZpqFVhDaKdP6ETl9VeOaMJPRLT
 wdNvzFQe0cDZOnJABRx8wID967meuTGYHPiVUW3QKAcWU5HAMF54gMA/lm+5yRsG2IG9W4ZiCTP
 /D5z0jWMLhQp1RQxU5ye/KcB96jLZ3zlDw1CT0ebxaLomSGy6sOZXMxWLnt6sIjxwYIkfZz/DWL
 9p2B0DgbFihcCOOZWIxN4ccfjB1zvWZuUeWVPXHph41eitqvxTTyD60rce0JVzJL6962ZSGjJpB
 JdpD2VtB+sJPN4DYidxG3gwXix3xQtXuEi7HDkntDgZxvexepkbYNg32Kia5ePVgo2wNrz5FOeK
 eYCLH18OpHc/WDitr/5RYe9thXBBZVjwK03zubqEYU/2cqB9e4p4zqry69ZGGepOBXfOzPgWy34
 cSLUpbuN6ig2LnKQYgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX26XYj7CS6AbR
 MDK/bvzBOh+3HgiBPBFkOxC8LXQGbHqO/hT1MtDr8bYkjakOdaVwu31VNG4w8jANHUAEMuSKgPt
 w6XnFVsantXD2n5CkQ6VSkfwo2kzQ1k=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af579cf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

