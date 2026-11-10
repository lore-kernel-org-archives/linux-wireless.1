Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292860;
	b=NPJsTfWLHmVoLgjNNhWnDzqS6msXVJIe/RwU25n3KHfn0/qSHe7BAvHgt826NPtJppuY
	 D48+WqKJWzVywpHMGu0i5kjPh48ocYC3iHPDjB0+fSPbM+EB9ePcRoO7pCQWni24x9S3K
	 CfsotzBdItcoY+1gnX1OLhc7b+LFN/BGQw9Y8Tm9y64wwn+9nrIH+mBHn63MTCnzj+slk
	 DsVW4rIoNJgHOklP/awYJL7z2t0aaS+6k+vH0C1xpXsRaI28zdzBmzkLUGVfJ3rJesRz5
	 jUFqThbMsL2XILlpjoI2tU4yjpYGR6wZUO5TJCy3S0VMZmLJbjobdWF6Wneh9rwvWAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=;
	b=MAJZUx2qeVxISf3khuQ4U2NwHTUHdZC/ek1Dgf2CQPjW9x8darR5Ok3fX0DH8xrS5XvH
	 qtCwWHy42UE/IRRtPPs3iefrNEBtpxFZlgUNgxcDqIbW5l59rSUoSJpFoZpLtTQAasHoe
	 1kGoNhNuMZMknFFUeoHGYvYIGEWpKFgKgZCS4fdUquqKo4V4JI1wxkmyEu9zCjVJq20w2
	 fgdu0y8YxZLCIvXsYi6vu2xrB6B6x5zwswmtNd+ayCtrKPcD9t5z0lc7lxydwJuUYmEtg
	 wIH2qUeGQ0n39p23o/VfZGHEoHPUJBwbSpnXmDMGzR2ZYx7+ZFiZFUj3fNHU8R50uQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DfWSjXCv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CwDD0BBj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FA606A32E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7FA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DfWSjXCv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CwDD0BBj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49toV1767213
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=; b=DfWSjXCvPMl2+nzP
	zknrZDNFM6w6V3VjaSOjqx8VQasFmbCtiZvbMd+YUp5PNBN38n5/zvXoL10KDpfx
	u7g6yVBa+QwsZYdUnwPJD71fKxIRvJ1cZ/ZEkPHGeQ+GVHwgxoa2HOJ+M/wkkVZq
	KckcVwgY44TT3vLHdNnPwnbt6RRhycJQkwtM2i/ty4812POq30w/mW7hr6O77wEe
	6O700IzUjbEoJWpCnt2EPj06TXBaZOna5uu5tERo74bRG8e0OzFbcKto7kYkTjEt
	YDxGt+wdxD9rnhaQBxpAnv7opqAJzbj/l8tYQlRnWWWNWTDEZH6uGMe/Sh/Fcw0r
	zlVisA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp0n4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd769cc9deso784083a12.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292858; x=1794897658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=;
        b=CwDD0BBjCgBGigOpzdcROsnGPH/NEE7D2gyft2IvDR3W35HnfZIBJ+hD86qkRW8+x2
         32iqmOmEMVt5OHUTUhthXc0Fo8rByn9KP5BIaGRWyvVYfw9JyIPOWW0g7GkVsMzb+GrF
         b5UkdZugFW5hp+H1iJx9v6XMhmD1wLBHm9VWqrFEq87YSHFRJe7tw/BZ8kj7hQkE/HBo
         RjnLhJ6bVMsWp8AOHeRVR6GbStd1mT/1WWaEfSML1gIoSSMSKpaZrKYYXce2BPcPhZY6
         z2Zmaj8uDJQJf+mhfe375mfM9jNsqhA3cYCfUxybm+JVVtcvx+M2T8DxWOUcrjVvAEK4
         QGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292858; x=1794897658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDbinkTh2TNmzP1JSmZsLXal3i2+qH/vs1fSNYHnOFk=;
        b=eLuGAkM0gfYadisHe08EI5Ychx2WVmhbSmhO6hz6vnsDnOxHSpvZwHT3hUVL1w0P6X
         GFbxuWOwWEO5L5Dl05bwHeCcbbYlo0ItVeEauT71J6uqhv2ODU9m1UnTR0R1AXHiJHKT
         PsG3IIH0YxfkG4JKyfkHhIw70V4HjNP3BWY69EyROEbWhroKIIBonEBZVQ+/cfj8/cVf
         Yec9GXeiHXuvpSIgeogOT9Y8n4QZPCnSh0STEItQWUpZXw+9xEuH3hFBxBKV1oR5RpZl
         nVPxDKq1mAQazuizoQ16AIOBN+D8jyJ62PIhpAzQhlMxZ9h87uLoZ5rRyZ/JGK6tkBQs
         0TZg==
X-Gm-Message-State: APuU4Z/OqjfSdRHf5wS80b1IezgoAnlDsvpNicMXJ/iLgvWQFZT3iFPW
	YZZZrI9QunuvUMns/R+QlzOdL+pLOz7gKsBwoU0ZOOHy0hWNhuMN4h8UFY3DiMsLyRyWlu/Htn9
	FiXPQLrScg3sV+DLMHK9rlx2E46FurIDFS5d6InbVTfyQQ/ENhgtw1M13xCWQe0O0bOfN5gZ+J9
	Zl0g==
X-Gm-Gg: AYBFou3NYXA+Ufkd6YY791Gw7fnNw7n3/Jjo2waffJoj7WZVBT54w8CcWP97ZqjBDCD
	HmHYLwYp2KicmMzoqIHJ87SMsL+YbYGeUP+4D+BRGK1NfnD/CPbN87ENRvKUWMy9aPsDaOp2Jmw
	U195SwY3pmJZcHKNe/wvhqboUUrtwlbZfqAed9iD8nHQzhLOlLXhJvPrvH24OkvTikiA74x6cl+
	NsaVvAR40bUBqg/eCljqgU+cn0/+9od+lDYuHxBdnYky4NgOzHqlQTIAzM2Wk8McBDBnfE3QRDe
	y2MEfnHmIlMiYP3JLvPvJsreYHRCmzMzPXSLbEls76zG+L0qpHqAiWXiz+hYOFrupNo/+Wf8D6n
	H2xVXfOzCPVvDbD9CkbC4bJLcvPlaUsxjJYda3wsdE72zGeSDrBlO3hxEnZAAKoCEuHKp6vb7wq
	q0zLABnoT7Rsi4LIIra1hzZwLuFviEZQ==
X-Received: by 2002:a17:90b:4b03:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b166cfd406mr2048818a91.66.1794292857841;
        Mon, 09 Nov 2026 22:40:57 -0800 (PST)
X-Received: by 2002:a17:90b:4b03:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b166cfd406mr2048804a91.66.1794292857247;
        Mon, 09 Nov 2026 22:40:57 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:56 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:31 +0800
Subject: [PATCH ath-next v5 10/11] wifi: ath12k: derive WBM RX drv_link_id
 per device via HAL ops
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
Message-Id: <20261110-ath12k-logical-link-id-v5-10-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: vxdS7ozbZ92YjXuuDjUmGnVm2U9mxOZM
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2bc7a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yDf83h2jVu8ggHpUoVYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX2ikFpjC3CREe
 30A9EJNzMsxUlnoGO/MTbTePk7Ybxh3YYw+in0J8hFtKxaAW608KYvGQWFc/2lgpLzKr3sW5qqB
 TWSX5hKwaxyb0r7FqLvbaQ/jNNsqcVxaqiHFEOUB76lBKXV5DxQmzQRzKJlnf9keBpv+HuZmrrY
 7hnQ+X9QbSaRi9GA27wgIr8IOuiJKJ1Q1JnpG3qqVCZ5nO+hGiEGrEA9PYbutQm8kEPU7BAwSkO
 jzCK7+8kdqLTqnU8pfbTISXdVS5gDS4N6X4FSbX+w8j+pZxhp7DMGNl0u9VmlH8uS+yyei5ZiSS
 frLod9wEV63Uf0MwlKR7zwSf82c+gmwG4+euKmkQuujc1UdIh55XiWZaZWEoMf2dQnaIiTPkpIS
 81fHxUdjI6YIeDBDtDBoRcqOm1mFwdndOtdPBb4jVb01jQuL9oBOq5aUU3JRSnGnwg9PeJPBq6p
 c3vc3uuLRJsqOA9r2PA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1ZVynxkTJrGQ
 OwcSjM3ThaVTiv3Rmzc/y+W4RInYtequB0QSQZ2GXD6aYflu6NWsjG/OwR+yWVQ3Uk92DgiOudl
 eHgDuHULFnODIrQsAY33WvbXZrXL9Bg=
X-Proofpoint-GUID: vxdS7ozbZ92YjXuuDjUmGnVm2U9mxOZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

The WBM error path also stores a driver link id in
ath12k_skb_rxcb::drv_link_id, previously derived from the source link id
via rx_desc_get_msdu_src_link_id(). Like the REO path, the source of
this id differs per device.

Add a HAL op rx_msdu_desc_get_drv_link_id() to let each device provide its
own driver link id on the WBM error path. For QCN9274 keep the existing
behavior; for WCN7850/QCC2072 extract the logical link id from the peer
metadata via ath12k_wifi7_dp_rx_get_logical_link_id().

This replaces the old rx_desc_get_msdu_src_link_id op, which had no
other user and is removed along with its per-device implementations.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h            | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/hal.h              |  4 +++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 22 +++++++++++-----------
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |  7 +------
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  7 +++++--
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 -
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  8 +++++---
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |  4 +++-
 8 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index fcad6a7ad6ba..a78efa1d9569 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -164,12 +164,6 @@ static inline void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_hal *hal,
 	hal->ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
 }
 
-static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_hal *hal,
-						struct hal_rx_desc *desc)
-{
-	return hal->ops->rx_desc_get_msdu_src_link_id(desc);
-}
-
 static inline u8
 ath12k_dp_rx_reo_get_drv_link_id(struct ath12k_dp *dp,
 				 struct hal_reo_dest_ring *reo_desc)
@@ -177,6 +171,15 @@ ath12k_dp_rx_reo_get_drv_link_id(struct ath12k_dp *dp,
 	return dp->hal->ops->rx_reo_desc_get_drv_link_id(dp, reo_desc);
 }
 
+static inline u8
+ath12k_dp_rx_wbm_get_drv_link_id(struct ath12k_dp *dp,
+				 struct hal_rx_desc *rx_desc,
+				 __le32 peer_metadata)
+{
+	return dp->hal->ops->rx_msdu_desc_get_drv_link_id(dp, rx_desc,
+							  peer_metadata);
+}
+
 static inline void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
 {
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index c8bb63d92bfd..343e1636b4cc 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1378,9 +1378,11 @@ struct hal_ops {
 					  enum hal_encrypt_type enctype);
 	void (*rx_desc_copy_end_tlv)(struct hal_rx_desc *fdesc,
 				     struct hal_rx_desc *ldesc);
-	u8 (*rx_desc_get_msdu_src_link_id)(struct hal_rx_desc *desc);
 	u8 (*rx_reo_desc_get_drv_link_id)(struct ath12k_dp *dp,
 					  struct hal_reo_dest_ring *reo_desc);
+	u8 (*rx_msdu_desc_get_drv_link_id)(struct ath12k_dp *dp,
+					   struct hal_rx_desc *rx_desc,
+					   __le32 peer_metadata);
 	void (*extract_rx_desc_data)(struct hal_rx_desc_data *rx_desc_data,
 				     struct hal_rx_desc *rx_desc,
 				     struct hal_rx_desc *ldesc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 312c7ac74b3b..4132578085cc 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1961,7 +1961,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	struct ath12k_rx_desc_info *desc_info;
 	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
-	u8 hw_link_id, device_id;
+	u8 drv_link_id, device_id;
 	int ret, pdev_idx;
 	struct hal_rx_desc *msdu_data;
 
@@ -2057,9 +2057,9 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 			continue;
 		}
 
-		hw_link_id = ath12k_dp_rx_get_msdu_src_link(partner_dp->hal,
-							    msdu_data);
-		if (hw_link_id >= ATH12K_GROUP_MAX_RADIO) {
+		drv_link_id = ath12k_dp_rx_wbm_get_drv_link_id(partner_dp, msdu_data,
+							       err_info.peer_metadata);
+		if (drv_link_id >= ATH12K_GROUP_MAX_RADIO) {
 			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
 							    WBM_ERR_DROP_INV_HW_ID);
 
@@ -2075,7 +2075,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 			skb_queue_walk(&scatter_msdu_list, msdu) {
 				rxcb = ATH12K_SKB_RXCB(msdu);
-				rxcb->drv_link_id = hw_link_id;
+				rxcb->drv_link_id = drv_link_id;
 			}
 
 			skb_queue_splice_tail_init(&scatter_msdu_list,
@@ -2083,7 +2083,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		rxcb->drv_link_id = hw_link_id;
+		rxcb->drv_link_id = drv_link_id;
 		__skb_queue_tail(&msdu_list, msdu);
 	}
 
@@ -2114,21 +2114,21 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	rcu_read_lock();
 	while ((msdu = __skb_dequeue(&msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->drv_link_id;
+		drv_link_id = rxcb->drv_link_id;
 
-		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, drv_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			ath12k_dbg(ab, ATH12K_DBG_DATA,
-				   "Unable to process WBM error msdu due to invalid hw link id %d device id %d\n",
-				   hw_link_id, device_id);
+				   "Unable to process WBM error msdu due to invalid drv link id %d device id %d\n",
+				   drv_link_id, device_id);
 			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
 							    WBM_ERR_DROP_NULL_PROC_DP);
 			continue;
 		}
 
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
-						       hw_links[hw_link_id].pdev_idx);
+						       hw_links[drv_link_id].pdev_idx);
 
 		dp_pdev = ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
 		if (!dp_pdev) {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index edf122fd46b5..bad2b60409d9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -173,11 +173,6 @@ static void ath12k_hal_rx_desc_copy_end_tlv_qcc2072(struct hal_rx_desc *fdesc,
 	       sizeof(struct rx_msdu_end_qcn9274));
 }
 
-static u8 ath12k_hal_rx_desc_get_msdu_src_link_qcc2072(struct hal_rx_desc *desc)
-{
-	return 0;
-}
-
 static u8 ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072(struct hal_rx_desc *desc)
 {
 	return le16_get_bits(desc->u.qcc2072.msdu_end.info5,
@@ -471,8 +466,8 @@ const struct hal_ops hal_qcc2072_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcc2072,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcc2072,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcc2072,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcc2072,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcc2072,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_qcc2072,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 7c19098f06c7..0f85ae69b5e0 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -892,7 +892,10 @@ u32 ath12k_hal_get_rx_desc_size_qcn9274(void)
 	return sizeof(struct hal_rx_desc_qcn9274_compact);
 }
 
-u8 ath12k_hal_rx_desc_get_msdu_src_link_qcn9274(struct hal_rx_desc *desc)
+static u8
+ath12k_hal_rx_msdu_desc_get_drv_link_id_qcn9274(struct ath12k_dp *dp,
+						struct hal_rx_desc *desc,
+						__le32 peer_metadata)
 {
 	return le64_get_bits(desc->u.qcn9274_compact.msdu_end.msdu_end_tag,
 			     RX_MSDU_END_64_TLV_SRC_LINK_ID);
@@ -1206,8 +1209,8 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcn9274,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcn9274,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcn9274,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_qcn9274,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_qcn9274,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9274,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
 	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 5c593773109d..b9c2b97105fe 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -33,7 +33,6 @@ u8 *ath12k_hal_rx_desc_get_msdu_payload_qcn9274(struct hal_rx_desc *desc);
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_qcn9274(void);
 u32 ath12k_hal_rx_desc_get_msdu_end_offset_qcn9274(void);
 u32 ath12k_hal_get_rx_desc_size_qcn9274(void);
-u8 ath12k_hal_rx_desc_get_msdu_src_link_qcn9274(struct hal_rx_desc *desc);
 u16 ath12k_hal_rx_mpdu_start_wmask_get_qcn9274(void);
 u32 ath12k_hal_rx_msdu_end_wmask_get_qcn9274(void);
 void ath12k_hal_rx_desc_get_crypto_hdr_qcn9274(struct hal_rx_desc *desc,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index fec625a0ea0b..2d66d71d1b9b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -505,9 +505,11 @@ u32 ath12k_hal_get_rx_desc_size_wcn7850(void)
 	return sizeof(struct hal_rx_desc_wcn7850);
 }
 
-u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc)
+u8 ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						   struct hal_rx_desc *desc,
+						   __le32 peer_metadata)
 {
-	return 0;
+	return ath12k_wifi7_dp_rx_get_logical_link_id(dp, peer_metadata);
 }
 
 u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
@@ -803,8 +805,8 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_wcn7850,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_wcn7850,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_wcn7850,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_wcn7850,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
index c7e1fba9bb4b..3fa919352686 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
@@ -27,9 +27,11 @@ u8 *ath12k_hal_rx_desc_get_msdu_payload_wcn7850(struct hal_rx_desc *desc);
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_wcn7850(void);
 u32 ath12k_hal_rx_desc_get_msdu_end_offset_wcn7850(void);
 u32 ath12k_hal_get_rx_desc_size_wcn7850(void);
-u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc);
 u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
 						  struct hal_reo_dest_ring *reo_desc);
+u8 ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						   struct hal_rx_desc *desc,
+						   __le32 peer_metadata);
 void ath12k_hal_rx_desc_get_crypto_hdr_wcn7850(struct hal_rx_desc *desc,
 					       u8 *crypto_hdr,
 					       enum hal_encrypt_type enctype);

-- 
2.25.1

