Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292851;
	b=l73Lywnplrax8z8iArmqkMe1+LvDaWa+sr56YFA25ODhBDIEbLus7QzY8jCtawe50fk4
	 GMnebfgr8uuGFCBmqNzOBJALLqKalju1/sAPGVNEEsaXXIuY4XSCmSpMZxLmgOxdN9FUe
	 zypVeTbLgPWlooXW/FMwM0DSZFQfzpcy4YRGJjhtNW7sYdbx1NIv6C6p0H0hXRsl4RV/E
	 5nfBSeGNloRW2WZ4XnsVLLU/YfjwZToYfx92cO2v8vSJbpobTjdSapy+0znRWDvkun2bG
	 EMVog3qhADOz/XJVzTOX8UQZk25Nw7gUAhEWz1l8MiP3VeZR8pIYTviGv6BI2UyFnEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=;
	b=z+dmmomOTCb99LdMeBtLIcJjxIfB1R9OEErq7c4FoJaNY20p0dZxYMYprQyjwupRKSRv
	 dMSdOMJ9UJvLVsGHVGxteRb3yY8HetisESoMr9k5Rk6DfsnvxH6IbvEBzblavnz36BVQ0
	 3pCTqyTPJrtarTKKd3D41DzplczM1t8eVK72igcH4IuCsshGbCmv2HiJUnexEXmaI8Tq9
	 djU8QdkenC/2I+DWXkXiHlSHtw74CpWDzEQL3PCW187PUC0oHUnj+BPE2DaL87GDGoJCY
	 YuoGubuNwwJwthvQArrAxgaWorYyApmv5bodhawCH3aMnTdSmwWmi6HQhtHgQkak/7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdWF++WR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2WU6ahP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2B3606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdWF++WR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2WU6ahP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A9oR2919661
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=; b=GdWF++WRs1ifv+D2
	r9WuoSlBuqOX94pi1sQ961qpN4wjryLNQi3BDi4F4V+y+Ox61UEExwFPrlYRo/OK
	6TbzfQHFsIvr5mCqxK+kbFwSmr3Tpj8taa8RQO3sIggeGAR93Shrgv1jwT1XTH0E
	TUPPerZPkwdGcgcEkbWUGxnOmJMBfAI7sG+owQ/2JVsGOg/xV0FnWeCmNUtpjNde
	YnQNIiJkL8VuapLHnq1elOJlRYj8rfhhlnDyJSOnot9ytNZ0RRZrnSwuFDFR39mf
	tyOsehU2KvSvIt5rfWenLHAWbIF9Pl/u+8wsNZ5UCC1SjEg7yjS22UtwccVnM8id
	y+lETA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg24j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1593092a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292849; x=1794897649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=;
        b=e2WU6ahPtzLlVi27wJ9XC6ia2cm1UWY8K5Kig8jBWsRl/GQFPNTc1V9Fx7gz+rAmty
         6HYI0AU+sfvmQkvs7t3swbR2hM/M0M7F5udcPSWO8w6n3SyWiYDSXcKz6VudxZGi3qE2
         wDamODRvGwbajB4aKTErED1wG7WJblITY4OR1I+J1fDjA7RmOEuGFEJt/uMvUPIylbi0
         0ELxQ95oiszFnz0+wMnine17z/dqt1Uy/yy0nhuROqXGgOBnI/mo6U9t0K72IFhrz3mq
         H2bQTu3kOj9njIX+virFVaNHJelHE3hBzNdXRLnCJm/27fc0MDP4RD2FF1nbay7NSsi7
         yHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292849; x=1794897649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=;
        b=cLqnbEHP3mxrw3mzh9eVsbPQsuGSqeAnBvQ3LfkjwN7EIjwweBeEboYTOulAIK+sEX
         lKru131KJPmBHK73MOzn3TAV49hG3ok/h1sAJHkiABUNhuBtREQ1JW3MRMt2VZgT3KCb
         pKxk0+PrmvU1hZ2bbZxmzTSbi3ZkHoKZglbIB/1uNuNa1Dk4vTIM+7FA4BF45xWlBPzc
         mvWZ+t27uubrebzBRslVLXC9/N3jH22wy4bGET3LPBQP7MoUfwVQs8oZOFEGu8is1pja
         qq+cPAxQSDt/iCxjyqf050vVBh2/WwsjkfXlK1/diWueVyzXRFaGmDcZ06w4nh5U+kku
         P6Qw==
X-Gm-Message-State: APuU4Z95KuXYiMDux1cSPCgLZ02BMx5S/3G/8IujucEMxyJzjd/cyMug
	x723mRb/wSvJfTdiNhSDrXg2Xz7eApNr1X7MJJ3TnhuNYDbPmWTG/Dh89DQwUROAMy3DgbBsMg+
	UfX8n9FZeSVdo8eI935nGzu1d999ylMccj0Fe+QNyUySqTxvps33G3EhtfIC3s2L29Rm2qzyR+/
	LUDw==
X-Gm-Gg: AYBFou1dETtod6LcqvSYTXD6Shsx5f5Du/SslahmnTrof48dXe1pvMc2TAxTlak4RLu
	4Nr9cUYA5j9nSKoeUgvnIF0u/KE3pkH168LMmmP7q147LL17uY4Rq1IcZLNaTWeaSqecbGI0KNL
	WmMX2TVOzf3uYfBQyjvAnsmEM+txXFHiL/hXJWzxfj6BgYdYyUydvpFKPz12WTN/N2R4oSL5HSB
	hz7BE6fMz2MCRf4oZslzfDRuqRPFU395ofv+Mf/aTf8THAX/gV5irWA+UoI69KxUSUoMtn3QBgd
	2FEout8DCV+EnZD5rGpvn+LFCTgy09rKK2+nTMzPQLXY2TYl//4SjIjQ9feBOK5Z7HmLI6YNase
	286kLDh1fTcwrI9XGxgY6apZyJ0O6uxE74sLX8QrPBYhBf5zzt06n+vmv7O/ZyEz+qCzn8d2thY
	dCtWH5lC0X/JwkhFGSmriO8rVnLRzWHg==
X-Received: by 2002:a17:90b:278f:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b166cf7a31mr1929699a91.26.1794292848514;
        Mon, 09 Nov 2026 22:40:48 -0800 (PST)
X-Received: by 2002:a17:90b:278f:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b166cf7a31mr1929684a91.26.1794292847961;
        Mon, 09 Nov 2026 22:40:47 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:47 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:27 +0800
Subject: [PATCH ath-next v5 06/11] wifi: ath12k: derive device id without
 drv_link_id for single device group
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
Message-Id: <20261110-ath12k-logical-link-id-v5-6-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXwMWHHvk6lWw4
 CgxOA/0XsGDl77xmxh4vPcrLDcdQSNfHfOslO32rr9+thSZ4mNV5jUXOLGYTJEKcXJFAUIbfOkV
 iFTYTRVP57PT6dcFmM9GmNisAKIPs6XyzNIKPikCgUvBMtTvspR1dxSRPcjQP50LAk0v6lNEdLv
 CvKrQehAhsTbAbLQTblyaxXAv+dDA/k6GGxJ7qVrOFvltIxQyGy5obvZQ+8HbORHUddxEG1xTj6
 OVWpr4XZJTtyjt6mLQaacqkxciJ4c9Gz7SSfNkcLN7Og5OzaTu3GnmDftfk0+D6sS4ZcBF+ZuBY
 tSRNR0M+OgWKC/M7WCr0n1mTPLTFg848u489E1CwGlJF4Wcxleq7CWidj+Z37clL+PWBrpUGJoW
 E1X2kM++rSF+5WGQGUONqQONQ4LLmFWs6vh0Mn6mFNG8GhgYUI913zxsHT710fsKmaEFRFeEcIM
 isHPZzXxsxHeG6FSoVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX9jGsba1f0xfz
 swH5mm+ngZH+YxXkpb3jy/uIT2YQy7iuBxrsHZl4S/r4x8OXCcXqgoR+goMqN58BD0CI9214m6A
 Ew2zpp52zn+Z96tFIVwnmvsUHyaXxx0=
X-Proofpoint-GUID: CYMyhtMq9X7IR5tFV2z76SOQbMOpdv3M
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2bc71 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fys5ee70t4wq8xtZfioA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: CYMyhtMq9X7IR5tFV2z76SOQbMOpdv3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

On the RX path several functions derive the device id from the
drv_link_id via ag->hw_links[drv_link_id].device_id. This does not work
for WCN7850/QCC2072, which use a logical link id rather than a
hw_link_id.

For these devices the whole hardware group contains only a single device,
so the device id is unambiguous and there is no need to look it up from
the drv_link_id. Add ath12k_dp_drv_link_id_to_device_id(), which returns
the device id of the only device when the group has a single device,
and falls back to the drv_link_id based lookup otherwise. Use it in the
RX path in place of the direct hw_links[] dereference.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c          | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/dp.h          |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 13 ++++++-------
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 0f0800388935..d49576d29da9 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -939,6 +939,24 @@ static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
 	}
 }
 
+u8 ath12k_dp_drv_link_id_to_device_id(struct ath12k_hw_group *ag, u8 drv_link_id)
+{
+	/*
+	 * For a single device group there is only one device, so its
+	 * device id is returned directly without consulting the drv_link_id.
+	 * Otherwise, derive the device id from the drv_link_id.
+	 *
+	 * This is general and works for all chips, but particularly useful for
+	 * WCN7850/QCC2072, which cannot rely on the drv_link_id to look up the
+	 * device id.
+	 */
+	if (ag->num_devices == 1)
+		return ag->ab[0]->device_id;
+
+	return ag->hw_links[drv_link_id].device_id;
+}
+EXPORT_SYMBOL(ath12k_dp_drv_link_id_to_device_id);
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif)
 {
 	struct ath12k_base *ab = ar->ab;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 5e9cdf72670f..82724b87733a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -736,6 +736,7 @@ ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
 	return p->rxdma_buf_ring_size;
 }
 
+u8 ath12k_dp_drv_link_id_to_device_id(struct ath12k_hw_group *ag, u8 drv_link_id);
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a59adbb78c76..08a9f070e4aa 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -608,7 +608,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct ath12k_base *partner_ab;
 	struct hal_rx_desc_data rx_info;
 	struct ath12k_dp *partner_dp;
-	u8 hw_link_id, pdev_idx;
+	u8 hw_link_id, pdev_idx, device_id;
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -622,8 +622,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
 		hw_link_id = rxcb->drv_link_id;
-		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp,
-						    hw_links[hw_link_id].device_id);
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
 						       hw_links[hw_link_id].pdev_idx);
 		partner_ab = partner_dp->ab;
@@ -669,7 +669,6 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 	struct ath12k_hal *hal = dp->hal;
 	struct ath12k_dp_hw_group *dp_hw_grp = &ag->dp_hw_grp;
 	struct list_head rx_desc_used_list[ATH12K_MAX_DEVICES];
-	struct ath12k_hw_link *hw_links = ag->hw_links;
 	int num_buffs_reaped[ATH12K_MAX_DEVICES] = {};
 	struct ath12k_rx_desc_info *desc_info;
 	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
@@ -721,7 +720,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 			continue;
 		}
 
-		device_id = hw_links[hw_link_id].device_id;
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			if (desc_info->skb) {
@@ -1483,7 +1482,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 			continue;
 		}
 
-		device_id = hw_links[hw_link_id].device_id;
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 
 		/* Below case is added to handle data packet from un-associated clients.
@@ -2104,7 +2103,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		rxcb = ATH12K_SKB_RXCB(msdu);
 		hw_link_id = rxcb->drv_link_id;
 
-		device_id = hw_links[hw_link_id].device_id;
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			ath12k_dbg(ab, ATH12K_DBG_DATA,

-- 
2.25.1

