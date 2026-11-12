Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472350;
	b=ETnjRlVj7sbXk2ZkEreMH2OTojqXkqjNv1nQ3Eb8Ifkq2z6++ffCt0eAI3IJy15bAkw6
	 GRlr2uk/jjdURVQsL9bR474eGNLcO9sLjiZm9RtyxgCgfj7kTgIe8lfrIxdSVaENCDSgq
	 S941T1q1eBtztUtnKyMHaO670EMpql/RY7LR7V3kD4cLnOl/17cEXFF/4nRF0GcGvtYBd
	 DSyX6Rny8nPGFJ43lC76lDFYSescnHK1WsLD3MmmmIdRDtx+9IBibE6IUCGKVFYJunLYs
	 6jaV6mbl76IdvpStXdMKPM/xExuywB2fFHUUlQUhCjjNZV3zK+XDP5shiRxvNhPRh5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=pjnDsSRPNC7zHBiOvrGVCmTqpKVwcCX2f81hu4atdENc7XGkSQpsEKYnfht4Rxlx9nyA
	 0v8mtfWSe31ufJAsuhfh2FcHapi0LPpcCaeWLGwiyB4H/ue5mdEZuTNpEL1UdBsdKI/IV
	 KOWvG3x1jyWF+U0jmMjj4Z53Ud14Dv2e2AJaEp8FG+RpQ621ETt02dJWtVnMzyJMugCkD
	 I58a2YdV4XAR83djca/s4yRpv9IAbh8F+bpKd2ph18qwCEaM4auZUM6S400NQzhvS968H
	 f6jNB4942jNKtHszYwtNxeGnOHHS1z8AcSPnPvEs+eXn/dPTPKXlbFLyO3J/ARiQw4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9Iftrr8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HU09p/zQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0A260A2613
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0A260A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9Iftrr8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HU09p/zQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZZId2514210
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=k9Iftrr8S/3KqYgm
	wmIq9ZLs3f7XOGvc5UgbHulW5ZWkPDV0byyDU+/QSnmBiJKElbdbJqVARzC4zcB3
	HOk/+fVqf4wMB0N5UpLlrbtojhgI1FveXZLeH5YucY/ZyzdzRK709zxm7JnsgTdY
	c9baOQMfRVkFPyfBFWQp3+HO6/4afvBjifCckxY1InLPiet421krTutcCvtVy7ms
	OQrtK8PRrDbjZn46oH+4cT6mHlmr2/5QMRhFcPxXKlXLFOgnm2uozC4aMGyrfQwy
	VlNR+u1F8rsg4Mr7nA4hVXYkQPM/CiH0KfzMFWZ+2KE2jo5iesPrpSb8w53NFaW9
	Qp+9iA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tpub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:32:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so1927537a91.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472349; x=1795077149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=HU09p/zQl23M6uIGurpJDGHGrxqse//H3bCZee5kPTRnqT6ybpRVxJzWh6PtcRlicb
         9Dmo78NYkcEiHTS8CxL5p3aywTUKN+E3lIyRMERuWsH0i97ounCxO2C7ykkuy9e/dojf
         SLxOLw5GJdaxA/yVd129zb8+foVffps/G4Lw6RwppRDmPERKdRxzowjQsf7MrEH5G6Un
         mPIjjCXllNeqFGA1HyTOwTt8PO0QZmpT+QDXsPi3S6sQdub4aWhgv4XavNl7Otxlmn7y
         TiZa5lKEOB221UiubJlkeYnBPW78s0ZaqoYFr0R6LQ8uMbrqjOB/8QU2jSI2AZjP6u7N
         gidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472349; x=1795077149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=0SHWweZc1ocheXTPHCxkZEAK8Y9HwiwPTSxv8lmJAQVZGDumDH3Uw+9JCQMBgWJGwh
         yJWtI4M5CO7TB/GtCDZgCdQThzeTMxuoq16IjBIKMJvTfk8bxIFERN0B4CyOMt0uFUJE
         fN2uydTeai5WqKcAIpi2KgCRjwZZZEpWbSaGsjG4U/mnQSLu5Nac9ljnX+gWM2scS370
         j/MxZ48osHTMbtCldGuptVXIIdAmMOIjWs1SqI+wIOxqBm7cNSwtfABu5W2IhndFPhPY
         EFBTeuwHeny+PqJhM8vz9Xp8EBYJ81GeptcdESrmgc9AgrCUPfLYi0Jr1E8CHM9k0wxY
         Z1fw==
X-Gm-Message-State: APuU4Z859O07+nlw83gQ0OjyRd2Z3yNJju5zsQjNEl6VVZxdxCTvPF1N
	RgvU0QtvopKfEdqcrIwOl9ySv+leraJZSrRqXQBbWaHtwLpVsPTL3BJJXUpfQQj5o9V+QmK7BsF
	H7WcfIR6Y0EcDmcQBDlnA1T1Bip3AgWdkHD1OkuH8N9UzJmLlBLh9775XYk2rFPiMOwLvPg==
X-Gm-Gg: AYBFou2GxZy6tA/CnQhwUe4WwxcwVzdCdJEdNZnxGrUY1B2JohBbFR6CxY1L7XJRFX+
	u8/JCP/lN/Huc/wd4BIt9EEA1DTd2iBvYaW/z3BgsiAS+SGcE3MAx5ZQV/Oy9r1m7BppXMVr1u/
	5/R5uGfiFTqZ0efn+CXKeibFYQ9RQJmmja8Nsgjdwnx/DkYqo4HtgS9UbhrqiwxOUTwoRBYjd1P
	7EIl+kfKq7/FHbW04r2Y0AQP50NX7ZOwESgsJPvpQWbmkfDmIH4U0aXD+8ZGdpvrWAJZTCM7j7o
	tst9x7QCmKWuSXNSA5zaktdnsbKOAGZKgEiO+p+KII4z2GavTGr+4a7DNziwJBGEPKg9dT7M+rF
	u89gq4RZwRtsHoRvNNWu/YCO5si7+4GJWZPlw5OfaJU8t16S/b6P9hMPK4iD3A/R76H/qBHdqmY
	ORHZspX9Lun8kvWKcYsXK4MSZd7I5x9N5Nwd/9D7Ksm3gdKImnTHKJHD81lfUx3Q22dl4Ay7479
	g==
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532442a91.65.1794472348608;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532415a91.65.1794472348126;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:27 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:15 +0530
Subject: [PATCH ath-next 01/15] dt-bindings: net: wireless: add ath12k wifi
 device QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-1-3f30fbc2bb69@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5799d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: xjyCxjScAUkz_sDDxfbLTkqkJn50poIw
X-Proofpoint-ORIG-GUID: xjyCxjScAUkz_sDDxfbLTkqkJn50poIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX11KXPjDO2lu0
 oVa08qc6Hoha1k2BAlGJ06pHHrCv58EKuZ64alegf2tCy4Sso68cVwWG43zPyrOphOThOpE4rrt
 W2lhSMMPHZwsqNozRnZIWnYO0odPaEwkcaw/IiXoIztrZvdcOw1rtkEMRbBCmb+lCoNa2pp93C8
 v6e4XnHN1ZHlohXB/9jmEngjAO88EZr3OU7s8tmTUT6sDOUtNUhd+g4TCzeA51AZxRG3n2FIRr5
 8Uv3f9Kk/FBcS9PeXNEpXh2o1BvTvmVyztter6at3eP4HbmP0UHjrRjyJ8M4PNrx7nHno8lPkqv
 It91fv9WREBUDOh1Izv0ofQ6eEPIssGnAfGAdIXNLGHeLSnzj/s4GkDGZ7Wikw78f0oiP4UJifs
 FnDl37h2d8ph97muvEafteFuzNd7WbA3ET31Zd+idI/Jy7O0JB5AGoN/+ZVS1UpmMnFQPdY2msq
 vdimsrNbYKkL8Z7FS9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXy1Q0ywiN0nMj
 6l0NdUbyTW/WYWIOEd2FQCoWQ0K8SjDK7UyqBD0meKPZkfiIa3GxI/x5NvBwDFTEO20FUL830dZ
 yE94H+DG379PfoLt+MO7N6QVevKi8Kw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1

