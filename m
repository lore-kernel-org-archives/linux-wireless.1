Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292863;
	b=J0NekGGkNNNGEY8c7GLNHvM/vKjlQcOy6D5rJRZ0YwgKpLCEnKH6AWjgm9xRoTCH96g5
	 UFBHDI33snXJTelurPZaaqY1j29HHbA4SqEcObJxHyArJtak0jzWhKK3LiXWqLEml+EBR
	 Ix6TEs0ozttIFTQTdh6T1ULk4kvYej39cUaiheKSxBT2KnoLdeG5KEXfTI8I2baOxdcYY
	 ez+a5nEBh/MUZuzeAEus7KaLSv+RmkcaHn4eY67rvxi5byMkSGlJCn/sK2kIzUVlpvbNZ
	 t3II15Ex+Eb5xYMbii8F+uBN6nUomXDj00GLZSPAFeCsMnKEi451j6001LKKUcSEvhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=;
	b=SmcFumm5ZbnkwkUFOqZLjHUZ8AJKOxuoVbVbIKz5AseonrSC2nVlwo+sTAiZUpuN67nJ
	 p9MJCXUohDMcLrVX3Ebb2kSh2DjV8hsflLeI1zd+SoE0GxzcJpp+mCmGCrLlE0gKEwRYj
	 BQTbrCGM0nCBB+5xqB1Ok4+RCsxBtU1uM6vEGKFHdyoGkSUYA59H5RWh6HEkdv654LZLz
	 zIZAleyAnV2XaqA1UAqvVBxApt02v08DFKDzi6o42PIZGCXnvAc0N4xFE3j0kR3sW09MG
	 niodDF+guSYoQgVpyu9kBgGsLUw2Ww30PUvOzK37BURu/zLIxVHt9v+umHlsGm3I4jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3hAzYoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bf88WnMr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C8606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3hAzYoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bf88WnMr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A61M1957677
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=; b=g3hAzYoBiT0GAg+1
	nvW8NbleCS1zta9gzEIvgFflH5ANaUd7Qj6XRgaz9vOZg1axIVC2TwTbiRoooIg0
	pCPbVg4Vzxu3GdSmWLkhW0DBj3s74dF5X0SLrWIWBh0buFKa8E5Jkcj1fFf0//LI
	H0eIK8KksKzbLVVszte7zj1XKOUbw8bnDKV5PYlIhJNEWZiaEf6zzb8z1r8bUQoH
	x8Kv7ZKUw+iQDNJdofFzL/5ur4uWs7iCEpHP2u0Xri5kRlTgDITtJh3mdPN3o9Av
	EWqT7y510JQzhmVm7dMxiAgvdrP4C3+b6tF2HVA37rINnra8PgVKRavXIPOyl/ez
	K9Fkgw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydm2j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:41:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1397321a91.3
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292861; x=1794897661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=;
        b=Bf88WnMrIOeMs5mT81n2H1snjH346QO4S7XOfVOuwoSttQNpoUB/fMboWltK/O7VQy
         LjFKe6ItDLefGwgCcFjCEo4TFJ1Iv5VL8SF3hPbPeYWVoKUwC8NUnelJlXPW/V8Y99CS
         YEeXWQlkLWtXBwh4qcaZQZQ6IEUfF/W7vv3UyLVWl//fuGT/IoAGvL2vZ/d4ctLJTKVU
         2rK6z4v7ydOLZnrXcCd9ze76PjQH3VRTecaV/lVwKNN+89B/D9lc4lFxjqnLUEijJJ+w
         hUDNHnBebDwZ3RJQ3Tpk0W3FLfNB571gy2mdj/C5NgjtPHg09C+TnYg7Dx44Qr6pNG5A
         e3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292861; x=1794897661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=;
        b=oimklKb2Wl9Eq4Po/HpUL0j1w8e582Zj6zRaE1eMYz0Ad5ndgw/KnAG1kPZJv7u+Gx
         lqog++27rUE7G6bEshmk2jZewSr946dyGIH3swJwOwsdUAyvmHTZaTA2exVLUNO26x8L
         h4lYc6db6WkEH+yOxaCOkE6GCHIw4UejS+4YGq3U9Uw8feL2JLj0rYO9PgA7eKODY8DH
         TdmsKBUpyfxHWhVV0Hf8czxtxmST4RFka0NFFbV13rQ9rL4ER8NOifcXJsQ/vS977Yec
         FWvYImXPEPUxDxTkrbYB9V1e0nrd//RwdZYqM+u1IQ9GnkdZ1xjK7JV7K3M42rqfCcxB
         EA+w==
X-Gm-Message-State: APuU4Z+Lh67aeLg1+SjnawUwAhviWJac8T67Op5Vvj/pA8W1/eabu6kS
	zn6pkYbntRcVob2Dj1x6O3VLROMZw8QfACMC9SQveAT+vMw5qG6N9oaJw2KZMmLel1eCRLUv63L
	/GStSwT9H10GVZgS/uoiGTzmwMGcWFImjFVmH7DK5yonXtcpW8yBMbComzPjmOavF0lkmQeVAaO
	tOYA==
X-Gm-Gg: AYBFou0Pl/xHaaQqG6zbcdgI4agV7C4de67NCOCtOV0wSc/4axVrIAC7Wr4IFJ6RZar
	UiotuQwAXmkie9lHAEE4qI/rEeU6DBJkGEawXhNkxQ2ClRA0xZV9eqiIc5V/oHG4rr9E9RRXJrt
	+jMdT7qz5l/Gvq1OCfAb1iD1oxaf06JnPEPelLO7SGKWNMQwVh4tUberA7fwbd9K1sMXXWip1qt
	0V6DiTP7KybTFdG6gUdblovy/kuq2QMwb7OWV8jfY91fsW1cXF24A7PPRweeUdB2Mf3W62Ag667
	YweRvTW7CSm98w5fQkqWh9neYz1pulqLcb3ze7ffvZ+0i0rCVZpK8ub+07zOs1OV6rg7e0ecleQ
	RbB+fT+CMirNSj7T4jDDkaXCP+4u/czBeZK5vTiZmIq5zf+n2rDLKFkmroVxeU9lZs4S0s12+VW
	JihbecQdqhVK4JNFcOIfrRYFt5LrJonA==
X-Received: by 2002:a17:90b:3b46:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b166b41b01mr2019343a91.2.1794292860606;
        Mon, 09 Nov 2026 22:41:00 -0800 (PST)
X-Received: by 2002:a17:90b:3b46:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b166b41b01mr2019322a91.2.1794292860077;
        Mon, 09 Nov 2026 22:41:00 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:59 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:32 +0800
Subject: [PATCH ath-next v5 11/11] wifi: ath12k: use link_id_map to resolve
 RX link id for all devices
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
Message-Id: <20261110-ath12k-logical-link-id-v5-11-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX4SfTZeU6gBAk
 sWAlYhkmVkEvf6cMJqWTHrZy6AW/RdCwpTI+Dsfx2XcKPNMRBAnjhbpreXpDdp5NHcHgIOpmp7A
 FUsCX0evO7EgZociTYfqqqWPuNHRLGU=
X-Proofpoint-GUID: GVyfZlevwTxkCrhr4k4bwyBLmR2UQkq3
X-Proofpoint-ORIG-GUID: GVyfZlevwTxkCrhr4k4bwyBLmR2UQkq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX/NIPAFgx5SDM
 pQISJdsnnLD8oAqtcgN5xJwmjfuZwjgl3hvFAnl6/fpO0es29RwF4riqijq94E04EsbNsURqIkS
 i/sA5jN8yayXedoWDxXm19jISsJcbYr9XT9jI2QV+YCwgAblJeIaWUlPRC6bqe11gxjU+yK6Ys+
 33OdQV2O+vikJOTKlbhaZx31dm1YsPp/1UiPR02xoLgYApZb9KQz8S+CXiWdtsNTMWxfK7lVBn/
 Vchv5p+wsesc0mVaNVZKD46Q9fYkJmvTQ5M6+jfvLoLKIXuj/xeQWgzXuJjRMtjvFuKYsnF6t3i
 xw9da5kElssf16P3jY5yq77KYJ7KT0JrW/+UrwkK/A8cfW6039OWoYaI/oVzoW+iJr1xsjp0a3g
 WBTT82ZW7WDkX0jCWQtvNcOfh17+yjmKn0XxcwknOYTNrIdB4lAEEyWxE41m3Is5r18VSONOz7j
 LyLX3kaDKDLJC/goqvw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2bc7d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KXmYhDJzFV-ZoC0c644A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on
WCN7850") added a set_rx_link_id() op so that each device could resolve
the RX link id in its own way: QCN9274/IPQ5332 index
dp_peer->link_id_map[] with the hw_link_id, while WCN7850/QCC2072 walk
dp_peer->link_peers[] and match by peer_id, tracked with a link_peers_map
bitmap.

Now that ath12k_skb_rxcb::drv_link_id carries the driver link id for all
devices (the hw_link_id on QCN9274/IPQ5332 and the logical link id on
WCN7850/QCC2072) and ath12k_dp_peer::link_id_map maps it to the IEEE80211
link id, the RX path can resolve the link id uniformly.

Revert the set_rx_link_id() machinery and the link_peers_map bitmap, and
derive the link id directly from link_id_map[drv_link_id] in
ath12k_dp_rx_deliver_msdu() for all devices. The NULL dp_peer guard added
to ath12k_mac_peer_cleanup_all() is kept as it is an independent fix.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c     |  4 ----
 drivers/net/wireless/ath/ath12k/dp_peer.h     |  1 -
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  8 ++-----
 drivers/net/wireless/ath/ath12k/hw.h          | 18 ----------------
 drivers/net/wireless/ath/ath12k/mac.c         |  2 --
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 30 ---------------------------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  6 ------
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  3 ---
 8 files changed, 2 insertions(+), 70 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 5acdfd18806e..4e753e6abe3a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -658,8 +658,6 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], peer);
-	WRITE_ONCE(dp_peer->link_peers_map,
-		   READ_ONCE(dp_peer->link_peers_map) | BIT(peer->link_id));
 
 	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], dp_peer);
 
@@ -728,8 +726,6 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
-	WRITE_ONCE(dp_peer->link_peers_map,
-		   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
 
 	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index c2d060de88ea..2ac4c6c6d535 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -159,7 +159,6 @@ struct ath12k_dp_peer {
 
 	/* Info used in MMIC verification of * RX fragments */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
-	unsigned long link_peers_map;
 	struct ath12k_dp_link_peer __rcu *link_peers[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_reoq_buf reoq_bufs[IEEE80211_NUM_TIDS + 1];
 	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index f11810c6e0d4..52838ade1b1d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1370,13 +1370,9 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	if (pubsta) {
 		if (pubsta->valid_links) {
-			int link_id =
-				ath12k_hw_get_rx_link_id(dp->hw_params, peer,
-							 rxcb, status);
+			int link_id = peer->link_id_map[rxcb->drv_link_id];
 
-			if (link_id >= 0)
-				link_pubsta =
-					rcu_dereference(pubsta->link[link_id]);
+			link_pubsta = rcu_dereference(pubsta->link[link_id]);
 		} else {
 			link_pubsta = &pubsta->deflink;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 05902edbb59c..138e556ac679 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -13,10 +13,6 @@
 #include "wmi.h"
 #include "hal.h"
 
-struct ath12k_dp_peer;
-struct ath12k_skb_rxcb;
-struct ieee80211_rx_status;
-
 /* Target configuration defines */
 
 /* Num VDEVS per radio */
@@ -261,9 +257,6 @@ struct ath12k_hw_ops {
 	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
 	bool (*is_frame_link_agnostic)(struct ath12k_link_vif *arvif,
 				       struct ieee80211_mgmt *mgmt);
-	int (*get_rx_link_id)(struct ath12k_dp_peer *dp_peer,
-			      struct ath12k_skb_rxcb *rxcb,
-			      struct ieee80211_rx_status *status);
 };
 
 static inline
@@ -294,17 +287,6 @@ static inline int ath12k_hw_mac_id_to_srng_id(const struct ath12k_hw_params *hw,
 	return 0;
 }
 
-static inline int ath12k_hw_get_rx_link_id(const struct ath12k_hw_params *hw,
-					   struct ath12k_dp_peer *dp_peer,
-					   struct ath12k_skb_rxcb *rxcb,
-					   struct ieee80211_rx_status *status)
-{
-	if (hw->hw_ops->get_rx_link_id)
-		return hw->hw_ops->get_rx_link_id(dp_peer, rxcb, status);
-
-	return -1;
-}
-
 struct ath12k_fw_ie {
 	__le32 id;
 	__le32 len;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dbbcf524906e..ff2508a7be74 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1241,8 +1241,6 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 		if (dp_peer) {
 			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
-			WRITE_ONCE(dp_peer->link_peers_map,
-				   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
 			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
 		}
 		spin_unlock_bh(&dp_hw->peer_lock);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 4132578085cc..473887ed4bb1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -2374,33 +2374,3 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
 
 	return tlv_tag == HAL_RX_MPDU_START;
 }
-
-int
-ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
-				       struct ath12k_skb_rxcb *rxcb,
-				       struct ieee80211_rx_status *status)
-{
-	return dp_peer->link_id_map[rxcb->drv_link_id];
-}
-
-int
-ath12k_wifi7_dp_rx_get_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
-				       struct ath12k_skb_rxcb *rxcb,
-				       struct ieee80211_rx_status *status)
-{
-	struct ath12k_dp_link_peer *link_peer;
-	unsigned long links_map;
-	int i;
-
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "ath12k set rx link id called without rcu lock");
-
-	links_map = READ_ONCE(dp_peer->link_peers_map);
-	for_each_set_bit(i, &links_map, ATH12K_NUM_MAX_LINKS) {
-		link_peer = rcu_dereference(dp_peer->link_peers[i]);
-		if (link_peer && link_peer->peer_id == rxcb->peer_id)
-			return link_peer->link_id;
-	}
-
-	return -1;
-}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
index 8a16fb3dd005..3da80da19ced 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
@@ -59,10 +59,4 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
 				  struct hal_rx_desc *rx_desc);
 int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 					  struct ath12k_dp_rx_tid_rxq *rx_tid);
-int ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
-					   struct ath12k_skb_rxcb *rxcb,
-					   struct ieee80211_rx_status *status);
-int ath12k_wifi7_dp_rx_get_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
-					   struct ath12k_skb_rxcb *rxcb,
-					   struct ieee80211_rx_status *status);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 76f40073e002..48a2f6da16ef 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -159,7 +159,6 @@ static const struct ath12k_hw_ops qcn9274_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_qcn9274,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_qcn9274,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_qcn9274,
-	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_qcn9274,
 };
 
 static const struct ath12k_hw_ops wcn7850_ops = {
@@ -170,7 +169,6 @@ static const struct ath12k_hw_ops wcn7850_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
-	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_wcn7850,
 };
 
 static const struct ath12k_hw_ops qcc2072_ops = {
@@ -181,7 +179,6 @@ static const struct ath12k_hw_ops qcc2072_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
-	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_wcn7850,
 };
 
 #define ATH12K_TX_RING_MASK_0 0x1

-- 
2.25.1

