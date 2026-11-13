Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581528;
	b=f5FzhHkiZSDWH1PrY91IjEUcZ9MeF37QgbKcEPfFZO7ynCPQedmOHyC0NjnuDUQguwZE
	 PMHdZIiyxFHnSRv9qwi7ZLIcjgTLvYQLZzeNjC04p1isphHbMRqbSrrVBPAZT7uonl4v5
	 qUiIR8fpN+iFPYCpjT00TO5A2ecYsQjq4CC3qcoaC8atHtfHruZFHNkuKLBYAz0t4527Z
	 zOTDa9xFjkq+umj2iLXoH2Ncu457HehLvZyDW2Zs6iS4Bwo7QpS5W37oY2wJydLcmh72Q
	 FPjc8nWvfysOzS24WMT8lLQUtjsBd11TwaYxBiAV/YrVOSn7F0+v0cwi0guzumZP1LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=;
	b=waYKQFsadsedShqjr0l4TxdSxM0OH0grrTiucHRs2H4qCAQwuXLv6lqRvKN1C3SyTUaT
	 qbiGyyCVVZ/qiR3iEQRGD+5Mh67bP0hjzzWwfdQHvfzhiFetxGCSearvjXhG2Tyl4dZAq
	 XOUWyCY+yVVtKRsCCu0Q0IPeDK1hkLsuxxUTtWvv2AXKTUjDsjBBHHOuXU/5gINzcvFsg
	 E5dZOXiLzCM9t3c1EyJiUVCoi/4NJk+j5VBbk0oJldEJutd/hzafft3dcBdIBM0wr1Zn6
	 onBtsn1y8RTBQRuuFKNeeqpguJmb2CAf8g2k2sqgg0J+EgF2NKvd35+OwFRUv1jdxrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG11Lvkv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDsUOpFq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055D7606A33F
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055D7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG11Lvkv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDsUOpFq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcqW242654
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=; b=BG11Lvkvef19u0Rz
	1GQPPC03OvDsda8fBN4ImfLeqSnXMCqpuApWWV/pMYQ2LEmJe75k9r0gGqzJP18A
	DMdyyomem9mkeNbCcKH2sx3HX3ujTjkXu7Y9tLhDv1tgs8sQ1lGc7t1QZ5fpe/3m
	taRliXG6PhyQgA5OtojVnzaM8uu4F8VViSg1VW/Zx5M6LiUEwGIxkfiOGxyY0BCU
	yihPX9hH/cgc1m+db/ecAqjdR4XUjvb1jtpsjYnPSN9h1zQyiA2G+N+62yZQNUyq
	uVDq3pNF9Suxx4TTAjXyZWMI4zcFfJb/KaR40Lew3c5G7ZX/SLcfUFC5XenLboU3
	LK5rJw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37hyww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9984a7eb3ddso978556241.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581526; x=1795186326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=;
        b=FDsUOpFqPotuMaKvErfTTUdt14iaw7eXHEzq4BxvXcK7dF1ZXBA1Jky0aYZMWpyjDY
         jlai4LyY0pphc0HY6ik47Q4si2YUgc2yWJ5kl+Vankobe/f7aeBKLyIbJf1kS8v9TCn6
         mTdg4K3b+WBB4VlD7BJGk0flAda/a3NVUMC4k/BC+0DJQ4KTRp+9R5EIKGg5exfXL3bp
         n97TM9xXAQ6z9rmulhtYP8Yqyh+qNeD0MbceMCC+29WZVzwsBF2BFjVMTsL81TlWOPgK
         X5G7X0MQx0maCkNNCyo0DV9xaDBWYAT30X8Zqmi5XkOj0yP+DK3m+Wc5WIzQcoko6AKc
         mASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581526; x=1795186326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=;
        b=ooy9Iks6VyfSm/4K2b3MmvGBh9BDXmBG2QkGdWXbmcLGylWL33cX/8UEpUlEwUjYME
         4LPZ3ysKrLPcqRF7NnAzQMZZUsRf6IRvBWmPWicICvhECNmvxNAGU+DfYes5pavzs7pJ
         FMZZlTWEe4nVsONNKTcFFpxVVTr8EW3Nfsl8TyMTYft2E7eMTofxeFPrS6zStt8/K09Q
         TaVKzNHbBiHXjaR8QbISj2LgAXwbjG4nIxzp8RcoOtdWQ36hgWjxrB3fT9/g5iocbuuW
         tkphFgsFAj4Fa8oaRbQmVUDxm2C6iWatT+jl29N+5DxuAJ86WJ4t/SeSPliHN8MNzBHa
         efQQ==
X-Forwarded-Encrypted: i=1; AL+hErE3/nk1Ue1QVeOYqpY01s4AWJ9j+Bw7UyBxczH6+QRcLvpegBnalW4l2h6YZXL3GycSikXxCEc3wI5fJ745GQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ihtd9TdqT0pKz+SO0Bivu8KjsIIICLztLQK4mws0HzeUxD7A6
	BJE7j/H4HBmXpBnXS/7+PYrWsXrOVjQ5+5Dyl7U7jBih/CJsD2Iv9shu0jOmHulpSc9TGhatSlD
	WL6KGOQRfWk4VA+Ju3AUGOase+D/8rnpA7Isy/LorbuXwqrXNsXFa5Y5PqY4JtX6qRWwfBg==
X-Gm-Gg: AYBFou0dpEcw3WeAyqJRDyAFt61/FhFxhxk3/6eSnPGJOE/o6t+NHrIqu3BJJusyQdP
	aPP8ahQ5SNdrpZWXYdb9mB5vzZFdWPjRy7doBBtxcUZBIVunbBiCwTwFW5gZUX2RtH/UY8o5wRf
	97lJgcrvqXyyJyRryzM1M6ScO4Dp47Vhs+nI6MVbE0bZU2EK0uI7E976yMnooluVdobYd6WrF+D
	FzRYGqrILjB45fKV5s9IbMe33lRXOVfzPv8t+0e+K8avC+d7l8Vd9gDDaDQyMg+erxxDM0BPrH8
	eRLXrhaa9raHBppTGT8Qs8ImoVtkvTMGLx0tO0H5XNNTBEm9q1cI3O4jrNHgxItrzgQIzDfYbul
	3hxC7KB1AV+Rmi20SimV22/9ORh6hANgjjyo/D4/I95Pc+T4=
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr962770137.25.1794581525741;
        Fri, 13 Nov 2026 06:52:05 -0800 (PST)
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr962750137.25.1794581525207;
        Fri, 13 Nov 2026 06:52:05 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm127575275e9.7.2026.11.13.06.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:04 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:43 +0100
Subject: [PATCH ath-next v2 2/4] wifi: ath12k: use MICHAEL_MIC_LEN for the
 TKIP Michael MIC
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
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-2-46d186f8688b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfXyAcaSJaCOiwB
 +2s8rCSCsE7H90s/dD40eLp3eDT1vcaFJ4D1KDMt1IgVgB5PNN20+ZDVzRG1d4omR5ymgHjEY2C
 ZFXHuwWUFFGS3ygNSFW0by8j6bYvZN8=
X-Proofpoint-ORIG-GUID: 9T3xt0erYaDlvbFP0DxamMfVyu3rC3wo
X-Proofpoint-GUID: 9T3xt0erYaDlvbFP0DxamMfVyu3rC3wo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfXwAPGplJimgug
 FrM7/fKqxftJzN9VFQeIKFFZH4CJGqTjBGqbJqq4ZMXxpnGn9xVe+5laN+D9kFI0WRwhDhP/Xav
 b5+xAFq/VMBNZeulI6cerzcVWiqvivUD5kI1r+oxtdeEoGP0YfD7nDxMjK58KQbe6QnDjtFxEWO
 8NF6NW8gZq7NM4owytqoFd+P3D2v4g2A1gWn9FlfMqESln+xas/wveOM2lJRO8qrRXcbptz6CGl
 4WYb+u5R/RxGRJ49pcR6ECaudU0H6P4D8obwbgDkfIxcBnTYC2idk/HCJ57VB2EBp5yPu2PCOvi
 Nm1LxnOYiL6Il2dU8tqr2C3j2EdIqTdyBD8flS3Ff1r6o4kG2nRWmUnXIYMAPcsm8q7wotoaUtc
 PtFhRDwxh4nr/oUCcTqG1J+/+Ou8FqMFPE3WCSXAdDLmZee9l90804qKkhKW1TKNTjt3rXn61ps
 HrQBuXx6Q4XzUdD9Gew==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af72416 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TY0F2RvhvldOZ2O7BigA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130059

The Michael MIC length is 8 bytes, same as the CCMP MIC, but use
MICHAEL_MIC_LEN for the TKIP MIC trailers and MIC buffer so the intent
is clear.
No functional change.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 4 ++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 6003ca901208..063bc3e58236 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1064,10 +1064,10 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
 	    !ieee80211_has_morefrags(hdr->frame_control) &&
 	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
-		if (msdu->len < IEEE80211_CCMP_MIC_LEN)
+		if (msdu->len < MICHAEL_MIC_LEN)
 			return -EINVAL;
 
-		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
+		skb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
 	}
 
 	/* Head */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 429f826923b2..f151f7de5554 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1037,7 +1037,7 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	struct ieee80211_rx_status *rxs = IEEE80211_SKB_RXCB(msdu);
 	struct ieee80211_key_conf *key_conf;
 	struct ieee80211_hdr *hdr;
-	u8 mic[IEEE80211_CCMP_MIC_LEN];
+	u8 mic[MICHAEL_MIC_LEN];
 	int head_len, tail_len;
 	size_t data_len;
 	u32 hdr_len, hal_rx_desc_sz = hal->hal_desc_sz;
@@ -1053,7 +1053,7 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	hdr = (struct ieee80211_hdr *)(msdu->data + hal_rx_desc_sz);
 	hdr_len = ieee80211_hdrlen(hdr->frame_control);
 	head_len = hdr_len + hal_rx_desc_sz + IEEE80211_TKIP_IV_LEN;
-	tail_len = IEEE80211_CCMP_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
+	tail_len = MICHAEL_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
 
 	if (!is_multicast_ether_addr(hdr->addr1))
 		key_idx = peer->ucast_keyidx;
@@ -1072,7 +1072,7 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	key = &key_conf->key[NL80211_TKIP_DATA_OFFSET_RX_MIC_KEY];
 
 	michael_mic(key, hdr, data, data_len, mic);
-	if (memcmp(mic, data + data_len, IEEE80211_CCMP_MIC_LEN))
+	if (memcmp(mic, data + data_len, MICHAEL_MIC_LEN))
 		goto mic_fail;
 
 	return 0;

-- 
2.56.0

