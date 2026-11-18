Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982821;
	b=1WNcYMIeAvxb1CchnrtDn2LkfyJcGW99e63ll7Tv5ZXJvbJGmDx0nBFM1EuV78B4HeCo
	 ULKZqz7aFdV5erC4IxWaLR7hiuofNcq/vyhsIHuX5XWCwBMi13Fv7LPlaYrQANHr60M7L
	 bIbq9vIsWvDRG4ZSW/q2SIeS8L1Spl7xIpAXUGdUpNrvzxa2PTVctg3GhjhRt4mEYY7pK
	 WMGqy96lGD89LNDYwFvZ5AuuMB0ud4KAFKZkxkY4g0LXiI/qBT4z7hx/RnhE8xoSxYUYs
	 vqDEluccxn8pFghFTG91sBlZVi4lfIU8yAOtGg3e2VCSou03HlD7vRqbxcI7g7N8FwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=K6sV+zIRsfMECbTqOW4kz7AGE3rAM9PC0fB6ri+tdGLl/x81/hjipIZCo6Vlblv9gCy3
	 1qBuZU+QjBvIhg2yxLjZsnv8S0B6h0ZoQleMG4kgTP2+ep9vlWt2bylH8LlaMI2QQ5DfI
	 0RwuJdtZ1opVEEPUjMuVefH1WGYpsQZRktvFdM4AnQfoHJQwhgCWC1IARZvIRWP6Ps2aY
	 eRlN89hJdEEwbGOAwrp8Vg71rxZthG+M2zZHOzHU3v3pIkNtUxz7fhVGfPxYkj07C0zWQ
	 J5fouzdVhYc2GSTtwJmDYA1zJsafEOV/crJeZbit9oWxrxzJm8ET42VJzm2GZtjP0+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AXbYmap/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85B0606A33B
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85B0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXbYmap/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2qO2106344
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=Y3jPPzR8mOV/BonK
	lBRvXmtMYaTAitKtjPjJC3235gUB87lBOZ+Yq+QA2ZsGdo5PhG9GJwPsSJ7gOPGQ
	UA0EXrG2UXygeyQnPdOsRf/q6GrnKDgfGQ77VLFP2gxuKRaLhNFCCDk/lcE8Tllv
	BluwG3MoHd8j4ikhPrWCy0xVLtVpK/bAdTrmbtM19vHPJPWfAVpEU7ULwL9jyMtV
	bBc+oL3Mi5gce+CU/Wc3CQyOAywRr8pautqHw+jbA7/Q1CHxwlAdHcIPSwIevhYx
	zvzXX6Cx48reYBN4DzWAA6+0bMOXUDdIiLaBsvpg/dniVlVA4admmHH6IwdjX3PA
	9UaghQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sg7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso810174a91.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982818; x=1795587618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=AXbYmap/yUONQYzHi+sHxrL0DkdW3hqI1oZEVA0G+sOu2nIdrz3c91RfRQV0JMENC3
         R1TD+pCFZcOBryO/SybWtmxn+KByR4MPYtp+v+NXWgPXgWG2HCH9E80Sb++4NCTPbZAL
         8VCmVx0mklM1Q9Q9/T9PqMquKmYsFK+goBHxRNuYIb080E81quIlaoTbd3/Z0kLyW7bI
         IJFkFlyv50zQ3c0jF6DcoOG78/J2VCpJrplvWTnpx4sUL7Mk0sngfpvqQLJcdmzcBvPz
         H1rlbIbRRzvCFmnHe6t339jcLgtrvCh8gpbYMSVcx2grdJhECeXT/PmklDuwJ2vIbbH6
         ZyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982818; x=1795587618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=VJHGsf/0svilSqMDT7ayt5r4s4F8hqpJq4nB3Ael5fZsG2eYdzT9d9ASXzHzh3Uqzm
         SecVKxBv5BQGrPA6vb5Uba7UFYl+Yzm3Pp2HN0wrKSGrWKNH3BLC8nrQ5MCLb4ttmr9E
         znisVDXOBJyr3ytA6eG1PUl02QIeYYsZxCYKNbnY/ESYfLym6jY4jP/M9BHL8o6vgtFB
         h3H3M0jfCAHdUwncz/spMU2zhB7dtwWKk2qa+y//yhZz8QlBC0v19lR0nZdGZWY/kbgx
         UCFzKIUwQiYTGx1ttYlxUQrD/Kyd5+/ezXeD0hsLs8rka60FjYL8x6695h2LkAAxrI9l
         pv2g==
X-Gm-Message-State: APuU4Z8F5WiFz8559UPqutHqRE9DAlH0ziwHp+E6DC4alCwybNkQhaqP
	bLvXLWgxmaedeohmfr7cGqQkEovJLM2w3tEg27j8y4P4ctSTjc1q9nWYksC1c7ZaKsltzB6weJq
	5Steha8dhVPdaBTZRG7K1yfK7UESZOS3Bmd+6OMZXWE76foA8sxyWv6RwkzMq3F/NvDb1vA==
X-Gm-Gg: AZFdTZc7VPDKCd9VqdfGNqdNVVcrZVbfV8yluFQ+3LLvS1FHxxFry7sw6XfBRhukCrh
	msmMoBVSIrvFhCrqHFeOtpBPS59ugGaw/1KECQpOTqAsNUAfvLpnKscDs1nvzpGE7A6W0F/0BSN
	hbWTpMXj6hNwtiU6+/pxruHK21zBOEWaqvc0JEbkZtFA+9ubo73ZW+BFgbJBt/XiIZaN4hRmd0A
	BBs4zyCvvJVSjxIdaBWG1BzCI3Nxa7i1D59m82Z1VCZPggkiOPeg93Ud3d1teVn24zbgMbPyIyG
	UbfL1sCbdPZEnyQesrr6FoU/1jZ9UcauF7IpUsCoZwUzHz52PL6vYavmXr9BUfeN7PrysGglfAB
	o8DCrad+PVv7usjb6Ra2rSXTttiycq2UbJbmmB3OdQt1pQipZPANTcTzq9vq3wYmO1mRa6Az+Uc
	V6m4rQ6BYFLcHaKc9DxKlelzjz/Iih4clt3SAzyIa4xXg4kUIA5aXG5kKoOHNx4/HhCA26yChZ9
	/8=
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653311a91.35.1794982818139;
        Tue, 17 Nov 2026 22:20:18 -0800 (PST)
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653276a91.35.1794982817603;
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:16 +0530
Subject: [PATCH ath-next v2 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-13-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: KqCarUuDjHzYB3HH5uTC-0WuVIbWGu_c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXwyjq4hP7AzI3
 eQId1D2JE6ybS2Hs024l/jydohT+q06ZVKmrckN9be7Xe+wbBahfJDoJq8OugF05SQsd2Cpzl/0
 TgAbvavOp8iGPaHEk1L3p5NOssoNrbU=
X-Proofpoint-GUID: KqCarUuDjHzYB3HH5uTC-0WuVIbWGu_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXwy8D1YOYBt9l
 CnPtJBnfXucNU9HoqjIaoLBEOpUAd4JymCvgt4kwUl0qDzHjUTVrgWdfS6MG8x9CYlVOsruJLuZ
 fb4GqHKo9RQdyFy0hpyUQT/yi8bEWZumKHiS8DE4+Rt7k2rMhzdYX9MC37+LRrsdar8Xi27f+xB
 HbB1Zcq6H9IqIgDXkxdMVmoml/ZrSIOeijkREs9OikLaEo31wvi7XlNuNW0icVG2VM3ZBwtDJKo
 7UBX+fsGz97Bj16XAiXyeo/E8lkBsTewCZvtB3LEKLVDO69TM/NlWWM0rEALWJUENP1lNPzlRhM
 eUeqrPvB8Lvap32XiFutEdeC91XD/8+IsxrHaGmW5dQOyf1vdXQMd4mrwrkb0ppIspBZ5y3uq5u
 DykBmaKu0dWYmGdxnqCbjNFZqQrmSeBPof2rHAWuH8o/ptwixyLJOGjgG9fpcrAzvMAhx4T3ZKE
 rw4WekdY3VGAhW94xKg==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd43a3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

