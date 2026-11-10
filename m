Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292841;
	b=W/2J7aWdzmtt8MLmc8Yab44Ag4+XkXDTt0+1NGadvgCowBOFl+6Ck5PiITAaZ419SE+u
	 suBxOX+4wCPw7z62rYjkIpuPlR4i4H2+RCxsb4MJhHmi9YiVun9zd7JgYrzCOEigkFiC9
	 B2TNfuHDr9/RS1D/E0lfZnc6Ol0uv0WSdgmkw0kOpLocLYQmZcK+tbXfbQYTIh94vbIvw
	 OggHl6TvtQAZ7fL4c3h8+0VLWmyIQxtW5ZEsPthVzFp0dsxF0fj1ca6WXUAF/eP5YcX8Y
	 2tELAKcoaeJpsbh7rI5YK/dX3S5i9ZuxOdAmMAe3HyRLeGbuAww/fPfqdXS8y0XGBuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=;
	b=5XeeymsAWVFqZ/pZx3JQbAiXJxSfm6GcN3NBsKfIV4QvfsuHU2wfAlc3EvGvHr68P7eJ
	 QVWkb8nL5gtCecA/C9CQ9YlqFHXZuf4TewBFwBIDA2wjvqyMSjcQDxIs86qzrYLhTUrxA
	 EBYh+PkxUzqiHcM0ylZlg8AP6pRVuAa6teiqVnHQ33aRi56+hH5MI+fw6pA50MXZmWbmd
	 /Nci2iIBvZnr6VfdYq5I1LBHahR4107CJV4k7HtDrv18IofqF9pskPTevLn2LHmmfsk7D
	 bCM8EGTFIcva/lzScU0eztDoHJCDJ9gUqVyCmMSpkHhoE+znCX7Y9e85aPzKnaeW4og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALmbT1OP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLJn5Jdm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51EF606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51EF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALmbT1OP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLJn5Jdm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A5gD2275468
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=; b=ALmbT1OPf/GnsmVP
	YbiQUhh6yk6uC48o6Fv0ePzw2S+r29lR+4j04NoGWJoautM7UnKSRIkEwrcZWELK
	ymXavlubWSIA3CsLuK9S1pyAZOs68PeksI2TLVrWsq9yY0P99m3L+zWPA8O6aVgG
	AQ8g4N7rXK1Vxr2sq9ao228Ynp3B28ttfvsA2xUxjdtrtY1V9XQO1tHrd2ac81V+
	k/lkoJsx0AYM1wJ8AgTR7JgnsYPMbLcGdCBTAF2TqMq4TvubKAn+4E3wProaDfvj
	HhWWumUIv3ecFGCfQkpVQ3uLu5OU63izvRYo65eVv3HrUM8H4h47S30p98dYKAK+
	pEtlxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bx0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso1514541a91.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292839; x=1794897639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=;
        b=WLJn5Jdm2V/6iQLNxl8SxrWLLM3t1QQ6uLsLTAdbPkvwIh7l7qE3vuWy0vYgLo4zT2
         wgyVmI6iGKqOhAjDFEKGIWowf6c7HNmOQSSpFQqTDKs24/UJ2p2GRx8qqFw8SMCuQiFz
         XX+zQns4s2/2goMCPPgvCDYFR06cPNmX6lDC7/FozxeXokPERPBiWpL9fOPhF01j9K/m
         WQ37W5mAqdzKapWn01+F76P//wSramSFQrnLBWiTb8PB2T9lMiijw3ZrHv3TVMwJdIHg
         Nq3XtjQDaiVdUIf3yAFBnd8Cw/nvwkxXqaQXQfX6t8owyrY33M4OH7UcNKXLaYYptTQj
         2WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292839; x=1794897639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBNOzrCG8K+RyTkgjeaTUrpJlaUmYgwFoqpoWPMCVJc=;
        b=jWibxVpP2XuWkRZYcI9fdHqY28Kjd1IrOOevUIrkTSJlXJQcHCzVrmTWVJ8LSDNaHP
         8f1ef1lCOeXnoSQaMI4Akja2GyGMnDnHCZEdfk2UGPhYDzn+QivPLtYg4XL8zSjiujeA
         utbVr0FAVHUk20jU4SMFbs4c+Gx0ka0peTG/8pcI6ksGTAZl4hIS9QzfKcvJmTXHOTFH
         Nd6OsLN/WBIaJoC15HyLXnovRnLp4yXk3NcqQW5Ye6HGJx9Zq3i/wZgxtdQGSvRD8qby
         DBXO8ms4TAIPZipZOysnNv1SiU/cqGcBGLUAJNSkeG7absCsqW9mC2I6cj3eEpETXIbY
         E5mA==
X-Gm-Message-State: APuU4Z8bpXB+i4UaYl7d2bxXCvGfaMUALwxYmDLSFXP1TV41zdvfVO0Y
	wN46YE6pe6QPSKiJ8EWuJNnU5KRZRUPB0tMA9M6QmqmOQL5bi8M+tLDbJ/H45Nok8N4wZRZqc8k
	cmjmv9kuDpVklPoGoOTA5mkdk9+F2kE/xANO78Da0vWmXguV0r73V9fUWLEfNeC6A4ue3OEMbA/
	E89g==
X-Gm-Gg: AYBFou04Ae1JiuMfUmzYKwFu95q2zV2A/r92cx+KT2lCN//gKfmzZxQ3cFCnD6memWx
	rXU/HKntUQQoszNlSE8eo+/jbHLw0dle/4BjJu8TT2cA05GyYYPSJNCGZihUdfh61dElMV/iLN8
	CEXxnJ4IzM7byjUz5J11B1JkaNI5JjAUshsM+C+lphB3VzlMwRIFgn3diDHFalwJe1TCof1XNxb
	ipbFLPB4kBKT8P8KUl7o8w0n+4p9XazbK5jUFkMB5hsFZwMJaVOpVLKRePFtwLoPtfAC8mGjl51
	gVZDDueFe9HqM3fdRD4nD7iWTSuPB2jJLfw3Gi/NvLIyxlwFenQb5ihqb7vLsIqGa3coMN1cMnR
	d1JvJubcawarH42wMSq21GXkNdlv0OLcS9dXZj7BPeV/BweaT0MYLbnfKkxv61cIn8y1Ply3jLO
	4/UM1QGEAPCvRZFuO9fzSItLQdTOeaZA==
X-Received: by 2002:a17:90b:48d0:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b166cd69a5mr2060386a91.13.1794292838846;
        Mon, 09 Nov 2026 22:40:38 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b166cd69a5mr2060362a91.13.1794292838183;
        Mon, 09 Nov 2026 22:40:38 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:37 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:22 +0800
Subject: [PATCH ath-next v5 01/11] wifi: ath12k: fix potential OOB access
 due to unverified hardware link id
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
Message-Id: <20261110-ath12k-logical-link-id-v5-1-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9McmE9uQLhWymxKIyYMffpaTKrqZ2vaV
X-Proofpoint-GUID: 9McmE9uQLhWymxKIyYMffpaTKrqZ2vaV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXzyf6c/P3UiUP
 0ugNoGRWEjOv/UZdtrc8Gi1yB1Ykko3/KyC2vOz+vIGjb89dyOWnHj5VrCNfc9i5jVMi871tKC2
 D4a3Mek43JMbaOZfqIKHYrNerIxfFRo=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2bc67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qtqQsJB7fzTjSEb7W4QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXwg6po+19bBxa
 wZb19uD5iqMi+YaEobGh+QLw1QcYXQdP/JGbK+FsQhBE4jhki3DJnatpAUy1e6w341XjvSqgJnc
 +zygJd7RYSeyWESzysbFfC1DXU8d8qaKD/gzojw0t5sSzk8XcSgwOwOtVlmzTcK4fFXN+wWYpfI
 vvoAqWbw3XHola5iDy3mJLWsb0SY5Ni/sdAfx97L551XknrmJPdrCe8pshlCa4K82n1ElnkgjiU
 GFtJnF3r42ug0Sy2MEKnccajTtrn1j/BIVqSym0S4SaU8beVWu8rJqCo/cWj6TJEo/Hr+Yn3XFy
 XMbsWYCoXSl38iKldktnPaPvZUabtlIpK2I00J95NYmRfoEoDQ8xVxe2PT6mS/s6JiIjjfPVsPf
 ZI+pny2osQfjq7CBNvsWFLNp09coQ+jMFUqFMTkZxWk7pglo/95qj+wmoIwOxgxbPMs7YJ89h+M
 kfGmQjvO/1NCMFk4wZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

In ath12k_wifi7_dp_rx_process(), hw_link_id is extracted from
hardware/firmware descriptor and directly used here (and also stored in
rxcb->hw_link_id which is used later in other functions) to index
ag->hw_links. ag->hw_links is an array with size ATH12K_GROUP_MAX_RADIO,
unverified hw_link_id could lead to out-of-bounds access.

Add the boundary check before using it. If the check fails, continue to
process next descriptor.

The same applies to ath12k_wifi7_dp_rx_process_err(), fix it as well.

This is found during code review.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..c8e590e5e250 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -705,13 +705,22 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 		cookie = le32_get_bits(desc->buf_addr_info.info1,
 				       BUFFER_ADDR_INFO1_SW_COOKIE);
 
-		hw_link_id = le32_get_bits(desc->info0,
-					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
-
 		desc_va = ((u64)le32_to_cpu(desc->buf_va_hi) << 32 |
 			   le32_to_cpu(desc->buf_va_lo));
 		desc_info = (struct ath12k_rx_desc_info *)((unsigned long)desc_va);
 
+		hw_link_id = le32_get_bits(desc->info0,
+					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+			if (desc_info && desc_info->skb) {
+				dev_kfree_skb_any(desc_info->skb);
+				desc_info->skb = NULL;
+			}
+
+			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+			continue;
+		}
+
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
@@ -1469,6 +1478,11 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 
 		hw_link_id = le32_get_bits(reo_desc->info0,
 					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+		if (unlikely(hw_link_id >= ATH12K_GROUP_MAX_RADIO)) {
+			ath12k_warn(ab, "invalid HW link id %u\n", hw_link_id);
+			continue;
+		}
+
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 

-- 
2.25.1

