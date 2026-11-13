Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581526;
	b=fZmPkmZ0D/m1ELfSKzizwAxxj3/yQlRoOKFI3Qp87oO3bQdi7d8TEiwhGO1GOSk2Yeny
	 cXCOltMhDcr11qw0rIrv4qy3bC0DD+rNCMotUsv60AljiISZeMqm1nAcI6Ps8UbkQrJ6d
	 EE+6dlbX4MFrcJ7+a8QJzpVqlF8RmHm6IBH8mKBh0qUrfYZl7KKG0LCoQBDjWMEsvImmo
	 5vJIQQCVg5gnAtgNW08ZugtgAJf5QhDloCvCdSl4xvVpQWJXsQbe+8J2ktWdPo0hjIV/1
	 D/i8faAB+j6V5uT9g08NxrEU8ELSD36Zr+Y3WRKiC4Ec6AO/Tgqncl/w5UenjN3fLoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=;
	b=pDqH/W+NIcxOl93p2J+k/GiA6UfBrV4Mq56678zob0Tw9mUSmuC90rFYvlCHXI5xzlbY
	 sq+idthm9UJLDUh7pxSJ3vvKHzTkii/PP9o51ttkifvCJWEvAsRMss7sSONQ3hD6xb5aq
	 iwRELd2eo4vkwKwk5dXePQwQ/sSc/7XhgvyNceWv/aLn7Vn+SpmTzahWG2xYJCoXDloHj
	 GVYMS9Pl3ylJRhOGeUDdmcTEevGSPqO/9UMZO3EBjgzVqdEFouv3ntJlrNn1EFSTIuMT7
	 zVT2ynvHaAQFO5lGAaiUnoSrc/LcCBzSq7PDvZ2zRmeHM52eibE13Mw9BdTYhLqmKqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp118GJp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ee3lF7Us;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A49606A330
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A49606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp118GJp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ee3lF7Us
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJTqa2796670
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=; b=jp118GJpgNfPNp3A
	l7nU9YD2tLO5swXKa6jmp9V+9JeHkmSefVLKcraWsTLj6BZIwYZf1P3pJiuUJ7cG
	SPVB2q9mT3hXSiqAXunK+LYm1YO4zzbi5AllJN05baW+0IpPgFGKlGuy6oBQs/xM
	772DjEr2tEfoXbacSR8W4ZuuKQ30jhZkdYrzDwqB+P7glGDPborBaHgeTyI/7ZlQ
	uWe59dsOSKROhhXjHHkfg0JImHbucUelWL/BG+xjlCbcNKQRwf2krBvb8osk2+Jn
	1f3c7v+bV8+A4w/KLWNOZqeYu4aeuc/IY/iyuxp2L8qeZBRplOxHy2CePQ+R0XYx
	F9mYbQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6ssyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d60a8bf5so146906137.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581524; x=1795186324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=;
        b=ee3lF7Us4h1bZAtMdvcIM2RM59uCr+PoWmMyxqmOlSsvj/BE+nEygW5vYSuqLqh9Zk
         bZeyZpRPRnc82FLTTXXONQbh1MFQmphzObCRjWJ8z9SFilUP1HmckPSJ479bEGQHt7aT
         YX27woT5DvsQcNgeuODW2zHRJXzYFPINpEIG4dOF5/Ldyh7zsOhKGn70jaeSkPo2iEl5
         vi9ZURIq7KeW7xKhjukhWeY9Fu41bomKG/5EXt1c5xOTNc9z9lkshVCJ2b12i7GDdsca
         hWo8H1zfd43+PQTrJA3manCP0Z0wAREPfujmnMJRDUBxae1nVDhiR2bTghLx63FH18M9
         yNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581524; x=1795186324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=;
        b=vTGDf3k4gN2wY3YW+h5ZSVpWavx2iH2hmLWdmzIzXQJsoAbKcDMoCRGp1MtxShOz4W
         S+bBhn/HO4P73oXiziuQC69JVU/GPKKdPZgi8eYXTqQa6R3x2GoCDg1NRw9ThP9PjbxN
         9DH/8DRjNp1A/6H0jqFyBLO60q+Zlm2CPjd3faBDaBngZA7xdNnDWeXT1SsN4WKawXFJ
         LqwvHYDJjHUFnCXpwN/qQIF9HvGuPNmWYzu1SuOeXk3i+8robwMW9QbNX0DI9JdAjbpQ
         gKk+lj/NfLoOczrs300wvoiY6qn8hD7NGXlQfaVRMjXV8hJSLN1O+RvCKc94eHAuXzbX
         v2tQ==
X-Forwarded-Encrypted: i=1; AL+hErHxQa0UYNJVa6YeTrIdcwTrgQiDxvXm82hgII+bhvvbLM5jb7lwxKSaYALiRjwYzYDOHHgcT948VnKBCnSCbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+oD19HIhP/vJiBDW//2OIiIC6i0PUluOzaRChCwwKnRqT/CtYs
	1AYLfbUHCltOMivzppYhdABL8RC5ACe5wzlJmjmaQvZhDqcQm21KMbYUOzqVYnqmesLz7uHwLEl
	v2NCNb1BtRiUPDBvN+xZxEzbHzOdhnrVOtNNIryR3nD9V2rRsRi2hvKOINhUQ3eyi2rbeyQ==
X-Gm-Gg: AYBFou0ADaikgys61rLdIhQpuYR+yPCWkBwuUegKz2gEY8moclUpyjoH58x03IpXaZv
	ZVaOhxSO5sC0jm881u5D0vlRNQhvrE4MQi8V6T8jJWxm4yYFBDmNjuWxwdWFwm3sreBVY4kowJz
	Rr2CPq4a2sowqoDNj19mHZ7jCuoOFrcjkGOEn2RZDGO1WJjPyQtDSYg902oUf3geBYI9y8iwqW8
	8703hhTi4+cBt7JdaVH2POKdHiQpXm/XJ4NDMSxIeMt4XbcfuXJmND5xjpCGEQoRr46roNGWZno
	t8SIKV+kqjn5wNnwU8T6Hg9bjbvrTlfElFjuy47l173vNgkh97yyPoJ8ZLdbExulv5wgNcRYse1
	Ki9NBBrG75vxYrcJKP3qljFEzpPttycf/hqZVAKPAtXdKUV+i0dT5XaoYfB1ftQ==
X-Received: by 2002:a67:e111:0:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d64d47dc72mr655897137.1.1794581523958;
        Fri, 13 Nov 2026 06:52:03 -0800 (PST)
X-Received: by 2002:a67:e111:0:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d64d47dc72mr655891137.1.1794581523456;
        Fri, 13 Nov 2026 06:52:03 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm64680265e9.13.2026.11.13.06.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:02 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:42 +0100
Subject: [PATCH ath-next v2 1/4] wifi: ath12k: validate RX frame length
 before undecapsulation
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
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-1-46d186f8688b@oss.qualcomm.com>
References: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
In-Reply-To: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX3hxdF8p/GQFg
 I08IFB39SGRoF+PK3AiEXFCEqFNgm247+OFwnFpLad16vnbEU5yXIxm93cwbM7ezfN3tQYd/1QB
 aTYu2lIt8Rw7aSqmm3pg51jqn+OHCUq0DJ4G/I73Q3Me5EitIJWsoBj//SydqTXjzzOCABkZt4g
 gX5oP0Qf3BA9g6WWU1I6kOodgdm8qrc4y+VmQ8X6+bhPJRNe56G4wkFVxD3Cu56x12uFs2266HW
 F7KUX0XICuV+wEjm/tIU6XToRMBtYsllNx3p7ndyMP+Kjso2RNy7kPOqSpORqZJI+Eus9hfYvER
 8E9WC5XkdlbWQ5DPTN8h9zytQMquKoROi2mPvnJMKmBa8WwJA6VKUhOAUq7E0hjX9zweiFNQ32X
 appzQAy2nLow/gmDQd+dTKIheoAXBvveMcgoaLmZo6bQC4Pi8ftBh++07rQBgHvflOMAc2eEIzf
 /IW0ctesyy80wkZxW3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX4Ac+4ZblAEhE
 f6rnFw+EF7HRaDP4cyfZyL+ifo5m8QQTNw/RpGwV4xUhRQdzCkZnWnyYuuZUNCiUaWV+5ScExik
 GSFsAdP7HHScyKYqqKa8zE6opzeuXcg=
X-Proofpoint-GUID: j2glNyq9EcZGpiiOf2rgMvq0tRRpIKDY
X-Proofpoint-ORIG-GUID: j2glNyq9EcZGpiiOf2rgMvq0tRRpIKDY
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af72414 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nTyYClWBY-Pg7gOM_m0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059

Reject raw frames that are not longer than the FCS trailer before removing
it. For an skb shorter than FCS_LEN the unsigned length subtraction wraps,
so the skb_trim() length check turns the trim into a no-op and the FCS is
left in the frame.

Also verify that the frame is long enough for the crypto header and the
MIC, ICV and MMIC trailers before using the corresponding lengths, and
that the 802.11 header fits in the frame before moving it.

In the TKIP MIC verification path, reject frames too short to hold the
RX descriptor, the 802.11 header, the TKIP IV and the MIC, ICV and FCS
trailers before computing the MIC input length, avoiding an unsigned
underflow before michael_mic().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 86 +++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.h       | 10 ++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 27 ++++++---
 3 files changed, 85 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 52838ade1b1d..6003ca901208 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -999,11 +999,11 @@ static void ath12k_dp_rx_h_undecap_nwifi(struct ath12k_pdev_dp *dp_pdev,
 	memcpy(skb_push(msdu, hdr_len), decap_hdr, hdr_len);
 }
 
-static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
-				       struct sk_buff *msdu,
-				       enum hal_encrypt_type enctype,
-				       struct ieee80211_rx_status *status,
-				       bool decrypted)
+static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
+				      struct sk_buff *msdu,
+				      enum hal_encrypt_type enctype,
+				      struct ieee80211_rx_status *status,
+				      bool decrypted)
 {
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
@@ -1014,49 +1014,75 @@ static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if (!rxcb->is_first_msdu ||
 	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
 		WARN_ON_ONCE(1);
-		return;
+		return 0;
 	}
 
+	if (msdu->len <= FCS_LEN)
+		return -EINVAL;
+
 	skb_trim(msdu, msdu->len - FCS_LEN);
 
 	if (!decrypted)
-		return;
+		return 0;
 
 	hdr = (void *)msdu->data;
 
 	/* Tail */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
-		skb_trim(msdu, msdu->len -
-			 ath12k_dp_rx_crypto_mic_len(dp, enctype));
+		int icv_len = ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype);
+		int mic_len = ath12k_dp_rx_crypto_mic_len(dp, enctype);
 
-		skb_trim(msdu, msdu->len -
-			 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
+		if (msdu->len < mic_len + icv_len)
+			return -EINVAL;
+
+		skb_trim(msdu, msdu->len - (mic_len + icv_len));
 	} else {
 		/* MIC */
-		if (status->flag & RX_FLAG_MIC_STRIPPED)
-			skb_trim(msdu, msdu->len -
-				 ath12k_dp_rx_crypto_mic_len(dp, enctype));
+		if (status->flag & RX_FLAG_MIC_STRIPPED) {
+			int mic_len = ath12k_dp_rx_crypto_mic_len(dp, enctype);
+
+			if (msdu->len < mic_len)
+				return -EINVAL;
+
+			skb_trim(msdu, msdu->len - mic_len);
+		}
 
 		/* ICV */
-		if (status->flag & RX_FLAG_ICV_STRIPPED)
-			skb_trim(msdu, msdu->len -
-				 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
+		if (status->flag & RX_FLAG_ICV_STRIPPED) {
+			int icv_len;
+
+			icv_len = ath12k_dp_rx_crypto_icv_len(dp_pdev,
+							      enctype);
+			if (msdu->len < icv_len)
+				return -EINVAL;
+
+			skb_trim(msdu, msdu->len - icv_len);
+		}
 	}
 
 	/* MMIC */
 	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
 	    !ieee80211_has_morefrags(hdr->frame_control) &&
-	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC)
+	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
+		if (msdu->len < IEEE80211_CCMP_MIC_LEN)
+			return -EINVAL;
+
 		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
+	}
 
 	/* Head */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
 		hdr_len = ieee80211_hdrlen(hdr->frame_control);
 		crypto_len = ath12k_dp_rx_crypto_param_len(dp_pdev, enctype);
 
+		if (msdu->len < hdr_len + crypto_len)
+			return -EINVAL;
+
 		memmove(msdu->data + crypto_len, msdu->data, hdr_len);
 		skb_pull(msdu, crypto_len);
 	}
+
+	return 0;
 }
 
 static void ath12k_get_dot11_hdr_from_rx_desc(struct ath12k_pdev_dp *dp_pdev,
@@ -1143,11 +1169,11 @@ static void ath12k_dp_rx_h_undecap_eth(struct ath12k_pdev_dp *dp_pdev,
 	ether_addr_copy(ieee80211_get_SA(hdr), sa);
 }
 
-void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    enum hal_encrypt_type enctype,
-			    bool decrypted,
-			    struct hal_rx_desc_data *rx_info,
-			    struct ath12k_dp_peer *peer)
+int ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
+			   enum hal_encrypt_type enctype,
+			   bool decrypted,
+			   struct hal_rx_desc_data *rx_info,
+			   struct ath12k_dp_peer *peer)
 {
 	enum ath12k_dp_rx_decap_type decap_type = rx_info->decap_type;
 	struct ethhdr *ehdr;
@@ -1156,10 +1182,16 @@ void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu
 	case DP_RX_DECAP_TYPE_NATIVE_WIFI:
 		ath12k_dp_rx_h_undecap_nwifi(dp_pdev, msdu, enctype, rx_info);
 		break;
-	case DP_RX_DECAP_TYPE_RAW:
-		ath12k_dp_rx_h_undecap_raw(dp_pdev, msdu, enctype, rx_info->rx_status,
-					   decrypted);
+	case DP_RX_DECAP_TYPE_RAW: {
+		int err;
+
+		err = ath12k_dp_rx_h_undecap_raw(dp_pdev, msdu, enctype,
+						 rx_info->rx_status,
+						 decrypted);
+		if (err)
+			return err;
 		break;
+	}
 	case DP_RX_DECAP_TYPE_ETHERNET2_DIX:
 		ehdr = (struct ethhdr *)msdu->data;
 
@@ -1201,6 +1233,8 @@ void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu
 		}
 		rx_info->rx_status->flag |= RX_FLAG_8023;
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(ath12k_dp_rx_h_undecap);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index a78efa1d9569..5bc5b28670b7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -197,11 +197,11 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
 }
 
-void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    enum hal_encrypt_type enctype,
-			    bool decrypted,
-			    struct hal_rx_desc_data *rx_info,
-			    struct ath12k_dp_peer *peer);
+int ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
+			   enum hal_encrypt_type enctype,
+			   bool decrypted,
+			   struct hal_rx_desc_data *rx_info,
+			   struct ath12k_dp_peer *peer);
 void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struct *napi,
 			       struct sk_buff *msdu,
 			       struct hal_rx_desc_data *rx_info);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 473887ed4bb1..429f826923b2 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -359,6 +359,7 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_dp_peer *peer;
 	struct ieee80211_rx_status *rx_status = rx_info->rx_status;
 	u32 err_bitmap = rx_info->err_bitmap;
+	int err;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "dp_rx_h_mpdu called without rcu lock");
@@ -424,8 +425,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	}
 
 	ath12k_wifi7_dp_rx_h_csum_offload(msdu, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted, rx_info,
-			       peer);
+	err = ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted,
+				     rx_info, peer);
+	if (err)
+		return err;
 
 	if (!is_decrypted || rx_info->is_mcbc)
 		return 0;
@@ -1059,6 +1062,11 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 
 	key_conf = peer->keys[key_idx];
 
+	if (msdu->len < head_len + tail_len) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	data = msdu->data + head_len;
 	data_len = msdu->len - head_len - tail_len;
 	key = &key_conf->key[NL80211_TKIP_DATA_OFFSET_RX_MIC_KEY];
@@ -1086,9 +1094,12 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	}
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, true,
-			       rx_info, NULL);
-	ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
+	if (!ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC,
+				    true, rx_info, NULL))
+		ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
+	else
+		dev_kfree_skb_any(msdu);
+
 	return -EINVAL;
 }
 
@@ -1741,8 +1752,10 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
 	rx_info->rx_status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
 				     RX_FLAG_DECRYPTED);
 
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, false,
-			       rx_info, NULL);
+	if (ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC,
+				   false, rx_info, NULL))
+		return true;
+
 	return false;
 }
 

-- 
2.56.0

