Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684860;
	b=T+J1jsKsWKWWYWu1tcWqCmer1dkWEq6ihK6QiW7Rmp1/RZkcqrTuZDjYrjpZ0qx3dGat
	 F69gJ9ufBRgJF1Vlt5NCFav/kdLRtm+w9qkTqnFyIuoAcrRxuR7KP926r8ImO0iB+A/nz
	 Xa5vLPueK45T0JCVR0Y81dY/Moa8q58oG1WPv7PxCpZXt2Q8pI2Rtigriu+X6Wrpe1twh
	 C+IlB/M6FZN4n9Dofty1rz0F/tA7lC25I+zmq90UE+S/oUAPBcxT/hME6tcpAOit7qeIV
	 ooiBWyaGdQx791tF81y5AxgOgLtmPUsAwTQHPx5IFNwY/Mzsky+oPLwmvXNcogKE71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
	b=MrYwCX39BakU2JTZaOS24zEBPY0I984IKAsO7jMQxxp99RM0w9DkmlGgje/q06vkA5FK
	 gDr6iETC4z64Coj8w8NC3dn1/wp3UB5TdqMbl9JEry9KZOoPMPACfzJptzbCoaqdW255G
	 ErXTLSTmTUYnAEkumaWSA9ollePMkWPgaRKSJ/47ftKFHNBpVTEhpAejswVu+up1oPdqd
	 PTiuheKJojC9u7YqUK/U7gp7ZAi7PP7j65BQ4l+ABbc0xO3AZHAjbBSfB0R35xjyGFkwt
	 n1YMWmW93CswSZspZun/f/+ylLw0PKkK9m3mIgpM3wvF90i6wbVUIJJWR1BZOzNP56Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TMC2UZC3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NusoFDI4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A64606A335
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A64606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TMC2UZC3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NusoFDI4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2942210735
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7dXCZqzkXmw
	N+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=; b=TMC2UZC3pbrDgsvqamkhU2BsIlQ
	1poJoRoNy4OwI8yuL1akUK2zn9laq1yp+o1rYqcUazcGrq0bCrrExETNRR/ZEDl3
	q1XFINkM/bSHmdFkDa12kTl4DqB4jgWkrJv32vGLlqMGlSm7uEMcq7o9gYksRNdG
	Vrx0CUVxiOwwObpD+uG8a5KQh/BqAIZCT0QKMFUzlE99pJRw8i3dZ5lhA/4Lwbgg
	tYwcbXZtMCDsmDPTKhHQaRg6GqNquoNEETCoAJQB16ILat2Y9LxKREI/D/i1YXVD
	F1rV8Be4an3Z7i6itjaXECFEbDGAJmY28TgJi169/HWVQPAawKMWPQ9cHlg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfa89k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:20:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdec55db650so13160a12.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684858; x=1796289658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
        b=NusoFDI4t91NfrzS3bj8E3zEsCwq6mQvOJ6MNosjiS3k5r1b5C5S3plsbFtGD8TeNX
         FI0vR6h886YvjlQsJI/6+4DTgt46Lxm/HoT4bz9tM+l9ouWsTNyzbyEjL55JAorT+2so
         mTqe7BNSzdChKDZBlXBPO/sNvDq3KoKMmVzfnZ5QzcZtx7uAGHzPtXFPTf9NtrLSebFn
         oLBwnLEw0r70Az5wcFrH4uztGRFQR+cmcZBGPWcvG+uyFMkxxU/mYxrRV513ONMC71A3
         9QrwSxsRug/adq3KDI8qYnGoxUJYBc8T6Y1eV77N/FvkOs3jqFBF8FBFeihCx/J2IvRN
         FC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684858; x=1796289658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
        b=S8OT+8d1SZ5y0SMThPzHqsb8mJSMHyz+IflCYCSCGlMTlsr9RCIC1i7TacSrEP26VD
         ogMpmvY9nztm+Df91/cGkUI7irFLRk1VsIQUi1FxQcOqCaU+2zv966R6AjpKSnkUqesH
         uynsP4qaORKGUPFUF3/9byqJ3PMT6HCKGficIL7M7RFDDMxJV5ZV6IgXYhmtSuhoH59o
         8RCpcWnkalplG6kIg5uOz5v3OLm5k6TOtA1EHZfUerrYy1Lkm2pudSTyzAYseY4HxQUp
         gCD6woXiNS3TGVUCcTErtt01iIAU88FQT0kmYqqk/gXAH2Jf06OupLfAt1P4RJy5jLrO
         tVvg==
X-Forwarded-Encrypted: i=1; AL+hErErULIp8/RWcS9I1Dzzew6AQy+q8d4u9SJlTkSqNkPq2ocIZ47ZfRVMdQ5lFBn5wmc2zNOB12s4vKyrNgwKjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CYjzQiFaF66WOEp014ICbABOGMDs8u7nBSwlEgH9Cr0TVmxlV
	MpVhf83BL67A8tObg7txFyAJYAF1nijEqkonR96TT+HMUH77GCGUSsv11IwmNZbtCwXGya/dco7
	RoELzeHnx1wJOcqNWUZlwKd59oMapHzAD0QYnHMt0Wj5bQ0TVNNV/8DU3dDVE4zj8hlxp7g==
X-Gm-Gg: AZFdTZfQPSa2aSDnwUSUOWZ00DPoctxQsgFcC9yWLmpgatuF4Bv9GyaBXhd3//VFfQI
	hC9hjc0zH0wgFntZr1j4xl4gzcTtjc8UnkTpirZPxKA1ZI6uCvGtc3rtJ+xNsOwyzLwYZmzufS6
	k0cYXVLt9Z4U03/XxPnE2pRMJJ6cT0504ha+Vj8AMY76HsxkligboxMTTHUSFHB7Psk27ZZWYb4
	vOT3GlTBxLayc/prBRnHZBX6SoYenMOEHlhNSD2bvZgDehuXvkLGoSzXGB8Bt+KX8MI2mH4xAjE
	p2VgXTodOJKEVNPLfZuCiUoFme2SCsW9XHyJvSxFhvMzhy5GAAFr98XKsBvltWDoPdl4ks0IyKk
	eMKmCzs7Fbbk45eFU2IGglB6d52USe2vXIEiM6+0kX4HINizSlQeg7qUkulmpoT3XC4U0h3NGbQ
	2TuAd6OOxcQooFTunXpkudxJqGWKwWPWQ=
X-Received: by 2002:a05:6a20:2446:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-4014b5659d7mr23101906637.37.1795684858018;
        Thu, 26 Nov 2026 01:20:58 -0800 (PST)
X-Received: by 2002:a05:6a20:2446:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-4014b5659d7mr23101877637.37.1795684857511;
        Thu, 26 Nov 2026 01:20:57 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:57 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/7] wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link updates
Date: Thu, 26 Nov 2026 17:20:33 +0800
Message-Id: <20261126092037.462830-4-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wXodFxBnyCbD5sbNcqW7pWoOrOKJCwgB
X-Proofpoint-GUID: wXodFxBnyCbD5sbNcqW7pWoOrOKJCwgB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX5uY/Csc8lp93
 qQaKYehGXxIA297UUak9xG634fkGs971rVPii7YHM+FORpFMxOM3O75Z8TIlUGCgNQEAXZNTnwc
 CRq7hV6BKH0hDMmO0MblXgVkfLrbktw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXzDNZ78s97JmH
 X24g+GIxYqbfgzsdN92A+CkEkxye7+XvMBl7n/qF2zvt+AVrc1XRkBCHKgqEcyPi/lS2mQ4ZYDh
 gjb9FSKp1ySD9tK0ieT86ryd1lJAkcY585wdBAEIUPBnTUHrgMAg7BE6x5mDQiuQ7KNEjJaU9wR
 BLWVG3B8Je/+j1zyC9Yw7/DVeMahc66eZeMwqri2U0ATjmGntBED/bQQs0QxKeKZAVLYl8V/ooe
 z+/E7iC/zJTYrdj8KLTae1jP41SCStt+Dih+W43XJuZigz+X83D5HEvENl/8j9vT4THAWryfxIY
 LbUzhdyb/sLByK4qxEj+5O82VncFYidlA3G/wm9rWgWFWiPQLEdtFiXwvgeAacjY3M8WeQ7Lbg+
 5w8hnKLtS1dNzefA2cJ8vM81EP84Gz3Cry+ITTcv+LCvdwe85lRJR+xRsrO8i5ixfmEAT64cecy
 KxXL+IPJuxFOEml3PRw==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07f9fb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Ns_Jbl9W-MFJWGn9c5UA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

Currently, ath12k_mac_op_change_vif_links() derives the links to add and
remove from the old_links/new_links arguments: it creates a link vif
(arvif) for each link in ~old_links & new_links and frees the arvif of
each link in old_links & ~new_links.

However, mac80211 invokes drv_change_vif_links() both when the valid
links change and when the active links change. In the first case
old_links/new_links are the valid links. In the second case they are
only the active links, while vif->valid_links is not modified. A link
that is deactivated is therefore reported as removed, although it is
still a valid link of the MLD.

To fix this, derive the arvif lifetime from vif->valid_links, which
mac80211 updates before calling the driver and which an active-link
change leaves untouched. Create an arvif for each link in
valid_links & ~links_map and remove those in links_map & ~valid_links.
A link that is only deactivated keeps its arvif. On disconnect
(valid_links == 0) every remaining arvif is removed. The WARN_ON() for
adding a link that already has an arvif is dropped, since links already
in links_map are not selected for creation.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index cecd634c5f7f..d7234ef9c025 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4388,9 +4388,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	unsigned long to_remove = old_links & ~new_links;
-	unsigned long to_add = ~old_links & new_links;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	unsigned long to_remove, to_add;
 	struct ath12k_link_vif *arvif;
 	u8 link_id;
 
@@ -4400,14 +4399,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
 			   vif->addr, old_links, new_links);
 
-	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
-		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		/* mac80211 wants to add link but driver already has the
-		 * link. This should not happen ideally.
-		 */
-		if (WARN_ON(arvif))
-			return -EINVAL;
+	/*
+	 * Link objects follow vif->valid_links, which mac80211 updates before
+	 * calling us. old_links/new_links only describe the active links and
+	 * must not be used to decide object lifetime.
+	 */
+	to_add = vif->valid_links & ~ahvif->links_map;
+	to_remove = ahvif->links_map & ~vif->valid_links;
 
+	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
 		if (WARN_ON(!arvif))
 			return -EINVAL;
-- 
2.34.1

