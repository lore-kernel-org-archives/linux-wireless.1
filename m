Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164177;
	b=u8jydJQPCA8U3Zbj8xaeQPR73NeKBT0yUEiEIW3Pqk/0LaCgcmuvSViYi9P9FWa4RwVP
	 n2YcXzB3tAmKXl3qbeBbdkLAeGdVEMW98yyvDOqWzr6dK2LELe4UmUNmzYvnxJrK5PEK7
	 NMo/zCWngFS1mKgaU+tAVyHhm4ZfBvIK2nbJMfpu/JtLFCzlS1Cu6+DrgKi/6JMykl0wi
	 URgXyrB1CIeMV1+X/kTHL3cCWMXZVa5EgNrIsJHcqN8+oarWnzGsBCu1vaoYa0sis2Q0s
	 4t1wt0ykqmxWW+a//YiDL9oV251ZZXkNsQvX2bVl2wz3zvIubsoTMAuZ1rt9C/aeR2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
	b=apLcEr4V2/u8jfA8umkV9obCzaozzY2mEUb1OQTuSvV8Evphm4mo1Rcar0dy/Vm+us7i
	 Osv36Jr+33JRaXWulBhw4MqrNwleXgK6bKAptzGCd6hbE+LedpD6+1iTPKl4bKcyWKIZt
	 Ht2A8pfGxY4nSEwrCVC02SrEwQnwDeClVGbWEKtyuK1u4tqrk/Cv1dXwRxDmfhk60+JC+
	 P0BFL0H4NmZicVRDONMAAy+BTk04bDhQ0hgAvnEylrdIc0g/ByR8DpHaxc9SbAUVJDVw8
	 fdmwTEAJ5ybos1OGVI3p4+1AxqjaXvzZW2qjwRnDcxqaS9LXvgx0ayQQtnzduhVuoqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+4tpFQ8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W/kEnOJF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42BB606A33F
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A42BB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+4tpFQ8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W/kEnOJF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqYf144481
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=; b=O+4tpFQ84LvN5Gsj
	gbjLHlkdm8c+7O7h5XGIplVBZGTGBv/jMjYpCZO+JbFzeQVYxgGz8umXvXEV/1Z5
	lTuXqyH3kOTpCXesus5lHKnzHZ7wu6M02jpgDyjkMSq+ooRcBJehN7OGGomr0ckP
	Jpz5eb1Zk/8XqV0y2Bx8Og9RXy3rFvpe/Fg/oIHICbmabB29mVu1C90eHMDtlm7C
	w4knEl1bbrxfs1RkV0iMWU4GaygGj5S4/icagr+lP6ggFy/5DtLRxXrfEPnbJfiM
	9WS7aOsl0yVSht0S63KWFj3xMBay65ruRD/tErxxNmN0NCB4vkGdOgEkjKsdA6QZ
	oPd7pA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbgunc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso820104eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164175; x=1795768975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
        b=W/kEnOJFbkOyXgg31zI5wWKtUteMVFFhQI5qgpuLLteMMc7IeMwOwOjWVElancEF1X
         UtaMEj8e8JO2Gyv3QpRxsm19YsiVJ5QjuASsbl5PhO/uBL5RWguWirK/pM1LzjSx7OUC
         jm+1ME/yJDi10o3l5GvbNDp2n8y8Cyc6RTVTXUBOkuE6QGVAIXfXcb0c68hpgxnYV8dO
         Lz/62nGcyzVMlMPzD1VYF32FmEjC3eEYXqSrdm7P7F0KTxpparPniI9bv1rw3YkkqfKN
         wlK8ZEhKz91JM4Tk+CvHva+alyqrbdJbejqzveY6OJqkx1+jSyrREPmFt9TB5eBGSyDO
         nY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164175; x=1795768975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
        b=JlFniImCb9uOCR+fIGzpN6dleT5ey9WEpHjGi+5nzmcOybQ9MnsLGyU4DQCs3ioImv
         LDZ/cugXWr6sBrviCQ31B5RdN6INCTSxYySou+q00NfUJ6iqfRMoSKv+FszhynoI5U5c
         nInaytU0t2ZeiV5gIROm7sVffy7bz9PMN+MVd+MPSxj8OdDlvFUbip9Kl3impSuLAxHn
         TnbFpsXDu83WW7cY9Nt+lO9KeGCq33N4tPF876piCUpqn5P2LKQNneIyNWkHb8EHipCY
         MIirGsEygpwFuD6rOfMt27w7/2MILIOL1X5ZKt8gI2u9qSD9x+gTqWA4t6F0jmGr8RXI
         tI0A==
X-Forwarded-Encrypted: i=1; AL+hErFdCxc/TU/RKeSi3RptLa0uM8P+9Rzj15uCy32eooxZTzVX24O4faZvdvLHyLCzyavIDA0Z7HfgtsEjJafrew==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3cOIPAyut/UgYldMngcjrx9BAf+1MxAsJR45BhQYy0XG0EdQY
	YaKsriq79o+/XlqZtyT7jgKpHjdcC+Ug7Kjwze/zmNW4qRupiAaDuDQ83a7/0ycdjVVi2+uswSn
	FBOKJVeI+L8wk9YijFglZ3RwdYce429pqGjXrGbqC+fX+Md6NR/KMMT14Axz4R08//qPbZw==
X-Gm-Gg: AZFdTZcsLbZPOd1PVvNfDN28pMGfftWAQm304sWY5gu+FxPyAKc0FcWp4uIPUPpnmQ/
	e7G3XgU+sB+gdwSfEHwsCXrgiqOqXeJPw2dc1xC2ZJWIDPym5z+5xHrvxqO4EUmReUs4lEclqQ0
	nzcybzjRpoemYQ2pN2CudpGYhak/6L0S7ucuvpoYkeZw1Eaj9T7nYh5SVXeeAHgTIOowUHmxhww
	Q04zvd8gSnh1IY3M+wdQjF75S8/GgvTNqUqDeM3TrgedVA5kM7ODvGVKnq0LaYKpSNQxvBk91YP
	zUNvMWuPPToy9yz/fsVE49EOHFiWexdmb5TeBJjQvSDH+XYYzYryvdMGRT84Wq6vVwGSDl6m7Ap
	g0uk1s5YX03oZOL38+Y6TILs+7uxFnpDDdpFaV+IUa9RTeaFi3+39hmk3Yru5IUd8PRbYqaRQbM
	i1Hcel7zIm2zFC1KNNK5x4/tw=
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr2663180eec.36.1795164174789;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr2663155eec.36.1795164174328;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:27 -0800
Subject: [PATCH ath-next v4 02/10] wifi: ath10k: shorten the recovery
 timeout to 10 seconds
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
Message-Id: <20261120-recovery-v4-v4-2-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1714;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=2xsTAU0BlNyklfGb1CwfGmuYHUyteh3UZGU+IoKePV4=;
 b=0euwQuzGBwsbZxmnsl7L+mmcCDxRGUfThed+VF8XGyh/obQDnOwis/dkK1v8Ajf0vriCFlpmc
 cIDstrR2fzQAaPIj3m+Kde3cms4hDpr8h3/jjbynQrxtAFz9mq5kIBr
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX3RcVWx4DVKat
 Et11ONYJ+ovkK4n+EgColv+xOhxOPgqDoA8eZrxpUXXWHDQr2kHcb5BzFYXy8ViVBQmWLsGslLA
 oHYLt6mFAIavuHHfDiiUSW0t2+0QEarxWNHCk6KHCw5G1EkhW03PVWva+shbl6EnX4eNsBUWYMg
 8scdhCxflcSFL0yPklrt2U6rOkMx/8MkGkV3P9NaEHjnggSlP41PptD4880yMhXitxfiPdEaOPs
 YRLDLBtAiALYD0ksAgjrIDkqIo5w5r+u0lNAw/EzJpkwU52oiORjllgdcZkbuSxRc5bpGzJMZF1
 J74SQsTIyqYmKtn9ueBCN4yHWzA6e9gwdMsY3xsrnqo2N14B0Vs9FsrXnVNt5ZyRyK330RZIp4T
 qBDt2+UImWFodOHuOq7KWl3nqFh2emMA+r+10fiAfZ8Pou5qtlz2b96WFsp+7sYcA487XFDIbWz
 gdXeNUgR1339W+Hns5w==
X-Proofpoint-GUID: DAjnZnXMfGXiHelVTL7aOm5BVA8AfXD2
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b00080f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QyRN0U5rXNGPXgRQ9SIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: DAjnZnXMfGXiHelVTL7aOm5BVA8AfXD2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX6TdTL048PNML
 LiXHn401SY9I0hWrxyDYNlDIjjE4h7B+wA8Ld3vH79A6PxV1ILKjWcI2304E7T0CdXqK1/CptDe
 CZYqAgSrrcB4BrO02M3MlOK7rOGoTQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

If a recovery does not complete within ATH10K_RECOVERY_TIMEOUT_HZ
(20 seconds), the device is marked WEDGED.

This is too long when recovery gets stuck during suspend. Some
platforms set the suspend watchdog as low as 25 seconds. A 20 second
timeout uses up most of that time, leaving only about 5 seconds for
blocked callers to return and for the driver to finish the WEDGED
transition. If that is not enough, the watchdog fires and the whole
system crashes.

Reduce the timeout to 10 seconds. A normal recovery finishes well
within this limit, and the remaining time is enough for the WEDGED
transition to complete before the watchdog fires.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2e100dd246e2..75ff555173b2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -87,7 +87,12 @@
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
-#define ATH10K_RECOVERY_TIMEOUT_HZ			(20 * HZ)
+/*
+ * Some platforms configure suspend watchdogs as low as 25s; keep the
+ * recovery timeout well under that so the WEDGED transition and any
+ * teardown that follows still have room to run before it fires.
+ */
+#define ATH10K_RECOVERY_TIMEOUT_HZ			(10 * HZ)
 
 struct ath10k;
 

-- 
2.34.1

