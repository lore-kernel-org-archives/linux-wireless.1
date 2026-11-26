Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658863;
	b=VY2FTREiZT7qHdAnCs2fFqTWX5XbtCv3S6vEfBYhEdAFs7Wx+disnA0VpOwHXsgIgxeG
	 dT3qFtBkjPMp4dXdn3z3NNAyJCPi6HrVrb7OOa5torHC3/5JFMBRNGMdtwRB0JiWlJWSx
	 4phHfP3zzTqkJSLvGeoCepgQXY79ptTEcCiZw0yHanSnJ/ljzQqE4JWMWvweC30kuvZyD
	 80HwmLJjDGCrUm/Us05siEKF3nfAQxNT2P4VA6lDV+HctH4U5xE5Wq0lW3VSih8QWEmfg
	 MP34RkbU67Oy3BLitLDNc5zRASKYBFeQbK+o4D26xnrV98lYwQosiOe3iT91Rnxepow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
	b=jNGbgya4Osdc7r7ZRjLRnl+DgWRRO8NXqTdUJAXEwUbwlsKqMqFkkWI+lE2QJLyagDEZ
	 ycEMk+ICz+j0In3nNe20HCou8BSOv3TJpHSMXTsntPEKLMoEMiTJdfaRA0fxqMlfEwVTY
	 1K6+PdRu552O1vRmY+mv7kE9iHq3XEhRyK/0AAC0547/cX/9ljQjJsYiDarUHKZr/9TGY
	 3IePvogvzrQTcOSW1gyqQdIvRWlP+8IeS39lRB/oevKhYlVn981/udGwRVsmR0dORu1FX
	 ygEFpOKDL2OyGbjljBWhTyxec7W36GnoDxs0D2gt13pHYVaPagryw6/AO3Cj5psQleQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvfnQzc5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JjuOCdOM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F078C606A680
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F078C606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvfnQzc5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JjuOCdOM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAntU1357571
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z2t65+X6bE5
	g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=; b=RvfnQzc5PTyXzRIxb60sbMdeVYx
	vgOwpaaCkax6zHTH3+bth5WtsxaugXvhqyTom1/yX3jNBQzZK7NGCIVzmHKvgZE6
	+2iqFDQm+u36/uhBTL/KcnCFVF4EOSMFkiDfOCrkXPXAvugrXb7qd2QFtblDtX57
	TblLmrMF7pad/Q2Uazihfiob1iXZQtElPQpSp2Q2uZHVf5smxY8VdbeklS0/Il4m
	ibAyJaffNQZ3ytC3cxr+qo8h4DwrvyLjgibsZXk0f3iCwH4lJed84KA3l2sYfwRk
	ZEZpHdXd/POVjpX1j8vEQptAaJG7YycUc1WQgI0xkxXEpIwJ5JhXKr/5jMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxtshh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso5787118a91.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 18:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658861; x=1796263661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
        b=JjuOCdOMSz8YnuZwa9ofDEHpnqve4fcOphYQBtR1oKuHDFxZiFrH5VPS6B8A43Row4
         KBKmDLi5N8oqGYIHaeo13pzpXPnkbWIbGXtdQmClyhsYwTAadvDBE2rPbBRzm9K7gvyM
         wL2RjvRKrBiiREiDDy4yrf3VdQSR60i/m5jzmdKsaV6oD0QVDfeBVl9sBbWDKCfduGgn
         tF6Q8DLQJZjVc3qRmz7dIo5p3QIBEF0UCjnGVXxDuS2IHKgtT7GlLM1f7yEN/amzQCLs
         yxmU33k984XVp0oROLDUaxV8n/I80BYPa2E0cMA1SaC92+adPk1iFXoAVfS642UsRzA9
         PzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658861; x=1796263661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
        b=krQi5Icbs8LBCcnJiG06T+6PE61XJAsSLeOS5yDah5GqsAcaLSjVWTu0bvYWVkGi8w
         7X9wrvsde5jXglMrSGDxW18B7UyRvXsyGMZ9JyNWLNMVkAth2U6ididftTOWPk5YTX2s
         kAZUbu0OkPev59FQVeKkBiXEMSEi4njdhOngNN5iwrbYJNLB3POqwWwKgqksv02SXCJ1
         a25/LDxU1sMRcX0dboOhDPH9ML9WLpxop42hP8lt9aVO49WCNol8oWcoHGjH5Dho7elr
         H+QEkT4nNP2RLAcU8BnFvu/bJ5Bxw3QJTD4hgE7IAKPMcex7GCzsZFDmTwnyn2UiW6tj
         1TPA==
X-Forwarded-Encrypted: i=1; AL+hErFcxtRYOeFo48+XaWtIXVjHPTQM8tJqgOGyDPuVbbgNxkRrO1qwHqdlfCM0JulVbKIujNb9xnuLewlHJqiXJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/yijZSZfTq/GC3svOmYhTAkPVwwJMi67SiIMNKJDcAWJwkP8zU
	pF6oSmpwrIflkHef3P1mQrgM7pM/DoqDM8zs83zr+bLT/bUoP0G8X98gJ5UR9t/5uo2TW5Via2I
	9lR7/oEApUnB1JIqI5n+iKd/IM8SoVbwH7FQOR/1JxcOpa8wdYTknUBI/TLArgFIn6UtgMA==
X-Gm-Gg: AZFdTZdONnYlh8nMO+wO6iEaicJZWuViFlmxSGfJlQhi4E7D4aONd67t6lb5yMaH3HL
	SPOmzcjt01BqpBGktBSnYQ582VhXmUd7pJdy83r/gJjutP0oV0hO/Esy6T6+YqJsn5GFky5j/VD
	fUXTvTHMN+b5HTkYkNyuH0bRSEMiOH+xY7nTHEGlWPmB6B/TMnR47Az5A9sNMSmxMvwo7EkOwwq
	2EjXe/4RCSuAdtW1Hvaq9kdKk9L2paQ/efSg39JYaTHDaLOD3tIn6TE44iNUrnhUA7cSTgjHqiP
	hsTBZVu8dnLqhujb8pmZANJAAB7b2RtyoGtXgix5EO0qIY2mZjpDr2Y0yXEjRqY/swSgRwwdlfB
	Ily2IhpY6pEI/c74QxGEQhFW+CzDBo1M3zzeVOz2rDhyPDhGZPUx3beawV74YYPMsU8Me7aJ7Rp
	TpGOsZ+6iiJHkRecxjvzvj/A01ZlfJfL+wW3e2
X-Received: by 2002:a17:90b:442c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b41c92c161mr13102295a91.24.1795658860368;
        Wed, 25 Nov 2026 18:07:40 -0800 (PST)
X-Received: by 2002:a17:90b:442c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b41c92c161mr13102266a91.24.1795658859644;
        Wed, 25 Nov 2026 18:07:39 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:39 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 3/6] wifi: ath12k: initialize per-wiphy MLO iftype ext capabilities
Date: Thu, 26 Nov 2026 10:07:24 +0800
Message-Id: <20261126020727.3273337-4-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
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
X-Proofpoint-GUID: HZT7XLfqrdHrBiRX1M8qW20s-xiKz53m
X-Proofpoint-ORIG-GUID: HZT7XLfqrdHrBiRX1M8qW20s-xiKz53m
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b07946d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PHNU0lTNFGNsHSJflXwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX/ZKmxFs+R0HK
 BVT+oNQ0bgaTuJQzcTFdLuaPWvfybQVuy23IQInUqm0q348ZIc9YUxMBCfXfhilF0WI68r0q/5d
 9/7urCOigPdmWZJGkCewj/+1zHZ2aa2q4C1Xauc6GWji1M2XkRSeq8XMQVs1WqE3+Pt6R/TKMmQ
 8VEgrOw5BDy0Z5j+TiRgUhhbwSF5M58fipztIyXVW8x4eglq4xIBay5TBfmmbGCCyPNCJ2NYt6G
 aeTwzGqvJofxEPr5TIyVJqj22fEys3rF2vbtswmoZ/nZIzOzDxSXlSVydUm1ssNFaj90tlkEL5/
 cwBI6RD4qvVMPhI0gm1Zd00xf0jgvXHhgWAWptDCtcJOy6hdyuAI/U8t7uQp+k3B2qHz6JwkaAX
 OmD9AX32R9Put/3djV9tuxRuB6HThPYC9gvsQo27dBvpd3LrlGxzbPJIxhjzCocvbMVFZmjNY6D
 kHezDpqzFxwZUtLg3ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX/lDqjebH1T47
 yXIZKliSTiBzWMldCvDNifKZNVZ2w31/sTcypWEbbt0xJjttxRMbZRnai6s3y+ANDsknr4bbS5h
 gQb8g1UGEbwK/6DENOTblUoBlZmW1Sc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

MLO iftype extended capabilities are currently stored in a single global
array ath12k_iftypes_ext_capa, shared by all ath12k_hw instances.
When more than one wiphy is registered, ath12k_mac_hw_register() on a
later wiphy overwrites firmware-derived EML/MLD capability fields used by
earlier wiphys, because mac80211 points all of them at the same storage.

Fix this by keeping iftype ext capability state per ath12k_hw/wiphy:
copy a read-only template into ah->iftypes_ext_capa during registration
and point mac80211 at the per-wiphy array.

Rename ath12k_iftypes_ext_capa to ath12k_iftypes_ext_capa_template to
make the data flow explicit: the table is immutable source data, while
ah->iftypes_ext_capa is per-wiphy capability storage.

ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX is set to 3 to represent the per-wiphy
entries ath12k publishes and updates: one generic entry
(NL80211_IFTYPE_UNSPECIFIED / iftype 0) and two role-specific entries
(STA and AP).

For MLO-capable wiphys, initialize station and AP entries from the
normalized firmware capabilities, preserving the existing capability
source.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d33bc467e832 ("wifi: ath12k: advertise MLO support and capabilities")
Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  4 ++++
 drivers/net/wireless/ath/ath12k/mac.c  | 28 +++++++++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..82aead52fcaf 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -42,6 +42,8 @@
 #define ATH12K_TX_MGMT_NUM_PENDING_MAX	512
 
 #define ATH12K_TX_MGMT_TARGET_MAX_SUPPORT_WMI 64
+/* Generic, station, and AP entries in ath12k_iftypes_ext_capa_template. */
+#define ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX 3
 
 /* Pending management packets threshold for dropping probe responses */
 #define ATH12K_PRB_RSP_DROP_THRESHOLD ((ATH12K_TX_MGMT_TARGET_MAX_SUPPORT_WMI * 3) / 4)
@@ -812,6 +814,8 @@ struct ath12k_hw {
 	struct completion peer_ml_id_done;
 
 	u8 num_radio;
+	struct wiphy_iftype_ext_capab
+		iftypes_ext_capa[ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX];
 
 	DECLARE_BITMAP(free_ml_peer_id_map, ATH12K_MAX_MLO_PEERS);
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cb41b8b1d3b..e78c711b7832 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14758,7 +14758,8 @@ static const u8 ath12k_if_types_ext_capa_ap[] = {
 	[10] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
-static struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
+static const struct wiphy_iftype_ext_capab
+ath12k_iftypes_ext_capa_template[ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX] = {
 	{
 		.extended_capabilities = ath12k_if_types_ext_capa,
 		.extended_capabilities_mask = ath12k_if_types_ext_capa,
@@ -15051,12 +15052,25 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	wiphy->features |= NL80211_FEATURE_TX_POWER_INSERTION;
 
-	/* Copy over MLO related capabilities received from
-	 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
+	memcpy(ah->iftypes_ext_capa, ath12k_iftypes_ext_capa_template,
+	       sizeof(ah->iftypes_ext_capa));
+
+	/*
+	 * Copy over MLO related capabilities received from
+	 * WMI_SERVICE_READY_EXT2_EVENT if mlo_capable is set.
 	 */
 	if (ab->ag->mlo_capable) {
-		ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
-		ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
+		for (i = 0; i < ARRAY_SIZE(ah->iftypes_ext_capa); i++) {
+			enum nl80211_iftype iftype = ah->iftypes_ext_capa[i].iftype;
+
+			if (iftype != NL80211_IFTYPE_STATION &&
+			    iftype != NL80211_IFTYPE_AP)
+				continue;
+
+			ah->iftypes_ext_capa[i].eml_capabilities = cap->eml_cap;
+			ah->iftypes_ext_capa[i].mld_capa_and_ops = cap->mld_cap;
+		}
+
 		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 
 		ieee80211_hw_set(hw, MLO_MCAST_MULTI_LINK_TX);
@@ -15083,8 +15097,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->cipher_suites = cipher_suites;
 	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
 
-	wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
-	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
+	wiphy->iftype_ext_capab = ah->iftypes_ext_capa;
+	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ah->iftypes_ext_capa);
 
 	wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
 	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
-- 
2.25.1

