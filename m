Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292843;
	b=1tww3psKZTE0bf2fHxT25Ka/WzDW++U67l/XrGEljfnaLmQVrBoHUsj6EwjFI8gErVJC
	 R5EftrI/6RUk3G8UjYbJ4DaIujvZN3uYr3kN/4tYbW9i3DBmboUL1o86DSAMRKDcWtaRD
	 2nLyiUjlE5Ys6ULw3wUOTMjT4L9FiCMPZBLciqBQYjswWNWA3NNziwEsnVIr1MltZUJ1z
	 BH5EYI3yukMd55CwDDWMaDxWb1QLsuucB25DegCd/HqR/h1QjNgXRrxl1hFrzOnHWMpjX
	 xle/wjzD4l4iUX3ITVj/mt3qxqaK7eML2cj0trJSySyG9Ho+xihi4OC1gJPJrWNL/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=;
	b=wjKDzTWZWNbEkjuns3mgInpfzxWsMgD43wPR4P0trShWLXpC7XVslQu3KOK8PFeX5Fcf
	 QzNxfNmR9oebot1fOn231IYhF+blVWs1CyfFQmbHjg+iP8ipTimVFk1TGHxB+TEmYdcLY
	 JzAEv5rXB8SdOfSwlM7j4wZhxT+R4wpeHs0WLznoawnQDNgLU1sQJ8PD66/FXgirObFhi
	 I9NiEIiKMFmeBkZp+7+Z1ZCO/sLhRV4ltjrwjShBbCsB9MoSzyomdVKwqaUoo0OBhH8UV
	 KPJPp7vn//6NhQF7/J+l6trgnf6D2PwHc+eWc9iI/voK9kZGBX3fbrW+eNMFgFLTEHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mg3Ozsn4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ClzCJUbp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B8C606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B8C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mg3Ozsn4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ClzCJUbp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AIGS2275742
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=; b=mg3Ozsn4R3ha6X4E
	8vnmZSIqLTNp2Bd50OkjRI2WgLdUOfwDLt6fD5B817tLvOG6RGdnG6AQj+JKEHza
	YrAmgcyzZkdm1xRcEj5CJqkznZ7cwrFancBy3NwFhhvQcV1s3aGMma3DYZpO3xEm
	RWi4Her0MV0bjgNFrsn1cc4pahF3JUmxaRAxjWJcGJuwenWbBgvyA5Z4kP9EvkCe
	LLzWiLdPg4jJtZJQwdTm9AzwUVdI9ztio/6v7NkJhXlUMQmAeAOwwR7V5pTv7Dpo
	X0Hu0I64slVahXoTz2Xne0NaPxsxmUaOLneLWmywT+/X3OpwVL8nw7+kYSDv9EAg
	Rb/bdQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bx11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09a466295so1436725a91.2
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292841; x=1794897641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=;
        b=ClzCJUbpjzGgs5ubv6Zi+xLiNU86a4DBEd9cKGo+DnX0mSmp3dNnf5HaoA0J63VpwM
         FKI8Q/bobfbFjnr/p21zKJCV7Ud82SElmosk48sT23cHziPH40XJ51mUx88M61ZTsLfx
         WitpJCe5tgMhIhlWQPZ7SRmDH2VJtxFiiRGFMdZOj7BMzPQau9DKjs2VtcupQ2x2q38D
         XkeLCkR52DQOdzY8wlqrFb4HJWgFYcaJJ6FFBwWue4BAGIvmdzsxgnrN4qgJQMiG6h7Y
         H+XJCko+nL3gd9pu6ir1pXS+nljqOfz9w75ViHK5mhOGqPFvEtHW9xcvcZu8Zw0HvLEr
         PESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292841; x=1794897641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=;
        b=V1t0wuCEXFuwWXSAByTAB8BVEQGU8I7DEhUgPapMW9b1rEkoQu8uDFRCowBC8N7CLm
         wiJzgbZMFUu+LkKgfHy3McduM4VBR0R8u258UnF0UWgzcu/7+IM7qcPNwdjRHDOKkTPD
         o3JUJe0L8jM3cOAW82FnGaM4QXzWuV0oUO/a+jY1nn3UyEk+vUSRxP+QzXZeH+LjM4pp
         EHHAuW96WT1QxpUNzKTCmN0hEmTzAP9la9yw05A1R9SCYOCIpETu1Xup1jiNGqBzHDa2
         czEhLfP7NYBOczQI81QrlVf0Tte3s8nkjDxMetDxujLSJtCPi1tCKclajuQ7xmMnK+iu
         ateQ==
X-Gm-Message-State: APuU4Z9bnu1fUqlcogbDOYSgQYzN7WU1rQfJ/SAKrB3x2ykXeCTS+ufT
	GT6FugkCoyGz84Q+zcJsAJRba8EEtT26pz0Fjd2DrfSLP3RJOD1JHysVAHkXfm6BOPPXw4CzElG
	x9fZ9kQTXUZPMpb0S5BDUPCE0Owuc1Iu80ozC+yHQAiRQAFiayJdgZcicvwGN/TXWuZFLLMcbU+
	228Q==
X-Gm-Gg: AYBFou229lm9kPfIMjHSVqVubvSW8t3Mb28Dwa9b6pzkKlwvmRVrwHglB99PX3m/IG5
	ojKgF3vWcoAUfTQ34JdE1wSTRgozTrzWKHEESdJbyHGBdjVq256pJ96Vdm9R+OJUQFB1mylEJPj
	o0PUvlgXntrA/kKjJKSpDVBpb9UEyvEEFbd1CQYtCKUqfYpJwjCcH0sc/u0Xj7LBlDALDdrLKjd
	WADXYOVBrAFZAleakOy0+YgoTdPv+PTZf09JfxZ5HRAPwIlqd4E5cceNbXbqofTHPig89RKqMFn
	y8XTRbAgwY/5RYmbaR+j9GSUwHK3ledtCctsHvh5tbKFXxYYraJ2h3NM/OMAAMAc1tsD4ml5VIb
	qXn9yL9OzNS4JVNtjm+5sczlG4EQprc7qjiAa5mL+a08yEBiFuOEwXuke9DIy04+TSHrOnzSqLJ
	KpZ6HhO5rjr7GZmHeE9g/EeG7LC9+/fA==
X-Received: by 2002:a17:90b:3c46:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b166c93350mr1651007a91.11.1794292840591;
        Mon, 09 Nov 2026 22:40:40 -0800 (PST)
X-Received: by 2002:a17:90b:3c46:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b166c93350mr1650998a91.11.1794292840101;
        Mon, 09 Nov 2026 22:40:40 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:39 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:23 +0800
Subject: [PATCH ath-next v5 02/11] wifi: ath12k: skip hw link id match for
 devices without hw link id support
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
Message-Id: <20261110-ath12k-logical-link-id-v5-2-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: RrBnMRiJWalkDSnjyfm-4buDkTJq1U3k
X-Proofpoint-GUID: RrBnMRiJWalkDSnjyfm-4buDkTJq1U3k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX8um7fZ6AyKW3
 dScyJEuCFqNHKdwzoUzIs8Y/NP1eUn/wUEcvisc7bWFGC3pI/wTUBcp/DX2JdQoAeMeeDSt7PGb
 lmCoh7EaGy4KrYm9IU1unT7x3v52t+E=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2bc6a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=71Z9w-pHtoC7iivNk9kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1Zt7uafqxEA7
 rmlegDtMbksEH7kz0DZyPZjRPI6pHNUu72PehjQpg5RzOnIZ4u1o+xK/bTEOcHdEYyyqaQDbiL0
 p+uH9L0R2WMkBX0u4jVL7LYE4ItTMY8HV+9AqwPsoZtGsJt7pSd1nh9V8AR0r0LT8oZjmWdA01+
 yopPEi3gIzDK6dhaNeNRt9uJoeKEyaA3UDvCc6j9yN0tn/OjXIx/gfdI6ap1Uyvr4kmpu4XIGS8
 BvWhTHlXb8x9K2Qdebsh9uKSxBpaWXYSVWzH8kzbRaIFIZGjsssscyYhZoC6rylsCYI2PdCZM9P
 ftg9yYdKQMArjxr/iO5Q9LnFZfNkpGPUjpgULTqWRzgK4GJ1tu/BjQL90egsrHRXaFYYNnWlxsY
 fTHdeuQVQaSR5nodaSJU5d1uA/fzdqUAc87Q+kX8b4R3hxbRAjO3h2dvXUvXLnv195Yx/aU6zwY
 ATbGku4xp871pCfZMPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

ath12k_dp_link_peer_assign()/unassign() maintain an address-keyed
rhashtable of link peers. To handle the split PHY and roaming scenario,
where two pdevs share the same rhashtable and an address may still be
present under a different hw link, both functions compare the stored
hw_link_id against the one being assigned to decide whether the existing
entry belongs to this link before adding or removing it.

hw_link_id is only used by QCN9274, IPQ5332 and IPQ5424, QCN6432; WCN7850
and QCC2072 do not use it and rely on the logical link id instead. Also
such devices are single pdev and never hit the split PHY/roaming case, so
the disambiguation is unnecessary; keeping it would also break the logical
link id support added in subsequent patches.

Add a support_hw_link_id hardware parameter and, for devices that do not
support hw_link_id, add or remove the rhashtable entry directly. Devices
supporting hw_link_id are not affected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c  | 48 +++++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/hw.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 14 +++++++++
 3 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 100b398cf868..102e67109ab0 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -557,25 +557,29 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
-	/*
-	 * In case of Split PHY and roaming scenario, pdev idx
-	 * might differ but both the pdev will share same rhash
-	 * table. In that case update the rhash table if link_peer is
-	 * already present
-	 */
-	temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-	if (temp_peer && temp_peer->hw_link_id != hw_link_id)
-		ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
-
-	ret = ath12k_dp_link_peer_rhash_add(dp, peer);
-	if (ret) {
+	if (dp->hw_params->support_hw_link_id) {
 		/*
-		 * If new entry addition failed, add back old entry
-		 * If old entry addition also fails, then nothing
-		 * can be done, simply proceed
+		 * In case of Split PHY and roaming scenario, pdev idx
+		 * might differ but both the pdev will share same rhash
+		 * table. In that case update the rhash table if link_peer is
+		 * already present
 		 */
-		if (temp_peer)
-			ath12k_dp_link_peer_rhash_add(dp, temp_peer);
+		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
+		if (temp_peer && temp_peer->hw_link_id != hw_link_id)
+			ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
+
+		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
+		if (ret) {
+			/*
+			 * If new entry addition failed, add back old entry
+			 * If old entry addition also fails, then nothing
+			 * can be done, simply proceed
+			 */
+			if (temp_peer)
+				ath12k_dp_link_peer_rhash_add(dp, temp_peer);
+		}
+	} else {
+		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
 	}
 
 	spin_unlock_bh(&dp->dp_lock);
@@ -621,10 +625,14 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
-	/* To handle roaming and split phy scenario */
-	temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-	if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+	if (dp->hw_params->support_hw_link_id) {
+		/* To handle roaming and split phy scenario */
+		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
+		if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+			ath12k_dp_link_peer_rhash_delete(dp, peer);
+	} else {
 		ath12k_dp_link_peer_rhash_delete(dp, peer);
+	}
 
 	spin_unlock_bh(&dp->dp_lock);
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index fb807d5a6ae4..41dca4cc6d4f 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -246,6 +246,8 @@ struct ath12k_hw_params {
 	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
 	 */
 	bool hybrid_bus_type;
+
+	bool support_hw_link_id;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 67c6fa79f859..76f40073e002 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -499,6 +499,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -596,6 +598,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -689,6 +693,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -776,6 +782,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -874,6 +882,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -964,6 +974,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1051,6 +1063,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = true,
+
+		.support_hw_link_id = true,
 	},
 };
 

-- 
2.25.1

