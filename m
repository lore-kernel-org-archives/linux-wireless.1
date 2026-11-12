Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472417;
	b=Vshcbfi6aFIvbT9T0Y55Stg/MAAJYPQwrpgqZ0YRspo+sf+M34qBEmyzF04T7ahZnRmk
	 w27Jxi/091R5RcrnTKJYx1mWltCufoERzuZgaEyHo6jGnzmGAIESr0fqj4g+F4V8XAn7l
	 h0e055obcgOB8TZ1rk7jXQPdiPbZmTILWtpGrEOmOukHLxmR3+zlDXMOD25zenA551Pa6
	 vINeWr8vGgw3NRPULkIsMFvPwxaZX97QAzCGHrZ6eDa1jigGoKAunr7rV7/Ui/vT4BNEk
	 LKboVhdfMYSYG1ccHTKZbXnZXYivUDbfeRT8zxI0rmqHJf3yL/YyUhLl+xOeF3P1dQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472417;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=wh314gFbjZi/cZYCJlwrskwA5fi7w+UypteMajzsqllrzI/OQ+s+vVVh4uGELF1O0z3s
	 azSnGbUHaeCdcJuoQL3z9jdOGgFvxKwyVcgVJ3VUM+mO7vmxOLhjTtxwS3ORlGnXhFZLt
	 QGvz+Q54VUQ/qjrwklC9HWHKjz4H9NpFnh8Kuzf25k1NuRBHWI8QdRrIwdmKjHFTuR6yv
	 NifAHsocV/nUAEVs55d6Xv2txzmEamVVhXCoFIkzo4mU1H5Ec9q7m7ZOVc+B3uq/pB3yW
	 ksP4nkHGMG6ruj7+620Cn/ccFnxWUMpefGfTqRCkmFPAoceRkTnEDNjClgqRb4h2Omg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI+7ZvcM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E4606A8B7
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666E4606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI+7ZvcM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4mKxE3893714
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=SWriODnmPpc/SBBi
	0q6R/aCwq/KQ2bAtKHOgUHD4F81ZtbBCe/1K8PSBm6gtQoOebum03cNuH0DXtNX4
	f5/ATLZ+MmMCYJZgtUn2FWwQ3enjBvucPWgQq4c/eqjNoec0QHrclkcx98GrmCIb
	jtpDFLfKC8CmkalpgileOhawn9axF+crHcwcRwOOSJTfuMHeeG2gMS4ooj/KnErM
	TtSxsxgIAQY0q8J2dFQBDdYMZCjjgMLdIjhScdAoU9FxUeZzaRnPt9qlXEnMH/PU
	7eVa7a5EaFthpT14BwLQoQoWU4A5B9WICjbl4S4HG65n7Kp3OVOthMNZTSujrh78
	10LFnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0r80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e954d87b48so61711175ad.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472415; x=1795077215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=JI+7ZvcMbrotnbi9fsaRXZ7EF0p5HDVgam4Z62NnS3U1fLg1UFs6R/XnhVZ+Ws/s0P
         fvDTGTjVIaDdSZTiVT7o5FmmAUv6MNHaj6KWLIjFHo7RbiqAS+bzVTpTjp+B0xqIzt/k
         epoi8kmSVQLKbmuYRFvB/j6xf1pYbXmyTqRzvyqLIvSK3xWea4ooq+qI0mMP5hVKf5H5
         4+x5l6p7FuzU8E2z1CJMP12CpaeZ/7meHEVvSxyoxYzqBtturPtvoG3jMHpcIVY50IJ0
         B1a2D/fJtKBQCPl0weYDYXwvloox5HFzfws7tTSlmpyIgoJDQFsILiyZkElRSzvAKAlA
         7TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472415; x=1795077215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=o6/LwT+BDefkndQq8F+v+NjFeOSOa5kDpAOr6PjtK3P9TohCh+riZnVx5cHpleS9Fy
         6gKUxuRHrwNA77xdrfUcwNT2YWj9wylXJLJncGmNJTkH4pMxuLEBQT0yS/bnc4s1pmT4
         1O/C192hXXjrHmTgKn1m8xTclLoMhtaFclxC9uOe30/EkWtuLNQiyeyd5VRnEAsYZIRy
         1AY1rW2L/AUCcy/WosfsrFOAIAMO7BNlg+4eZ8ywplbmT95XUWwSzpIUn2HYu4NJbuQC
         f2M/FBUiatsDlZrTzouZ8Fm1uTXcR55gp/fOe436m8ERYKamP0NANxS+kz56gHSZjSDp
         BOmA==
X-Gm-Message-State: APuU4Z/v0CsldemCKmhlKBI1c911tHmAr72nglgpdoHnRmFXHpeB69vy
	oIztVM1wXdLRVppJECC0+Y730D/PkXHiQsZ7Mdabt9D6vtlfdc8GdKMElL7UDZzNG9tODt4RZk+
	t3M1K5c6/abYn/8G1z4H1mBcd/5865hEnto48slEianJEJAU8HInaP1NtA1qfUCwf2/9wnQ==
X-Gm-Gg: AYBFou2ixi4OlHJ6XuLbwH6Z3uFHCwMo5qOkBEA7G39geQr9WPCcm0L9+1sZAdCMfkl
	jWyy1VJ0jVoeo6hUZwg2ATl61MRF4GcksGataw8X3UNbIrI1hjq1IrDpMUNfeN29XNK4id8EY/g
	NL3GIEwtmtLG6I5MNLhm96MsCo4ah0qv8S4U80XCPc5tq5qMR4t/TtWRP3Wy8wMjfcw8VXG/v2r
	cDxK6RPhdNZhLWT9pg4KRmXoPzOW3vQeK+PmaBE4cmm23/kYu9SgZmBdWp9ipDSRl47rSjYjRJE
	KwzadSES48NMTPjrMRHwr+Thh0OoA56yQkA7dwPxeRwL3R0QjxGGzLtFdw2wwIoKemU4D8K7sHG
	O+YOBK/96nL01xoN2bbl9Vf+2pNpssFXHBN0Jo85/L9zmjbTOkIUKqeAudfBfpMp3L6wfnhqlFa
	VyIWSojKE2L7r8dp34EbnLZXVkNDnWbWXVj5HtvvIXsjJceLftL//KnKzd0lTMFE330AO5lwbwp
	g==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554116a91.43.1794472414849;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554086a91.43.1794472414096;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:27 +0530
Subject: [PATCH ath-next 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-13-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: z-nhSRTySzLqxNeXee2ZozrzwQg_lWP0
X-Proofpoint-GUID: z-nhSRTySzLqxNeXee2ZozrzwQg_lWP0
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af579df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX49iWkH+kVI2D
 IHjnlxVGsj2MAb4Qyxndf7jqifczOTyHCNIfsAffkr2oGzSDMnsSkUu4q5fXO2lO/8w9eGnHg7T
 6nGCwFGL9nBM95V8D8LyO9jemkln6C8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX9FnPlgtD8zd5
 MJ/zsOQkmnE6dJ6RxPUCU9RIA4lriMxt2BuUdoVAgHEte0/PgWbzMfFiCAsfhMJK7LK33L82p/6
 HWZCeFk0MIpz5hQLHnBzr6cN+DbtBe8UmoxAHMacpNMcRkbvp3Bx07HPESklh7J/r3G7JNEKhhC
 z3dO82tf6AIt0mTE1piRqBigg4SbVeyn+hmwpa1Ta+JKrbT8Y2UwgqWh9PN5Z9miQLseaNdF6OU
 2VSx3ryuRWpFZK0T148SWy3PAp2lK1sslXBH3MXwdRBbniJcIHnSA/RtKuZyVPSd6wW2AP9RMqh
 J5/rQDRVJlVy7W3+Fi+mDDyMQtwzpykZqLqppHxheuQcOGAKyEk0Fh2OAmkTDob1Gh0CZTkjliJ
 vOoi3GMKxycTVuu9aHKsmLZ6r5QigcApxV++Lq+fPgc6T1kMnuOzko6h3JY+vU76BsArwRVuMWG
 1IZbh2CUrvabV8vkUFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

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

