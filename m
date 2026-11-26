Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658864;
	b=iFSydPm8ONN/eWleUp5XVlqO6DyFuv2j2FB7AXTAn3yJLWWQDWAAG/7sNZ1+59RydO1B
	 gKOwpmxvPmeurKgniqV6DkdMwTffF4ZcYEzNWbDfI5sP+BIKUf/UXZ2FEfemKAoWcXtST
	 A3HYVNu7Y0+mXbNgGlY9hfBN515QoaVkQUU04hEc2xNgZQPQI1Ykj/L2OKFbHJc12qd0n
	 g+IJUp2fuLThxNSuNp6Hy6v24F+Td80HzAU7Kf2LY8RMt4gRO9KPhWOltICMKbeO7im0x
	 c5g+alWr98ceY1BE5nFUBMewsOeCS1tN1oayV3JhSck0iIfVcAY6XvwX7kPQN6KnOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CCPrWCw3D5FfBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=;
	b=iHK1eS7FGl9Q1WV6p6U1j431BOCehrx5pOb/XQsg3qB5WwymoRG5SCNs5fOw5GY8zpKg
	 vz7KnQy7xb6onf/4eYLG/WWc5i+o2IJw+4eoOfQHM3LoG2I9kxAff8z781Uc0VLY5cLDy
	 ZdJpFeBGfuVraZS8JcQ86cGqbvkT7ARDgUtYQVjQmS+wBNTr2V04frjbLvoJsY72DGtjI
	 kzveYs+qzt+gT1/RxdbI7F3Yi1Hk4LIQC61ApX2u8kMCM9XA9arg2l1Z9vR7Xkn9sT0Pl
	 k7UMww6oEy2WcLL3OsKVOTxyXOnuMceIrU0bSWGZZNcreUUxX7tZXZ1qYP7bWZ2gogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=logWVONR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T0WF/85b";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F6606A333
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7F6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=logWVONR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0WF/85b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAtWn1357697
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CCPrWCw3D5F
	fBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=; b=logWVONRMkvqAHyFQd9tVH4HHfg
	xxxSF4yZTjbWJZ3VFH0L6/YuKKlIyiZyz8HWfHB1KtAij1MhmetLmWUuXa0fzUJs
	0kNDzYSvUgARxV8qbJKGsEW4M9E7OsHhx5niHOy1zYWoeVY42Y8VwPtlWZAviSXZ
	ZJJQlVVLoKeSLmfhSBWsrvH+RjepOWrpzCpfKpCwWYwh6unU0sFcTRdRPA7UIuj1
	aVb5h3rZ0iKtPWJEQAbQQMAZtwTPpQuXpfACekaTkOXHjihwPr+xGkiSzPMEPF50
	omrFNgXafvDjpx1cldtQE8BDNUJdoUnnEDWsw4pZOOUu9X0r5FlVjGLbLTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxtshx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso4352794a91.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 18:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658863; x=1796263663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCPrWCw3D5FfBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=;
        b=T0WF/85bSbyREOtt+661lvakukZk9NecTiHiQ3qommwPg8D+Tsa7JH8YQn9MrniscD
         bt8LwtgQ4gxYHzAU8sTkQCCZOU4VBEx67GIk9ZIE50YLntT7oW/eNnLwIhHbWQiqd73z
         a54bhY2v/KWw3WcDrYyFCozKdShD2STesOQvvo1LrmxmWgkj8r/yq9wasK9EBW+AasbN
         xJohmnUi7brbR9eaYWGwn1e4cA735F5zmWcjNzS95zDlBLv7weJnnO58o8OQkjwldUjk
         huL5ydfh6fFVU44VlSeeJK3MSxtlbc0dUEIuCu7AX0hqRiUY3cMLHgRpvpkx+a/DfTkV
         6ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658863; x=1796263663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCPrWCw3D5FfBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=;
        b=em8zoAngQj0wpTGodGbf1D9r2b6t3H2dZNAymIxRCk6FDYmp4x2fOfxcw5JKt5Hpd0
         FKrwy0Ug2ik01jSD5pcUVjHH4kohSN70kg9wyVzYjmSqG4iAa8U9uIVAQwWx96pHkCmn
         35Mhch0b5suZx7nLF7wTcUvQhWUqxSOQV9N/gXVQxlVAbyPFge+/Qh2ujuubicp2uLSl
         phS3GhlG33aM7oJaHCJ+uuO80x2DoqZFt6dQQwiopezokBhhrfh/QjqaBQIJOx9+Iudx
         Jxv6sEJqDdgYmP05PbWsorJkcZVpvonWSRckyBn71CYB+v6n0BEmhTjjLnNT44Jl3vQm
         ZQHw==
X-Forwarded-Encrypted: i=1; AL+hErEN6Owgu4woAr7QIvqvOLNVtOqYjsd7TK1T8/A5mDC/YohzCwuttnF/ihrrQv6m6oK5pMvLdd8bfOe52Z8OEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jWD1vXiDwijITQf1YwIWl+ZFllYwsQA+YVzU0B+pPAD9FWyqG
	5lpaDZJRmiu+D9MI+jhWlAxIsLyGy6lq/aRFyQ4tly97aBCJtyzusmcQ3+iMKGKTQk3QBu8D8JS
	cF1JKusQRgUzOKa5HyHOBEgM4NX/c5FKXvTvcSEcXiSaA1RZLEZ2GkC7Oy02m1CMJ448RK3fJyL
	XtmA==
X-Gm-Gg: AZFdTZc9ndxssfQMXvMQr/vbcIThqwzx7YcCW0ojJcLhJ5MbKdGWvnVsNTuTxv0ZnYP
	Rn6kQ0+490SkPyGhyZvhb/7Da48YB1zaHPhTj1Sh+BsGoZVAOQj5/EOHTc6gmhyhBoWVb2KroK3
	3uf7e27Tpm0OcfzmAPsL2UmMrAG3NPC2pl5dIm3hD5k0nKjg9rJ/ZTrUHLbrZnLNtLAJoDtKp+/
	xMeFHOg9fTZPwzJbJ2nyu91HTpUEYvdVQ/REpBEr9ElzXVurAv8CcNAXYPNY1mYP4Yb+47shDHE
	8VHCFW3esYkVevNS0wrBS8tdHR6Ni5Ovy4YBjaJO+KcxGOCl4bJm/sOdhcM6sPXZX/Srx4SSxYR
	JcnKtwNALUHxOCd/Mkearrr4qEoaqcogbJd9v8T1bm46YBJ/YviEBgMaSmfIagICjKbWJnQVyQ+
	xPIrKpPr3QIRu3Szdz/f3GZXX64KFfvK5fVCFf
X-Received: by 2002:a17:90b:4f8f:b0:3b4:f260:72de with SMTP id 98e67ed59e1d1-3b4f2607685mr4061031a91.64.1795658862912;
        Wed, 25 Nov 2026 18:07:42 -0800 (PST)
X-Received: by 2002:a17:90b:4f8f:b0:3b4:f260:72de with SMTP id 98e67ed59e1d1-3b4f2607685mr4060999a91.64.1795658862187;
        Wed, 25 Nov 2026 18:07:42 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:41 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 4/6] wifi: ath12k: fill MLO simultaneous-link fields in peer assoc WMI
Date: Thu, 26 Nov 2026 10:07:25 +0800
Message-Id: <20261126020727.3273337-5-hangtian.zhu@oss.qualcomm.com>
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
X-Proofpoint-GUID: Y8_Ecr2lSVwAeOw-nnYp97iAPMwkMSYi
X-Proofpoint-ORIG-GUID: Y8_Ecr2lSVwAeOw-nnYp97iAPMwkMSYi
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b07946f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UVoeoLa06s1F6bhou8kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX6OpSTxiNc+QT
 vgD8xQxkDJ2iEe+e60dEGGRHYoKA9I6luEYeFP5SWzRhwvPcxAnBNofSnbEZqeyxCUE9/sHcWPh
 k23GrJ0ww96D2neKNTHSFx7LrcGpdJ9j3R4axxI4DnXOYCu+6UW8Ne9Tvmb4beDOERS+wF3EWR/
 k2bTj5xiHEyRI7XnGdyAZ7v+S6bap/uFXMOjFkXI3hMN2dxl/rc63bhJv8JCLci4EH6NjmRR61T
 r02ZhOC3G+LIICbwJbYCdNknkPwPHg3tI5GYB0xfVrW9gljh5wXLZcIDObdHqMtTteBuYHIF7cw
 oW2HzcOEnN2czZzZq34cWZCFYa5lxH2MiUi2Yv7gxzJFzKgQ/RGhIISm7q62blcAw4yR4L7exjY
 OB445ivnxf61Zu8EW497KKmsloGwAOrHkFBGQ3IU7SM0hHGMP2OihZY0SBakP1MRBjO7ROAJOMu
 BV0kYG7pXCLMzLuHjUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX2Eklzxv7GHFo
 vc5ttx64VBvCzCnKzKmU1pxzC3dWCkdNXNZbDI3JQl4jUvXdETruTX/PI8/VHtw2zA6MIsVu2/B
 J2VFqX6/QkhNOUWzjraFoU5U2M/Kiuw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Populate max_num_simultaneous_links and
recommended_max_num_simultaneous_links for MLO station-mode peer
association and pass raw counts to firmware in the WMI peer-assoc
command.

Derive the local maximum from the station iftype's advertised MLD
capabilities and operations instead of caching another copy in
ath12k_hw. Convert its IEEE 802.11be N-1 encoding to raw N when
preparing the peer-association argument.

Read the AP recommendation from sta->ext_mld_capa_ops, which mac80211
already tracks before the station enters IEEE80211_STA_ASSOC. The
recommendation is a raw count; use the local maximum when it is zero,
reserved (one), or exceeds that maximum.

Leave the new fields zero in AP mode: the current station API does not
provide the non-AP peer's maximum simultaneous-link capability, and
the AP's own capability is not a valid substitute.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c |  4 ++++
 drivers/net/wireless/ath/ath12k/wmi.h |  9 +++++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e78c711b7832..2d7ee2ab9d6d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3529,13 +3529,17 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 				    struct ath12k_wmi_peer_assoc_arg *arg)
 {
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arsta->arvif->ahvif);
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
+	const struct wiphy_iftype_ext_capab *iftype_ext_capa;
 	struct peer_assoc_mlo_params *ml = &arg->ml;
 	struct ath12k_sta *ahsta = arsta->ahsta;
 	struct ath12k_link_sta *arsta_p;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_hw *ah = arsta->arvif->ar->ah;
 	unsigned long links;
+	u8 rec_max_links;
+	u8 max_links;
 	u8 link_id;
 	int i;
 
@@ -3573,6 +3577,31 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
 	ml->eml_cap = sta->eml_cap;
+
+	if (vif->type == NL80211_IFTYPE_STATION) {
+		iftype_ext_capa = cfg80211_get_iftype_ext_capa(ah->hw->wiphy,
+							       vif->type);
+		/*
+		 * MLD Capabilities and Operations uses N-1 encoding
+		 * (IEEE 802.11be Table 9-417n); firmware peer assoc uses raw N.
+		 */
+		max_links = u16_get_bits(iftype_ext_capa->mld_capa_and_ops,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS) + 1;
+		rec_max_links =
+		    u16_get_bits(sta->ext_mld_capa_ops,
+				 IEEE80211_EHT_ML_EXT_MLD_CAPA_OP_RECO_MAX_LINKS_MASK);
+		/*
+		 * Figure 9-1074t / Table 9-417o define Recommended Max
+		 * Simultaneous Links as raw count L (0 no recommendation,
+		 * 1 reserved).
+		 */
+		if (rec_max_links <= 1 || rec_max_links > max_links)
+			rec_max_links = max_links;
+
+		ml->max_num_simultaneous_links = max_links;
+		ml->recommended_max_num_simultaneous_links = rec_max_links;
+	}
+
 	links = ahsta->links_map;
 
 	rcu_read_lock();
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 5cf104536dbf..443d29fdd763 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2473,6 +2473,10 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	ml_params->logical_link_idx = cpu_to_le32(arg->ml.logical_link_idx);
 	ml_params->ml_peer_id = cpu_to_le32(arg->ml.ml_peer_id);
 	ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
+	ml_params->max_num_simultaneous_links =
+		cpu_to_le32(arg->ml.max_num_simultaneous_links);
+	ml_params->recommended_max_num_simultaneous_links =
+		cpu_to_le32(arg->ml.recommended_max_num_simultaneous_links);
 
 	eml_cap = arg->ml.eml_cap;
 	if (u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_SUPP)) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 843f1d11f9c8..204eebb1d0c7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3926,6 +3926,8 @@ struct peer_assoc_mlo_params {
 	u8 num_partner_links;
 	struct wmi_ml_partner_info partner_info[ATH12K_WMI_MLO_MAX_LINKS];
 	u16 eml_cap;
+	u8 max_num_simultaneous_links;
+	u8 recommended_max_num_simultaneous_links;
 };
 
 struct wmi_rate_set_arg {
@@ -4031,6 +4033,13 @@ struct wmi_peer_assoc_mlo_params {
 	__le32 emlsr_trans_timeout_us;
 	__le32 emlsr_trans_delay_us;
 	__le32 emlsr_padding_delay_us;
+	__le32 msd_dur_subfield;
+	__le32 msd_ofdm_ed_thr;
+	__le32 msd_max_num_txops;
+	__le32 max_num_simultaneous_links;
+	__le32 nstr_indication_bitmap;
+	__le32 recommended_max_num_simultaneous_links;
+	__le32 ml_reconfig;
 } __packed;
 
 struct wmi_peer_assoc_complete_cmd {
-- 
2.25.1

