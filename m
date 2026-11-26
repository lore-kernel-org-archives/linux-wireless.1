Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684870;
	b=faPdKRWfmioocXWa/ZstFKPTTcTn4S9ieuPfdfkAFpLotlmsz17yQWP3A/64L7waXYLM
	 j/k6bGbWstOtG5lZ7QKEv4pvMh4ieNeT7t3gzyKbxuJDkApLD53KtFW84RFrXkqzlB4ur
	 HkBQaDZmzoOZbck6bbWsdVq1sclo0GHiGz2yX1srYW9yKGbMjEMuxmKkEgG3JCH+B6+S9
	 EM3rEF+mNPOXKyGC3QrhpAQe2lhVKxjifVKD2PzbGbUKfWKjgGvXMfL+e0RQzMAl3RVoj
	 Kf/MyJ3hyKlmVk37ohP7zyL+fF9rXIH22L/Md8yXt/XGJK9vXM9oOjV0YhPetYvbLZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=noDcCoJfo1TOjWUuqjic1mU5Y/HKWbo7Pjs3rDdTH0w=;
	b=oCCD/sMV6yEBHVPQIbsoBPFUTY64PPhfcWi8uScgF3cAZUrwCTjyM0XSQGgMTuvQ83a1
	 vEM951mN7hEZMFzLN6jR/jMO/u+FX2juLMzeEMjpELqFUSneVX7u+cvB11/l1bXdHmI2g
	 rReuk3gxOig1vbSCam2ek8VhWAuQ5JDqjPkSLgOfiJb/NF8yBRlwEcD0USMttMMQW/sqK
	 PO3nUZFsk0BxSGpoq6ltZOv11LIyhMsCJszZ350Jq7VeWx+OkODX+oX0t+8ya+Tc9oPqs
	 E8+xgvlP2JS/jl4ohqgZliTJrtTOffUAbDiIi1KOLt9MiuI6722Y4KNwILEgTRkn69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPCd6CYD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=He4GXGqW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BBF60A2611
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4BBF60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPCd6CYD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=He4GXGqW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwQB695024
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=noDcCoJfo1T
	OjWUuqjic1mU5Y/HKWbo7Pjs3rDdTH0w=; b=UPCd6CYDOlgf2PJ8Hq0dfmG8Wqh
	Ur/R8UwhSrF+C/kjMzIc05dGKS2KvB6k983QAE00fzk2nn2EXYEFjjLOxwlU9387
	sFdL1yrPZZ+PbhRl83crAayLBRhSZGegpbP89XHM8wsUTiECc/txoq/Y72Vhry0k
	TBOUwaa11I3sZkup8fdh3tG60HrsqH5iGeIXwPAvAUB03nBzkmvobgX0fZ5wuMPF
	YIdLJkrVnVraLF/6nyy9LkV+b+qKpBOFuM/zjC0ZNisp7Ctnh3JAQdLbWO0Yk9mA
	6Eg9uLuyRY9290zCXlydXBALHzSUh4Rt+hcDVB1rI6IHA4hDXVDQg095hAA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rjsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so6856982b3a.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684868; x=1796289668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noDcCoJfo1TOjWUuqjic1mU5Y/HKWbo7Pjs3rDdTH0w=;
        b=He4GXGqWlCcs1XuhMx9JfTKbavX726xTAOA4ZfAJYL9ehBFjAJkM8C/s58HbVFgxCg
         bEOMwrCbiPqU5Nrks2eY5a7DlJhUQIeCjILYwg8WO/LUYVQrytApPJKTWJMrjyEpVQmb
         cdDpyNBTtszNkn1j4mtf4itnMjh7UbHVELcSaJHb7hWRTYRIc5B4IsGHZv3aqMElsf62
         v+CcHvNsuyzMCB3EzTuN5IODq1CnXUtdW7dmA9nXPcytu2VgmDI+g5DK8Y63jdVNleWs
         dkuwig7EBdrDFxbKROA9Llw3u+a6T6Re+VVyejJeMvcXa0CIgHP9FxD1UyoPe9r0uETq
         XGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684868; x=1796289668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=noDcCoJfo1TOjWUuqjic1mU5Y/HKWbo7Pjs3rDdTH0w=;
        b=2KULyTIH03bzN3C76ZRlLoQwQlNDp5T0+zJ8I4asugUr5gVnndPUK0njWa12j6cGAo
         CZTvDhcPOcCIKW2I5B4IQeLhedrBWILaNx1cQzbH7/CPsfJyODd51Mqfxb5EVuqc/Exl
         ktqoXuQUEuPNbehsL4MvO/Jz6AQ5UlIBNArZsfAn5Hugi8H3G1HtMGhJZwjihDylus8v
         EkY6xXbHBLWl35nxUrcc7bokuyo1Gqat38yZCQtnPg2L97Mipo8aL+dYN78b3/IgjecI
         r/7GyAXxp1R40YPjH7hu4B75fImbYdDa5ga3s7zaMmDBsYMLa6tzUy/X8E1gWqtJf9u3
         lC0w==
X-Forwarded-Encrypted: i=1; AL+hErH2FYdGwDq7o3jmV3mlDFfeeDEeupNWviYcK9wiSpEzGd/wR7B6G2KcMCojxjMpTSB4tNzNFn1u+vHv/SOUeQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+AQzMzEYylrAr8T9du9PuDhxQtqvFpC7SXIXbbCIxnSpHWyO+8
	rzZTMJMGwOrXruzlzVrx68+e1xOMJBb9bRyXp8DBFHq7tKIsc7h57TNzHqPlZ6prfrcqdksaA6H
	RYh7xxra/LD7yjCDK7m2zLBhr9fq4gaHGPNhTEzneEEiTnqWHIs7y/WyBZBfLlTHZkJh1sg==
X-Gm-Gg: AZFdTZeveDR/geKFCX97lvwq275tPyYXFCpeqMK8wdO+p4/qjOMNGt0MHOd4yg3Z6lp
	VyKpqSnoGSBmmxogtt71GjAsVNv5J7CSSRpQzMVo/4D/5/F4U6zSzBYbfnbSVxrRYiGrWxtFgwu
	oFWCm7tIZYLgWsdeMyV52MR/PPOP66CcHIXVO8ODT9T/XiFVMMRwfkRPNUaMmchdLJjXOHagAKx
	ny75vVIP6yun+sno0K4dXikxJKPecXyhrBXg7LxhMArGXN4KVbANM2cYHriX0Gaa/cQtZADuVe7
	i5d+6xeiLMmMnmqRrBUgCHQDs35FthK6c+61pFmyGbmPFt8r99l9jq3o6KagDjnKUqplw1D3HzO
	rmROkn1GbUuKocjyM/Y0VFkbqDHX8TrHac1kQ8VV2FzGtdbDdzgHQxIW3xvy7rXVrfuwhxYCx8+
	N2mYmTldSWYSpUmIwSRICDPPfC0c3Ddm8=
X-Received: by 2002:a05:6a00:32ce:b0:8b1:af8c:73f4 with SMTP id d2e1a72fcca58-8c87bdb4c28mr20379286b3a.16.1795684867640;
        Thu, 26 Nov 2026 01:21:07 -0800 (PST)
X-Received: by 2002:a05:6a00:32ce:b0:8b1:af8c:73f4 with SMTP id d2e1a72fcca58-8c87bdb4c28mr20379267b3a.16.1795684867071;
        Thu, 26 Nov 2026 01:21:07 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:21:06 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 7/7] wifi: ath12k: handle MLO active link updates
Date: Thu, 26 Nov 2026 17:20:37 +0800
Message-Id: <20261126092037.462830-8-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX/VOZaAz3l+8n
 XQhLIp8+UIVK+yzwNId3xvXPN7J+9JfWaxl0ehlk1NXoCvWiNWNPOC5QQTimvFriQ9Vhz94a++L
 B+pDfqVqPUueF26DuiP7PMeAFgfEXYg=
X-Proofpoint-GUID: tu4KKP6EGS3Q7391pCaUd6cY2mO2Gdso
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXxqk5R1/iOvo6
 8Gwqy+DhHb4lk0COtEaFNN7aQzYTjqjdEpe5SS3enTrNEicOQ6E1faTHzIbIYOd3JjppDVKsdlA
 +cnJOJx/c6OjqXZCKQGRvSgVKDtrPXVNMjzoFYq2pcFzfSqezw6KCoWMmS7UcCvDAHNsf8QOcPK
 FdNntRV0jrtpPORB6wFG+hANko4WCJwlIF0pO+Ut8wB9COh9AkH+K45IbRSEIDTT86qQ/AqNyd0
 d8tIN9AvSwVzvJiE8yt/seX2rELdnFzfpCx61es59r6M5fmZOhSYRZnmuLJiNypZ13KlEw6hGmq
 sCL+7rTb1Ux1JHal/ADizM143/fwLbHXYJeFCKJGzk509XxWY6XlojBhlzrsrC3d3UN4DmAq5Ct
 JjiQo2XZ2L5ASQkzhiLiwEn48HGlKkd0NeD/QPt6hL2xPZ0IdLhQ00lYWtjyCRHTOJe1UExP16t
 FglUACEea5eOXK+KcZw==
X-Proofpoint-ORIG-GUID: tu4KKP6EGS3Q7391pCaUd6cY2mO2Gdso
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07fa04 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cAhsaRmiovNJmrqcDNoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260036

ath12k_mac_op_change_sta_links() handles both valid-link and active-link
changes from mac80211. For an active-link change, old_links and new_links
are the active sets. The callback returned early whenever new_links was
smaller than old_links, and outside connect nothing sends an active-link
command to firmware. So when an associated MLO STA deactivates a link,
e.g. active links 0x5 -> 0x1, firmware keeps link 2 active while
mac80211 has already released its channel context.

Sync the active links to firmware from the callback once the STA is
AUTHORIZED:

- Create link STAs for sta->valid_links instead of new_links. Firmware
  cannot remove a single link sta, so removals are only logged and are
  left to STA removal.
- Take the active set from channel contexts: a link with a link STA and
  a link vif is active if it holds a chanctx, inactive otherwise.
  mac80211 releases the chanctx of a deactivated link and assigns one to
  a newly activated link before it calls the callback.
- Send WMI_MLO_LINK_SET_ACTIVE only when this set differs from the one
  last programmed, cached per vif. Send it to each device that holds
  vdevs of the STA, with that device's links, and wait up to 5 seconds
  for each response. Two active links on the same MAC use
  INACTIVE_LINK_NUM, as at connect, and that command is not waited for.
  Update the cache only if all devices succeed, so a failed sync is
  retried on the next callback.
- Reset the cache on ASSOC -> AUTHORIZED, so the first sync after each
  (re)connect is always sent. This also covers hw restart, where
  mac80211 replays the station state transitions.

If the device crashes while a request is pending, the waiter still holds
the wiphy lock. ath12k_core_pre_reconfigure_recovery() therefore releases
the waiter before it takes the lock, otherwise recovery stalls until the
timeout expires.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  15 ++
 drivers/net/wireless/ath/ath12k/core.h |  20 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 251 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c  |   9 +-
 drivers/net/wireless/ath/ath12k/wmi.h  |   1 +
 5 files changed, 281 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 719200759ca0..1cd5ea4b43e8 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1524,6 +1524,19 @@ void ath12k_core_halt(struct ath12k *ar)
 	idr_init(&ar->txmgmt_idr);
 }
 
+static void ath12k_core_abort_mlo_link_set_active(struct ath12k_base *ab)
+{
+	struct ath12k_mlo_link_set_active_req *req;
+
+	rcu_read_lock();
+	req = rcu_dereference(ab->mlo_link_set_active_req);
+	if (req) {
+		req->status = -ESHUTDOWN;
+		complete(&req->done);
+	}
+	rcu_read_unlock();
+}
+
 static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
@@ -1538,6 +1551,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 	if (ab->is_reset)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
+	ath12k_core_abort_mlo_link_set_active(ab);
+
 	for (i = 0; i < ag->num_hw; i++) {
 		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF ||
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7c7057468916..74f184d283b7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -401,6 +401,12 @@ struct ath12k_vif {
 	struct ath12k_link_vif deflink;
 	struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
+	/*
+	 * Last active/inactive link state programmed to firmware via
+	 * WMI_MLO_LINK_SET_ACTIVE. Zero means unknown: forces a resend.
+	 */
+	u16 fw_active_links;
+	u16 fw_inactive_links;
 	/* indicates bitmap of link vif created in FW */
 	u32 links_map;
 	/* Must be last - ends in a flexible-array member.
@@ -797,6 +803,12 @@ struct ath12k {
 	} incumbent_signal_interference;
 };
 
+struct ath12k_mlo_link_set_active_req {
+	struct completion done;
+	int status;
+	struct rcu_head rcu_head;
+};
+
 struct ath12k_hw {
 	struct ieee80211_hw *hw;
 	struct device *dev;
@@ -1153,6 +1165,14 @@ struct ath12k_base {
 #endif /* CONFIG_ACPI */
 
 	struct ath12k_hw_group *ag;
+
+	/*
+	 * Set-active request in flight to this device, NULL when idle. Freed
+	 * via kfree_rcu(). The links of an MLO STA can be on several devices,
+	 * and each device is programmed separately, so at most one request is
+	 * outstanding per device.
+	 */
+	struct ath12k_mlo_link_set_active_req __rcu *mlo_link_set_active_req;
 	struct ath12k_wsi_info wsi_info;
 	enum ath12k_qmi_firmware_mode fw_mode;
 	struct ath12k_ftm_event_obj ftm_event_obj;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d50148fe761d..0bd7e10420e3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7678,6 +7678,8 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
 	u8 num_mlo_vdev = 0;
 	u8 link_id;
 
+	lockdep_assert_wiphy(hw->wiphy);
+
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
 		/* make sure vdev is created on this device */
@@ -7993,6 +7995,14 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION &&
 	    old_state == IEEE80211_STA_ASSOC && new_state == IEEE80211_STA_AUTHORIZED) {
+		/*
+		 * The cached active link state is only updated while AUTHORIZED,
+		 * so reset it on each ASSOC -> AUTHORIZED. The next active-link
+		 * sync then sends the state to firmware.
+		 */
+		ahvif->fw_active_links = 0;
+		ahvif->fw_inactive_links = 0;
+
 		for_each_ar(ah, ar, i) {
 			ab = ar->ab;
 			if (prev_ab == ab)
@@ -8256,6 +8266,204 @@ static struct ath12k_link_sta *ath12k_mac_alloc_assign_link_sta(struct ath12k_hw
 	return arsta;
 }
 
+static struct ieee80211_chanctx_conf *
+ath12k_mac_link_chanctx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			u8 link_id)
+{
+	struct ieee80211_bss_conf *link_conf;
+
+	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
+	if (!link_conf)
+		return NULL;
+
+	return wiphy_dereference(hw->wiphy, link_conf->chanctx_conf);
+}
+
+struct ath12k_mlo_dev_links {
+	u8 active_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
+	u8 inactive_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
+	u32 active_freq[IEEE80211_MLD_MAX_NUM_LINKS];
+	unsigned int num_active;
+	unsigned int num_inactive;
+};
+
+static u16 ath12k_mac_mlo_vif_active_links(struct ieee80211_hw *hw,
+					   struct ieee80211_vif *vif,
+					   unsigned long links)
+{
+	u16 active = 0;
+	u8 link_id;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (ath12k_mac_link_chanctx(hw, vif, link_id))
+			active |= BIT(link_id);
+	}
+
+	return active;
+}
+
+static void ath12k_mac_mlo_sta_collect_dev_links(struct ieee80211_hw *hw,
+						 struct ath12k_vif *ahvif,
+						 struct ath12k_base *ab,
+						 unsigned long links,
+						 struct ath12k_mlo_dev_links *dl)
+{
+	struct ieee80211_chanctx_conf *conf;
+	struct ath12k_link_vif *arvif;
+	u8 link_id;
+
+	dl->num_active = 0;
+	dl->num_inactive = 0;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		if (!arvif || !arvif->is_created || arvif->ar->ab != ab)
+			continue;
+
+		conf = ath12k_mac_link_chanctx(hw, ahvif->vif, link_id);
+		if (!conf) {
+			dl->inactive_vdev[dl->num_inactive++] = arvif->vdev_id;
+			continue;
+		}
+
+		dl->active_freq[dl->num_active] = conf->def.chan->center_freq;
+		dl->active_vdev[dl->num_active++] = arvif->vdev_id;
+	}
+}
+
+static bool ath12k_mac_mlo_dev_same_mac(struct ath12k_base *ab,
+					const struct ath12k_mlo_dev_links *dl)
+{
+	return dl->num_active == 2 &&
+	       ath12k_mac_freqs_on_same_mac(ab, dl->active_freq[0],
+					    dl->active_freq[1]);
+}
+
+static int ath12k_mac_mlo_sta_send_inactive_link_num(struct ath12k_base *ab,
+						     struct ath12k_mlo_dev_links *dl)
+{
+	return ath12k_mac_mlo_sta_set_link_active(ab,
+						  WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
+						  WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM,
+						  NULL, dl->active_vdev, dl->num_active,
+						  NULL, 0);
+}
+
+static int ath12k_mac_mlo_sta_send_set_active(struct ath12k_base *ab,
+					      struct ieee80211_vif *vif,
+					      struct ath12k_mlo_dev_links *dl)
+{
+	struct ath12k_mlo_link_set_active_req *req;
+	enum wmi_mlo_link_force_mode mode;
+	int ret;
+
+	req = kzalloc_obj(*req);
+	if (!req)
+		return -ENOMEM;
+
+	init_completion(&req->done);
+	rcu_assign_pointer(ab->mlo_link_set_active_req, req);
+
+	mode = dl->num_inactive ? WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE :
+				  WMI_MLO_LINK_FORCE_MODE_ACTIVE;
+
+	ret = ath12k_mac_mlo_sta_set_link_active(ab,
+						 WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
+						 mode, vif->cfg.ap_addr,
+						 dl->active_vdev, dl->num_active,
+						 dl->inactive_vdev, dl->num_inactive);
+
+	if (!ret && !wait_for_completion_timeout(&req->done,
+						 ATH12K_MLO_LINK_SET_ACTIVE_TIMEOUT_HZ)) {
+		ath12k_warn(ab, "timeout waiting for mlo set active links resp\n");
+		ret = -ETIMEDOUT;
+	}
+
+	if (!ret && req->status)
+		ret = -EIO;
+
+	rcu_assign_pointer(ab->mlo_link_set_active_req, NULL);
+	kfree_rcu(req, rcu_head);
+
+	return ret;
+}
+
+static int ath12k_mac_mlo_sta_sync_active_links(struct ath12k_hw *ah,
+						struct ath12k_vif *ahvif,
+						struct ath12k_sta *ahsta,
+						struct ieee80211_sta *sta)
+{
+	struct ath12k_base *ab, *prev_ab = NULL;
+	struct ieee80211_hw *hw = ah->hw;
+	struct ath12k_mlo_dev_links dl;
+	unsigned long links;
+	u16 active, inactive;
+	struct ath12k *ar;
+	int ret;
+	int i;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	links = ahsta->links_map & ahvif->links_map;
+
+	/*
+	 * A link holding a channel context is active. The links of an MLO STA
+	 * can be on different devices, so the active set is derived over all
+	 * links and each device is then programmed with the links it holds.
+	 */
+	active = ath12k_mac_mlo_vif_active_links(hw, ahvif->vif, links);
+	inactive = links & ~active;
+
+	if (!active) {
+		ath12k_hw_warn(ah, "no active link for sta %pM\n", sta->addr);
+		return -EINVAL;
+	}
+
+	if (active == ahvif->fw_active_links &&
+	    inactive == ahvif->fw_inactive_links)
+		return 0;
+
+	for_each_ar(ah, ar, i) {
+		ab = ar->ab;
+		if (ab == prev_ab)
+			continue;
+		prev_ab = ab;
+
+		ath12k_mac_mlo_sta_collect_dev_links(hw, ahvif, ab, links, &dl);
+
+		if (!dl.num_active && dl.num_inactive) {
+			ath12k_info(ab,
+				    "cannot deactivate all STA links on a device\n");
+			return 0;
+		}
+	}
+
+	prev_ab = NULL;
+	for_each_ar(ah, ar, i) {
+		ab = ar->ab;
+		if (ab == prev_ab)
+			continue;
+		prev_ab = ab;
+
+		ath12k_mac_mlo_sta_collect_dev_links(hw, ahvif, ab, links, &dl);
+
+		if (!dl.num_active && !dl.num_inactive)
+			continue;
+
+		if (ath12k_mac_mlo_dev_same_mac(ab, &dl))
+			ret = ath12k_mac_mlo_sta_send_inactive_link_num(ab, &dl);
+		else
+			ret = ath12k_mac_mlo_sta_send_set_active(ab, ahvif->vif, &dl);
+		if (ret)
+			return ret;
+	}
+
+	ahvif->fw_active_links = active;
+	ahvif->fw_inactive_links = inactive;
+
+	return 0;
+}
+
 int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
@@ -8263,26 +8471,22 @@ int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	unsigned long to_create, to_remove;
 	struct ath12k_hw *ah = hw->priv;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_link_sta *arsta;
-	unsigned long valid_links;
 	struct ath12k *ar;
+	int ret = 0;
 	u8 link_id;
-	int ret;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	to_create = sta->valid_links & ~ahsta->links_map;
+	to_remove = ahsta->links_map & ~sta->valid_links;
+
 	if (!sta->valid_links)
 		return -EINVAL;
 
-	/* Firmware does not support removal of one of link stas. All sta
-	 * would be removed during ML STA delete in sta_state(), hence link
-	 * sta removal is not handled here.
-	 */
-	if (new_links < old_links)
-		return 0;
-
 	if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
 		ath12k_hw_warn(ah, "unable to add link for ml sta %pM", sta->addr);
 		return -EINVAL;
@@ -8292,11 +8496,17 @@ int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 	if (WARN_ON(ahsta->links_map == 0))
 		return -EINVAL;
 
-	valid_links = new_links;
-	for_each_set_bit(link_id, &valid_links, IEEE80211_MLD_MAX_NUM_LINKS) {
-		if (ahsta->links_map & BIT(link_id))
-			continue;
+	/*
+	 * Firmware does not support removal of one of link stas. All sta
+	 * would be removed during ML STA delete in sta_state(), hence link
+	 * sta removal is not handled here.
+	 */
+	if (to_remove)
+		ath12k_generic_dbg(ATH12K_DBG_MAC,
+				   "ignoring link sta removal 0x%lx for %pM\n",
+				   to_remove, sta->addr);
 
+	for_each_set_bit(link_id, &to_create, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
 		if (!arvif || !arvif->is_created)
 			continue;
@@ -8318,7 +8528,20 @@ int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 		}
 	}
 
-	return 0;
+	/*
+	 * Active-links are only meaningful once the sta is authorized. Before
+	 * that, the connect path in sta_state() programs firmware.
+	 */
+	if (sta->mlo && vif->type == NL80211_IFTYPE_STATION &&
+	    ahsta->state == IEEE80211_STA_AUTHORIZED) {
+		ret = ath12k_mac_mlo_sta_sync_active_links(ah, ahvif, ahsta, sta);
+		if (ret)
+			ath12k_hw_warn(ah,
+				       "failed to sync mlo active links for sta %pM: %d\n",
+				       sta->addr, ret);
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL(ath12k_mac_op_change_sta_links);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7e06dbb1e884..8d4938ff3163 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -9716,6 +9716,7 @@ static void ath12k_wmi_event_mlo_link_set_active(struct ath12k_base *ab,
 						 struct sk_buff *skb)
 {
 	const struct wmi_mlo_link_set_active_resp_event *ev;
+	struct ath12k_mlo_link_set_active_req *req;
 	u32 status, use_ieee;
 	const void **tb;
 	int ret;
@@ -9740,7 +9741,13 @@ static void ath12k_wmi_event_mlo_link_set_active(struct ath12k_base *ab,
 		   "mlo link set active resp status %u use_ieee 0x%x\n",
 		   status, use_ieee);
 
-	/* Response delivery to waiters will be wired up in a subsequent patch */
+	rcu_read_lock();
+	req = rcu_dereference(ab->mlo_link_set_active_req);
+	if (req) {
+		req->status = status;
+		complete(&req->done);
+	}
+	rcu_read_unlock();
 }
 
 static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 6d590b30ecbe..7b18de37f0bf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3030,6 +3030,7 @@ struct ath12k_wmi_ssid_params {
 } __packed;
 
 #define ATH12K_VDEV_SETUP_TIMEOUT_HZ (5 * HZ)
+#define ATH12K_MLO_LINK_SET_ACTIVE_TIMEOUT_HZ (5 * HZ)
 
 enum wmi_vdev_mbssid_flags {
 	WMI_VDEV_MBSSID_FLAGS_NON_MBSSID_AP	= BIT(0),
-- 
2.34.1

