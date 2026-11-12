Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472373;
	b=h0wx9TuZzqyj4sq+y13MdsopeqKZKOy+9flN4mw0wKqhRtgW8xFqhQDwcOOLkP4891R8
	 NCSHokEp2MaHl+4YRDL2LC38j7/ab3FimgOfuQdD1yXRDtS8cG/v5Uw7kRR0NzV18YTZ0
	 B1ZRrcPxoDpgDrEYmYLD0LOucEHycYVNNLPQYCbIfbIk5jVMoZKcs4RHoO4gav1vBcCeC
	 gRN6udJdVBnbGPIMu/klXAulyUoJjItw2uu/RhNhv3ANQSxe/fqmLm9wHTG46jJLBRpIN
	 /17U7ti9A/5V2pHPsKGFBuDgtT6sEAq5c9fIqCAuQufY5KTL7vSrAYhIVUrb7pXBvbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472373;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=c3Ae5pVIWQwA8BjIYsqS219AuOblu7fBuURvV4ZfRv3RIEvL/Kx0fkac7axNWQ4Ketjx
	 JmqJ1CwpAzcnDcw1jxU3EtvYyyCXwSLjjc1LNRvVty7OcoUmQyXFHqTooIwWYo/G3pje8
	 YEMSPz95u/tXeKtlgpl+FmyQYyte1gCpfgqRiMX8Hwm/OHsyxa13EB9DYAMRDi3rPF5+S
	 JGQ4xhCQ6DoUFmjgP/w/Bo+4uaia2Uy1gSy9tcVlHbEFmEvkAHZ3dDWsCADDIeA2bLwkI
	 /SliHtw4Uv+ZHTcdWa7pZxVD878G9HeQ7+HgCzmIqpkK3m9e91AqFeLp27Q4Nqp6dBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLAopL5a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD09606B707
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD09606B707
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLAopL5a
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oWEA2818507
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UY1mprCalcSCyaMg
	MmkNtghlBAC0H6EiCe6XvvllNqmTib3KbZm9udLxwwIKi473iAeZmCO4NbKVBY8J
	2nDvywiAotO5zhBeUFWdpag7pZeUttW9/qsCyd1SE7nV7erVjhtJ2Li6HFQpc8CQ
	99rg4kAo0xDPHs3Xh12jSSaAkPxQJYb46l5CHLVtiDsUWFgDd3kylGzYV1TDH688
	sPLUe+PsICH27xpQZl7JGizW7J5ZKyR/n5QLTkR86tOQmcn3rpiHv5Ec/ucNcROj
	nhB1iLLxYlVO+qKXc0J+54Az4Qu9uodyKQMLQzYwuxusREkSNQQBrWqpdX+tYMog
	5ZFPcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18588-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so2934390a91.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472371; x=1795077171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=iLAopL5aqh7mzFd3D4JtKs5qsZsACT7O9nAlKxzUifS6muGYpTwO6/cBkhMWG6b+g8
         mJ+h+r+E3ebeXAgIVH/kLIw/31/ma9c8WohmunJXfoNSNVGI395eAPcb4vGYeH7sHng6
         y9LHF9uGeS+8E16X4SmyuQQpnoM3syXmWGaw7CVL3qb1vG6eHnoH09ltbDEcuIyBqSub
         Eusb56trNU1xjxStdvl3oBQZZe6YG+JmzQMmXjq3NimlnWrVex+SVKLjWEqiWgKSwntK
         AwtCCgahVCo/2pR7fN+5mEqgrdAGR9yIg2jfgNEdhSLq0qZ5bSvxDHyj4sfCTTagnKgs
         P6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472371; x=1795077171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=vWKo9jv29FerB1moV67xsn76pSnyeuWm6dSTmBrcpaYRP2GriL8h1HJiSBuHIU+l/M
         waWFirnrpr0uCMx2FgO/6zHmWUN9p/zFrAiwtUdLaPHxZSSejY2mT4crQLPFbtjgygud
         KP1qX743W6mNbGTWUEIUfexswpEUnN0KhhHPcxUcHS0ZrDaPw+M0FRHn4VCypWl3YxrX
         sYv5B21sA2mUlTv8eQUuHVoIHp/AQIwVgpf+ktVujvfsYIWLNuhMF4xIY0MmSkG/X0Jw
         WJts/1mIdfyT0iSRdqClqvkIo1W8F1aeaF8qFUQzRfTI/GsKZA/7yu87pTWBjzEH7/7Y
         GArw==
X-Gm-Message-State: APuU4Z+fUIgZOh5H0rtZR4i1FiYtmPVXeGlIFc6Gkb39IvbmJYdAeFI6
	Asq+qy1kXkDg6HXr5RQMQEof5lJMNzGR++9CDl5byLpjhn4KGdz50xPaFXCILq/G3Sc9q95B9Oq
	AydcAmlU/DA+NBtVF+Hy2VQwqSYXVhgTgnThVl79qk2e66wk7GvADZCxn4jjUFyTWvbpI5w==
X-Gm-Gg: AYBFou3v+bNC/ePwUfyQLTQJ/dXecsJbOVJ8qJMbH52dUZj4CxyLEcgyx5EcE7Len5t
	o96VCD4jIJNrxM8kUzc+5VRqQqE95VV7aR39tsM14b7NZ+mIX0FjXvrLMGiV8zlh2ojB+x9T5Iq
	OfZIRVbCKx2GSH3j9ZjNrA/WlxQg7mSpeHv58rcSrYbEEl0+9xSpNamxOhd/KVcT6Szz8XhMAlp
	jRQdPn4XzUeTFpbntba2NuvLDcpDj0o7uqCyQdf36zaDgsCVWKB/wl5kOmIt2zzTYyEKmyRZCzL
	F32nl7lF1XCXq6zydMjWf2+HEBfApSBAfWOFDJHXwIBeHGM1tp+ToKJl0v+g5RYBUAVKN724utN
	GFcxlhdUzQoHaOnaLqxDePJTYP7t2/MvsLe+W71U+rVrSxkTCxbGtzqfhLKk4b19FAq4Jxbv6rT
	/jvz/Hwd+rwFIKkUkwj1ySfamTigA/0yt+owfiRLBSx1R0Evo3FcObI3cFbU3Gcetn6JeyLBha5
	Q==
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031306a91.49.1794472371413;
        Thu, 12 Nov 2026 00:32:51 -0800 (PST)
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031273a91.49.1794472370879;
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:19 +0530
Subject: [PATCH ath-next 05/15] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-5-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+bKKYdmrgP9H
 IQQVGbOdVgMWMasHKK8iO/9TiOh2THmryDKXfqotNcbJREspoG7GPYRzgSkk7Knn7neu4r/6btL
 YLX5Zo/uzkU241tOaKsitNRIO9p0mdw0RewjP6F+1P/9N6uyZN7Gf1Ew2J9Bun6u64RTVpG5dBK
 84cdVmUV2C8xuhqX81dh81vQDwKGp8ZHk/D7bG8YjpyrGvYj1mvv08ft0ALsI3tp517MNrWXahz
 ZHBTelprelOeTiDYKwee/SfnAXYYWlrc48ATpJLdKv82OLb565N6o8Ws4V6yAynwzmOhb6Bjjpm
 vXdvqep0XcLWF0zLs+uB1p4b1IWm8WtpLifgGvSaoMLbMAYp3a7jmeX+ts2lsX5XGiSYj43imp2
 6G077r6zTSaw4lnEpMKfUeGE8ZFxC27hEF0UcehoFjokr23tMz8fPCoRcni7N9JgKh/++pdxcsU
 psxOjrm2boOxJS+cBkg==
X-Proofpoint-GUID: P1cIMJ6qoJuhZUmwwNMyIjyeS5bnSu2e
X-Proofpoint-ORIG-GUID: P1cIMJ6qoJuhZUmwwNMyIjyeS5bnSu2e
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af579b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4Chw6GjdUpFB
 UTSVvYmtiNUlfSvjkS10rQas86rsc8H8sGVeG74qFAXL2YSdREUZS9xZzo1bj2NunxgbSz+HG1T
 T27KKhY7/219RsFmJo7WXHUVyf1/w0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1

