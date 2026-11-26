Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684867;
	b=3Pql7bjoNdoPBHYHRsAS7kG6nHyxMAHZKa6aXP4+Xn6ZKozay5iijfQWANnytWn+Ifqc
	 JnfSsCGTXKm0v8ECKqKLD/ckjAJhYEVxiV27ZaRlcomStxp1GWh1S0yZ/ERNLZF7JdWKB
	 UpOAdc5v6iNSGwqQDfUZW25XDbnuH1Zh2bKviVIFYpve6ziaNas6/FdDb6LHo1a0Y3+KU
	 3xc8rGKm97+aZQwcIWiBM3c2s6YeJU4L1EfPTYRk+MBnMI2oHjBVsRSJtwJPUmpsbrKHl
	 YBp2AppCe54WI0+K4JY/HLoT/kNh/E9QlgDGhRuCoaR+lZFAw4SZjKztWQLpwvgNTuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
	b=3oNsC1kQFK66zf9INpMDXEMvz40EoSa0NnVkAvnh6XDlKrhnzco8IEeJHFIvtSfwI96+
	 3ipRVI9lOZ7hfEZzpC1S7d/Cyl3A6+WF+szZtcblCK9mSd0ya7PhzoG/aNRiOGAbyIvOQ
	 suI5PsuofXJrzIAmnzrkga/FMs04+it/sHOJ0mZKjronfNp5kWbpmk4n1M/dmBdToyXxr
	 TDfeX0/gLSbpwzU0zkB7A4cp/8fSKBkREQEeI0N+8rh+qUQHpz2pAmsIQbcaxyBk2dhpG
	 xqdZ5SXFWgK0mL/s5BPXgA6Qr30s89rYR42HMfgcvVINCSXZhE83fQLJA70hoieFwkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5fr5c1B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e43vLxih;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78939606A33D
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78939606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5fr5c1B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e43vLxih
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j0f4131121
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WnvVKxUOEbs
	BzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=; b=O5fr5c1B/l0K8y5cFs3KJrfBT0+
	uUAWKuI82Wn4qamkjhwMit9+hn6HvVoXz91FRwqOzxMLeOyTMvKy3qnX2WPRn8MG
	zUEr7kgXZTXhq9u4sMKiXaJmElq4BYtvfBCNSS5M4RMxYukplUQ2eNdI8yStT1DQ
	MbnXQ7J0r4HVmmKDRR+UUNCdo/WgSG/GxIYcBH2MQByybMQHf/7oHHdtMzeF01Z1
	tI5VgwvDA65p64QwSBNGYIodPUgogZLVq7gvnjrul0bNa/zKiKORhBs/qo8t5h+g
	ySPMmhDOMUjw/4pARVYw1w1f2JmbyYc+/qiKcX3kmAlqhLWj6l7LmYpcrJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0bu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f84753b43so5208331b3a.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684865; x=1796289665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
        b=e43vLxihjall8OVRvRhlJG01egPCpKtSLZQXdiRWqKtQytThO/J0xZrtDN0yaHTetd
         zCnetvt1t6gNBMU6pu+ADW4xk0SOQeig36Itzllv9kYjgQoXEzGc1LQ6QDQIPObOzxlx
         Nfg/ecQC8asJQw/kRedZB2twP1Ik39LNFUuHgj/91YbuJTFYs5sOqDhmbMPAbwpBqNH4
         mzhGfcoGLLiP4oSDyka1+FXeFRxZZICvvifv3JHRzmiZAyjVr1JlExvsRn6fqkOROka2
         LRl0Bf3UxXKEY03lzmoGJoptvnxW5GNTDVYYfjk/q+IaqBjW9dXDNkUKDfsJU/7TIZpq
         NAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684865; x=1796289665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
        b=UVHgHluMy+3DKbTJ6bvxhN1CoHxk4gxJwFFTDby+ti0s718MsLKoHTNd5yP0YLSJJ6
         uYEzT7iH0SPuVD6go1ak0XV+JpsTxOXdBkwG/6/+KSms4ezYm+YWqgUFJ+U3H/aPvesu
         cux8cwD3RY+wffI+8BBN5+X8e+rNiAPHYdGK1aCGfLvLMfad/6H5+JbNSUMGTt6MOkai
         BJG0l6PKVFCctCkbD3MSPqI6JSCIBsE7JrwNjUmLm2gqK64AlBSsOGBPOMYe9E2MVZq8
         dmP38nFFursWHAOn/C9SIEAF4iwnh5004nrtUgvuRpYelB2tz6ObiZHlzqNDApbInMAm
         rmkg==
X-Forwarded-Encrypted: i=1; AL+hErFWb2NQNN1ckW0QhSSxn5R9QgpYJJmAeoMKQbIg0RgOFPJQef5gcuXreROpx7KdKlrijIy1kKIXVX47030kmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+nLfwrd2Ae5oD2RiRg6wiQR0LBexJ9lwiyGNy6dIpMk/9OvklA
	nD9gw+MUoB/sy5fuoFhoi7Y3xxB0a1drq1HI6KLGl0gPoCHRsH3thMvHETdEIlBweOu6HtDTmz0
	fK3zo5C2gnuFQ4AlGqsEE1Idps/vhhedL5YL8rlpNnqfXN+UJtmg7dpIBr3jHr17ZwiYnsjGhp3
	jHVw==
X-Gm-Gg: AZFdTZeRZfMbB3QxfYDbZ7KxH4lAWsivYNKGVuv1eWG97bbweIY30qo7CD0mK2ZiR/J
	zowBvyt2pj7ixzwL+W5x0/AwhNoQuWFjBm+WnY0+eN1S705sp22A5aKjYhIjRAOUaZSUBlm3Onk
	OYulJK8qn0DwujLDvek0pcelwyXTLLeudCsIdgPYhRj83rLi9DUyyRMIXumT+qb3xsMoe3aUjt6
	5+LFQI73advPbtRG/UExrD0PsSw2FDCHLUJTQyTIm+tzYuKaHzqN5Sx00zJNhmJAc7xzTE9JAFW
	mAmXyGJt5oxok7SeZg1KeNlya+XQFHBQLjMdIUuk8a8A8oAt2Af7Iml14yYTjpoEPRV+b7n5JPJ
	s7a1ur3URygXOTGtlD7TQZ2k9X9A/35riUlrGPY3YFatHX2bzpF7uX2U9knFR1i8JS95OSgk4A3
	BkAnoMLKnG87PpMe2FKNAIfmGgtSJeHSM=
X-Received: by 2002:a05:6a00:1f12:b0:8a0:3ed7:939e with SMTP id d2e1a72fcca58-8c87d80e2cbmr18038867b3a.60.1795684865301;
        Thu, 26 Nov 2026 01:21:05 -0800 (PST)
X-Received: by 2002:a05:6a00:1f12:b0:8a0:3ed7:939e with SMTP id d2e1a72fcca58-8c87d80e2cbmr18038837b3a.60.1795684864637;
        Thu, 26 Nov 2026 01:21:04 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:21:04 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 6/7] wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
Date: Thu, 26 Nov 2026 17:20:36 +0800
Message-Id: <20261126092037.462830-7-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07fa02 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LZTIgfvDWzmdvsE2OGQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXyon6Bweyv4K6
 7Y0tEkgd+Zm0mbOhx2TzhxlZyp/35PXYI8LEmlDLJZ1R3JCa9YG4YNA9rrAcngDTISO/BBCGoAd
 QZsEs8I6rUpsi6KCBRUKoMrnGiJXrDGLXNYy8VHvDj+ARzLg3YJUJE9Jf59NIdSSltIcAYtxYM3
 2MdxwFu6ytwXqamNCEpPjDFrg0zbolNOQL90JO0EgsIL+IxyQ3aJw4ygT5f59ddovh1NhWfyEA2
 2CD7RzNsLZsqFHTQdjtIlP/Q5Dr5YLxtA3BN51Ea0zSeRX09bMFzTPz0unyfYJoqXnc8U9Sv2h4
 tOollh5QcUCkeUyCu+q2GXptsSlcezWOi/aZYoDi6gMiU9dsoXVkzypTTSQfnTRw4/fNvdkdjFM
 8g6efJ+n9IPXGCtV9Z46bwoEh12P4ibiBYXNFrlpeKvFGaf11mpNZgg16v0QINog3LztE5ODb/h
 skpNrIhhtmPM9brFWBQ==
X-Proofpoint-GUID: 7-jpnP4WGw96L2Rra80fkt7iuGLI0Z7h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX3JbpVXRUrYhm
 33UJ+cCWe4tGr54kwbBg9Csj0g8FaPT7UNeb9AMWbUm9KptgbKAaPAWMd4OiefT1XxFTEtgf8QZ
 0ytbhGrxFaW0m4L5OJcGLwAb9S0lBZI=
X-Proofpoint-ORIG-GUID: 7-jpnP4WGw96L2Rra80fkt7iuGLI0Z7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

ath12k_mac_mlo_sta_set_link_active() fills the vdev_bitmap and
inactive_vdev_bitmap arrays of struct wmi_mlo_link_set_active_arg, and
both arrays are sized by WMI_MLO_VDEV_BITMAP_SZ. The bounds checks on
entry_idx, however, compared against WMI_MLO_LINK_NUM_SZ, which is the
size of link_num[].

Both constants are 2 today, so nothing changes at runtime. The check
still has to match the array it guards: if the constants ever diverge,
the wrong bound either rejects valid vdev IDs or allows writes past the
end of the bitmap arrays.

Use WMI_MLO_VDEV_BITMAP_SZ in both the active and the inactive vdev
checks.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e79a9e55c248..d50148fe761d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7616,7 +7616,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
 		entry_offset = vdev_id % 32;
-		if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+		if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 			ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 				    entry_idx, num_mlo_vdev, vdev_id);
 			return -EINVAL;
@@ -7636,7 +7636,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 			vdev_id = mlo_inactive_vdev_lst[vdev_idx];
 			entry_idx = vdev_id / 32;
 			entry_offset = vdev_id % 32;
-			if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+			if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 				ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 					    entry_idx, num_mlo_inactive_vdev, vdev_id);
 				return -EINVAL;
-- 
2.34.1

