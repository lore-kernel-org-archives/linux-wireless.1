Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292853;
	b=bnhGx4GwTTQswf5nkUCiDDZI+hvHUcuGIs50uf5qQ3QEFW74xWhDSF/JgGG93PQ2EyLB
	 ybyYjf2gd6T6CXV7LqQCREoMt9NGmfO4QA1hK8My4DCJY9PMAsozoKrcrA9hzRgWkZl3d
	 KHK3ZTXyzuIcU4NVBZ2o54oEwE3t/HSIQRToe/ZFB1t5dM+LBMpm7YihQ4p/r/FCnHfDT
	 rVmF/lhBNFa0TIilXHNAcP6ZtA8teu0nQRg7vhUtJqh4AddfppL1hTOZW/QGpBcxNgEYK
	 u9uLjlaigcav7MEVdTHIz6et8dAKqQzTdPdmmPA5e1F0M4/jTfcJhfcF3YdBecXrADQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=;
	b=k5QR1hQBQgOam4HFQHgjFMn+xRFx57SNcdh0X4rfRkE6ejtaVMzc/P27G2lSFpW9MdbX
	 dSo/mmP/bFT01A1lIQG5TT1uboheSonpxE/OSfsr94yOUzC1rstbsw/CuhfmcfXJSJuQm
	 JraAuZ4mszxd6TKwr9k0Ee4bpCXWYxeEVn3qk9mp/wJ0LQK0Til/WMyuirTNQCcQXV3K+
	 8z0bt/c2guriX/c01tYZFx4BcfVPKyhz96SCxtMOKgEK7eUrunqVIOmUPobJmJa5pn4jY
	 D61iYcIVIcXmpk/HV+WZshH2rhnfitUEYhdTJ5biEw4cUgu5xZVWxiBJ8KCxi71pTcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EzqVcyJC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXzmzR9g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312E6606A326
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EzqVcyJC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXzmzR9g
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA55Bmx2414990
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=; b=EzqVcyJC1dHB484F
	L2TyoB9MCCC9Lq2DGbJVr+hclnWCYdPTIeoECSpkX3OxaarLCVTtGHlOXYjHmmnG
	DAq1sA3tA5M+evWlWEM7PW3QpF4rhrHF2o7SS2L8G6/l22KsJEbmdkrOq5OBQMoI
	mS8uMIAiMrdYjWEryr4lxtdO1z+g1j+y6neFhvUBurevpA8P8t7ux81mV7f/0l2v
	YrfUcZ9Pv/6Zjy4XMHRvFNFz2BP4oU/XEh0eCo2NMv1RrYAjwKKXtxAXG7kEERQZ
	IngLN8bGiRLtQKLycCtOoJZoQg2ngKJt4Zt3ZH/acUOIrITxweIQYijiM+0l9KYH
	Z8iILQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd8cbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1984425a91.3
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292851; x=1794897651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=;
        b=KXzmzR9gwZ0jzaZ1UHkR9f8YfP5H29tdMqzTJr/zM0BXMTphRmb2vg+mMDnS8aPgaj
         04Okw4zFUQnw369L3fWVi5nwy0dS70NP7aMzeZlduYROxK44K0RMpQl2RIOb60AyawLO
         YldSOiG/QEGj+LmF7onBrNCbHGF+e3Fh/y8rR1W3dtHsO6npOAVq3OKFfV6QLVfXzzpA
         ulePq/G+N00mGq5lZXEg+GyvVkVfqQKq0L6y9wRJWXcijWJ60TtAAxnfrqfylS6kLaHP
         KT6RT7k17tCCRwulokB9NZBHMRNsJcnpklqNSBvIFrfFRgwMyvteBqInwB14NB51sFnq
         Q6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292851; x=1794897651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phAA14YfzPBJQQKUzzcY0SFp76zWidjotJ30d6/vFqE=;
        b=NTU2Ou8L4feZrYb8s+dxbP7bDXn/NpItbgEvTteI7BXGbkwKmtIpIqvRK9bt3Pxf86
         6vqVGshpLjKD9N5NkV4KTiHlEaGMG9kjro8CUIrGK4AWvbVy5z6s0KhqcH01ZX+/KeMr
         BIruHIbZF+sCCWpKVOJ4VHRtyqD/LY39RbyXYMngyN2ewWMRrvFcrQDgwZV0uclZda+0
         PCOH4Qinz5sIBf9w1ioqFRVkoedC9NlqtUhSauCgWVdqsoqGO2MK3VOvQjUzmpLGhNnT
         qj33HJI7jbqMTAh4u/6u9cuyOSMsqzyedD9TmRlmj9C4U1Rwq8LqsOaURuWPFbMVrl/M
         EzlA==
X-Gm-Message-State: APuU4Z9+YuSc0oxQMd1CnY8rqk2drHrL0iCgEPa7l+ggKoQqkNgnE2A7
	ldP6hmY6Jq0Gy9K3bqCIMGrlYzN691OF6Z1HFdAQxh+bIFUlEfPY+Cuy4G0OCV0jC6cKu22jD1/
	8FM02anhoS096JHXUMm7fG5DQQd8+FO02OW7CMvxVVktcgUXN5k2frP1Yy2o6nI34gNroVg2W9l
	l4XA==
X-Gm-Gg: AYBFou2TFZF+gUoAfhtvsIfRNLzSLZcQg83VsB91HzlSejsZkeJnhGJSeveNDDjFXZE
	UURndGL9pZQJUFlJ2Msi4mTXGGWEQXDf5y9BSlEX0sso0+v8J2ioLwXmQ5zfz6KqbpyP7hJ4PtW
	7tlI09eXwMseI+HYEiHF4lQcGPdETcYrPYiUC71WlYP9DD4jqOYKZXGXD43o66Qtbe++w7keOHL
	wVhzRgUxzqhe6OaFUWRBfOr5tOYlJPr/IKDmLXLI4VjsHZyICwTYAv9oFpf/ClcGp2nWB8a9329
	3flV8La44gbLg5cCDFI684poG1d4++aF9qijur6NGyTv3sFKU+O0WjCS9yCvG7DF/fFlociYQqK
	+pyl7g/XK3qGPnZL6Ln155RylmASOoF6SJ3n/Ktjdc3LKf7/8kwc+tZF8+HEqlSaWDrHfFvW41E
	yPgl+f3Tm6D84T4k+L99jB1YR7Xg9rqw==
X-Received: by 2002:a17:90b:3c86:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3b166ad25a6mr1918349a91.2.1794292850700;
        Mon, 09 Nov 2026 22:40:50 -0800 (PST)
X-Received: by 2002:a17:90b:3c86:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3b166ad25a6mr1918327a91.2.1794292850145;
        Mon, 09 Nov 2026 22:40:50 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:49 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:28 +0800
Subject: [PATCH ath-next v5 07/11] wifi: ath12k: add support for
 HTT_T2H_MSG_TYPE_PEER_EXTENDED event
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
Message-Id: <20261110-ath12k-logical-link-id-v5-7-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _pW_Eg2JOXbBRl-YELNdxz4fYG262aVJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1T0Ay427167Y
 W6rWkVVj7YFJvHr8vn7PDp2aLPz5kGE7TZ1sqsQVkP68GaAddEeX7453rWKsMrMT8B03pTPPxzc
 4x52+unTHWmLukQcPSLI0w1+VM81JXA=
X-Proofpoint-ORIG-GUID: _pW_Eg2JOXbBRl-YELNdxz4fYG262aVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX+2XCCWLgGXBz
 tR2g0A3957i+gg0nRTsU9sEMSrePTid+jLzpWJ/ikRUzC0NszIIqospmw2VT9AsDj68G/z9JmOg
 DkJ3P5cbkC6YffEhmY03AEGCyW5KWhHxsA4aq800rclFnfy2QFqLiREFLTMLzDqq4bnwSsAUL02
 GKKpyVGI6sGdhVxFehlfhdGK4hrxLicZDcJxTDStfIITTSK270aBzpV4HYc+EzEWT6GH9f74COP
 Bnn50zug5V8NlfaanFUVs8XLRwk9fma8HPb6NXHSkVAlmcwzQX8wxDQfTxObue3+1mx2ED9BZLC
 4U4rSy8oWZ79MRpF7/nKfJHFtK9UUbY4Q9ZbSviWUOGr/paHOUw5QC1CsunuzZfbwoIyXeatodO
 rRFnPX1gipDkYT4w1PXcugiJ0nGjgKhvqEzx77cMo0W2zo7kgyY55T0v6aTcQIAxqFfL9Exj/H7
 dsExKbsgxjihftu3NmQ==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2bc73 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FAGSEp2nAAAA:8 a=EBqVsfUuMMxUAKVxpnoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Lh16BCjgaU6qELXH5G7V:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

WCN7850/QCC2072 hardware/firmware report only the logical link id to
identify the link on which a packet is received. The host, however,
needs the IEEE80211 link id. So a mapping between them needs to
be established.

Add support for the HTT_T2H_MSG_TYPE_PEER_EXTENDED event, which reports
the logical link id for a given link peer. Find the link peer and
populate ath12k_dp_peer::link_id_map, mapping the logical link id to the
IEEE80211 link id. This map is later used in the data path to derive the
IEEE80211 link id.

The firmware sends this event after each peer assoc, but only when it
advertises WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT. On such devices, block
in ath12k_mac_peer_assoc() until the event arrives. The event arrives
before the MLO_RX_PEER_MAP event, so wait for it first.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c    |  1 +
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_htt.c  | 17 ++++++++
 drivers/net/wireless/ath/ath12k/dp_htt.h  | 15 +++++++
 drivers/net/wireless/ath/ath12k/dp_peer.c | 66 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp_peer.h |  3 ++
 drivers/net/wireless/ath/ath12k/mac.c     | 13 ++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  1 +
 8 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index f588a105ca61..719200759ca0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1568,6 +1568,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete_all(&ar->scan.completed);
 			complete(&ar->scan.on_channel);
 			complete(&ar->peer_assoc_done);
+			complete(&ar->peer_ext_event_done);
 			ath12k_peer_delete_wait_flush(ar);
 			complete(&ar->install_key_done);
 			complete(&ar->vdev_setup_done);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fcb26a6878a1..3a92a4b03359 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -697,6 +697,7 @@ struct ath12k {
 	u8 radio_idx;
 
 	struct completion peer_assoc_done;
+	struct completion peer_ext_event_done;
 	struct list_head peer_delete_waits;
 
 	int install_key_status;
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 72069640bd38..25c1f915defd 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -627,6 +627,7 @@ void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct htt_resp_msg *resp = (struct htt_resp_msg *)skb->data;
 	enum htt_t2h_msg_type type;
+	u8 logical_link_id, valid;
 	u16 peer_id;
 	u8 vdev_id;
 	u8 mac_addr[ETH_ALEN];
@@ -708,6 +709,22 @@ void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 	case HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP:
 		ath12k_dp_htt_mlo_peer_map_handler(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_PEER_EXTENDED:
+		peer_id = le32_get_bits(resp->peer_extended_ev.info,
+					HTT_T2H_PEER_EXT_INFO_PEER_ID);
+		vdev_id = le32_get_bits(resp->peer_extended_ev.info,
+					HTT_T2H_PEER_EXT_INFO_VDEV_ID);
+		peer_mac_h16 = le32_get_bits(resp->peer_extended_ev.info1,
+					     HTT_T2H_PEER_EXT_INFO1_MAC_ADDR_H16);
+		ath12k_dp_get_mac_addr(le32_to_cpu(resp->peer_extended_ev.mac_addr_l32),
+				       peer_mac_h16, mac_addr);
+		logical_link_id = le32_get_bits(resp->peer_extended_ev.info1,
+						HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID);
+		valid = le32_get_bits(resp->peer_extended_ev.info1,
+				      HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID_VALID);
+		ath12k_dp_link_peer_extended_event(ab, vdev_id, peer_id, mac_addr,
+						   logical_link_id, valid);
+		break;
 	default:
 		ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "dp_htt event %d not handled\n",
 			   type);
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.h b/drivers/net/wireless/ath/ath12k/dp_htt.h
index 2db7fb27c036..1d192bde0c29 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.h
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.h
@@ -933,6 +933,7 @@ enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP = 0x29,
 	HTT_T2H_MSG_TYPE_PEER_MAP3	= 0x2b,
 	HTT_T2H_MSG_TYPE_VDEV_TXRX_STATS_PERIODIC_IND = 0x2c,
+	HTT_T2H_MSG_TYPE_PEER_EXTENDED	= 0x39,
 };
 
 #define HTT_TARGET_VERSION_MAJOR 3
@@ -985,12 +986,26 @@ struct htt_t2h_mlo_peer_map_event {
 	__le32 reserved[5];
 } __packed;
 
+#define HTT_T2H_PEER_EXT_INFO_PEER_ID		GENMASK(23, 8)
+#define HTT_T2H_PEER_EXT_INFO_VDEV_ID		GENMASK(31, 24)
+#define HTT_T2H_PEER_EXT_INFO1_MAC_ADDR_H16	GENMASK(15, 0)
+#define HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID	GENMASK(18, 16)
+#define HTT_T2H_PEER_EXT_INFO1_LOGICAL_LINK_ID_VALID	BIT(19)
+
+struct htt_t2h_peer_extended_event {
+	__le32 info;
+	__le32 mac_addr_l32;
+	__le32 info1;
+	__le32 info2;
+} __packed;
+
 struct htt_resp_msg {
 	union {
 		struct htt_t2h_version_conf_msg version_msg;
 		struct htt_t2h_peer_map_event peer_map_ev;
 		struct htt_t2h_peer_unmap_event peer_unmap_ev;
 		struct htt_t2h_mlo_peer_map_event mlo_peer_map_ev;
+		struct htt_t2h_peer_extended_event peer_extended_ev;
 	};
 } __packed;
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 94d98f80f9f9..2e2672a082a9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -8,6 +8,7 @@
 #include "dp_peer.h"
 #include "debug.h"
 #include "debugfs.h"
+#include "mac.h"
 
 void ath12k_dp_link_peer_free(struct ath12k_dp_link_peer *peer)
 {
@@ -195,6 +196,60 @@ void ath12k_dp_link_peer_map_event(struct ath12k_base *ab, u8 vdev_id, u16 peer_
 	spin_unlock_bh(&dp->dp_lock);
 }
 
+void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
+					u16 peer_id, u8 *mac_addr,
+					u8 logical_link_id, u8 valid)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp_link_peer *peer;
+	struct ath12k_dp_peer *dp_peer;
+	struct ath12k *ar;
+
+	if (!valid || logical_link_id >= ATH12K_GROUP_MAX_RADIO) {
+		ath12k_warn(ab, "invalid logical link id %u valid %u\n",
+			    logical_link_id, valid);
+		goto exit;
+	}
+
+	spin_lock_bh(&dp->dp_lock);
+
+	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id, mac_addr);
+	if (!peer) {
+		ath12k_warn(ab, "failed to find link peer with vdev id %u addr %pM\n",
+			    vdev_id, mac_addr);
+		goto unlock;
+	}
+
+	if (peer->peer_id != peer_id) {
+		ath12k_warn(ab, "link peer id mismatch, expected %u got %u\n",
+			    peer->peer_id, peer_id);
+		goto unlock;
+	}
+
+	dp_peer = peer->dp_peer;
+
+	peer->drv_link_id = logical_link_id;
+	dp_peer->link_id_map[peer->drv_link_id] = peer->link_id;
+
+	ath12k_dbg(ab, ATH12K_DBG_DP_HTT,
+		   "htt peer extended vdev %d peer %pM id %d logical_link_id %u link_id %u\n",
+		   vdev_id, mac_addr, peer_id, logical_link_id, peer->link_id);
+
+unlock:
+	spin_unlock_bh(&dp->dp_lock);
+
+exit:
+	rcu_read_lock();
+
+	ar = ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
+	if (ar)
+		complete(&ar->peer_ext_event_done);
+	else
+		ath12k_warn(ab, "failed to get ar with vdev id %u\n", vdev_id);
+
+	rcu_read_unlock();
+}
+
 static int ath12k_dp_link_peer_rhash_addr_tbl_init(struct ath12k_dp *dp)
 {
 	struct ath12k_base *ab = dp->ab;
@@ -543,9 +598,16 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		dp_peer->peer_id = peer->peer_id;
 
 	peer->dp_peer = dp_peer;
-	peer->drv_link_id = hw_link_id;
 
-	dp_peer->link_id_map[peer->drv_link_id] = link_id;
+	/*
+	 * Only devices that use hw_link_id can map it to the IEEE80211
+	 * link id here. Devices that do not support hw_link_id fill
+	 * link_id_map later from the PEER_EXTENDED HTT event.
+	 */
+	if (dp->hw_params->support_hw_link_id) {
+		peer->drv_link_id = hw_link_id;
+		dp_peer->link_id_map[peer->drv_link_id] = link_id;
+	}
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index d2752b35ba0f..ea36947d1707 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -122,6 +122,9 @@ struct ath12k_dp_link_peer {
 void ath12k_dp_link_peer_unmap_event(struct ath12k_base *ab, u16 peer_id);
 void ath12k_dp_link_peer_map_event(struct ath12k_base *ab, u8 vdev_id, u16 peer_id,
 				   u8 *mac_addr, u16 ast_hash, u16 hw_peer_id);
+void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
+					u16 peer_id, u8 *mac_addr,
+					u8 logical_link_id, u8 valid);
 
 struct ath12k_dp_peer {
 	struct list_head list;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f16c78b52a8..f32d391bc10e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3875,6 +3875,7 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 	int ret;
 
 	reinit_completion(&ar->peer_assoc_done);
+	reinit_completion(&ar->peer_ext_event_done);
 	reinit_completion(&ah->peer_ml_id_done);
 
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
@@ -3890,6 +3891,17 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 		return -ETIMEDOUT;
 	}
 
+	if (!ar->ab->hw_params->support_hw_link_id &&
+	    test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     ar->ab->wmi_ab.svc_map) &&
+	    peer_arg->ml.enabled &&
+	    peer_arg->is_assoc &&
+	    !wait_for_completion_timeout(&ar->peer_ext_event_done, 1 * HZ)) {
+		ath12k_warn(ar->ab, "failed to get peer extended event for %pM vdev %u\n",
+			    peer_arg->peer_mac, peer_arg->vdev_id);
+		return -ETIMEDOUT;
+	}
+
 	/*
 	 * For devices where the firmware allocates the MLD peer ID, the host
 	 * learns the real ID only from the MLO_RX_PEER_MAP HTT event, which is
@@ -15214,6 +15226,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->vdev_setup_done);
 	init_completion(&ar->vdev_delete_done);
 	init_completion(&ar->peer_assoc_done);
+	init_completion(&ar->peer_ext_event_done);
 	init_completion(&ar->install_key_done);
 	init_completion(&ar->bss_survey_done);
 	init_completion(&ar->scan.started);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5d0afbf0bd0c..94c5def03137 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2278,6 +2278,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_WMSK_COMPACTION_RX_TLVS = 361,
 
 	WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT = 365,
+	WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT = 380,
 	WMI_TLV_SERVICE_THERM_THROT_POUT_REDUCTION = 410,
 	WMI_TLV_SERVICE_WDS_NULL_FRAME_SUPPORT = 421,
 	WMI_TLV_SERVICE_IS_TARGET_IPA = 425,

-- 
2.25.1

