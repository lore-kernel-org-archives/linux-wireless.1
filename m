Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285192;
	b=Cw8hGr+gBwzQz5KAjc2b88MTivZ6otCX7+mKM7HoO+JhbkzXNpT9Dp+EKYv0zFgcshS/
	 XkHZ11n+MSP/pcyY1uV+YTtfbUUUDNA4Gbd/RsZAg8DxcifV5YjRz8M3pWl7k7Eo4uKeX
	 V9FLdmHaU74f4kO6oXwYyaWxuKARFcvGGNQ31BEqZe1LNf1Dx51P5axTRpB3KWvsJldCE
	 FcaCnhGjrVhH0+02STr0L11oa1TAh3safQipLX0k/8/RtMk6/IvaUzcFi2ankOI0hDjJD
	 g83cjphNFG/dAS3nNfR+NiEoO0M0W8y8EWF0uy4MAMvyZ91O0IjvNFQ0ZVlcZCyhV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aX2f8xCns3VVo/yZE97K6PhGGsByQt+7z0WuVHE9Xu4=;
	b=W3x2JA3mVn9CaNS3X4TsJqejIMFNziiA/qfhcx0lDs8lFBVofk1UIWr84vEI5JXQdmQk
	 ibDm/rZfCK+eoOVcEy/rZRhxa2fZJ/i5on8pe00lvG7igEKk1nK5W05qeaeJJXFLSBeFV
	 BvUlBl29qKwIEA8NJjfcAdlElRFvOMUUI677oDnWKIsexS+ik9VNvdno5aCUfuxj50Fec
	 YnCbsA5Y+q9YdFaRM6cUr/43patIrSkSib/1yPrGc+U45TWTt+rPv2okzR46bryZlOYKn
	 M7AcVX3qTqDJuzDaB0JZgGGa93SphlrJage3RhZ10rNK456EUq4Si19hgJ9G5uf7t2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWDnqQE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DeL4S+tg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9056F606A88D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9056F606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWDnqQE9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DeL4S+tg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2NM1207369
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aX2f8xCns3V
	Vo/yZE97K6PhGGsByQt+7z0WuVHE9Xu4=; b=pWDnqQE9oQYNBVid5EX4rTi3gS0
	gvhw7dk4pMAUTYLpmH01bloNPVplTTML4VTndizp3H+svmBqdl+oXCaKHX+AKhnR
	mknBMZs59FnkrtXwPPl2T7FkZHkKrD+L9zFLi7ud74RqYNjpTSwPejIDvPEMGWQm
	vvQHfrcuZYJnl9PVgO0wobASjuPlp/ktnlCITvMrGEpcm4aFJmrPv2RfojYL9iOz
	Y5uSVu4Xm2brFhFc+VccUPmCIp02JKdGEaTAu9xeb+h5IeVLDIc7ZgCfyGamNAUa
	TohnLogXH/O1G69eznn6wonTxpcASADDDjiPDSaanmd5Xio20vkrVLtSkuw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhd62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2960180eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285189; x=1794889989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aX2f8xCns3VVo/yZE97K6PhGGsByQt+7z0WuVHE9Xu4=;
        b=DeL4S+tgQ+OXARqXsZ48Ibsdhp4JNty/yRdSCVBm8kz5MOsWKh5cJq5nBtmtwJuiRt
         pTzkDQ2KCoAP52Us7JWhPSSYS0DWArXiaDaje2O7+PW5J75PJNB+d3K0mpIbJl+ykUXZ
         Hk+HitSzbcV1pbHFxgifDuD5anZkWHCWGsVAChWmsBzVpK95Fl3Z6CJyxAGXsdhqsiYW
         Ulita6hxbAuk2AniCh5XDX8bR4F+pj0AH4194pN9Iy0uBcE216QuNHVMd4iCfbq7vRzd
         4Hj9yQvZBQAHsX8jpkF7V2z9v47XsWY33gCDliVmlIjw3KTiMqQsNX1T1WyZOtBuRjRc
         yQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285189; x=1794889989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aX2f8xCns3VVo/yZE97K6PhGGsByQt+7z0WuVHE9Xu4=;
        b=Ko2sdwuhCK5tVtwFILCrS0TPP2TOxZApd8npCQaI+yExt8gOHHrTWKpUxzlGvxuPVg
         W8DhfUi2TOfEkp+t87lGmrjm97a+Qe553khFVeJbuVxwFI05khHSAlttHwN0iRaDBn2p
         9qduGhUPodHiroWiqgF3zuqCO+0+eQ9AukLSh9gDMRivMgPMPpArfoeMI78F8suy4mTG
         ckEQOM1nT/hSqhKc7l6eOggVgyA5lx4R5s8oc5TlLrFCqMY0UEOYh1G/JcrQxECVB6T/
         R6C/OuI+zs7wBCUtvGIK9GvFuok9uhzwouLCSpcvz1/+nNKYWQS9WBfChbVSX4YWngSm
         Qbcg==
X-Gm-Message-State: APuU4Z+TgTydyPDEyA/6s++ik+WSFNNsMbW3wSpnO0skgKqbGxouittZ
	Y3+Na4X1SIL/sjXoD7BCWj4PIZu0ke2xy8UWyG5JX7mWxZp/izW5Fu6ogYwH3ev5cA7rVXmp3d5
	Wtf/qAkfh17J6oqYIm1CLp4JESuPYei8SRJTE22o7qlCEVAN2QCGSmIVTG7+8Fg5rPGpoYg==
X-Gm-Gg: AYBFou31SgsX6CvL5cD1VNI3ZeXqy9RtpF7cdV4eS3krMIfS2H6xAWzAG2XeW+ebeR8
	Pjlr7v1XNbCF7pwXgwsHvmZPVQfGZXHS5S/RrcbIf7q8EvzlLp9U4UgPXMQZzjV+mo7Xj9vveE3
	W23O9RGWxiHe5SC78V5GFgZCZwDr20tr/uPP8dSav+5WY8npc1uOmOfiZNCojbQzFCd6rAA5fHb
	3Os9VwNUUhVesyOfTlwspD29MMXGHGsx3ccv1XQB16okHJUMVzpA7WDYk2b8s/JID0U+9riRMlp
	XjCN011e5tKYG382LaSB6ab0UUaJCSgwyKST9AXJ0NGZpLTyNwuxuYySDyZpKUoS+N2rZWUg6F9
	Sw20pgcQ/gzCe6IA+I/DUWqyQXh7MQaL93ilcR721JkXuFeclboRFrZW9K9Z3aMfTzj6FWGn5c/
	lzcWLdLJjB8A==
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr1701811eec.9.1794285188781;
        Mon, 09 Nov 2026 20:33:08 -0800 (PST)
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr1701782eec.9.1794285188146;
        Mon, 09 Nov 2026 20:33:08 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:07 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 04/19] wifi: nl80211/cfg80211: add NAN ranging FTM capability
Date: Tue, 10 Nov 2026 10:02:27 +0530
Message-Id: <20261110043242.2012238-5-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: o53OjtgzOHkc-5StXprEOa_HBSsJxz8d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX3FJ5xnOChWfN
 bSb0+8bGBOOP+Ly4CbIqbiA06Y23c+IUhNZftVec/2obhHsTW3Zw8V+yG/XenCp8ZJUsB8JJ04Q
 kwbSVfY58ARzhQyGAMl1mqnL7cHXGOc=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af29e86 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tHaWkjuROnUFulaCi40A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: o53OjtgzOHkc-5StXprEOa_HBSsJxz8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX7+Z9lTP9f7p2
 qo5Sf1HcDuvE3R8QGjnCeyA019lZi3Bodu7hVnSWZbCZgaras0tuqV6RmNaJ7lItXusdRW9l829
 xHDNZXeNtcwBLjdWr78VC841Q8W3yd7FXqVCLzTGEhtD+x+nl9ETZUdwmiAz1Zlap2V8fePwlli
 cTgJQGgMf69MIH+FoJNYg3Y1w+gYmrLQSUjMe6pnwVvUH3syL1yWaB7OQ2aL7k/BzrStbfmUHVu
 mdkfH7Y2Bnmb+wNczTM23JR9jAHAJmIZt/901alQl+td3aJBRIUU3EVktPgX7M9SNOqU8pPWwb6
 h9EuKp3ORxQ8LZcdKkm8pNuSR1z2gYWAlhcyCnNcCEXU44SzQ0u3+5iMgyXY+evIVhv2lCyhZDb
 9NJ+5bXB7sgyI3lmGj3ns0QtUB+r1spfNGfX8fZxCmDKZGPHtzCalDhy/cMlZW8J26qDyNcXtsI
 OXx5BOCGT7yGv8y1VdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Add NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT to the FTM type
capability enum so that userspace (e.g., wpa_supplicant) can query
whether the driver supports FTM-based ranging within a NAN Ranging
Session before initiating a NAN Ranging Request.

Add the corresponding nan_support bit to cfg80211_pmsr_capabilities
and include it in the capability advertisement in
nl80211_send_pmsr_ftm_capa(). NAN ranging always uses ASAP and a single
burst, independent of the generic ASAP capability.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 6 +++++-
 include/uapi/linux/nl80211.h | 6 ++++++
 net/wireless/nl80211.c       | 7 ++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 285aa6991efa..91bc06a46a3f 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6246,6 +6246,9 @@ cfg80211_get_iftype_ext_capa(struct wiphy *wiphy, enum nl80211_iftype type);
  * @ftm.type.pd_support: supports peer-to-peer ranging as mentioned in the
  *	specification "PR Implementation Consideration Draft 1.9 rev 1" where
  *	PD stands for proximity detection
+ * @ftm.type.nan_support: supports NAN ranging as defined in
+ *	the "Wi-Fi Aware Specification v4.0, clause 8". NAN ranging always uses
+ *	ASAP and a single burst, regardless of @ftm.asap.
  * @ftm.concurrent_ista_rsta_support: indicates if the device can
  *	simultaneously act as initiator and responder in a multi-peer
  *	measurement request. Only valid if @ftm.rsta_support is set.
@@ -6296,7 +6299,8 @@ struct cfg80211_pmsr_capabilities {
 		u32 min_allowed_ranging_interval_ntb;
 		struct {
 			u8 infra_support:1,
-			   pd_support:1;
+			   pd_support:1,
+			   nan_support:1;
 		} type;
 		u8 concurrent_ista_rsta_support:1;
 		u32 pd_preambles;
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 38dd596b54c2..bd18cb922310 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8439,6 +8439,11 @@ enum nl80211_peer_measurement_ftm_capa {
  *	the device supports peer-to-peer ranging as mentioned in the
  *	specification "PR Implementation Consideration Draft 1.9 rev 1" where
  *	PD stands for proximity detection
+ * @NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT: flag attribute indicating
+ *	that the device supports NAN ranging between two NAN devices as
+ *	defined in the "Wi-Fi Aware Specification v4.0, clause 8". NAN ranging
+ *	uses ASAP and a single burst, irrespective of whether
+ *	%NL80211_PMSR_FTM_CAPA_ATTR_ASAP is advertised.
  *
  * @NUM_NL80211_PMSR_FTM_TYPE_CAPA_ATTR: internal
  * @NL80211_PMSR_FTM_TYPE_CAPA_ATTR_MAX: highest attribute number
@@ -8448,6 +8453,7 @@ enum nl80211_peer_measurement_ftm_type_capa {
 
 	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_INFRA_SUPPORT,
 	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_PD_SUPPORT,
+	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT,
 
 	/* keep last */
 	NUM_NL80211_PMSR_FTM_TYPE_CAPA_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 44d512675065..ca08b40baf96 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -2770,7 +2770,8 @@ nl80211_send_pmsr_ftm_capa(const struct cfg80211_pmsr_capabilities *cap,
 			cap->ftm.min_allowed_ranging_interval_ntb))
 		return -ENOBUFS;
 
-	if (cap->ftm.type.infra_support || cap->ftm.type.pd_support) {
+	if (cap->ftm.type.infra_support || cap->ftm.type.pd_support ||
+	    cap->ftm.type.nan_support) {
 		struct nlattr *pd_caps;
 
 		pd_caps = nla_nest_start_noflag(msg,
@@ -2786,6 +2787,10 @@ nl80211_send_pmsr_ftm_capa(const struct cfg80211_pmsr_capabilities *cap,
 		    nla_put_flag(msg, NL80211_PMSR_FTM_TYPE_CAPA_ATTR_PD_SUPPORT))
 			return -ENOBUFS;
 
+		if (cap->ftm.type.nan_support &&
+		    nla_put_flag(msg, NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT))
+			return -ENOBUFS;
+
 		nla_nest_end(msg, pd_caps);
 	}
 
-- 
2.34.1

