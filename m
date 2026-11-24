Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538640;
	b=VbplvW/Wvrmr4kpOuoxwvijmgYOSWSFaCZo8KqJU4LbUzf9kmuhULv9k+/VkTn/8bgcX
	 IW9BxOkfhImL6OPhyzL2WqUE2MKHwun/kfQIgVoVCANx45UQWcIz+F85WoIV3j/25gtHz
	 2sAvJOKY7uhl9hpDWupYJnzFCVN2MHLi+3Sb/zOkOSOhDQZ5ulp3D/UpXt+IxF6BtIeMh
	 E9U5vtVWs5EFZQCLiYHZ22OapQQmrZgtGo2RgbSY72w7EskqV5fTLXo/hbgmuT+MbJloA
	 T1nLI2RCLHtwOHOMzy8SZlfCYKEOQuTUixZ/EtKElflOKiHCnbpnyajeKh1RmPu4Lcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=Yjtac1XnEM/Hr489AwNg+7m/qpyenh0ImEDOeT/pvzAn4y1Q7HbboH4Vsh2QejDXmt5p
	 z6zxks6BHmx43jxDJWNLV5ZZxqfQ3jtX2WKdxq6funkc9tgsznDbiU0we9UDGQasjVmg7
	 zIY19EV+7l/HCToWjzIyMPX4kBtCiZjdOLNUm+/ap6YXUWWxNCLl2BXgCugAEcGOf8hdi
	 H/QVxv5A0plaFWILDHVRQ0w0d96RAjEwjv4kNWx3Bly1XTfI6kHwk/DyR9RSRQ7h1D9cy
	 ilW/ArvQuFy4CMbxFTnSzo8e0MOnx5FB2Ca67iErdAkOHCBdWlR+ulyw/Fo0NYaSxjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cryb7+qr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C3606A32E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4C3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cryb7+qr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKDR3267090
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=WWwCqqvm0H/6V+XN
	+5OtzpUE6C6N2ABlGE8AQ+cyjy13MueChABpPBU5MDIhuSCEz5/sJewspvbVuj8R
	PHZzEXZgPaCMjYUqTaBJHAc+lYiyfQ20Ao06hSbgo+GjGrEZclVpmnx4WRDlP6hW
	CfRPpL7DM4IyhjQrfDb+ITeTbz0m93nrtjkYh9/u+mwdb1xPtyCNf6qnchBhM6fa
	vENDM04+KrjgwgzoWeQOkOrXPUIT5gU9LOTQsMdDj8dlfAA+S5W0SOCx8eKL5pPw
	+cN7I+06Umm83CDR427FeUQSCiyLHeOngUP9viWa7qQtme8SLfib+2Z6oXT+54fM
	Th4CPQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s7n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:43:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so4816685eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538638; x=1796143438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=cryb7+qreY4PSXa+C3icUF3rBXoMwrXgBTAx1z2bZ6tBisvXM4XOsTDEU4xPty29An
         fzeAfuOUcd928GRDM2XnL9LxxZ2n7yhzS5KnFg9wdR7zYHYo421AdbSD6F1COhMaFRKh
         bgNyACVznkTn0SJQo0IIHwosFdN6MkvOBywRFrC6JfrcYHP44e2TV0/5ZcMNzjEJNGi7
         p7MNegURZX7NRa7Sgt1oKbPlVxzf6I7UkIbuV4amVJp0a311x0jleACGQUB1Pa7KK6cx
         pRAvGM2B/Ihr5nr+Xj7i7OI8gADaNgZq8UllCCsoVRqxjmcWuliOKTdsu++3lRWEYit9
         lEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538638; x=1796143438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=K4Ve5O7UhNpY7mmOUmP2OttVRIrncGrF/sLWJZzVDrnyva/baLrS0Hl5CWHdsy5OTE
         2R6EFutNifpZ1pAC+So/vKQDi1vjWKLf9QXJFW4NqjkKLIODEteQryuQIBOpTm+wIwRp
         7LWo5lR15z2Ju/5S2gZsxxrfsoJWT6jkZk39Dh7GOyPAyGX6nx86uoGS4fvQOQltqEeM
         P8tMLC1krHagvcfw6Vs0zbntzcAlo4IxPgrfAkMC+7VEjoLFvEnneUDVjhfpBaFzS1X5
         8nbv8Fkq6Sgqf1xjthbc+B6nME0h8vUISiUlhF7KSr2D5paE+cz67b4+2zEYdYxV5JcV
         knJA==
X-Gm-Message-State: APuU4Z/AIwGVQyVxvP93rHM8l1wcaZSCQ9299rZ4NXKUjbvxM7xrHdQf
	ReXs1lyiI3gSBDMyRoF/pmF/WlvwTD+cEk1E98dUDFgYqNsNutA19qDfcil52QuslDn4U76qXc+
	qOSCqsDavwiiNquDrOcISGfhUIUyPZeG+yjjx9rgriv/rEa8ghLGeDBAjTDdvabPx/mLTmQ==
X-Gm-Gg: AZFdTZeJtQ/79lCz3WFSEw4G+HpRCwTzjXjV3JiS1O8RbHuFHF5vjlDv+k1QEWmMacM
	NYp9ELmMCyUnv6/i2/OUAqHo9A1qgLMzvc37oz/6jcuCbiT4QCmWKIwdtaTpQTx3EqDOyObP618
	5uHCnQe7ZJgB5bEcb0EiPrVhCcJjoe0Yo6oQjv4I3j7Fi3c5PRMU0OLgWJQklU8aDDMr77KJ/NR
	JeHoodBCb9SDvRqNPalGC1u5bUut1pSwloke6pZvhbX09qTdhTaezJs9Enz2JEyesyoohpXhZn/
	VNOyCQ8gZIO0SmL+cDSqNAA/lCP2ytcYOK0EHT8OQqoltKoYk7I5XaR2Y0uFhJRgIi1+wyjybxb
	FtXzwfyAx9TBRmRD0c5O2f9Lj4/YhQu8BSFADDd/I4bcsPwIiLk8IqvlRNXCWuZXar2ywvvRPPl
	+6blRJLMs7ZN2+QXUg7c0yUZxA8hjIslUTuabkEOC1k4083AoAVcjsXm1ynjZFQft2wxcynB5BR
	8c=
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886161eec.27.1795538638059;
        Tue, 24 Nov 2026 08:43:58 -0800 (PST)
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886121eec.27.1795538637480;
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:30 +0530
Subject: [PATCH ath-next v4 04/14] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-4-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXy4kx6TvNwRkW
 5EMtRZJg3eXJlNbqqC92w6ZikQegUyXVFNjn+JGqm8CjC33QL/DC+5MPz3pdFKq1AF56bK2J24I
 eq5SoA7biRSt0c1JXLfGbKsDXtuNARk=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05becf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX1x6A4gyxhOw9
 71jnuBEDQV3eo0pPKoS434Fxkg1OOYC4128RdHKRW7qfriotBIY71wP1R3ry9ZD3HO2ku+7Prf4
 6zLmqVilLVNEw4dPDQJGn7Jox6HZqepBPAcDN68yVrRUydAex3UGKa1qCD+DS2Tr05vjxCGYfxS
 7OmBuclljRXQhG1UDdKqIXk/hR2L/DzsKtLh8Jk3t2i1kMIvUci8WB1U85ON5FjKFDGRASZwVuf
 Yi/WoRTmrGa2j8bfIZDj3YLBtPZ6cRdNyp27+V8/M+xEkd6UUMtdroKigvu5cjY2VowrmDBLwvK
 k5Cv5Y/BjH5szFCAgiMtGse0OBIJTCnOKtselo4k7H5Uq/qssJKJgwSJRZ4wIRcOoY+rdOYKdgV
 A9m/nnEKEVWvUsem49piPYK3C9u06SPL2vWoUmHmb8ZrM5bkGs1Dh3MCRITeXfS9JHR/VdUFQqx
 Hi4gZhZc7//St0kKh6w==
X-Proofpoint-ORIG-GUID: sGLDSe-UiNAenxoakzKCfaLsZ6VZSxb-
X-Proofpoint-GUID: sGLDSe-UiNAenxoakzKCfaLsZ6VZSxb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065

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

