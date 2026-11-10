Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292855;
	b=sS+A+otKTnv6Aaul80LzoqVV4NBBAyutxtayRAzCzosFMHk/AtrYz/Y8IGx2dlvQYoXx
	 WGgXXmTJPcSp77GAp+vxIiLL1Q+chvT4F56MWn/0R5ghpTCardSrOMqGVQp7uP9G0hjrv
	 8LBMnbYFUGLx3OcdWsTrTLCXndf8OS0W2EH0BVmBdM7/AX30nAAJ79l18NPkjIasgWB0t
	 q2iu4+J5lXjtDZD+qZXD3Q0jow/0qfn8nVDm5PumIKYDL9CcsUxU4dN47VVJVEgAwB4SK
	 oyeKoGrikpN9brWu2VqhoB7QoYH2kroA4hXl4hmD0IVZBVFKEDOXMnyukCyzldlqGsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=;
	b=Amhis+okkwJ4I2xqc8lb9ls4b7eJuDanPiYMkLaSxqa8Ap14JORnV/HQA+yVaNC+Gaq5
	 ZlsplMxEulh3oDUwUsp4p63S2vTsFhKI3osBRFHrj9H9q89iMxeNnWRmthaBeTpthw9HR
	 zgnzN1Ufci1pEiLbPin5Gqibar3fajG8Y4dKbFPb46ZqkdSjMoy6is2y03TbV3bS3n3Ys
	 Tv6Q3P2voJymvYPL16QuPI7hZJHxRJ4OronRs5L/d2Mewn6E1W3nUmTT631cVzPUX0f3f
	 dmbwqiUyDmiCyeYzW+2u5mK/V8V51n1Nly2ji2Mf0FYZBnFCA6UWt9KMC3BNJeCGsSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qxfa8Oxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZ60Xebb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E8A606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E8A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qxfa8Oxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZ60Xebb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA554672414830
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=; b=Qxfa8OxofHeQDslE
	3XeKPseV44m7MfGFV3cDLdqrN/+ghy5/DYyJFhTyjPPM3vez4tndiOoKznU300tw
	99iYVPZVKunAPdz74RwB9ZqhehgtY9qrXqj+EZOZAAi7Qefy6bZXCyLK9mNHZISQ
	CqwjtLsfQzUboxwkF/Hewu3XA4ZvMXn2WURwFO6cmm+ooJsEpHBsdE18Lka183PQ
	gkBp6ciWhZKPHWr3IlRkNKRkwVBnDlnbgwR+H5SWQ5M7DXPlOhDN961lofOwg+zW
	sc+rz3WNgAiYrmURJzFcQ43r/ohCPVQQIMCDsOIbAg4AmKU/2pYvkq/E4HCXY9qw
	tOh7gQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd8cbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so27434245ad.2
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292853; x=1794897653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=;
        b=WZ60Xebbc6oGC0UcacQCN06catHq0y2zCtOuySGcfTgiYmqUkHoVG4u+BZ1gc6Be56
         Sgm4pBaIAX0yCTEirSZe3F6bsvalCbRwKNEdKIxHoQ6Pkkb9iOjLUKwRKyQ4USNPchIU
         1QUV+avwT71UiHkkck7Jq98Lq5I5bEw2DoHeutaYLJ1hf2QgxUr1u3xUWIEyxW4pI6HU
         wt9Sr6YDfGZxosbFJQ7uK6zKk8eEJHjsYInWpjYoimDhb9nSJXPHrICyXM2CJXCI82mx
         zYe6DKnPkSithKdN6lapAcVGkwlJLZpbPeS4Je/w/96J5E8dxgo1iB+hd/yNZoPidZY0
         IDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292853; x=1794897653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=;
        b=CRVipCqqrRbEztmG87XTRvUHU+0qUKXLJ6Xld2OqCwJ0Ze0h23zdZdnsYeQtNb++4+
         g4tii/JnGK4TNFrqUqZ1Kq/gL6nXEe8Ej8HMC8e6Hy0l9wOLcuQlQO+r7xMWG6rWA9wm
         8kv7MM0xhO9QaaC4tu/FnbPHZXF+dzPqYfkN0aP/LABMswLwwsPCaTyD5+lrqcVnvPiE
         PCcM+VypRL2ks9T7QJ+u+A1AoguRabwBMtz3VtbWjrwEppqq85KvV0m3jOf5hxWtbetK
         /Fk878XFOsRgK/zUj+LB+/B8ysHE+TzXtSuiOCpxUqTd8pQGN9oGIzV9yR2XdqSuDIzt
         Hj+w==
X-Gm-Message-State: APuU4Z9wtssE6jZOw7IRMctMU09AF48/nbSiSLozJ67XfKxXKUK2I6TY
	iCGCu3IfCrA6PyTSgUK+iFa0O00JN/q4mEpYusMX7wg9NS7xCnnHpJQxC7LOxUeuGHgFrfzc+Bs
	JDfHBL1G/3BgkhCHuNCOBLbJNtP1TnGFbw/qLP+Rg6x6Je6ZACGiRXNgoMGMtjSgxaFK0wRcUvt
	FBmQ==
X-Gm-Gg: AYBFou27QS/HJa7ubKJeImnsF8NdvOSA4tUnlQ/cGlUWZ0s83Ahx9wp0AUS2EZt3Be2
	BmN8ACxzajIW6sLRiR7DjxCX9ePklS6R9qURZDGfcmvxgS/+g+gIv7Pq2tM33tRmGEDHG0pyq+6
	40Y23V9J8L8CTkNisZ9F8/2hSvUV4WLiZUdx2aoiZYqgyADE8v5tQ316hnoMs3XMxlN3jWJTAt8
	5Q1VkwWEtBZ+3G9MXebVCYm2xBCsmc71zYaMeX4FuzEp23P/FhtuaUjnPsSrA5SNzm1kCgXZ+4W
	uETG3zR26nRKkNW4eQqs96N0iDKmlW4Nv/hp5k9Xy73hjzoJ7hrwrKLzMoi+FLl6vVqt+wp7+Ik
	T/9TOjcdFume+Tc7A3gq7hQTaWplRD4b9F2OLYacIQTeiAe6Kz8USBKNXBqs791I/hL/48qX0dX
	OV5W3NE+3H35TpiXs8Sx9+74CscdMvCQ==
X-Received: by 2002:a17:90b:3b4a:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b166f69f40mr1967970a91.13.1794292852681;
        Mon, 09 Nov 2026 22:40:52 -0800 (PST)
X-Received: by 2002:a17:90b:3b4a:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b166f69f40mr1967955a91.13.1794292852053;
        Mon, 09 Nov 2026 22:40:52 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:51 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:29 +0800
Subject: [PATCH ath-next v5 08/11] wifi: ath12k: allocate logical link id
 on host when firmware does not report it
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
Message-Id: <20261110-ath12k-logical-link-id-v5-8-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: RXt54ibFmu2bYqRhvjyCBpufF1W3Fhzg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX/hS/OeMnRniK
 4V2qXGBdHGdhHg17A2mDa/M/r3LAH7l4rI1WE2PPkmsPnI5gpMBIZZG65DfUsepYetLQzdghF6S
 4CRosPb8ORYIMKB3N5mkCEgvx5xs+b8=
X-Proofpoint-ORIG-GUID: RXt54ibFmu2bYqRhvjyCBpufF1W3Fhzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX0QWeSYwtb0RB
 jU1/txOkt9gSuzWJW0Aiw86GhDO8o2L258UFAlfZ5VFmRBZRjzIqnbOfPBElI7c6BKImRYBOTo8
 p73EaCdYB3fR0smBDtCg5vn5XreI5faQlY3qkGi/BSAnCI9oznRJtE2Z8e1+/2XRP9L4g5JXEWW
 opCa7fLo9Vj2hsG1QUzmEk+y5fQis3JTS2gK5NGWFkWKVE/HJ6Ja94zBdhkxCIjr7t3xqDZKbqU
 Ga1tbOrTJhGvmpBaqK5dETZQPdrmVVB3XzICLtclm42jivYhzJW0oRfqvvRftTfnJ5iU8LNYmGt
 evjqqY69s7yxIFojf2qEfkygtqLgUbuEn6BLBfsN0bVzl9PlzrGtlDctO0TK3BJmkP6bEjz8zMU
 iQBmpe4umTp90gWkR/xMOGvWaMT7Ch3onihBYSjWXtXRhorUZ/xIS+UVF7EEi7aUF9VSRThkqgP
 SGDIE9Gmw/YyVouq18Q==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2bc75 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2FDiJZU-w7-vk6pY0YkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

For devices that do not support hw_link_id (WCN7850/QCC2072), the driver
link id used to index ath12k_dp_peer::link_id_map is the logical link id.
When the firmware advertises WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT it
reports this id in the PEER_EXTENDED HTT event, and the host waits for
that event to fill link_id_map.

However some old firmwares don't advertise it, and no such event is sent.
In that case allocate the logical link id on the host, mirroring the
firmware scheme: pick the lowest free slot from a per peer bitmap
(ath12k_dp_peer::free_slot_map) at peer assoc, after the peer assoc
command has been sent. This matches the firmware, which allocates the id
while handling the peer assoc command.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_cmn.h  |  3 ++
 drivers/net/wireless/ath/ath12k/dp_peer.c | 50 ++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp_peer.h |  8 +++++
 drivers/net/wireless/ath/ath12k/mac.c     | 52 ++++++++++++++++++++++++++-----
 4 files changed, 105 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
index e17f044ff812..88abe90767eb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
+++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
@@ -9,6 +9,7 @@
 #include "cmn_defs.h"
 
 struct ath12k_hw_group;
+struct ath12k_dp_link_peer;
 
 /*
  * ML Peer IDs start from 8192, assuming max SLO clients count 1536,
@@ -97,6 +98,8 @@ void ath12k_dp_cmn_hw_group_assign(struct ath12k_dp *dp,
 int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 			       u8 vdev_id, struct ieee80211_sta *sta, u8 *addr,
 			       u8 link_id, u32 hw_link_id);
+int ath12k_dp_peer_alloc_logical_link_id(struct ath12k_dp *dp,
+					 struct ath12k_dp_link_peer *peer);
 void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 				  u8 vdev_id, u8 *addr, u32 hw_link_id);
 void
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 2e2672a082a9..5acdfd18806e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -513,6 +513,8 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
 	dp_peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
 
+	dp_peer->free_slot_map = U16_MAX;
+
 	spin_lock_bh(&dp_hw->peer_lock);
 
 	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
@@ -561,6 +563,49 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	kfree(dp_peer);
 }
 
+int ath12k_dp_peer_alloc_logical_link_id(struct ath12k_dp *dp,
+					 struct ath12k_dp_link_peer *peer)
+{
+	struct ath12k_dp_peer *dp_peer = peer->dp_peer;
+	u8 slot;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (dp->hw_params->support_hw_link_id)
+		return 0;
+
+	if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     dp->ab->wmi_ab.svc_map))
+		return 0;
+
+	slot = __ffs(dp_peer->free_slot_map);
+	if (slot >= ARRAY_SIZE(dp_peer->link_id_map))
+		return -ENOSPC;
+
+	dp_peer->free_slot_map &= ~BIT(slot);
+	peer->drv_link_id = slot;
+	dp_peer->link_id_map[slot] = peer->link_id;
+
+	return 0;
+}
+
+static void ath12k_dp_peer_free_logical_link_id(struct ath12k_dp *dp,
+						struct ath12k_dp_link_peer *peer)
+{
+	struct ath12k_dp_peer *dp_peer = peer->dp_peer;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (dp->hw_params->support_hw_link_id)
+		return;
+
+	if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     dp->ab->wmi_ab.svc_map))
+		return;
+
+	dp_peer->free_slot_map |= BIT(peer->drv_link_id);
+}
+
 int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 			       u8 vdev_id, struct ieee80211_sta *sta, u8 *addr,
 			       u8 link_id, u32 hw_link_id)
@@ -602,7 +647,8 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	/*
 	 * Only devices that use hw_link_id can map it to the IEEE80211
 	 * link id here. Devices that do not support hw_link_id fill
-	 * link_id_map later from the PEER_EXTENDED HTT event.
+	 * link_id_map later, either from the PEER_EXTENDED HTT event or
+	 * from the logical link id allocated at peer assoc.
 	 */
 	if (dp->hw_params->support_hw_link_id) {
 		peer->drv_link_id = hw_link_id;
@@ -677,6 +723,8 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	dp_peer = peer->dp_peer;
 	dp_peer->link_id_map[peer->drv_link_id] = 0;
 
+	ath12k_dp_peer_free_logical_link_id(dp, peer);
+
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index ea36947d1707..c2d060de88ea 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -145,6 +145,14 @@ struct ath12k_dp_peer {
 	 * WCN7850/QCC2072.
 	 */
 	u8 link_id_map[ATH12K_GROUP_MAX_RADIO];
+	/*
+	 * Tracks which link_id_map slots are free for devices that do not
+	 * support hw_link_id and do not report per-link stats. A set bit
+	 * means the slot is free. Mirrors the firmware logical link id
+	 * allocation: the lowest free slot is assigned at peer assoc and
+	 * released when the link peer is removed.
+	 */
+	u16 free_slot_map;
 
 	u16 sec_type_grp;
 	u16 sec_type;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f32d391bc10e..dbbcf524906e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3892,14 +3892,52 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 	}
 
 	if (!ar->ab->hw_params->support_hw_link_id &&
-	    test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
-		     ar->ab->wmi_ab.svc_map) &&
 	    peer_arg->ml.enabled &&
-	    peer_arg->is_assoc &&
-	    !wait_for_completion_timeout(&ar->peer_ext_event_done, 1 * HZ)) {
-		ath12k_warn(ar->ab, "failed to get peer extended event for %pM vdev %u\n",
-			    peer_arg->peer_mac, peer_arg->vdev_id);
-		return -ETIMEDOUT;
+	    peer_arg->is_assoc) {
+		const u8 *addr = peer_arg->peer_mac;
+		u32 vdev_id = peer_arg->vdev_id;
+
+		if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+			     ar->ab->wmi_ab.svc_map)) {
+			/*
+			 * The firmware reports the logical link id of this peer
+			 * in the PEER_EXTENDED event, which fills link_id_map.
+			 * Wait for it before returning.
+			 */
+			if (!wait_for_completion_timeout(&ar->peer_ext_event_done,
+							 1 * HZ)) {
+				ath12k_warn(ar->ab,
+					    "failed to get peer extended event for %pM vdev %u\n",
+					    addr, vdev_id);
+				return -ETIMEDOUT;
+			}
+		} else {
+			/*
+			 * The firmware does not report the logical link id, so
+			 * allocate it on the host by mirroring the firmware
+			 * scheme: assign the lowest free slot.
+			 */
+			struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
+			struct ath12k_dp_link_peer *peer;
+
+			guard(spinlock_bh)(&dp->dp_lock);
+
+			peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id,
+									 addr);
+			if (!peer) {
+				ath12k_warn(ar->ab, "failed to find dp_link_peer with mac %pM vdev %u\n",
+					    addr, vdev_id);
+				return -ENOENT;
+			}
+
+			ret = ath12k_dp_peer_alloc_logical_link_id(dp, peer);
+			if (ret) {
+				ath12k_warn(ar->ab,
+					    "failed to allocate logical link id for %pM: %d\n",
+					    addr, ret);
+				return ret;
+			}
+		}
 	}
 
 	/*

-- 
2.25.1

