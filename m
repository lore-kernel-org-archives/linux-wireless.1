Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581530;
	b=i2fh4dweVx3uYn0b/eFC8E8GeqX8J5hsZWRZ9opykf3IroinSZfwgPyIaIUUpBANaYls
	 x+qwFCKG+BWAcTunZ0UlHLrjdFP4zIHi+/5+IWHQ8VUUo3FH1W54xH5EGnLWgguwIPHCY
	 EGnh3RIQr5eZ4Mkbelb5hqJslgffRE7xcu8i2CtjOqyelvunTaa1sUbA+hWd+pupOlZgY
	 +9z4gkkSb+Smw0JXBcoakS+RotSxaBOZ7xfo2/dmuICaL3sh2N5frpvI4IZyG7BAK+ZK8
	 2TBO63BjXugmnLrt60NUcXwT6/rYNTVR6URnXGD/5sH323lCpdGgCTZ6e1IzDYMH/DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=;
	b=BQCPxYu36SVX4Z21FLmSu4mB5j9/xHzCnk0C4wLzT4J+1Y7goI9YeE6ETVLQ/a3LdgFV
	 P3Hdbp3NbAutIRMmHup0Cs9ImjStspfUWVPpbJ5CtgUNvF2xvg2iJPbNbU7xanmTa4bzj
	 4/YE/0LsqriL3T4pwscCn8Hp+2MkGLObdwHLHKMMfR0vGwtSpG8bKsZxVC+FaiU1SOHKP
	 MHVUGttLnkBCBZux+YplECofp6OnWZvuq+4jyMUo9fFlC3nZYA3+4cWgDBF3Jb6/XHLZv
	 2Tb/HMcYUYawKTSfK5b+tAM5E62vQTgwBIWEWfHqwTAcq+xDia9us7ZFFXzH2KY697w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcX0Acdj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E0FHFAD/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B32606A33F
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B32606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcX0Acdj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0FHFAD/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKQU53126283
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=; b=YcX0AcdjdfwPtCy+
	RVqptHAIcvexn0EXhWGA3Cu8tyGcqhdNsnO3sQVq29Z+1DQiBEyl9p/u0/mh4Kq+
	Huxf92+6w+u/CM7TfKBwp7jlkg35Iv7tt2UJP4zsX5Bik9XMSvhnuDL1b7KeIdgC
	jFCsX6jLwRYepVQG/Ey4RIAxv6HUn7yQPwvqumqdOb3NB3fQuHXWsSO/p/+QK2zK
	g19jObeuo+bjQP1UpYmlO4KQJMG+259tCtxk4voFA9ivJa+83bQzyxou4jqdDtfY
	I+xbijAB+kSzzv7Et82iWfIPPp26pIUreklixNbMfAt7L7fVJoL9Vt4ZRmMSylTl
	+VO3tg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcgjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so114805285a.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581528; x=1795186328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=;
        b=E0FHFAD/KX+O+8az1kadjZx8kKryPxDKwJlnfsfV1kYdWA2anclQSFQt1n5x2zp8hM
         /3lYoLTPEQ9VzRkmYnQoUWFiCQuTf8es1smZ8WeqE+nfpYfH84zW2yuxeSWrMrhPcPO4
         4fjlLgD555jOQd6FG4J1v8RbmHjyVvvHoqenp5KOGDMwuFyBa53aBtAg1YR6yktr+/Wl
         zpl3hq8WBOXy1Ckx1M9ubw9EWZxAX3Eys3tydE3pCsrefGSOkaVptKSCW96GhK5ATVyS
         3s9G7Fhdc2khIcuptPR5GkiHRTE0Ab47c4AQfCDC18qZEmxexwiKMSof8XtaCvwdoTvB
         yZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581528; x=1795186328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=;
        b=XkK4qsGayFs75dBbyh6dEnVFPgnkaysw+a1ygkZZ3yc2J4lX7rlANbsnuOM+SmCF2i
         rqQ+CXLe+ExQKq1ahxbH8YFZxavgxdTg4OZXzkNpuTbuU35aVZA2p50YwGkx7k5aAYJ6
         lt+UjNMqEi/yl/WFbQuM6PA5ja6uFJR0hu6uEhUopsixikhWQ5WAsKCdaLvMgPM+J4l3
         XUtBoTbTGvsy4PWxF0r88wSAtHMSj6//1Kk2el2O35X9HLHBpdQhwReRjoZ+CpZr6uFW
         nSGKRVqlIafKJzyhLUCQkFVqiGIqLYC2LyD5uY4/DLbEH54mECL61T/dcDySkjsfFiw4
         0HOA==
X-Forwarded-Encrypted: i=1; AL+hErHuxGAwodJH08n7bBXPSwB5dIlXmvBzhWErBpRHRnzbICPBf6wB/+Ep+ElcYTweKrond2IteDuq/Xu+9AVF3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/d2cWU8fofNP5CvMrOPk0QwF2kkr5eAlVRgACGo3lAvvtBoAH/
	b9CzQ4D9xap3OfnIcmkLAcI3eYOKoax46i0jLpK0A2fyeS8IneJ6pfBtuLkQkhtnt4pPXfXBQHA
	5khMhdGiBUQ/HLQHQ2rR9WCtTxhk3/2HajFzR/d4z8AzTeP+WOVvBttQ+mDCV1hgOOmx8nGEa5D
	mFBw==
X-Gm-Gg: AYBFou1WLh9z/kzBfFCt4LlOmPUcUERCgYafEix0w2AelOng/OpFRmjnkX3YAn5iK6S
	gTsmkoTV2yjSgq9vY/oLJF5k4HxH+6v078rb5wFu7QGYe999U5LgvoShVFkKN5+diA2VKOlJ6Fh
	PwqNCOznQ5aoQ826yaPKM9wNmjDzmRKHzMBpiFacRfXNks62bYRMWwBgSGXdqW7fAFspiOwZE0b
	2y8cAIqTaoHKpIb38kt4pw4y4JDNTL70Lk5p9pUZ2RQgsKa9EnsfQvd4Vpersh7RwwAWOnCXOBS
	9GYQIlpIPTo27nofrwQxl+34/Ivpo3bcK81EI68OnuVcyYEYSk1FNFsrG3YKd5oRfCri23UuDIw
	d40nzcMAgt1KvJa6Tgq5sg63ECthm7iJNYqfT8zsHFHlE4d+aXtF22mY+YOAVMw==
X-Received: by 2002:a05:620a:8904:b0:93c:c2f4:9182 with SMTP id af79cd13be357-9494bb8ab63mr407282685a.20.1794581527547;
        Fri, 13 Nov 2026 06:52:07 -0800 (PST)
X-Received: by 2002:a05:620a:8904:b0:93c:c2f4:9182 with SMTP id af79cd13be357-9494bb8ab63mr407276885a.20.1794581526838;
        Fri, 13 Nov 2026 06:52:06 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm5163364f8f.5.2026.11.13.06.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:06 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:44 +0100
Subject: [PATCH ath-next v2 3/4] wifi: ath12k: rely on pskb_trim() to trim
 the received skb
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
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-3-46d186f8688b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af72418 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GhD-aHKe0MmzFVZlnzIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MIW0IhAQc6k3bLnC0Q4sUZaeIJJZ_9cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfXwpQ+i4oZkZ1b
 BRoMaKKNXm8kVhoIE8p1uBnTv15jSxedbpHL8KWvwwqXHE9GHMPoKff5ghEiXOQK4iDBTRHISt4
 k+wuYIs5nVdOdkhOpiY9dXiaiq2mffDYikJca4fEj4uzK46Q6duFnJQ6qk8F/RkD2/wtnC59z1s
 TJ5Y4oSZU4O+YV+KUocym/Zuc8/0uTmIQAJqXlzD/KPA8WPFiKI3WL2ZMlY6FnakNXRHVPf57NO
 +YEJ3JvveNe9Gev4+ZbEjlyflBvjjMfSJTjagFiNMbBciLar8wjZ8G4EvdE6eKBaQrFDy8eVAr9
 IFeKW8RIe4J1frr/UbKyVFpq+gx0dp3vghrG8sMLq6NgfNQlU3tGnVKcxfuHJGuV/eDsLyRV2GN
 rN6sPyDJj3dTjY3C/viSNwmddirYHX+fJHgt7y8ORIwHxZRRhXAnJnWhIEjJ7jVd2wlCTiRsZkn
 OrWaQFkBgylWWi0VqsQ==
X-Proofpoint-ORIG-GUID: MIW0IhAQc6k3bLnC0Q4sUZaeIJJZ_9cx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX7Z4UFirlFyIc
 TX7e6RVBw9IBhVnzIYyVy6T8zGW52rG6FGUkBJoEz67GKJbRQcN8FDNJ/xualrpoqr0dWVxGEOh
 zrhsMUelVFxmfmFTbi2z5g0H/IixK4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059

Prepare the RX path for handling non-linear SKBs introduced by the
following RX batching change. skb_trim() cannot trim non-linear SKBs
(__skb_set_length() warns and leaves the length unchanged), so use
pskb_trim() instead.

pskb_trim() can fail if it needs to allocate while removing data, so
return its error from ath12k_dp_rx_h_undecap_raw(). The existing callers
then drop the frame instead of delivering it with an untrimmed FCS, MIC,
or ICV trailer.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 39 ++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 063bc3e58236..74c2d2affb0d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1007,9 +1007,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 {
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
-	struct ieee80211_hdr *hdr;
 	size_t hdr_len;
 	size_t crypto_len;
+	int err;
 
 	if (!rxcb->is_first_msdu ||
 	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
@@ -1020,13 +1020,13 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if (msdu->len <= FCS_LEN)
 		return -EINVAL;
 
-	skb_trim(msdu, msdu->len - FCS_LEN);
+	err = pskb_trim(msdu, msdu->len - FCS_LEN);
+	if (err)
+		return err;
 
 	if (!decrypted)
 		return 0;
 
-	hdr = (void *)msdu->data;
-
 	/* Tail */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
 		int icv_len = ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype);
@@ -1035,7 +1035,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 		if (msdu->len < mic_len + icv_len)
 			return -EINVAL;
 
-		skb_trim(msdu, msdu->len - (mic_len + icv_len));
+		err = pskb_trim(msdu, msdu->len - (mic_len + icv_len));
+		if (err)
+			return err;
 	} else {
 		/* MIC */
 		if (status->flag & RX_FLAG_MIC_STRIPPED) {
@@ -1044,7 +1046,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 			if (msdu->len < mic_len)
 				return -EINVAL;
 
-			skb_trim(msdu, msdu->len - mic_len);
+			err = pskb_trim(msdu, msdu->len - mic_len);
+			if (err)
+				return err;
 		}
 
 		/* ICV */
@@ -1056,22 +1060,31 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 			if (msdu->len < icv_len)
 				return -EINVAL;
 
-			skb_trim(msdu, msdu->len - icv_len);
+			err = pskb_trim(msdu, msdu->len - icv_len);
+			if (err)
+				return err;
 		}
 	}
 
 	/* MMIC */
-	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
-	    !ieee80211_has_morefrags(hdr->frame_control) &&
-	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
-		if (msdu->len < MICHAEL_MIC_LEN)
-			return -EINVAL;
+	if (status->flag & RX_FLAG_MMIC_STRIPPED) {
+		struct ieee80211_hdr *hdr = (void *)msdu->data;
 
-		skb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
+		if (enctype == HAL_ENCRYPT_TYPE_TKIP_MIC &&
+		    !ieee80211_has_morefrags(hdr->frame_control)) {
+			if (msdu->len < MICHAEL_MIC_LEN)
+				return -EINVAL;
+
+			err = pskb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
+			if (err)
+				return err;
+		}
 	}
 
 	/* Head */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
+		struct ieee80211_hdr *hdr = (void *)msdu->data;
+
 		hdr_len = ieee80211_hdrlen(hdr->frame_control);
 		crypto_len = ath12k_dp_rx_crypto_param_len(dp_pdev, enctype);
 

-- 
2.56.0

