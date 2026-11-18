Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982811;
	b=5J4aiQiQVCDtyrwSZbwuQV7jixlStDaUO6jyDnRFbqiOQd+vBIQtovHvqbe9lBVF9gSt
	 B5FaYmkbwKBJHbQFjua2jHxbb5CHIMM0gGCgV5ok7aV0bbDtJcVpK7+XX+E/uA6lM6ujX
	 yiTdMFLKPxB3GNPK0UBVPVdmrNSbkPgJUHGS7OtiATwQCeYuthnnbk6kLZV0pr+tMPG2h
	 1kDwrDHFPt/BQi+tBc9X8WVy0jToC7iUs0vaGZzXtROLwAHznuSWHbWToBXuwlYGTsinX
	 TJsOA7y7ZP6UjK7KX1TBowBg3oH5ft7b01m/kiuvjr2IHheVkLLydkmtrFC4RceOb3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=;
	b=Ky66hN1BsQkKods1Ujr/2yv1M423T36I3qiHWToVrs6w8uD6Tf7I8KCUpLId9n0I3XvJ
	 hlz0nXKmjhD9K7eQAexFBeudhBnM2g8CI+6iy4bbE96jqSMl7ntp9PRmHo8xeRjcKgKS/
	 6BH3vSlhQIkHNLlX2hub9TTynvxBwuH5E0y/Rg+4oM6t5EOalzmLjYNtfC7ip94nYACa3
	 N9UNwdJ0Q2arlgZFAm9aSrhiag/aiSlJG+9mZ8VOtPQMhXJLOyU69YW4rXrLv9fXG4y+C
	 RnvvIkpM9KWx+aVg1HPOUfyyf7Ye4gx1sW73Hl+ARdTjJfrBOkFSFT+q34mt5L6Zawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i87DefKw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KdyQc1o6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315A606A899
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1315A606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i87DefKw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KdyQc1o6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvJH472539
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=; b=i87DefKw8nUwCLYN
	qR+IiDnAyIj+Pi1qUrki5T6xWMEtxajVmblZP3WVZgcKZYY7HQ6iVJO77DxsUBUe
	+YzVjin70jPSpgeGzkEM59vQmp2Mt+Nc5QrG5on5OYBAUIUwZ5tnqTBLBpCP81lY
	qUBVLv1RHIgcF5yrqX8sqYFbOqfukc++S3bF8XYX2bb8QT6D6ArtR2QUB6nxEQB2
	RmbjIu6rXquQNsRMXVvieM2vNJKjYrwYAZEwcLuqtS7pUic994cHsBhdCIfYgcNR
	IvqEMFrRYiLa2cvDuL6RUExQpYvOCGBUupaKfKRst6hGXGWllDBeSDDrQc+COCfE
	VleZjg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89ggx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:20:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so583447a91.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982809; x=1795587609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=;
        b=KdyQc1o6FASgT957zo/gbRURLIL81K4h+70WVxFiUN8LopUJV7NoG9JLNG3AJZovqv
         jPbi5Ak08uxzV2hVIIHmc+tSl7khgNfqg15hgNbKeLRoZwjHwvfd3kIDb5lMLAEHlhUe
         a7lGXkpg0T/AkESn0fcbGCyInUebzn3GTnJGdcLhd4zDDDkyBbPPmhPxMODwEe9FL750
         Z41TugZtyAvW6xtztwqW/247odHkTtvFfctm1wqSm49ADbs6Ad6MsiFlMVe0BzW35yzj
         rva7/s9XXo71qLyCUZcQNBXQPFGMaK7KXx6jNOJHxFhLXjb++zByCrJjuuIZE+FbqmbX
         +6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982809; x=1795587609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=;
        b=S9mfx5bVM0c4TjXZfSvEgbgzErgPKW+ZQktzSo2vU45eLmxEXIAiw1Ya5h6+I0W/co
         hdBQju97y03t9n/GpqpEc+dll+Eu/Ps1ka2PaFDwTZi1AtHsVKoM5mxzmtag9YmaU02h
         VnIfVYsvTqkS81HA1hD6ekWvcv/zwi0dJM+VKU4VJRvmTRHLbDKFZHI+/fV/mASadKUl
         sgORKjU1c0JfiUbvgHNd++7E6bOO7aVO4Bo/IihcrhltFLT9wahWf+QzJCMPiHMov5Gv
         Nwj9GLKGjDkaATx1quPPvdYtdR2+8ujkjnV/wMXLApZafvzPZZuYqyRzefdMCYphhbr6
         Go6A==
X-Gm-Message-State: APuU4Z/AQz5WGsN7/7WRWXNcDBxE3M5ITGn9v6hL5+BdDhDcIIqP4tOs
	yGWdgU/5Vh8Rw9CnRU5aOAewx6F6I2oQw853E7Nisxx5LV+Xydq54eOCP599gqMQu30s6/tGEzv
	2Prorgp3saMAMrRe/PZeO55twj6MJRyr2CV8fQHopf2Hcwd6Id+22JlO80nV7quT3Pt6IMA==
X-Gm-Gg: AZFdTZfDp3E6nH4+CxgatnBBZ4mptBWRxtPfcmFWOCO3awqpnchw/rsEE0MuQauaWlh
	Zjf2pMXYEYVNbLMEmZc8hRi6ofimkWrqHAj1Hvsr2bgMVZoHjjiTTguVI9d6qd512tqgZPD0pce
	TndgrSnmdecsKAw/am86G0dFmz2KuYrg8H76KLxNX5Huu/YvdbVPfiZG8C1IPnt47G1QnvLCL5j
	Ak9/9BvuNsepKlgO9d6pNEKJiHEA/G9vMKQBOJifUXzAY7Xz80l5kYNERmlKSgfqJV35DB/qM+E
	Y0DBxOaKlx1zp3fa9XmZRUfqeaJhTsEvFkKq+YsRQAOQWSOluRiwkSFdOu1KdVq5gJqpAQ17HCm
	ecjW9ZY+5M41Dqm5bWXvv/kfaThZNtYPELmQjD+6WkXLGv2+6vi7ZFhmLAHc7+dQBEcUyuTBVa2
	WY+LC8vXDg9ebFN2PNzjw6JX+VuyRrhZUZso9R9Fr41lrIaU7cqz8rC4eY4lzvUaaNDJ0El60hq
	Rc=
X-Received: by 2002:a17:90b:448b:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b3d07b9f34mr1716890a91.36.1794982808226;
        Tue, 17 Nov 2026 22:20:08 -0800 (PST)
X-Received: by 2002:a17:90b:448b:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b3d07b9f34mr1716848a91.36.1794982807411;
        Tue, 17 Nov 2026 22:20:07 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:06 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:14 +0530
Subject: [PATCH ath-next v2 11/15] wifi: ath12k: add Wi-Fi 8 CE config and
 service pipe map for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-11-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: f6mxSL4AXmcjMFt3ku5UHjyzjUXFbLf3
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd4399 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ve5JB-QzZkeB4WSZPW4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4/MI7+5m5SoC
 jIWB/10Kh2kyNl7MSntWoaKrJJdJzvpfZtR6m34CVM4p8RF9TF4YOD+E+zU1sSmra595eK3nEeW
 KmmJPyh4NCUavl/dWJrMNuZSj01FF7/eAnxK7H0MtfJPr4urBqSF99AHUDTZSJqldAweuoSLXyU
 kNxTwCl4pu/ojqqz8/9GNcHgHRjyNFwZ8aGDLQQ4UgLfPEfWvmiRfHoOVoUlOAdynRvMUZUTrBu
 YsrUP78VLVV2vSbr5bqFlGCynRTh19QLlCcBKELYEFMXE6eWUS3HsBbSKBP9FdVxyjuMMqrluS3
 P1uwc4W3pRRDpYiCUlJw+W5sQ46tGZY7sf/fEiocMVQueAq8Xkk/BnOp7m0cShpSs7GKYdWyEGh
 bLNlnnmANzzRhJGvuf7M996cCGXT0fClS0sLgHkG21HF4Em4SKI8edeTTXl7q6w414M+tUiexkF
 5QFec+7xBqNPXTQ0Q/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX+es869piY4DE
 waXf3WwsfZ9jLnCWkxH7toYNA42wFClvoBewx8dODkGQVxABo2ZQdfW4wJn3MgDB7e+JTjmqwTv
 jmWQnImL+jE6thQxumibSWpi9KQzqUA=
X-Proofpoint-GUID: f6mxSL4AXmcjMFt3ku5UHjyzjUXFbLf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement the CE and service-to-CE configuration for QCN9575. QCN9575
uses 16 CE pipes and a service-to-CE map that includes additional HTT
data service IDs not present in Wi-Fi 7.

Add QCN9575-specific CE configuration tables in wifi8/ce.c: host CE
attributes, target CE pipes 0-8 and 12-15, and a service-to-CE mapping
that includes HTT_DATA4 on CE15. Introduce HTT_DATA2-HTT_DATA5 service
and endpoint enums in htc.h to match the HTT data service group
numbering QCN9575 defines; only HTT_DATA4 is wired into the CE map by
this patch, since it is the only one QCN9575 currently maps to a pipe.
HTT_DATA2, HTT_DATA3, and HTT_DATA5 are added now so the service group
is defined contiguously and are expected to be used by future CE/service
map additions for QCN9575. Add name cases for all five in
htc_service_name().

QCN9575 also requires HTC endpoints 9 through 12, beyond the 9
endpoints (0-8) existing Wi-Fi 7 targets use. Add ATH12K_HTC_EP_9
through ATH12K_HTC_EP_12 to enum ath12k_htc_ep_id, raising
ATH12K_HTC_EP_COUNT to 13 for the shared endpoint array. Since
ATH12K_HTC_EP_COUNT is also used as the validation bound for eid
values parsed from firmware (HTC rx headers, credit reports, and
connect-service responses), raising it for every target would let an
out-of-range eid for a Wi-Fi 7 device (9-12) pass validation and index
an endpoint that was never connected to any service, where ep_ops is
all-zero.

Add max_htc_eps to struct ath12k_hw_params so each target can specify
its own HTC endpoint limit independent of the shared array size, set
to 9 for all existing Wi-Fi 7 hw_params entries and 13 for QCN9575.
Switch the eid bound checks in ath12k_htc_send(),
ath12k_htc_process_credit_report(), ath12k_htc_rx_completion_handler(),
ath12k_htc_reset_endpoint_states(), and ath12k_htc_connect_service()
from ATH12K_HTC_EP_COUNT to hw_params->max_htc_eps, so Wi-Fi 7 targets
keep rejecting eid >= 9 exactly as before.

Update Wi-Fi 8 hw params to use the new CE config tables and build
wifi8/ce.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/htc.c          |  18 +-
 drivers/net/wireless/ath/ath12k/htc.h          |   8 +
 drivers/net/wireless/ath/ath12k/hw.h           |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c     |   7 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/wifi8/ce.c     | 404 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/ce.h     |  13 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  13 +-
 8 files changed, 454 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/htc.c b/drivers/net/wireless/ath/ath12k/htc.c
index 7227bed91ade..a9241d290534 100644
--- a/drivers/net/wireless/ath/ath12k/htc.c
+++ b/drivers/net/wireless/ath/ath12k/htc.c
@@ -82,7 +82,7 @@ int ath12k_htc_send(struct ath12k_htc *htc,
 	int credits = 0;
 	int ret;
 
-	if (eid >= ATH12K_HTC_EP_COUNT) {
+	if (eid >= ab->hw_params->max_htc_eps) {
 		ath12k_warn(ab, "Invalid endpoint id: %d\n", eid);
 		return -ENOENT;
 	}
@@ -158,7 +158,7 @@ ath12k_htc_process_credit_report(struct ath12k_htc *htc,
 
 	spin_lock_bh(&htc->tx_lock);
 	for (i = 0; i < n_reports; i++, report++) {
-		if (report->eid >= ATH12K_HTC_EP_COUNT)
+		if (report->eid >= ab->hw_params->max_htc_eps)
 			break;
 
 		ep = &htc->endpoint[report->eid];
@@ -264,7 +264,7 @@ void ath12k_htc_rx_completion_handler(struct ath12k_base *ab,
 
 	eid = le32_get_bits(hdr->htc_info, HTC_HDR_ENDPOINTID);
 
-	if (eid >= ATH12K_HTC_EP_COUNT) {
+	if (eid >= ab->hw_params->max_htc_eps) {
 		ath12k_warn(ab, "HTC Rx: invalid eid %d\n", eid);
 		goto out;
 	}
@@ -411,6 +411,10 @@ static const char *htc_service_name(enum ath12k_htc_svc_id id)
 	case ATH12K_HTC_SVC_ID_NMI_DATA:
 		return "NMI Data";
 	case ATH12K_HTC_SVC_ID_HTT_DATA_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA2_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA3_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA4_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA5_MSG:
 		return "HTT Data";
 	case ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS:
 		return "RAW";
@@ -430,7 +434,7 @@ static void ath12k_htc_reset_endpoint_states(struct ath12k_htc *htc)
 	struct ath12k_htc_ep *ep;
 	int i;
 
-	for (i = ATH12K_HTC_EP_0; i < ATH12K_HTC_EP_COUNT; i++) {
+	for (i = ATH12K_HTC_EP_0; i < htc->ab->hw_params->max_htc_eps; i++) {
 		ep = &htc->endpoint[i];
 		ep->service_id = ATH12K_HTC_SVC_ID_UNUSED;
 		ep->max_ep_message_len = 0;
@@ -667,7 +671,7 @@ int ath12k_htc_connect_service(struct ath12k_htc *htc,
 
 setup:
 
-	if (assigned_eid >= ATH12K_HTC_EP_COUNT)
+	if (assigned_eid >= ab->hw_params->max_htc_eps)
 		return -EPROTO;
 
 	if (max_msg_size == 0)
@@ -754,10 +758,10 @@ int ath12k_htc_init(struct ath12k_base *ab)
 
 	spin_lock_init(&htc->tx_lock);
 
-	ath12k_htc_reset_endpoint_states(htc);
-
 	htc->ab = ab;
 
+	ath12k_htc_reset_endpoint_states(htc);
+
 	switch (ab->wmi_ab.preferred_hw_mode) {
 	case WMI_HOST_HW_MODE_SINGLE:
 		htc->wmi_ep_count = 1;
diff --git a/drivers/net/wireless/ath/ath12k/htc.h b/drivers/net/wireless/ath/ath12k/htc.h
index 05b3e593542d..1364eea56f70 100644
--- a/drivers/net/wireless/ath/ath12k/htc.h
+++ b/drivers/net/wireless/ath/ath12k/htc.h
@@ -207,6 +207,10 @@ enum ath12k_htc_svc_id {
 	ATH12K_HTC_SVC_ID_NMI_DATA	= SVC(ATH12K_HTC_SVC_GRP_NMI, 1),
 
 	ATH12K_HTC_SVC_ID_HTT_DATA_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 0),
+	ATH12K_HTC_SVC_ID_HTT_DATA2_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 1),
+	ATH12K_HTC_SVC_ID_HTT_DATA3_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 2),
+	ATH12K_HTC_SVC_ID_HTT_DATA4_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 3),
+	ATH12K_HTC_SVC_ID_HTT_DATA5_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 4),
 
 	/* raw stream service (i.e. flash, tcmd, calibration apps) */
 	ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS = SVC(ATH12K_HTC_SVC_GRP_TEST, 0),
@@ -227,6 +231,10 @@ enum ath12k_htc_ep_id {
 	ATH12K_HTC_EP_6,
 	ATH12K_HTC_EP_7,
 	ATH12K_HTC_EP_8,
+	ATH12K_HTC_EP_9,
+	ATH12K_HTC_EP_10,
+	ATH12K_HTC_EP_11,
+	ATH12K_HTC_EP_12,
 	ATH12K_HTC_EP_COUNT,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 9c11edd2b051..96776c6e2050 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -164,6 +164,7 @@ struct ath12k_hw_params {
 	} fw;
 
 	u8 max_radios;
+	u8 max_htc_eps;
 	bool single_pdev_only:1;
 	u32 qmi_service_ins_id;
 	u32 qmi_max_chunk_size;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 282a41980d98..7b2f54248fa6 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -416,6 +416,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274,
 		.qmi_max_chunk_size = SZ_2M,
@@ -514,6 +515,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = true,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
 		.qmi_max_chunk_size = SZ_512K,
@@ -612,6 +614,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 2,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274,
 		.qmi_max_chunk_size = SZ_2M,
@@ -708,6 +711,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
 		.qmi_max_chunk_size = SZ_2M,
@@ -800,6 +804,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = true,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
 		.qmi_max_chunk_size = SZ_512K,
@@ -899,6 +904,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
 		.qmi_max_chunk_size = SZ_2M,
@@ -992,6 +998,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432,
 		.qmi_max_chunk_size = SZ_2M,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 051c6447d35c..3717b00741fd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
-ath12k_wifi8-y += core.o \
+ath12k_wifi8-y += ce.o \
+		  core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/ce.c b/drivers/net/wireless/ath/ath12k/wifi8/ce.c
new file mode 100644
index 000000000000..27bdb7a3b20d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/ce.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../ce.h"
+#include "ce.h"
+
+/* Target firmware's Copy Engine configuration. */
+const struct ce_pipe_config ath12k_wifi8_target_ce_config_wlan_qcn9575[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.pipenum = __cpu_to_le32(0),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.pipenum = __cpu_to_le32(1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.pipenum = __cpu_to_le32(2),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE3: host->target WMI (mac0) */
+	{
+		.pipenum = __cpu_to_le32(3),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.pipenum = __cpu_to_le32(4),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(256),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE5: target->host Pktlog */
+	{
+		.pipenum = __cpu_to_le32(5),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE6: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(6),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE7: host->target WMI (mac1) */
+	{
+		.pipenum = __cpu_to_le32(7),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE8: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(8),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE9, 10 and 11: Reserved for MHI */
+
+	/* CE12: CV Prefetch */
+	{
+		.pipenum = __cpu_to_le32(12),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE13: CV Prefetch */
+	{
+		.pipenum = __cpu_to_le32(13),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE14: WMI logging/CFR/Spectral/Radar */
+	{
+		.pipenum = __cpu_to_le32(14),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE15: host->target MSDU/MPDUQ */
+	{
+		.pipenum = __cpu_to_le32(15),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+};
+
+/*
+ * Map from service/endpoint to Copy Engine.
+ * This table is derived from the CE_PCI TABLE, above.
+ * It is passed to the Target at startup for use by firmware.
+ * Pipe direction:
+ *      PIPEDIR_OUT = UL = host -> target
+ *      PIPEDIR_IN = DL = target -> host
+ */
+const struct service_to_pipe
+ath12k_wifi8_target_service_to_ce_map_wlan_qcn9575[] = {
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(4),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(7),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_PKT_LOG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(5),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_DIAG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(14),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA4_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(15),
+	},
+
+	{ /* must be last */
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+	},
+};
+
+const struct ce_attr ath12k_wifi8_host_ce_config_qcn9575[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 16,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 128,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE3: host->target WMI (mac0) */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 2048,
+		.src_sz_max = 256,
+		.dest_nentries = 0,
+	},
+
+	/* CE5: target->host pktlog */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_dp_htt_htc_t2h_msg_handler,
+	},
+
+	/* CE6: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE7: host->target WMI (mac1) */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE8: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE9: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE10: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE11: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE12: CV Prefetch */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE13: CV Prefetch */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE14: target->host dbg log */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE15: host->target MSDU/MPDUQ */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 2048,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/ce.h b/drivers/net/wireless/ath/ath12k/wifi8/ce.h
new file mode 100644
index 000000000000..222b8dddefda
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/ce.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_CE_H
+#define ATH12K_WIFI8_CE_H
+
+extern const struct ce_pipe_config ath12k_wifi8_target_ce_config_wlan_qcn9575[];
+extern const struct service_to_pipe ath12k_wifi8_target_service_to_ce_map_wlan_qcn9575[];
+extern const struct ce_attr ath12k_wifi8_host_ce_config_qcn9575[];
+
+#endif /* ATH12K_WIFI8_CE_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 428d6b2b4418..fa64b865b931 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -8,9 +8,11 @@
 #include <linux/types.h>
 
 #include "../core.h"
+#include "../ce.h"
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "ce.h"
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
@@ -28,6 +30,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 			.unified_fw_image = true,
 		},
 		.max_radios = 2,
+		.max_htc_eps = 13,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575,
 		.qmi_max_chunk_size = SZ_2M,
@@ -36,12 +39,12 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.hw_ops = NULL,
 		.ring_mask = NULL,
 
-		.host_ce_config = NULL,
+		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,
 		.ce_count = 16,
-		.target_ce_config = NULL,
-		.target_ce_count = 0,
-		.svc_to_ce_map = NULL,
-		.svc_to_ce_map_len = 0,
+		.target_ce_config = ath12k_wifi8_target_ce_config_wlan_qcn9575,
+		.target_ce_count = 13,
+		.svc_to_ce_map = ath12k_wifi8_target_service_to_ce_map_wlan_qcn9575,
+		.svc_to_ce_map_len = 21,
 
 		.rxdma1_enable = false,
 		.num_rxdma_per_pdev = 0,

-- 
2.34.1

