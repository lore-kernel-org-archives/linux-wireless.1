Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982780;
	b=zU6ddb9W6KPzLTKG/l1p8pNx3AIpf9tF5ekXycnjSzoZC89m0H9gyc3FsjbfkbI7anhe
	 6yedBS+WEvJ6PActu7RD41jTj91Vd3s/rK5RMV93ZYDg5/JpG5BpIae/UgKHRXda59VRj
	 LEStqfG8tpmqZjDDYk8RDdrpgafLgquOTPFXzWQgxl+xJj5Z45Kp/k7HXLEiV1mHr2ySq
	 mW/zBeVChh+z1Q6kxCnU3/VmdjbgnAn/K2Naa+dk1+wgthFr7IXIqirnrc3kXIcezG7Ei
	 KnakHTdHV9xSSv80pxL8QHe14bM74Efpg//2ZRPFO8JYXwMCWSEgDRr0AJ6t4pKfHoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=POGsME6whxgnBjgFOnkgEj2BLrSbGecHddw6KdWH7lOh5+f/mx1sGMcMsdgAQ5xCHpFP
	 X6LULGyIKjJ2Q9grvcc/4jWP5/5so1zhY0pJ/yepOyxMDBX3um+T9DQIBi9Ai6E6FdsdC
	 N6IycIcOmAjVO3Z9Q3B8vyQZtDGttCYzylM47gGqfw4nl0ccecGqoXqlD72hhJ7iHDcL+
	 pOGXnUl00cRQYIodk8PEVMJH84jZV0zK4/Fp+AoOOUECdhYMzHahw3iUinTibNS89y4N6
	 1vKf6ixkUqGQzqcngQdTe2fznEFmpwk82cwuhhDRRphwSzv+eae7frHx9ZXbfgTg22Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UKdBPY8/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iz5nYy6B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8C6606A337
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8C6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKdBPY8/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iz5nYy6B
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxuN3121726
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UKdBPY8/WEkzKPHd
	VZXuIJDlXiO6GvbW/ddla52LU4seCudxBkX1qAFPQfpC/Smh5yDMrIfZM65rwTlq
	AyDvfaxkSfWoZjChhOEFr6unurC1lbk8Xc1Wic58kJIhQthAIgVEGzOV9XUdDoHO
	ejOdNStfYWcZIqgQr4p8SWADrh2DYU7PNGA+8O8rBZfXEoQjtX4tVhmGYL0B62f1
	UNHwipGJ4Y4qXzkPvfDfSpatwR8EM0gPNutzlxaqZEjo5Wu+5PAUZeNHfQT2eMuZ
	0+p+3Im8s3+pr1cOeipPYVFw2E5c6ShkHfSsxzDe+GZRh2ZXoPLWs1RGJXUlpkkN
	fV7dWQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hgb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so529892a91.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982777; x=1795587577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=iz5nYy6BBLI0RoaBCpzn124BPXssa/JeAt+CJM6+X7Vd9xFzSNw3lkU8So845ZkRRd
         CegBZRYOjvbSbLbr5DyF+KixJrqOyHPKygLaZqFA82v/8fzgDBI5Y+kAtZTYLiSiSZYG
         b/BzjTG5uahwP+1KJjYRCZB9dMMJInSjs6ISGRm7wF69xy7NLA852taS+e1U+2AbRGvu
         DIGwWY2D37k5gWz6e/hsixCA+nGV5ITvDeP9iDsXEzHCloT8ZMKQKgshg7plPWR4cJ1c
         7Oxu0D2+fp3flGhx2b+UjouJVC1Hj9i96a9CkUINhExP7/ao/pXqNfzjnn3rPM3cmXhU
         nsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982777; x=1795587577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=U0AubyPkcDGi88ggTxhrOfvTvEKTHUml6/ettQeAqCSHcIgrVA3L7H/XxrByc9nCgd
         ZuJxGYTLgQYUNFHf2u7u7RlHD77/p6R7PKMZBMVapd2NtnKsxI3iH7CRGWi4LMgHiOPo
         Yoc71Do/VRw3G8FjdDfUHyGDsbfbufM8rtwvbUka2TDGIAg4v/w014GzGuWR2RypWfei
         Yrsg4iRcbhnxYLerWEfSNbQgJgYW80SYuzAiyr9d4iuZMkpqbNtpHuuYAlSrXp0O+tvD
         6jon71m/HncgYAV7o0IjQgfe+COpaL6vPycZgJoRD0bO3NGQGUrNVvC5ECzByg/yXTWP
         1cvg==
X-Gm-Message-State: APuU4Z9M3PyYZZGoUPKOW0WtyG4aTTtk+Pip7HVaPhEqgNV8pAWOdWwu
	hNT9IbwkKGuvllnk6RvRM1FtjiC7ZHKBIHJ8jR+PquHEUdzz+TICQqDlflw3Qm22OSlfjsljmdw
	zvGSZ5mgOnKFLZdaaB7YtdSWg0TYJ9UQP95XoMVJVZB5L2wybn5w5MtoZCBIvKigVzKULGK4NVT
	vcjQ==
X-Gm-Gg: AZFdTZfLimwqX56pRgtcBEDOX0UwJlWdjXxbrgP/cESn8Ex8KzQpEpZi/7btbYdFZLT
	qL5mHJJCYP/cWPEtVqdTTRwTUVc1PKRoP6x/uIu+fb6M+JYJcBgqLH7oOgM8Fkn85FLNgk9H9hI
	BRD9xB2+XM+Zarjj1eZ12R3Ypl84G+j5l3GkcFBYhg/fzANNNKe3HxtLzmqUJYRiP3is93U2awn
	jr9SaArEIps1VG7S5+ETQeBYyWpUPIahTXsLgk6Y+EVfFl7bgibyXqJHPoGOnxsI71kijwU0MSU
	+99w1YhGdkcKScJY0a60HGTwGw+ZxhQVlAilG8MlbVrJ1/QWg+WXnFHL+J0l4q52c3r67PK4CHI
	sgPxsglZmdlYkYZVkxqiFzGtNYk9BPI215f+3vHhQeTsNcytQPRaslc8hL31lt3+PUmfaxJQRKu
	Cl0vjAVoHeT7WhSZAWKpMK0Ig+wGrhiLuhCS+TbUUXWlxlb/W4/18GA+s2PsrSVN4FUiUezBb4q
	pY=
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493783a91.36.1794982776929;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493753a91.36.1794982776388;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:08 +0530
Subject: [PATCH ath-next v2 05/15] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-5-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: K4zWPrWmCI2A1mLj7ImOc6a-Vbt0HOV_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX7a5RL4UlQR9z
 olCOG1RrHB4ijIPDn8JYBt/AQ2N6pjWsYSkAD1ASY5czYC+bad00Anm/atmWPqzkaAqz+1aWGEB
 IENemVR+Q+enYE2wO9JUnyGm061p7SI=
X-Proofpoint-ORIG-GUID: K4zWPrWmCI2A1mLj7ImOc6a-Vbt0HOV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX3dJZ+O7Wvb2h
 8xpguc1woR4UCXOf0KPOtU0HijtvrttzU41rVTXoNp86v3VEUdxe2DKPi+1EAidTkP1+MlOViva
 qUdSiV5IjajkWqF2wBs0U9DdFRu8EWv1qO6lAg/EWEAGL4coT55v6xfRpe3Bf+d1V2aotpM2M/k
 8pF8NJGc6GJ42+tyWMBH7zMEx0axCt87iRn+9IjC89mTU452a5y74Y/tvgHlL1kaxJa2/rJZGFE
 JDMTHAKf6cvNeJnB5j45EYcV3dNLvCKI0xACKQ4GWl0owEKiHAnVabQhRshl4r+nlKOUzwAzDb5
 uweQy0tWjkM62my0zKRWtRMVVP5v14vB1vacf/oScdoOjY7pBZ+z3GPpjC3/sPlV+Glyt8M7+Xw
 4MGnoGASmuf6Ph3vYWpY5Dr1nh2NRqbEtwAE+58VEoNV0aj8qaBsg6AJAI/HNpFoBVEolb/0ARJ
 qL7Aeu0KkYxkLtk752Q==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd437a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

