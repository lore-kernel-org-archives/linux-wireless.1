Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989812;
	b=VIkBqmvORkghFPSLZFucQVRrpvVlCbVy/VPHbF5yHNi/vyerhYMx616JGs5UYP5rHjIq
	 BiBhbcrDtgL2Rk4CAhtX20BzPTKwsUqUPTYbgipSUVFoxnMuYDNxuTThFMS/a5KDPBpd3
	 mNDthQKD5teFm56QNhgh1M2UGrZ7UBL1UzWnkQQvJ7cTyOy0mpwRyAQuxtCLFEwVBYqeW
	 tncn+Flgyb8xS69hx2djUtgpWghlyvo+oyMcuwFhgtI+HsaOWTGjP4YCQC4mi3a8FNjAU
	 TZrzEYRaGDRlE6SRvC6i/GxwOrII3Boo7aTmuMfT7rLmcqQuvdWoCGobknUEGyT7+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
	b=PCqJZ9MV+6sFbYjYJewBBSsqMMEUbefrZjQl9jYWAs+PGI58kT8AAiqLYp+uW4/Fofrq
	 EWWHjCCnEa9sm5E80b3seabcbMxqtHeDpd3djwHZ0A4koWf0dZR0n4VfV4PlzDrITsbmy
	 OX9lkt3POM7liZbZCh6fnN58vUAFGwiVCS44FLOvF9w3Xwes3xBdQkZ25FITiBmcCtKOX
	 2+B8QP6i3H1LfPGY0VijWlDLwfntGgLxIRGyr9B7CpyqsQA5SoMszvoKPhiC4vucMv8cX
	 6mkMaCfUostAQxbIDv2jWNAS3R7FrCzNzbL5o0y/sFknbPYxD8FoT4HWkJOaM1PtcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JBY7sesU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B4pitIEe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA2606A8A6
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDA2606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JBY7sesU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B4pitIEe
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0Yt2453700
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=JBY7sesUIbidjWgg
	Ql2d8Y5ASHRZJZr+/adbwbzV2GZw3O2aIA5JRAOTxCBih4H91kNosboaDGHMi//v
	ZdvXfKIuPakMoM35vaFbOPg0ksdZRS3S0pwCQSAi/RBlDWBo5gGxD/wlrVOPPPXJ
	bFkCNBq+tPb1O8jFISU6u/Eaa5hd7bwpYuNGSooNwumbC4h0sSuNasohNhmlKhan
	Fa3bKvaQhrsbiumXSvHq8FL8Iov+9Wy82ZphJzDZwUIsYKkaAZpmkfYdpEwxTJJ/
	BO7ozYNZbUuIs2NcX+wkKDzvFQQIt7bWyHLG69OOT+1chXXuUQgH7A57mU6O+UpE
	GYn0JA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99yej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so426252a12.2
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989810; x=1795594610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=B4pitIEealR83VdUJ/KjWph9Em+YQLycWX78NnbNIXhx07IzoI2WorWCS66jSO4Lrs
         uRNfmY6OLYNYB/6PGF6E6bVcUj8YgFX+mrkW7RBuJFP47FNGOnZTotCHq3VM4+WXAU4r
         VzrL3OCgFZNjps43/cQEdIpb6m1yMdJ1cCwMvMDoTr+wuuitWffq0p7gt/HBUcKxvMc5
         fbY7bEYIAd/D3QBkoDywzH8vJdFXMZztly6EUyYiILBGRAPKsTwZtqubFtPdFi6K2e8w
         6Xw4D3neFMCi88xAEXzushMs/ZSOQxrbdrRNNeeddmcFr30Br0/VkaTypCW1BMU7qXvt
         b8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989810; x=1795594610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=UleS4jfNY495ouKerQYkiQTrFGXvlzDnXqV6KR8Z6prOeQaC3GrT+rPXnvQHcrGAmD
         tpZTT/nh3Yo9Ye6oNkKOAUBqW7CWFq/ieqppfCGfti0qiYu8TVcv95Os6oYBblx99P8W
         05uvwLHN2EAi63ybxJ9TyPHLhAEfEE67dpB88XMPxlpW+8B/QSRR5z/FFOkbDdMV8Gs0
         Hulo+5Rt9ifeoUMhwGWqcfmByaL3cBcJvJPxBZ24UV7lAK0dCeuv4lTrrPMHw2VrLs1o
         UX9Z6r9/Wu7fUy+Wkg4kboZ+CM3o3UcQUbLVDXgN8Qq6ls2jozjxc1sxdSi/Jg6XKApZ
         MngQ==
X-Gm-Message-State: APuU4Z81kQjwFQBT6zjaGliEgKHhT1SUvILlG9nJkoXtt+bhPlyhw5un
	zjC1/n0ivg1pi8pnWWst4gwnwDJU7CnUP69jDGMH5ARvd4VSznlXactCiTGL0xMvzaLEkA+f7pG
	GnWfKjiGtr0h1bed5txxbhsR4Xxgp4hW2Jjxr12/Qg92PeRP9gS8UUcqIg0lAU50Qs9CjmQ==
X-Gm-Gg: AZFdTZe94tuC2efnoVwjocRFO61DxWlZ6a6YUYlMfi/D03MSlTJ7lK6dCXvBe55Nenb
	dcsQYDMTgceVuUcc7cuDg1wb5XZB1IP7wS6ni13qLh2t2qVMyiQxWEdmga9avLFgUdcJz8r2eGR
	u2lk+uTBXoOt4Mz/DrT1gU58ZUUR/dhQCBqLdE8rsrgKlB4JYAjGq+gZC+qxDXSu2p59ozhbBNN
	IRfCTCkIi7gaS8+8AVpKUXtyL3M3UjbM3jETP27oY0YxRB44jEKZeuCLw1k7LBKAQ/FPlBkr8K2
	gwXmHAAGRwbOqWuwZbNKMJpU38fwCMMlkaRlTes7tC59jwef3WU3XTk/Bl+xGU89DUc2IDdB9jl
	akykZ5XI4MiaExY8v2KmdYmeGZ1ThTj/gAnUqZgRBJy8G1EB2io3yLZBPK/KXdqCcv9R2yD1nmC
	FQcCy9nw8nIVQXaYeE6CI1upUJHTlulVd7FZH/VQ1Rhwvraa25XV6nv+houJUsInpcidbnt46dY
	Q==
X-Received: by 2002:a17:90b:4d04:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b3d07597a9mr1583874a91.10.1794989809608;
        Wed, 18 Nov 2026 00:16:49 -0800 (PST)
X-Received: by 2002:a17:90b:4d04:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b3d07597a9mr1583842a91.10.1794989809062;
        Wed, 18 Nov 2026 00:16:49 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:48 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:38 +0530
Subject: [PATCH ath-next v3 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX/FwM9CC8hO0F
 RW8mQEr6OBARu/GeySLUI5bZMY+nwsCxTkLD+k17hk4TsIY6H5jGzZnnoqIk437LzhYQvLqjs3+
 sdqEbysnqEFJ7tEkIMA8TNgsFHT9xgU=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5ef2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX5YUBnrxh6JbR
 7426KQ9hS06GHXZ74lP7Mxsy1rCBJUPz5IU4hWg9TDuGpyG52nUhWot3jhEZhSYoGKGIv4RcVAD
 ZR/t8rBeaBQ8SArI+Hf0HaAf2ZJ9VJvLPJo0FqF5ce+Pc+KWXH8D7ATa9E/RDi7hyjggMrvbwHU
 wF4Y4UWoA8XnHEgatn2hdJNcM8SdtqITmww07RXWplGzGRlHvDmcRvgtBCJz9MWLG9ZT684Uovx
 xPHti5WTaq0GUjdobjIXrPtdheFMDCnqBUt05EyrHI9+j5wLZE5kLl+p0VGgnlVJdDeQyU2qDkz
 lGRUsVSiYAFVBYJyYKGZBc5ewhTTqz5xasbT0Qzre9rVgQPvOGiYsLKKBtJNAqV4ahgXQ39YRif
 q0DyAzh2xotNuMMKO9K1QUEx+NB1tr3gpjw7Fvy0f5Fv4+pe+v/tRei6tDHsBXu8sf2c298aW9Y
 Lbv/Jze1hLNkbIhqJRg==
X-Proofpoint-ORIG-GUID: fta5AfPe1BbAOF4MpiRGLxdbw4S3r-OV
X-Proofpoint-GUID: fta5AfPe1BbAOF4MpiRGLxdbw4S3r-OV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Add QCN9575 PCI window register constants (WINDOW_VALUE_MASK [25:19],
WINDOW_STATIC_MASK [31:7], CE_WINDOW_MASK [13:7], UMAC_WINDOW_MASK
[20:14]) and a Wi-Fi 8 reg_base instance (ath12k_wifi8_reg_base) for
per-device window selection. Implement ath12k_wifi8_pci_probe() to
configure QCN9575-specific PCI settings: MSI vector layout (3 MHI, 5 CE,
8 DP vectors), static window mapping, window register address (0x3278),
and hardware revision. Call ath12k_wifi8_hw_init() at the end of probe
to complete hardware initialization. Define the Wi-Fi 8 PCI driver
struct with the probe callback, and register it with
ath12k_pci_register_driver() in ath12k_wifi8_pci_init().

This series only adds Wi-Fi 8 platform scaffolding; QCN9575's CP, DP,
and MAC datapath support will be posted as a follow-up series.
QCN9575_DEVICE_ID is intentionally left out of
ath12k_wifi8_pci_id_table for now, so no physical device can match and
probe until that follow-up series lands. The id_table entry will be
added in the final patch of that series, once QCN9575 is actually
functional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h       |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h |  2 -
 drivers/net/wireless/ath/ath12k/wifi8/hal.h |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c | 89 ++++++++++++++++++++++++++++-
 4 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9e88bdf4a93b..b30a8039b2ec 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,8 @@
 
 struct ath12k_base;
 
+#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
+
 #define HAL_DESC_REO_NON_QOS_TID	16
 
 #define HAL_INVALID_PEERID	0x3fff
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 19e02bb16ff2..fe880b0befcb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -31,8 +31,6 @@
 	((hal)->regs->umac_ce1_dest_reg_base)
 #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
 
-#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
-
 #define HAL_TCL_SW_CONFIG_BANK_ADDR		0x00a4408c
 
 /* SW2TCL(x) R0 ring configuration address */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index c99521abdcb3..89fa9a7f3fd9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 /* WCSS Relative address */
+#define HAL_SEQ_WCSS_UMAC_OFFSET		0xf00000
 #define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
 	((hal)->regs->umac_ce0_src_reg_base)
 #define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
index 3975081d167b..fd0489f8333f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -5,14 +5,101 @@
 
 #include <linux/pci.h>
 
+#include "../core.h"
+#include "../hal.h"
+#include "../hif.h"
+#include "../mhi.h"
+#include "../pci.h"
+#include "hal.h"
+#include "hw.h"
+#include "mhi.h"
 #include "pci.h"
 
+#define QCN9575_DEVICE_ID		0x1113
+#define WINDOW_REG_ADDRESS		0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(25, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 7)
+#define CE_WINDOW_MASK			GENMASK(13, 7)
+#define UMAC_WINDOW_MASK		GENMASK(20, 14)
+
+static const struct pci_device_id ath12k_wifi8_pci_id_table[] = {
+	{}
+};
+
+MODULE_DEVICE_TABLE(pci, ath12k_wifi8_pci_id_table);
+
+static const struct ath12k_pci_ops ath12k_wifi8_pci_ops_qcn9575 = {
+	.wakeup = NULL,
+	.release = NULL,
+};
+
+static int ath12k_wifi8_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *pci_dev)
+{
+	struct ath12k_pci *ab_pci;
+	struct ath12k_base *ab;
+	int ret;
+
+	ab = pci_get_drvdata(pdev);
+	ab_pci = ath12k_pci_priv(ab);
+
+	switch (pci_dev->device) {
+	case QCN9575_DEVICE_ID:
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->static_window_map = true;
+		ab_pci->pci_ops = &ath12k_wifi8_pci_ops_qcn9575;
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
+		ab->hw_rev = ATH12K_HW_QCN9575_HW20;
+		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
+		break;
+
+	default:
+		dev_err(&pdev->dev, "Unknown Wi-Fi 8 PCI device found: 0x%x\n",
+			pci_dev->device);
+		return -EOPNOTSUPP;
+	}
+
+	ret = ath12k_wifi8_hw_init(ab);
+	if (ret) {
+		dev_err(&pdev->dev, "Wi-Fi 8 hw_init failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct ath12k_pci_reg_base ath12k_wifi8_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
+};
+
+static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
+	.name = "ath12k_wifi8_pci",
+	.id_table = ath12k_wifi8_pci_id_table,
+	.ops.probe = ath12k_wifi8_pci_probe,
+	.reg_base = &ath12k_wifi8_reg_base,
+};
+
 int ath12k_wifi8_pci_init(void)
 {
-	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	int ret;
+
+	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
+					 &ath12k_wifi8_pci_driver);
+	if (ret) {
+		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 void ath12k_wifi8_pci_exit(void)
 {
+	ath12k_pci_unregister_driver(ATH12K_DEVICE_FAMILY_WIFI8);
 }

-- 
2.34.1

