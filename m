Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658857;
	b=ycjpaC7qxZr0jysZSm/MCfVogBhL4Bp0EYdBqw1FzgQgLrf9KdyO8oKsQsZzvPr2bwKC
	 Pjr5sJHoD/mLSwgsuAr49urd51+qBYIUZDzsF9r68OjxB1bIe+JDVyiav4HW7nfBQ8OiE
	 4Vi4GYHGePluW1EOOPi60sCb4ekJwGPqSK+fta3xL45xgZymV08qYhwSDACsew82by2Q8
	 2Zj3pRNwkYuHAbSXzH/t0Vph61q+3tsgBNKCiLwdCPrEWB1LagbkVsejlOS1Riiu++O9N
	 8QydR6cw+4J45XEOWhpOe8Thr1va91LcHAPkHtc2ZdcdMKl2iu16iRCxrOU7uqJx/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
	b=CO6/8szstBoDy2kJNyCIi4Ktst83XtmLk5TpEaRLTg531oF+bhSxqNKP1+BNaEaQAD0c
	 w5whPUzD6Km1Nrc5n+AswbiZPpKfP6eR3eHyt+/NbjbFZAgwGAfEIzDJLiWP+OxLpUtRV
	 JYnsZW7oDRsdFwEQEFEq3kXuMVs55b7eqy/cY4CUDHWPJN8oPr4aaVbU2wC61utnZo+hX
	 Zuu8/nTDl18nIkoA1laLDsXBjtVwdKq5/g0hO+a+qhbaKFfCO3PO5HpPFIf7mUaXU7trU
	 551NP+8hKEX0HxsOx4l/Jjr7cNV9gdUnY2379SGrpxTRfDSwpVFsOJGTZhev/RBKSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgyVSNcI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhcCOMSe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF841606A327
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF841606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgyVSNcI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhcCOMSe
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJgtQi3661516
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7s+V4BLd85h
	76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=; b=lgyVSNcIQgHh6RspzqQ89UQ2QQu
	XMfZY/52O7IjCqeJ27QMDvkyGSma42fEn8mQf9K6u2ygvsc5v12tyu3xNK9rC25s
	1MiVn4rYOShsyEEEPCwpK3ldWyQ4oubwLhZzzcRcPUdMyTOc17E19iMcZ1tJZ7Ik
	aPw595S+XMXwLkpInXOo63wScp813UK5a8xHv5Ab69I71uCxXnFRn/xJJ2gGFdxU
	URY9ttIkhniKatib+enng9ECoyjINuQRmw5D/pbWwmqWITBXoybYt2tBra5h614V
	p0fZJp+TCbQo0RLGsvCMNHrthCfRtXVVceg54yQO4S5eqJGjaOTg1pkyqTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y0xu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b44bcdb096so4572444a91.2
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658855; x=1796263655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
        b=FhcCOMSecfPny+GFpU9Z6u/QtaTVMTnUt9sYU7sL7dc15ksmiWOBwD6koMND1kR99J
         BF+2raacKy3K+/uiG9MU7R0LEkJcEmwD9IK2MtBauZjvYfT5ypSqvfu/5/ohUsHyqdqJ
         e9JKFeQptWOXtaj91Asqzjyo0EBb2gPlZg4Vp0IlGireFyFj3oxblXO1PlLnN68rwHkd
         HlwXY207DDmLIRr8orQQEPSChGWH/vl1tWBfHmm7dZTLiH1nm9VKklXVMat9NA4PylDy
         RzJfVmqxLNCqeKwf5X69keDdKvq5gZGUK8LRLUB3pwfH35Fo/yuvbNkI2/n8obfzp2wY
         zSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658855; x=1796263655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
        b=dpbmguuiYtSnTJ44G1Z7J5+224fa/f9vx23XO0kQptC2HvANQ/zTjvqU94CI0FFsHT
         qoqbKkk7IuPqXkIpd6hF20lI8xUCpIlT0wwLub/UN5VhA723tyz5CWN8K5eCcnUsplm+
         J43xLxfm1tPpOsLRFtmOd81DqGh8cEXA8NgRZThkpwqhsexjXns3vv6oeTBhGmykCNQZ
         mjAmEvZ/tLtiNjjOW4ZsXnpo20MHkq8DVHscqro1uGVWl1Y+pbMZVm0W0nYGPOBraaou
         GRR8DiEg9RF5BN0MayxB/4Kd/tEzfTReWcrwOWFrQaad0tL9GfHLq06eg9FgPjes+JsK
         c3Tw==
X-Forwarded-Encrypted: i=1; AL+hErGTnR4XVtMDRBa2yA5CBLNihGiw9kT+yB+zUacw6KsnwevzpCCo7BE6sUFK4sugo5stLycIy7Y2uY/B/rPz2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dkyElhz1lzfWu8MVBDmSUvU6oxhbQZKeLRm9G+Cu6GU7ap88y
	RpzcnQewkECwgEFKWJGpCYsK95VmaNkP85U3FGPAx7kkLhT0YgkTB5gauY11W2x4cXYgYnnOkHm
	YPSt2KbIo/+j5RYKM0ysu+nbj3ceVd6VNJ7g6UwF4U0dw4xDegot1Folf8lPD20yM75fhKA==
X-Gm-Gg: AZFdTZc860AEGVmkhZhJD40IO26K0Wn5/6/xtQk8e7OwkG+dmjZa6ar1Dsxxv4jb7JQ
	qgPWxTfwkp5w/LNWl0bJyCCjoqbeyG8yFMT7qjnJR7kleDN+A5FrPxPJTfhd4FsOe0m4ZmYgJGA
	4QkVr5ROJQn2G5Lh03ZVqgS2DsMnf75SJqrvUuc/37NMhypx9LjrTwaQwsD11POs/FcEbWCisNz
	r2MINMxJYOMedy6M1fDLPrXKc/1+KzU9DwqgeVr/HGQwXLnVhO65uBstM+jc1jb1H3c/dVnjI6+
	Y8t+6saQqRx9dcNUn2r8P3G/5pD1YOCEC1c3bnYgBfO7iDaPJ0WtLXKnu4GvRvYG4xDcT3I8giZ
	qTVbuWMt+Lo2UoBs8xOskuQ1afDOS1CsTdno9nXtcvMqMFLfEI7EcWTSC9ta7dfXcjmPOlXAM/3
	IGj77Uf/VaUHDGx8qXIKIB0YbdxSdZFeK3VxbX
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr17941786a91.21.1795658855350;
        Wed, 25 Nov 2026 18:07:35 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr17941755a91.21.1795658854563;
        Wed, 25 Nov 2026 18:07:34 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:34 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 1/6] wifi: ath12k: encode MLD max simultaneous links as N-1
Date: Thu, 26 Nov 2026 10:07:22 +0800
Message-Id: <20261126020727.3273337-2-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX/mhNNt1Y7rgc
 +UILj1uO4fOafKXAPFxAVH/gZGjGyD17oHtT7+MI5Eqkp8lRY0gaD9vwzUgceOMcvLJW/lmfty+
 pjODIop258dIDHdOJoCOy6gzLHGzYa24KbQ+ldE2gspaYdgjYdhsyUbGs02qdsvqj6v1qEkwooQ
 IIblrp6eAQUo8Q5p3faP4KY6T0bFH+nnb+JPQJ+FqDfKI6u5UmDoy833PWXtOo+nfcidJEH5tOa
 0fqexzW4gGJxMkNk+R7n2lXf1dll2uW8ne/TyjEMJa1cyxOe2B6nVV6AAo59SylquplNjelvssk
 T783AUzOn3ZH6LGUiR5xl4Jir3LP9dWwOaukprrWVkAh89hfQw7hUPuuzpRR+0aa01CfmeMjYzh
 N+ljRdt76Zyg2O1/iRlGoeR6SyhrH9ob15zxV9SNE6h5M2ctzNdCQ6u4YuX9o4zUbRpZKHZhKqh
 E2qqWg2uxubnCuOUnXw==
X-Proofpoint-GUID: 653a_XnvjvjYa4N4gPWsKgolHN4FLFxc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX+vX466lcsU+a
 Ncgar35Gdj1FLHZcYBTx9UPFvv6FdmjudomthTXFGTDb2Hu+9Gxyr/TY/ctA66XSwGouMdbgpLD
 8jTwUqB3cvbzvxPhTkOjK5UQemgw2GE=
X-Proofpoint-ORIG-GUID: 653a_XnvjvjYa4N4gPWsKgolHN4FLFxc
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b079468 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=G038fZ69IvUhEtWw0z4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Firmware reports Max Number Of Simultaneous Links in raw form, but MLD
Capabilities and Operations advertises this value as N-1 per
IEEE Std 802.11be-2024 Table 9-417n.

Normalize this in ath12k_wmi_tlv_mac_phy_caps_ext_parse() before
storing pdev->cap.mld_cap, so all users consume spec-encoded values.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..d1af43ede2ae 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5293,11 +5293,33 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	cap_band->eht_cap_info_internal = le32_to_cpu(cap_info_internal);
 }
 
+static u32 ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab, u32 mld_cap)
+{
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	u8 max_simul_links;
+
+	/*
+	 * Firmware reports Max Number Of Simultaneous Links as raw N while
+	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 */
+	max_simul_links = u32_get_bits(mld_cap, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (max_simul_links)
+		max_simul_links--;
+	else if (ag && ag->mlo_capable)
+		ath12k_warn(ab,
+			    "firmware reported invalid max simul links value 0 in mld_cap 0x%x\n",
+			    mld_cap);
+
+	return u32_replace_bits(mld_cap, max_simul_links,
+				IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+}
+
 static int
 ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
+	u32 mld_cap;
 	u32 bands;
 	int i;
 
@@ -5343,8 +5365,11 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 					  caps->eht_cap_info_internal);
 	}
 
+	mld_cap = le32_to_cpu(caps->mld_capability);
+	mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, mld_cap);
+
 	pdev->cap.eml_cap = le32_to_cpu(caps->eml_capability);
-	pdev->cap.mld_cap = le32_to_cpu(caps->mld_capability);
+	pdev->cap.mld_cap = mld_cap;
 
 	return 0;
 }
-- 
2.25.1

