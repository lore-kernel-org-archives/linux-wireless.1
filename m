Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292844;
	b=u0TbinjLQR8REsSo94Mq4Dn8enphcF6DarUVOLKqiLeOjCmQVqTTFigYnDqI25AkZiR1
	 +OvE9FLtYuZ8Ga0W3ZQy8AKNXgpKOWEH9jMSnD99VP9dXicfG6qmmY+vdqHXe5/TtSflb
	 nEaCDTaIJlq560TAStPin2e1adcHm9vrgBjSX0Xm4d6/SGkseVNFK0leTpGe28PTMhHbn
	 x1+3dcbZe0B1BD4LEq6cJk4+JQAkQkzQY0CQGNKgdvMui9EUYazoDskdtVj5xxt7/Zn4X
	 2c2UrGjzB088IZMKfmXNlo6WBa8lYJdPnMgJm/IKHvbqUUdslayv6z/UmxJ9Kn4/I1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=;
	b=4HEuVGrjCtROjC7cGJJ09VAAEod6G0crEplAUtipDfC8MhRKZSSTGcCWjD5YAKWFJxnU
	 VCvVBLwPqj80buHRuZOP3lt8iEss07htKqPfNA11aZQVObC8o4Ne4xgtBQWJXSSQWk5uk
	 3u+CtmNYf1DR6YBoOcQ6PTNuipCMq4po/RIAVxfKxJ4jIv1AcvB5Tn8zYefvsYagfFTQL
	 131yJH/H2lzXAM4fHFXQRkVHeieTx1oMU7O8hBGQPdxPhx004nNpfLpSRUlA3PsZ9LxyR
	 Lp4/3tjEejuQ6lNdXWFPzOZ7hhUbpTz8RohVgvH3YVXzIbiVRYte5TFjRM1W2VAfRlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bHs951Mi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wi4fWcVd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF8606A325
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEF8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bHs951Mi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wi4fWcVd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6k72295083
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=; b=bHs951Miik1fGahd
	oDy/CkkZo/OHv95BW3jzPOAoZ2HAcHvpmUrDa7gdZ1Z/EhXwbBODgeEjn/O0lXA8
	M/16Qs8lBjybWKgyn5xV0cGLXf5dtBJNyf2lB83kCubm960Uk9KHn1esWzap9sPr
	3GSxt3PiN7NSi2B6eAdZQ7tdIf1O4a21YWyoMB39zRyv7QRvq8VKij68OerpPRnm
	2QVrDtTcfuskJiZDCVYvi7vCm+XvET0Ez2xzPXcrPfH5uJvZSybyt5cG3IJtQBhm
	nZYFbPvZ03QADGRPmf7g1MdacW2Fi2wuBDXnR1+uY5DWH9I2birU9vo0QdJkKYK6
	9Mr4hw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5v1rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so1786056a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292843; x=1794897643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=;
        b=Wi4fWcVdN9QOG9T2A5kfgEa27s9tbBpm4bfyKXMm2vO94AH9r81QZXfbODOp2W8F1A
         7q9Vm0mWmFnGWrNWKV3Guh/mCIhkAvWc4iYs++IKQiimOG+vnpooRGJ7kOthg5ujnk6F
         aHyfLSa0fW/NKuUiy99UazfQJ/J/7lufmRpTkmAUsI81+zpWguhueP5kWMdBhA3AX0KH
         WSvTGv0RtfxErJ1UCdkrkq11k1DJIIh2zXPoY5RPHx+jJ2x/p4g7SR8EgwyKjccMExdo
         ftXSxyS1AHvXu/XAUCgUyc4H2gy/IRZ4PszzB7VFuknOBAY3lfhJPnjZTiTeUQE1xlM+
         eufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292843; x=1794897643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=;
        b=TDn5AiIr268zgKqD8MdI6gIwa1T2ErQib7bKvw/hMhwVbnL03tYKcVGx4LnF1ooGiw
         71oo7vNe64RiwmXtCswBo0gVW/XVWUvrnowShNPp8eRdeeBPwzlQBIy7EM77PQPsm84T
         kjPYuK3v8kIClFdU9I1F3VDyDDO8cpAyphDVP4c2N83QGH+cvYqyA+K4wZB+TkcuCXwL
         CV60lqYpLpXcYD0LvKF1+ccv+tA5PUNm1YR6IXFJoXYj6/UZHSqpWQ/0ROIq47FCs/LQ
         R4anyiR6liY2e5yYT+sWOmdyN1Hs/K8SpY7iYhOSEJhURCEhM80JWOpQMK5PAyQlRQXb
         TRBA==
X-Gm-Message-State: APuU4Z8GQlXbobiIv7cVL6RrxEooJBsyPC/tjaGp798kIPtEXqf2necW
	/Tp6yhRQj9XLudL248r+2nJ6oz7icGU4YtQEkCwBKZqtbZnmsg8gGz9PgQlDDsgBeqea8CE7AL7
	HqQw/lvkg3/oyjJUQj7ZuMyTv0zzPADlw4NTr3dnmq059wprP/K8DUr6muuUw6QasSn6QaEVJJh
	tlhw==
X-Gm-Gg: AYBFou14/dlR9hq0bRVIEqn441p1N1FbTWzCfC454duVNkZWB7tO9/vgJTdcQ+66DeF
	Ie4Yvrbdy/baYkRCa0LVdzwNaZ3P/cbGl8wpjJSIY/YwveT2CPnj7HyDG9mDFUIVcvMyy4NLXKR
	8Hj9qIZt3QvFzHuVoxl4fPZb0+j2w66irND72tVhnjLc8fRdpEVXh8+cgkFbB2R15XIjHGglZet
	tYKKElVSXZ8zNi+jCC1VVFR6plt6bFJsGJAvlAPSbkxacViLOXj4owXVU4VoisyjC5qAAcmq8B2
	R1sB6X2IaPocEx6pmlVYLRd7eZhFpDxPPFDuZ+RsqnRPU6Xx0jgnQqdV1ZB5tyynPb5N166foyq
	AL64P4Dri1i+0PDERgMYotEhPi+TjNfrUvmr6PSQk3K4vV9UYWAkoMuRJnUmMLnQzN0+VPnO+1/
	GFjODPGgAMS7oFpzDGzzNe4M2XyyafyQ==
X-Received: by 2002:a17:90b:1c90:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b166cdad2bmr2202495a91.51.1794292842565;
        Mon, 09 Nov 2026 22:40:42 -0800 (PST)
X-Received: by 2002:a17:90b:1c90:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b166cdad2bmr2202481a91.51.1794292841989;
        Mon, 09 Nov 2026 22:40:41 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:41 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:24 +0800
Subject: [PATCH ath-next v5 03/11] wifi: ath12k: rename
 ath12k_dp_peer::hw_links to link_id_map
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
Message-Id: <20261110-ath12k-logical-link-id-v5-3-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX7pkbvLkVJWSW
 whobHQlXcVh+vOSQQFh47C8DWaWnCO5PudEdfawaiqNGkh3UFJUTPnAdpid5KbInK+xZdK4ZmFp
 Hu+8aKLIKNgggNEJ+yGsSRk/wRi/Stk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX3E2zKgYVmtwJ
 nC309lvbjQGPLSlhzvQMXr2dfuF+/5fhdA3l8+TiSewkFXL1YdMTx3xICQCtnxO2fDS2HEcToFQ
 qZJYSsRefYjZrg6/e9BgANyP+d4iB6aDbFbXxF+lP04q7IEu4yE8uMMCeIsi0RMYmgEua20Yd0c
 ILV2/vIR7mBj183KMeG+r1PQJSScR1YcA7DP89RyncpqfWnZmsoOFrGnFSKQ1dE+HV+6iJ9a1I2
 eGxCHTg1Hg32YxGfyHOP50aNrUUmaxRmi4L8oBnz2vbNdcnllgyvavU3EVCLIeaTpIz4WZzosYK
 dMo86rbYxsnT18DDgZxY9xibsQ9fBKE2f2jrDuustdtfLStzU+68mrsLr5VYXBEqJALUgmuO8qz
 Q1CHvtpJDxTN1MbRolnPeshrX1v87C8mtxKIoNkdRmozG7L3ln4yWPRMsOpQ+A7eoG5yY+uxcg3
 Xx9QudG5REspWTOOEmA==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af2bc6b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=niLHlN7IhEeuoKN5US8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: TWMiIpP0p-Lzzk_-eOVUIy5Ok_9G4UPo
X-Proofpoint-GUID: TWMiIpP0p-Lzzk_-eOVUIy5Ok_9G4UPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

The name hw_links is not clear about what this array actually holds.
It maps a driver link index to the IEEE80211 link id, where the index
is the hw_link_id for QCN9274. For WCN7850/QCC2072 it will be the
logical_link_id, which will be introduced in a later change.

Rename it to link_id_map to better reflect its purpose. No functional
change intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 6 +++---
 drivers/net/wireless/ath/ath12k/dp_peer.h     | 7 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 102e67109ab0..aec30e010de5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -418,7 +418,7 @@ ath12k_dp_link_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev, u16 peer_id)
 	if (!dp_peer)
 		return NULL;
 
-	link_id = dp_peer->hw_links[dp_pdev->hw_link_id];
+	link_id = dp_peer->link_id_map[dp_pdev->hw_link_id];
 
 	return rcu_dereference(dp_peer->link_peers[link_id]);
 }
@@ -545,7 +545,7 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	peer->dp_peer = dp_peer;
 	peer->hw_link_id = hw_link_id;
 
-	dp_peer->hw_links[peer->hw_link_id] = link_id;
+	dp_peer->link_id_map[peer->hw_link_id] = link_id;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -613,7 +613,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	spin_lock_bh(&dp_hw->peer_lock);
 
 	dp_peer = peer->dp_peer;
-	dp_peer->hw_links[peer->hw_link_id] = 0;
+	dp_peer->link_id_map[peer->hw_link_id] = 0;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index d01ef1aea48b..b9c94d6366fa 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -131,7 +131,12 @@ struct ath12k_dp_peer {
 	int peer_id;
 	struct ieee80211_sta *sta;
 
-	u8 hw_links[ATH12K_GROUP_MAX_RADIO];
+	/*
+	 * Maps a driver link index to the IEEE80211 link id. The index is
+	 * the hw_link_id for QCN9274 and the logical_link_id for
+	 * WCN7850/QCC2072.
+	 */
+	u8 link_id_map[ATH12K_GROUP_MAX_RADIO];
 
 	u16 sec_type_grp;
 	u16 sec_type;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index c8e590e5e250..2a0141157426 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -2368,7 +2368,7 @@ ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
 				       struct ath12k_skb_rxcb *rxcb,
 				       struct ieee80211_rx_status *status)
 {
-	return dp_peer->hw_links[rxcb->hw_link_id];
+	return dp_peer->link_id_map[rxcb->hw_link_id];
 }
 
 int

-- 
2.25.1

