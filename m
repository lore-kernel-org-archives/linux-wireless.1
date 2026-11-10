Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292849;
	b=xlFaeS4Nk6kPK5DeULIbuQ+GSLWl79MeAvBR6pfY5Pk+ha1IJbJxR33Ou3wBgsELhRYL
	 DJShBRHu2yNnuAJPri3s94TXhjzxw92sf0gCLpg5tORakN5EXGdLoGP4lmfmtl2Iwvej/
	 6fZMWX415UWqJtaklGS9rZnMUsqSxf0FL7Wy2XQcr3INznalejLIx2cs6SNpTUiFthAVp
	 yX/pWi0h1pvXZN9Sl9xnuAeKVXweIXMFtbInAiKMxt7yHLnR6PGP3eMpRfrLhpwJaOAjR
	 uSnBLtoy5ja6p5GNo6DxQSI9mU6om1fBqo7yWkh6Ufb+xkrVo2xYECMthFsqWMI5sog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=;
	b=n6puRqYbJerbu+SQ7H/GA51y4/Rvw/iI9mOWPwgxV9kBMTP89kK83rKmbamlmQwfLEKH
	 KB9MmPefa9yu+N8Vw6AX5N2Br6OpMxMFuZjKyk6HNr+Mwyo8d4HjH4sv5JU12nyeVABbX
	 87Ex99mnVnVTHXv5jH5e+QZdXOApYvKkH2iM1KdYhiTPLfC1JJKZogX+KPsmZKK666SZ7
	 iNULJvru3begMT/fzF2hVwZbtjMfX3842Vwxav76dVShHtywaKiZtKJSYRUVYfl//rO9k
	 23WtA1nMJepCd+7Z/+17Ao9hyDd6nYGqRlb8EBeJpkjPeXUYbfPxX4YU/pJABGMvIMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+LcqDtg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3gfmHxO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2652606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2652606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+LcqDtg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3gfmHxO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AIGU2275742
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=; b=e+LcqDtgeDj/TsZx
	+BAR025LsFWkOTHZ9kzmAk4/7Ynr3Qv9IQeAxOB/bFz3i8zZlkNHo/NTZ11CxqJy
	bSWT/wPrNevikLfb1ZfmJNbOWhZk2/Ra+iZBCZktMuSSAjo4LrLbSUyTr/g8l7+0
	ZTJdSWcfHqUqqjcrPSLDw9/Zq8GOJ423w37J1MlsE2g2/is2jd9aBF+K4hgFFKZB
	l16b2KsbR1jqrf/fX6YnfLEmnJWviOqFWbUf2FmydFyNwkAu51O1RNLTc3Sgbsog
	qCJg4m+Z6t9A9NKL/FL08s4kcBwEZuAWazC8WNBt01WKkwY9420xkbgUNnCOoI4+
	mDrKvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bx1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so1566028a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292847; x=1794897647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=;
        b=R3gfmHxObVXjFO5+lGVyxTfQ/rTdgxG50VyyJ1oDJam/8TbKcbUuHRLeBimhJBCfLM
         T1pYrkq1KQ8IfEUXnAgPJbztcb5yUAkNm1qjokMC4E/ZfvMjBSD9V/KFiPvY1XrcTJ9F
         E1vcliX2tk+QFXoxZUohYim02GCi+1MYK4CVp4QcgngnDB69x/JCftHJAyGRVzmPMZ/l
         isw8onSBvCbnUF5l8SJFwlLpVNiDCvhkbVE1ISlE7INheqUeoVedqgl0l4SGb6ZjPwAK
         rHik/2JdmOR/8xMLlGzIWq1VabaahDpLrvW2tcbC8buUIh0gVoHRuqkMyxatjP9jvQnh
         vpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292847; x=1794897647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=;
        b=o8Y5e++SRp78xnLh8JmmWmVFFIXDoeRBuZNYkfSEagY+16Rbj4tHnDlOF+f3oWPP5V
         kkVfThednVA5U2GqTWLPSB1+NyULlJ7MQmHD0SpsC4FzdaRUfs15gOHwN9+i9EXPvUjI
         abwIph41FBAgRaOth6dMoFUYoNjENeOoyr5vwcKFkPgdkEDeq/s9lvwpWW4mdDjWZ2yt
         U+bVY9ZhEXYFNHSwKhekRmFBU+1duBMvX03ChDMDEBdIIUhZHvT+BQN3JKpQX96pkdBp
         I3eCK2lc0bFV3RXlKlI4o2ejN+kHQZsAAT0JhNeYxuMNkZxY8JBmdWE4liQwkxYYM4+5
         5gYg==
X-Gm-Message-State: APuU4Z8IdC62pHryE+CrO9b1YqO0efsjuoKjXNhkIz/7Tf5HJjJnifOv
	PmPWKL8gsq8foeBIdFre1Ji3jNwpuRYM2S6EnuQYDn3mG3KzfgHeUuCIAaCbMwvAi8Q756oV5Qs
	PMnsBCDMMwfjFG7iwIUiYJr2tuUnPwBWczOZAxAUxmV65VrVlBWazYnNeAPX978pa3Ro73guhFK
	yX6g==
X-Gm-Gg: AYBFou359UklpK2N3YQ/lP1bp53RhYiaUmcbNXiaVjcIisAPKC5IWu1+68Bp1HrRQdl
	13C3JGs4GnSqUBLpKxK1Hu9go4NpcJpF4vQMyA1ILwpD7Q6oICJIRBDqcta5nDru00xhKCgCJEj
	YodrxtHwDz8jwzK7VerPYCKa5FrSnk6MvTWjRUOhXMD6Ph7r3ZV2z3XUd36Jb0iagwKcjXhnmxO
	lpLkalXacgcmBqYA5dQtn/cQehQe2Hbcf9YJabj7BHAkTTq1YfUiK9L1AZIn+BUPzPUlo3yVmFM
	6OBDq3PPF0q5a1nbi/8DpHRc612EhnJwTavi6OvuS0vfcNX3t/aOaA8elVuH0naF7q2SYjACeRp
	JA95AMj/t21RMf/lcuLBzj8YaGi+K6ph+xSHw6+DBDZZiWStZHapWwANo7vrXOGtMvOBjXyJ6cv
	e39XmvbJ9uzmoBo9Y5uxzMuar30Dtp5Q==
X-Received: by 2002:a17:90a:ec83:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1678cf05fmr1092540a91.8.1794292846593;
        Mon, 09 Nov 2026 22:40:46 -0800 (PST)
X-Received: by 2002:a17:90a:ec83:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1678cf05fmr1092528a91.8.1794292846035;
        Mon, 09 Nov 2026 22:40:46 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:45 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:26 +0800
Subject: [PATCH ath-next v5 05/11] wifi: ath12k: rename
 ath12k_skb_rxcb::hw_link_id to drv_link_id
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
Message-Id: <20261110-ath12k-logical-link-id-v5-5-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: qYJlRn0ghIzRsGStJYmwSNW8fJ3J9mSQ
X-Proofpoint-GUID: qYJlRn0ghIzRsGStJYmwSNW8fJ3J9mSQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXwrnBgXqyOqIw
 Icd0+RfWbhor/mVsQN/d4q4KH0f9Enwo9HASHBTFLxEP1jmlCjIyPtMhKQENlZd4lN3hdPsXipE
 vKVWK4AfZEO6rpXTvOMt33j7HKa3FZ8=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2bc6f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NxgKQpyHIDudPh6FZjkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX6lcg3JnAorYE
 FrO8281JipxnOpDMatEaly0rrvAvNRGzPDTL/UGKbez0IKZVN7947IKkyDDcVPtLeK2DY79KqmM
 qaeqRoZbqyEgtM6VoO3tLXVs9EEFOhL95Uo+oDQjTtsFhpdNRJB5cEyrVNxY1Rkl4YgpzWZ0jYy
 JEo1rgU2NCMJXJCBfExa7efqU0k6N0aIj1EB/mSbEbiSAGO39sOI2u+v69GsS7qgoF3D2dWK80j
 MNtpfsNas3wLS+21woDtdWuMual1y1u5erFd7B7kjl8tdgdoAJaAh+7ZhV1qPIcYDcgnnprZUC8
 KgDVEooQkKYjNTejIeO5pKYhCuKTZ1s5fIplBt3noC3ADJsSKrHrkJLQePTb10pExAhZ7iwNIKL
 UbwHvE4G8oYZZePcLBgteqAfiw50GS5kCQrILYd1a6DpqyDZgEdlkogoGR+17XzRZPX+GbkGfnG
 lpfxJDhOjITvb8kaKPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

The hw_link_id field of ath12k_skb_rxcb holds the driver link id of the
RX frame. This is the hw_link_id for QCN9274, but for WCN7850/QCC2072 it
is the logical_link_id instead. The hw_link_id name is therefore
misleading for the latter.

Rename it to drv_link_id to reflect that it is the driver link id
regardless of how the underlying value is derived. No functional change
intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h        |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 212b4855a7d8..fcb26a6878a1 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -143,7 +143,7 @@ struct ath12k_skb_rxcb {
 	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
-	u8 hw_link_id;
+	u8 drv_link_id;
 	u8 unmapped;
 	u8 is_frag;
 	u8 tid;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 2a0141157426..a59adbb78c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -621,7 +621,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->hw_link_id;
+		hw_link_id = rxcb->drv_link_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp,
 						    hw_links[hw_link_id].device_id);
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
@@ -776,7 +776,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
 		rxcb->is_continuation = !!(le32_to_cpu(msdu_info->info0) &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
-		rxcb->hw_link_id = hw_link_id;
+		rxcb->drv_link_id = hw_link_id;
 		rxcb->peer_id = ath12k_wifi7_dp_rx_get_peer_id(dp, dp->peer_metadata_ver,
 							       mpdu_info->peer_meta_data);
 		rxcb->tid = le32_get_bits(mpdu_info->info0,
@@ -2063,7 +2063,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 			skb_queue_walk(&scatter_msdu_list, msdu) {
 				rxcb = ATH12K_SKB_RXCB(msdu);
-				rxcb->hw_link_id = hw_link_id;
+				rxcb->drv_link_id = hw_link_id;
 			}
 
 			skb_queue_splice_tail_init(&scatter_msdu_list,
@@ -2071,7 +2071,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		rxcb->hw_link_id = hw_link_id;
+		rxcb->drv_link_id = hw_link_id;
 		__skb_queue_tail(&msdu_list, msdu);
 	}
 
@@ -2102,7 +2102,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	rcu_read_lock();
 	while ((msdu = __skb_dequeue(&msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->hw_link_id;
+		hw_link_id = rxcb->drv_link_id;
 
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
@@ -2368,7 +2368,7 @@ ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
 				       struct ath12k_skb_rxcb *rxcb,
 				       struct ieee80211_rx_status *status)
 {
-	return dp_peer->link_id_map[rxcb->hw_link_id];
+	return dp_peer->link_id_map[rxcb->drv_link_id];
 }
 
 int

-- 
2.25.1

