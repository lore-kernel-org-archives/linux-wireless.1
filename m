Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292847;
	b=C25MG9k1naNofJx6ePf7l+9cEsnilStoXPcbCyKwRsQUQ6JQfDCEIyfh2PUNzysk84OQ
	 bPtuinEVQr3c79DhbrU6100axcyRiblC+LtBQiO0vHJ6e/nxM44SIbcygXFY6X89LdsjG
	 TIIELEW2w4sdYouKesLQEhdC3wlc14arO0bxsK6UxPKC4+pIPjCtevnsWc1HOCeCBizqb
	 u6UyWu1BpWrwfg56eKJ5t4z01zfLN13bwMkLJjFIbw5N1A8HJBr5BFDIvvTDUyA/bOH1Y
	 v8Z8BJwgw6mGuZshy6WnCS3olsBZjh/QccDTmWxkvFajcEXLFzEq6XhKT9rRdAVbbMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=;
	b=qUb4w0OIrpHZ9J9jkZjMV/pxCN7otfIhW5ebsNPt3ndJfNyzxU+AUTouTmlbbEim2l1X
	 f/nnbcntf2rGjqj7BB7vkiURkT0cm/HWA7td+IWXEm3QAHJg1fRQyejFBxaNQwLIDC+QL
	 IfbF2Z8U4B0b54VQL9fpLmDCwrHcD8a+ukSKe+7Jutod2AWEu5A8DLRmah4hWNxP5cSwU
	 x3oMuHYg6cvi4LdYeznBrVlpfN6fAnb1ubrRP0QQf51jU/eAr9dNPGGNV3VPtL+iPudUU
	 mkNNc8N7T3d4jd7BzOOzLco+2vaUMfzyPdQNHd6YE6RdJfwpQQSNSZASbxye9UnVAvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y2MQrBmC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U14fkvGV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8BD606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y2MQrBmC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U14fkvGV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ACPI2928648
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=; b=Y2MQrBmCSengxvn7
	yxiy1SeOi4Gl/Pmx2Yz+KdQiXjL6Qw/WMePCbtuoKZxUFuvCGr1Y17jJT2QXCPO1
	MOiGBEvfQxcPiNjqadkG692RJ40sxoQq9ItOIE9DuTL5QxkQj+GwjAZGcyCuyY3R
	vNcsAPfxEAW7ovxlxbAYqfqKEBmcq0tYuedRPBA7QRq6JCm8yXjVctGsJcDh6+x5
	c6tDta4z+FiCRzqBzGjXlJv/k1+s4GWi9KZGNiILMD2NBKPesPkXg8HbVnCS4TKC
	xzg/DR9w1hHvviygqKf/Q6GDdW+Gp0ZmrHqWcGAsHLNN6RFwOa3DnlOPiRoIaoSQ
	npc7dQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx83dq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso2149647a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292844; x=1794897644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=;
        b=U14fkvGVlSXxGG55JVRl+kEbcUdljpr9doKEqE2Nurh+jibhMCrIxyCGJMgrIs3ZUa
         nefAPrKL1RmM/4v/KXrzcaOVICTVOHCTm3RPWFzYa8uMfJL3r4OLa1dJQJB6kTXD4m3O
         j+5qEuZRdaJbS9L1VwRQK4RVkc1Rb81V6abgtxf97QsLeuQWzHLGL18YHpufRMRzabUz
         CEde2xz5AeDow+myvQfrHmvDv94vdh/swAttBdBQX+hQCOF41RZnuzqSRvSbL4EroQe7
         ghNiJYQo1Q2e3PCl9boVFpCi3AjnjEYYjj/AW0Ygo9wDLFGxIClGMdW7foMN2K4oABDr
         iNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292844; x=1794897644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=;
        b=uAI0HjZei5/9EHbPO9tH4N97Ngd9GFYXTDcvV5kTRp9zTDA9A/4Xi21v92hJZ719gD
         DaHig5/c2Na/hlf1/Cp876+Sj3QbvhQFLs5s+9rRB1ZBwDBmI7P6BaRgSDKgI8nkAch3
         eUzVRKtjOc1NwAH0YlBxg+/LDBf0Zncqa9Gj3XOEoIG+Ovh3ooA4UtzQSMcURdcpqahZ
         qxIvfMFWofZH7TIYWDWjaK6exYwlsh/ttA6D472EAAmIYZmiyO1PRoUgiLh6sEKdN10P
         Mwsue435h7uXW41fgtJRV822r79WxLhiM8pu5g3ahMj9oGcZbrpPiZQthAgh3On+WmPq
         kSGA==
X-Gm-Message-State: APuU4Z/LrHNdH6YKSbLrvC5EszoKN5JLp4nJl9L6oYZkSo56eKAaMOZB
	7R9heqnBliQX2LC7PslUW4NQslhHKOOnWtRx/c/Oy4E1DOpoJhv2vue/f2jWSHJlV9s0LamkXM6
	Ty52o1cIXKpXo/+/FPN00/h7ur11CXgh0xLeJjuFknptvGSyEnDvNS5PWoNGNPNZZw/axgDSe/Z
	qlRQ==
X-Gm-Gg: AYBFou0AJeub5on2TBJj3cfWuZa36powdsj5FEkHLcORAhusKG62cwMCWtsnqV2OFgg
	eue0aq2H5oWk5JlSEAAG0PS/sqoL+R2pEJQSl67ATA+yJWpO/fyYv73TWDylYYc+oA5YmTxbXB9
	D7PFHjJAV56ixgV7CQaDlJGUaK1ocF+gTGCXzmQNW4cZUEI2+O99ldmcIbmO/Nb6AqemW8NmW/V
	lrcULUfsx2x0p7gvMwr2L3Fxsq5ABX+VSpqfQn9xxqjLKDd+jx5efS1lBho76UaMzgdqiYuAmp+
	WHVlM8j6yANvdiuSA3clWllIQmIZdxuZ1SqtU1bnUiIsdTS7yJhw4HYXbWI2UfzGxZXY3TMpzx7
	pwjZyapW78Egftsy5lnS/hnyyjKUm+Z39RY8u/J7FSVNocwsgU0dLEYRqx2gInu0oVq+bUT/jcy
	QtI6K/j5u2ttK1W/p/hucRwESiGyYHhA==
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1825080a91.61.1794292844520;
        Mon, 09 Nov 2026 22:40:44 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1825059a91.61.1794292843982;
        Mon, 09 Nov 2026 22:40:43 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:43 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:25 +0800
Subject: [PATCH ath-next v5 04/11] wifi: ath12k: rename
 ath12k_dp_link_peer::hw_link_id to drv_link_id
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
Message-Id: <20261110-ath12k-logical-link-id-v5-4-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2bc6d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NxgKQpyHIDudPh6FZjkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: XQWAkof929E8jEGIsn9_vdreIBWIzpzv
X-Proofpoint-ORIG-GUID: XQWAkof929E8jEGIsn9_vdreIBWIzpzv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1bc+NvygdigW
 TEarW3M5MnDAtbEIUauydN919EfJTqAgu3lW12wXmIzLkJAGmGGLYOttnd9mTPO/gZGPIqKo04v
 Gbhrh3ZYkTDvtzbhOl7qYpwcN7w/7io=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX48fibjI1luJ1
 sHk1aAN+7S2TKuZmwwmmFdfLVtaFSHsQBDuLXddXlCWK5M3mqFW/dPg+PLB0Vv2Y+1KRkHrwgJC
 rshOyxgd9seTCl3/qDjzU5NfYoOD+PXbHl6JM+jbzevTQNI6GBKKLEWMaG58J57JnasNWjDEZ24
 I38A1iDSnVOPYTgAjaqgTGtOncXKhKyvaWFgTvbDCa4f/bvXVIJXAZWWHFPUlWn+AHsEKKUOwYz
 WNlp5ZCnDG6MfC6/08slaijt7IOFPnvV/gj3IzFR++44PkEHgI4vMJs1WOPX06n19ULMgGAiDsZ
 lMnqtNJlYYHcZkTNTSvWR2wHL0QHMERePLCrMW9oGnCCydDGJ5NpvELJDl3ZdFssRm1gupF/mCb
 DTY9NlNUZs92CazU0gdbdebB5j4j63QoImpWbbJiefqScK9fmrppOJYP++JgqVYNlxfAq9ZPadw
 iLYekvC09ZOw9IbH8Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

The hw_link_id field of ath12k_dp_link_peer holds the driver link id of
the link peer. This is the hw_link_id for QCN9274, but for
WCN7850/QCC2072 it is the logical_link_id instead. The hw_link_id name
is therefore misleading for the latter.

Rename it to drv_link_id to reflect that it is the driver link id
regardless of how the underlying value is derived. No functional change
intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c | 10 +++++-----
 drivers/net/wireless/ath/ath12k/dp_peer.h |  7 ++++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index aec30e010de5..94d98f80f9f9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -543,9 +543,9 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		dp_peer->peer_id = peer->peer_id;
 
 	peer->dp_peer = dp_peer;
-	peer->hw_link_id = hw_link_id;
+	peer->drv_link_id = hw_link_id;
 
-	dp_peer->link_id_map[peer->hw_link_id] = link_id;
+	dp_peer->link_id_map[peer->drv_link_id] = link_id;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -565,7 +565,7 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		 * already present
 		 */
 		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-		if (temp_peer && temp_peer->hw_link_id != hw_link_id)
+		if (temp_peer && temp_peer->drv_link_id != hw_link_id)
 			ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
 
 		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
@@ -613,7 +613,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	spin_lock_bh(&dp_hw->peer_lock);
 
 	dp_peer = peer->dp_peer;
-	dp_peer->link_id_map[peer->hw_link_id] = 0;
+	dp_peer->link_id_map[peer->drv_link_id] = 0;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -628,7 +628,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	if (dp->hw_params->support_hw_link_id) {
 		/* To handle roaming and split phy scenario */
 		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-		if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+		if (temp_peer && temp_peer->drv_link_id == hw_link_id)
 			ath12k_dp_link_peer_rhash_delete(dp, peer);
 	} else {
 		ath12k_dp_link_peer_rhash_delete(dp, peer);
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index b9c94d6366fa..d2752b35ba0f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -99,7 +99,12 @@ struct ath12k_dp_link_peer {
 	/* peer addr based rhashtable list pointer */
 	struct rhash_head rhash_addr;
 
-	u8 hw_link_id;
+	/*
+	 * Driver link id of this link peer. It is the hw_link_id for
+	 * QCN9274 and the logical_link_id for WCN7850/QCC2072. Only one
+	 * of them is used at a time.
+	 */
+	u8 drv_link_id;
 	u32 rx_tid_active_bitmask;
 
 	/* link stats */

-- 
2.25.1

