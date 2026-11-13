Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581525;
	b=Br47JvGPMSgsKgMv2pOKcmNxxOu90cyDEaNM4NvOAIcsG6WjqmYd0ZFon5o9H5tGOQEH
	 Cli5vZCpPG9i2CMj820xGDfyj+6s58diRczGoTgcYuWrW20fe2951jpnXw/0Gghfi+aCe
	 yVvqJ4tvP2QFDpI8UmuUnyru+R0Urg2rtvrddQLuWNqljsfTfodLLr9nPuNKNQ3lB8uCj
	 MDUTbcpP3HvQSsUQxsuQL8E0iI9JVRA/0VxsEE2jLht0HV+Pk2H7/ICYJLsPnGcD1mmdU
	 iwrleendn3RgmDOtEzJcEeGEtdWS4j66aQdyl3MA18vtjtK6z/Mtwaw/dGoZ3DDG/Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HBnpD/rV5a+eJzRuAwU/AeVBE8xDRNUHClstKN9l9mw=;
	b=32QGQ62qm0urww3iCHI3CKxiZDuydyPRnAhzt7/mZBNHTHwjQpnSjJniGoLB9VIP2IWD
	 m3+V4wQCng2zQEM5jCLV+PvIPXlstr2c0SXnNFT72TyqbGrtbVDJmFR1mCfCq/vk/8xYu
	 7GsDeoNLiRPZdlTnuY9NQqXCsx3Nk3DkmSCHmDLjthZdJujDyJ5e9Jcs+XABGVaOAta8O
	 e+cMn8ZmxBph1GdQkSv5Nx/t7LrcrkY95y+b40A/fWYTrI6Qfy6ESl3PGdK45zjPVX6x4
	 jUswAFp9LZZSWqMfBcscbYv4pCbBVpeyMNzAuvqdVrnCtzkbqb8tcW988gYrtXCh+Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FqJIADiX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhAlOrDp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC02606A327
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC02606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FqJIADiX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhAlOrDp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJSrB2796659
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HBnpD/rV5a+eJzRuAwU/Ae
	VBE8xDRNUHClstKN9l9mw=; b=FqJIADiXaN+fVjc880J4KA+PJPqiD+jr2PJi9s
	xGB0YAo9VrdJycUY4AeWgtr+5hRbg9EMryzVLw+J5AeLvDN20ac2oMM5JoMyzpp2
	5YAxtcWAtPORM0VhkpLK5b3zWF6mrR5qySoaZTv1UBrvcIW2QD/Gu66wACfGNCaC
	W15S1weIA6rp7+8dxXm331MpjR68LNty2vwaohtwMv/Mg0imBqKbkzMo3F2mUEdI
	ECmXy9x8w1DuPtyYLSvu7G334KN4W3LzDQqS0zLHH50+r2U5U3+JwrX6a1yJ2Z30
	UkfiFQQgjGdLXJL+noUUHKuXvOr03sll7FMRvxoqRuX8/U7A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6ssyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d32175c486so191757137.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581523; x=1795186323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HBnpD/rV5a+eJzRuAwU/AeVBE8xDRNUHClstKN9l9mw=;
        b=fhAlOrDphmavore4Sc+Fvk9p6xbGONGpGmmAfq4O1MptqxTkQn9dHPmWJrv9OLUrND
         Xdh/GndM50KjvKsaw8ahloorFZFAxj0ppS6gravTNpcVjR7H0PPqX0s5C2l/qQL/JJMb
         GF33dj6AjEsfLwEFMzkjcO3ygbT515uB9oEhB7K1sSPfb7ZgvPQjpzzdN9QkoN0mcW8o
         sck3fBBiwLJQMdaTAQE6gT0k5DUgtNC8KvnxPlxbW7DxSyuetI6VWyD58VigP4rbzEk2
         F6g6IwgH9Mg8DMohB1EFRzvVBr7IRHtVbU3Ta2oAwO5IKM+jnwWhUfGCmJVanMG07Aqt
         /Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581523; x=1795186323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HBnpD/rV5a+eJzRuAwU/AeVBE8xDRNUHClstKN9l9mw=;
        b=1MVzCd/2OvWcZA7hdBaEPCHF1QlOEbilkk2qOJns3+jZLTIB212jtfUjiduwZ4RLFP
         kMF764IXHx3NcSVTquW1kgTgeiTdcxIU00ICrkMra8FBicI7OgT/MhH+TJ+78m2k7RTN
         EJwmrhq9oF9HnAwjEtxpgqpb6ZDy/ObV0v/N0yO8pANyzXl9vy4B4R/YhuublpZrIHwT
         HUG62NLnKOeds8qqAa2TJ8qb3cOQ4EE9RsQakF0bxBEm9ZwCv+EGOGEqHI14mDmRRJAL
         011yZpX5jVEYYOScZbsBuOTrPYQGGMXA3VYSmx9Nf7SKUmf3KrJWBaFes+oFk0hzAT/y
         0pFw==
X-Forwarded-Encrypted: i=1; AL+hErHJTzA1YxwdPtr6e8iJ4qeB+/pBjHB+ffDJG/AkkCgJNvdLu6V99NVFkyhO4vX/e+TLctJGzj2KdBmnoV1Kow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NrmWwlP7gbueHcArkHvIf1FgNWX3UrjSED9MFQPt9KYd6Lbid
	IVw2xJH3q+k92y1Ez0WuN1QlnuPA1MbnF4jPMNfxRyp4GeeNVCa1lmWmuTQEvhzhBC2PNxrw1zd
	Oy107OSaj4pWYeZmO1tT5h6qRoJod4mHfV3mQJcW3UTVBlqBc1Z0bq5mg8ySsFsNp/0Voow==
X-Gm-Gg: AYBFou3FHEscmg+xHJxK0/joSug299ZDvQ7XoGmfBMo5V50yH0G0ULYZK9Pb2yhorpe
	lWERX15jtLBzm8UdVsBT59Z0+P+kXxeb1tC8fGJyzbAgiPexOyoiAUgmSSvaBUjSDmApJ2COIuJ
	PcOHiUf9LjN7EroqrwAqqpnBVcYLPhhaLTY3XvRohqtncIPY7ofiuMCX4XY1SHSlXzkXWKKPTT+
	AmFYQ1o2lkN79rlgMyy4BnP4Y5d7yKuhnkJv242eAwOTjSgZwKLBV54UD+GlqfHtFvJ19RGIqs/
	k/x6jfauaPVZHLFp9FDiYBde01UQ4d1SaRbaFM3dlWhM9DDxQRpxOj194hi7pFI8l9iXMyZqNEN
	AsHquS1pQylbAZmWckG2aUgeUfYfPLNpOCSfgvw2IObprRMSiWb/R7Z0lSEqE8g==
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr604418137.37.1794581522510;
        Fri, 13 Nov 2026 06:52:02 -0800 (PST)
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr604412137.37.1794581521863;
        Fri, 13 Nov 2026 06:52:01 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566a4a2csm35910475e9.0.2026.11.13.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:00 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/4] wifi: ath12k: rely on ieee80211_rx_list()
 to send rx packets to mac80211
Date: Fri, 13 Nov 2026 15:51:41 +0100
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBBEf0X23JUkYqg99T+KhzRZ61I1NrHBI
 v57g/Tay8AwvDcbRApMES7FBoESR/ZTLupUgO3N9CBklzsoobQUUqJZeqmeGFY0ybPDQGYYvEV
 tz/ZeUaWkriHTc6CO18N8gwzhROsCbV56josPn+MyyWP/2fVfe5IoUFjS1jWNc3V39TGWr7cZr
 B/HMge0+75/AX6FYMjPAAAA
X-Change-ID: 20261011-ath12k-rx-avoid-realloc-6c8cb3e32165
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfXyIMA/Zp5I7SE
 rE+P01x/nVpK2TXfj8RkIAkiqipHA6WKSItIruWo/gacki4dJ01eXERgJM5MxRTfK6+4tAN8B3e
 +TpcRRg0sU+NYcWC698tIYsMykWzYTFnm/IsvEe39gGNvbGrWvyCzncz2JXPYte+nXoBqtg98u6
 euJZexuWrl0Xjzq+vAPebwGULVkM92CkDy7EijvVraxtZY1op3au7+akbwFOv5X3cbaQO+bR8ws
 /wybd5wCjhtbUxY1ZT/nK+oDSs8osugpgHF8japQpuxbsOutGpGKZvX5sd/hVP3ySeAUfiIJp3O
 TFhvBB0bNoMexrhcM2cxx6OXdgi/6A37mHjvfIR8Rm7ADe+R3bETRjvm4Ub2Y1ps2AakzJu5xLI
 1EVIOfO625cJ6CfgazwzJ6rTIOmV0VRMPfMsdQ8XccjCpiWuYmT9v8SpzRRITTE1+F0oU8fIQfb
 89un1r6u8xm/hj8XCyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfXwqatvid3ZXv1
 DwH0RZck/KlsAk8LTtj8JzKhkEFcbaaYyAwgEd/FE3VeB2ZPy432JFbLND99EYBNjbazVJRglrz
 EcRDRAGfw6E3tNg+TCvD5TlDyWr8p50=
X-Proofpoint-GUID: sGqcVpFnAB4_cn8dsPpj3jMoL97LdPxm
X-Proofpoint-ORIG-GUID: sGqcVpFnAB4_cn8dsPpj3jMoL97LdPxm
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af72413 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Uz-ZUL6_wFoK7G5W0_gA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059

Rework the receive path to collect processed frames on a list and
deliver them to mac80211 as a batch with ieee80211_rx_list(), feeding
the result to napi_gro_receive() at the end of the NAPI poll.

---
Changes in v2:
- Check skb length before running skb_trim().
- Move MICHAEL_MIC_LEN fix in a dedicated patch.
- Link to v1: https://lore.kernel.org/r/20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com

---
Lorenzo Bianconi (4):
      wifi: ath12k: validate RX frame length before undecapsulation
      wifi: ath12k: use MICHAEL_MIC_LEN for the TKIP Michael MIC
      wifi: ath12k: rely on pskb_trim() to trim the received skb
      wifi: ath12k: use ieee80211_rx_list() to deliver packets to mac80211

 drivers/net/wireless/ath/ath12k/dp_rx.c       | 113 +++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  10 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 290 +++++++++++++-------------
 3 files changed, 234 insertions(+), 179 deletions(-)
---
base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
change-id: 20261011-ath12k-rx-avoid-realloc-6c8cb3e32165

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

