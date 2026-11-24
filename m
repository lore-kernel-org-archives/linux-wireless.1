Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538680;
	b=GosTvVnxHbvEaJFthMH7xu4gym3GVqmtLO1OD07aWSo3RqFKS6SzW3g6CudRHALVphWS
	 Ro20j096X0C+xsaTngZaIqlkP9J2z5Nlr94fXm6utB3jfulBAp51BANz/xhsTFXidteLJ
	 RLO6WXNDOtE41DNcVAXfxV3XFKJrvijjxii1Pa2e0bhptER8jNIHyobyyMGXYVjGHNGx0
	 QoPLV9z/RZMt04b7WjvoXccidhcp7hxcOhNH+dytYFlsLKBbbLDZb+/o8O8UxDBS2hmYr
	 wkfeDvORhFOW4t5QTxRXEsrZQXy1igZKbckoLtI33pXWK4nVCBC+1r3nRg+572DKZBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=08TdWC9VjsrqeG5sURZPjtxFckpuhJ+anlOECQ5dy2gjo72REMtKDnaag0sVQWvqEOFd
	 DYmr/kURu19UlO93fLKSoYbbX+cxJGCygPq7Denj3Kt+9cOGuVJM8+Pkco3g7WsghYa7H
	 5FsQabo3g4rMaqo/0C9hIOvkUlj5kkf3/l7RdQdYZ5MABpph+1zoy6aK7v4v/d4+wRIbi
	 t9+8a/Fo9NPfcNYHP34+pG0YRHu7LblK6e+0wxauxrgfyFJfnKblIit2AK9s5mIRO1u86
	 lhofDaJYhYfWAQSHDs/SItKpO2SN0qubjgeqOWXF6iiy57M3P+GD96lMIEXSAV90eiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwfK8vbj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B1606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4B1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwfK8vbj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL5fb2317924
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=PqV0EkHYogXdhnHT
	AMpAdHDUXoutgpJcFFDj/H/HBwszQ/DuWwkZhOf8eXhnTAOQ1/LFKiNIg2Rh7vcj
	u5gpjtLcSjSa3/g5rVwBKmSqBLFH4B+v2T50OKvXrq6rtfvyL+UTVJzsBc0tOzRH
	vfYfk5cWC8Eo+ZW7X/pzW0kghOCEdFNTnRiLJSGBsL6JPPFZ6EJFOaoGYR5oQSKO
	3QBVFge19Mtx6CZbZLoSCFQ6+2LJCvMMfeku1bWgV9FwlY7HHng6tCHP7pxpNBvB
	dcONGAXd/Eses1gvWouu/rxQu8O1gB5bviTu+ayoyS7o6TuirSonfofRqtqlpoBh
	G7pLCg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd3vpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:44:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5867944eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538678; x=1796143478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=WwfK8vbjzNQjTPWyfPhdww9E884LGH2+XOe4GWGTsgzY/7tKKyayhv8OXIpaYJSeDt
         P+1/8HpVTqykzrrcN/vzych0PSkTTbkjoDMeXJTPy797rnuekzlq4HfJxksKfmFua7Rh
         sxZdA7JIFyFu+XFsjXgN5N2lrVDZJTKkE41ZxEaYxz7jUaNx3ht99LxJ+cef/kzapj7+
         PGGu388uV7YCZ2Ee1mUEIqEw/MxB7r0r37LYiS9Z7rRMNqLXua4yRMsHKM3NhT2maZTp
         DcSFdD6D1KdqsymUkdaODv28fX3/yjS62+LO9J7fuPX8FJ2W188rAH4VLUl4symh4Blg
         kQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538678; x=1796143478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=DzNbkxi3jwKvNDskzlo2yGxOdHhKzyJQPsyeluw9D0mZ16cty1d+i67gH1efv8/pra
         9NCi/eS3hJhActZGIfoGyWnzz8iUHf32/0RNa1zw7hyyRDPyb9HQjHIJzPyl9mjVl0ry
         DRb2CPPN1YDn6Aig5HGxn6WLoserpcNkQkaZ0mcnnvYMAgo9vrbwB2E1YZUkrIvqwIS6
         EezqX4t254GlrPWSPm0Gbcel4yxmXp7fKyTSgHl0xsuU0oWWQRcIVqtShtKIj73BDQ5T
         O5osw2WK0e7XXDJu5O0iQI8Xp0kix3MjwOmg/BkKunu/wxJbz4CN5sz8YcBPTpfgKZOL
         Xc1Q==
X-Gm-Message-State: APuU4Z8MujmEz1blxN3COrQ5XGx6XfOCQczLYBKOqrE1fGvH1jHE0HQO
	7mWQn9GopbKCG2jzN1ekdRnLYzq2QGW8SBvRR2+jkOqHzuQ+VM+L7PypdZ+RbfyZU2mmsORFb0p
	oL283kWAILw63/BjrcB+s/fhUgPnOM33Tq0+QRhtQ9xfn+sF0wj86s9QazzyFfsQFkr7iSRb2QV
	2/vw==
X-Gm-Gg: AZFdTZfzE6/wK/64z0Cihky881obKkaoaZMdeCAd32wGsVTTqmuYfz69cRQGSSAt76j
	1RSCH5MIH11eDwpOKWcMVd2DoiRe+ctiZygbThdle3NeYdSrNOuszDE5udAtBtIy03CGewYREHj
	OjpKckWcr65qgZb4oYKXEfLUNkT4+yYb+EgU6lmErE+O2XR56sz6A52/V0ZeAcJE3vI2+a8OpDx
	kaDCG2MweH9y9CqROawM9aKRyN+cDIHnsZ3sc5xvbnR60p3NIwPD1oHXyS1Jg2j9ra61dPxIB2y
	bA9rG9Tyh0zVUJY9n51vnAUNdOLrJLgMsAtEFhpZ8/9oWCc6dHPrw+TwL7XnpD1r5NnTzW0fTt/
	8hVvzvOW4at2p42CpjWUD6ziD6MIyc3LkoST2oE5lddNXFb/NIVyMLAlJFZ1G6sQNV+aZPvV0gG
	fPfxh0e6BQRUyb85yuItd2SmRSNclZmtHI9JMfpPBgFFbRsnSssMgj+vKZWGY2/Z2vh843Vxlsm
	nM=
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780118eec.24.1795538678003;
        Tue, 24 Nov 2026 08:44:38 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780097eec.24.1795538677370;
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:38 +0530
Subject: [PATCH ath-next v4 12/14] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-12-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05bef7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXyFtvnuF+T/C6
 CAvzwKBDMUvvVzSNrjSjr+rXk6DXm9wJpcvpPNvLO6izX8SXGUQ9ese/P0VKOcMsYKKBq3lmXNJ
 Ye5Mkhg2cgRX9bgx+1cpMyWq2ZVZETGfuHHe2zaT4Cx/1+FbIEJtuicT20eSNMTtLlhX8jeyMDT
 0/nkhrHo942hvxoaBkrnc/O+andq5pu2DMG7PECIfFQeJVSBOlV4tMrgyTd4m/IwQM52QX7h5M0
 kwEsvxUafdumAB8draSShASQu4nWoYz6oZCE6mDy76Lmufil9UVlgvAYQOSf97FA2mQCr6y8+m7
 E7L2ZRpaxX3WhVCKppi8bG3CszP76Gf7fKOQWHsu2h/mKwvFqBKn/d3NMtx/lUfzxkNxbDfofSc
 lBefAGnDAUPWh6sj9T3Xrogj3Xp5GJJLIpt0O6yj2qkWMtFEbBY9bRQpHQxdvSB7eW83ouT9dzN
 fzmdhRVBau8g/0CarNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxkEF54ErKWb9
 +8dQ7rhfSwNYhO9FTCLlsZvUB/i5NV4t0SAoY7sBpO2J4SQOWJln/sbznvlYiBYAp/it5IBJf3d
 ogKoyS06U2qWXKrRy6dRlvO01JilXJc=
X-Proofpoint-ORIG-GUID: vhogdTmurgtZDDbBn-_M4u1WR1WVAX0l
X-Proofpoint-GUID: vhogdTmurgtZDDbBn-_M4u1WR1WVAX0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

