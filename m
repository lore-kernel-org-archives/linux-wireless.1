Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982759;
	b=VON5jxvzI+mX0wCn4tId1AdPsmI7b2rOFT9+qcUnYXJ5kzhv1MbzCQ68DBH4AZ2gUp2Z
	 745TrZKATeW7PrtADzP8Wn9+ocxtDuSndCvDAsOCUXjyvsIck8RUFICVbwMghhsKaRBi4
	 2kNeik1pJrl/2IEAdLeByDKfYJKDMnqbbmT39kMCS8UhNIhC4kT2NiIwV8eHWIQ7oxWeN
	 m9z5+1TQbq2m+Ja1SAmO2RuOz0UtouvyOGe2pdCsQa0KZFRKWcQU2/P8KkTueTSFAqazz
	 45HKdr4QhcsbzOwr5MksLbc1i7YWRpnuX1hdEwtrLTPs6aS6BUgstRj8knt+xi08LIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=3uvYjXwYr0pAzKDIz7jekSIgCSnYZ8X39nAj7bMn3ALFqAzV3FMOhEShtjo577SyoiZc
	 EaJu20tGTEBx3I794ElNpWw3a3hL/F6wmhZCeGGcYpFMD1gcUOq+Kh7Tspty1qoUWRLng
	 b//Law2WTX+y9C5jhrkViGkQa1aME2hjA/gM++RoKv17+FIaivfqEnK44UeinoimasnKw
	 egk2MnlsPMfzdvEhQUGytXW14S/0Zq/zTfdyObstVpigttzA/8zUeCTp7J0NzbVSBxko+
	 z0h5UDrjl1cNvWUIqatxVOD0rc7rimZxZOFTAknEiU2tQ2sO41l7dINhaEjqRQXPkMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0HrlLuW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811E4606A331
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811E4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0HrlLuW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI5emcW2403753
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Do76T8LSF05wtpgg
	Gt11GH2PLpKktrmfYjxLGxCINJ6jNabvTRQH4fUDsv/Y5iDCSpGE75bwfFRdSXJo
	MZTfJiGGZMTSqPN6brfN4ZjUmDCZ+CVjy2KiZt3mTGPfXXBbgiJ4HAcIFATRsUk2
	0WvG2jIKmvkb/7Nw2fGqTnSXki6AEhw+4BVSLgrcoUDYi0FUZGAWqlx7mR1qNWlz
	myG4kbx0wmJ/pmExKb65ugjL5zipXiCjfEnZQoPz0urufdOfPk8QBzurCLQaIs2N
	NWrqQfa+s+ZRCA7+HNmnYzJNkEAGpvtyRmk8P40r1NGKFn1C/uLsCLkFo4rbEaml
	O2hNaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hhk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so814481a91.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982756; x=1795587556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=B0HrlLuWddp5t+34hghWnEQTkNFyss6Y2zCfKRWe0lnGj/iVycNut2s3WfqXmYvrsq
         CMrB+VycTTJDkitsKnr30gO/nV0Zq1IVeAHzsshue0u44IDTcNbWeSpV6690BlVVuMnu
         LEFlrpHv8Xju214EUncgLLSAK2K+4LXF9DYUzbJB3Na1KwN1asJmUG974oq2mHaIqwrW
         yYov3Cod2rkZM7ENtwvWUgS0hCFKEdKSlkYSykRzEcvkjTatc+qFT2SkJVdyKPe5sRCA
         sV/fHoVL72uPMax2vW35IDHYyy16ztVjJ2j40ihuBaU51dakf7q6a9eGRvZJYm5xsomV
         8hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982756; x=1795587556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=O+UlB5sDbop/ygZ5sjjlHUHCdjmDc6ZR9Z2cxjVn1yPxNJUBUOQJWOOQEKQisj90pc
         ZTItD0mChhlXCvcavCVOS+qN4PlEDIVORvGU2Xk2l1mEdvyqejtUhF0NR4znIhHZxRjO
         NIeprmZ1e8wJDG8RvTGemKJvOusPS7IbEdlNUoqc/03nkq81tTI3EwZD7GPV2cyoMuWq
         kdVj58SQbGGlrF9HTYm4+FpKtKKU+RVtPU53F/elikTzbW2aMOn/bmaeNDTD0HRxk6a0
         fHUx7QlSaELWVl803QCQocdbS4nPLu9t0VSSyA0utJQxZH85ZX5CVNDe0qXqEjuiw0Tk
         Qvag==
X-Gm-Message-State: APuU4Z9LZUMfF3o/54swTK0lnJ1MPcuJ5CkM6kPrq8gAceCrnmaVtSar
	ZfjCQCoo7HsLe4opzBGkr+gmBWJyhj4wCOKehSae/Lw83LaftDqps44JbLEl/wjRAF0LvtyCIQX
	/M8CAaUnEaofR4OYgTigHYLozZr5Tv8f/o0Bgd9ZVNk40E3IX8cMGwiqurFQWKTkFwMDzSQ==
X-Gm-Gg: AZFdTZerRQL+mZealRXKsFfCWA4Ulgzi3yfkPtjvtoTdZF1gBbvj4eJHcj1A0a1kusH
	6oygWuQrkBZnbxH0Lj+iLhpnHO4wFr7FkOWpyu9EPavTERHAAo12FvxrD/cohtlOfQZNxKyLogU
	Ig0c3GE0c2OADFw+ypvVqJ1zrcyEA95rD8/0OOFejupeot/j01ok4NskHh5G6cCT2b7/z0RUaj7
	OIynOOOIbTrEyKWTmSy3fUokoIowQx2WChIfZMs7ywqEa+oOO5eu4TcqpD2uvWFDP2ExhRUl1pH
	YdLNkk12eEh3HzwC9kP17qT9uH/Fyio7sLik75I6g2FS3kXcBLawJAEciygGZHPK+6AQnFLLr2T
	qkwYYTkAWS6hReLMvss3d6DpW7jrMrhzMhcw4jRNVlfmxDIp7qRKSmcKJsiLvSH0V+3jaFB0m0N
	Ezvz+IpqpEALwPIWoGAPIhjCmO+kLOUpDe9fFqgkVBlqiwfIrfcPkQTRC2qlchgej3ZrhCM799J
	8w=
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569830a91.21.1794982756187;
        Tue, 17 Nov 2026 22:19:16 -0800 (PST)
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569814a91.21.1794982755695;
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:04 +0530
Subject: [PATCH ath-next v2 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-1-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: Cq1_b5q1PpB8NRrBZ-ZDkawBpd4zJXuM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXz4sWIY6xTfDe
 eu+8UGOFZfg632EcmGwAUCTvORluPxWTrSrm9FSnreMOkZd4FdqObIZ5TryfeOhP5MWJV40rL7E
 ElvzbWCeyt9SZcL0EPt/YFKsNZj72DA=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd4365 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5AVEUtnm3ql3
 FKAffEjrOCCFf7vZPlZGLZi81lU0ixy6Dz91yotuKS9dgaGvFyZ++3cdTgulgm/QDqjlAQo79S9
 +2iqBPxNzvkCZE5B9m1GY8V/ptu0xl11ABKCCU9g7pmKnZjCTLtf/9AUXme1tU6zGrsGrjg5bPO
 h4w4QSofz7ku9qTz1wV8ETRZoOk4ljHI6UFQmT4bjVnklY5fQwM4+deSqehhlgttWJynpcnP0Ok
 WNAhn3zA6Q8MQy0mCpf8iKoKwzTgqnMmLSYAzW45rHZJXzvTTZj4vlrIZxJCe8O//v0zSdW7QG2
 AHNdfdw70KvWnQpRWolkFVa9xoJKVKAbzXJsAAtaDylqiUn9uPo/55zsclprkd6xmiz7v1rBjWk
 qVjD7u3ynVdgI5wR1BluKwjTQPojbi7r2HxUdJcKqAtppbke/X7MgH3yUsGGmb0HGVpt1M4HIMS
 22ZsRU/7O2z+IlCmF/Q==
X-Proofpoint-ORIG-GUID: Cq1_b5q1PpB8NRrBZ-ZDkawBpd4zJXuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

