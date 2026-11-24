Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503485;
	b=hcqDW+V2hILrC25eC25O1MRfFrHc6/krPUrzb53aZ98zMkYsZz8UwL8+b0d1ilTXf3tf
	 sMHnBrveeMR3Wv3fHKBMha7KqC2+7sOVnFXZA87iGCU7jYNSAB5zuQB8/yqjQf9rT9ZV+
	 /wwxE433wI0dLMNIr9Fe+Ns3qlTLucOs1O/t9GhJrHdMIGXfpVSHn55Y0cMeYh2sT4Q54
	 74qHyBxq9cDDVzZetnod2LJnIoASbziQ99mE0vNJRa9+ZG3djRYlpFOJImDKKqYqDNrjm
	 NEtxHnXGN5lTNX4gRI6GMT4AZpFE3RniLAqhNjCacJ5c6N1JoSuVTlaP53dc2pISaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=;
	b=L0Ueu5ddUWu6h6T51nXznny8z+RzABe3sDCsHiHk95NlqtLLc3+MGaFxlqcOJyCBoAyP
	 4prtboDAcm9eHEo4MpXFjw+ikCHeh1SHzWXCQ9Mji7iKHkRn2sXgHIesOj0x2kOhizGtd
	 mFBYbommI5K2snpWP5MM9C4EB9KqAXdz6fL475SoOim/mZMbnA/PG5MbO4XFnFvxh+J6R
	 bv3jmmdrfTiys92WC0cndQwkJuxIxWoI6s/ErrD1k6L/c4zOzZimLAYcogiULoEBpOeQJ
	 pbFuXwaUOs169TFZ0HD8vspnkDisNcHzLitOr2vPWnCX/ZCY9/fevSpIqLo+9mj4FUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KCPcnwx8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEP4OrCb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A69606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KCPcnwx8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEP4OrCb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kHOo2208787
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=; b=KCPcnwx8i0t/qvr/
	g+3HfGThzXkDYrYNjrF/jZsrGKrvJDBqaYvPGz1tVGGdDoOe2FtyPJPpNI9ZmE7V
	BHlabuOCVWbhBk+h++OyjKFkh3PDSpj8XTYkrtL8o0K3MYv/SRTWY9upGHeDHZLI
	Zv7It13M25luYhVn7b/utrGz9hWGW0a7/sNDBxCEaSHAyRw+Qvq0uoqkzmZg0c9H
	FUBr2uGEvGQdFflidChZu2u+vkdWD0tek3et37sOaaHqA7sZZyJpf6QV4m+zBFdw
	NVia6ayk3eoSHh9s8z+z3p09jDsd01gPNQaiKh5hc4XOSH4f1uDeqTveAbBo8/la
	HVwPow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy11a1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:58:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso4001781a91.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 22:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795503482; x=1796108282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=;
        b=LEP4OrCb0jhiomvV5OJEdI4hmL1UI1HwyF8P/UopdDFFMWBvN6Sjkih7ChBP/lN1kD
         2KKsAPZmQdzUptu6PCnCq39KVItydBGn+jYfZ7yqY944wWXEQXJZpg0M7tIITjxq6pjq
         xVHXSQxd9R7HMPBVqAanXr9FtaKuO7fxqPp725DObtzI4DVAmUmKhPs/C+sNppioLQMZ
         lVqIwEMt92w3dMqwjYe29xoREP62JAEcrKolkA/8UCLAwUGqeUcysDqQGmCXAWAIHRVd
         GCP2zwVySDxmMD6uN2HdU5x8Qxp8M/5CFjaE5HMTUW8Hk2ezXuvedX0yHsKy4vDXLe1B
         ryLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503482; x=1796108282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxWd0DhgEvMoKZFiCHllelXo8d7ZvfxJitilPWHbpso=;
        b=d/+uJV4sNkXB26xN0JDqW2LQeSFfKCTO7onOyWV1TOEQBftZ+5TRmBwVsqYUbPrTo0
         YlbXBBuo/cp6nlJG4hMyXX4KgaKTuI/7Do8Uy8+U93IgdlhK5JRHuI86msbCMG5SHq6X
         mOG8iQhzMh0PQpvmMuKTQEK3Zl4WcHDEFt6wpoEfF4ukYp017jeDc5m8w8N6rbxIMbUG
         +v4z0oJVbOUB9WNQqv9d7hxu8Gd8LfZ2Zxln5cF7nqoJuNvmIEs9ONiOR9ucz5IoFORQ
         XhLekCLwgbhKDNxc8QzIRHy8YHj4t5tVwdPEKTkVgcUnSdxKCFpHtFOWNqDk9gBljwdZ
         YOIw==
X-Forwarded-Encrypted: i=1; AL+hErHYwVd+/BQzI9Fje/Cvy3FXDhr04o3ycXRskEeAzqDsV2abZ9nwzLHyXF6npLXSlOGbgvFRXaQ8+gSKblhe+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pPdTQNkm3VmJXPWWBsVozPoAte+l4MfDsh/6kIYyXxjH+voaG
	6Q+S8NxoXdLnv5Q//BGQhiBRgpJd1iHKtQrqEbbhqlevlyJp7bH8n7b9FD/VfTbE/5/qL3QIipg
	Bcayr7MoyPIZ1mCQa+32QtGSGIw893z3Z+eslXvH/yv9VJFVVj6kB8w3jqVycNuKbC6yAEQ==
X-Gm-Gg: AZFdTZfzB/HgzWeLj6Md0Wo5Z53uaqCQk0gAZ9LVwKebAj+TWsIS4/sTYssp1pqEkVZ
	kyd6N9dsqlgQeuVxdTK5hXwnpttJcKn7RBdxEDKJgAqSXVz7jS/Obgr1sLuGIF9w3Y35CG0zisD
	eaKrdAGDL6wBp/+ZOkWi5PyImpf1a08GdpDp26TZXEfADcsdllrZBa8Isw8gJCTbtf55GcmnBPO
	mlNqA7X3kejQ/ZO2sEUcdBl09636nOWWpjsFOqD7vviM8IkgpMa93aO1Nas3SZbLUaBzg+3rJPP
	5hfW0v/5Awu0Dqg5Rme/bMlnxVBkX8GR5RHRuXHEsZiV1HPvFxqFBs4C8fCVTJkMN1qrBkzNqkk
	fFMIeA8t4zDKCExIC9onpJ1fu4Tydo37ONKbq/eiiMocHKo4X6pilT6b/IfS1ULhe2ea53cHNxC
	4uwQXqQqSpadLbrXwZUOAnz8ftmGpPpn4bOk8eUZe+FtOeKgOjWHbCgIgptI8ORjNIqpGpSUEt
X-Received: by 2002:a17:90b:240f:b0:3b4:a7b8:7d97 with SMTP id 98e67ed59e1d1-3b4a7b88040mr2852898a91.9.1795503482358;
        Mon, 23 Nov 2026 22:58:02 -0800 (PST)
X-Received: by 2002:a17:90b:240f:b0:3b4:a7b8:7d97 with SMTP id 98e67ed59e1d1-3b4a7b88040mr2852884a91.9.1795503481809;
        Mon, 23 Nov 2026 22:58:01 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm23819811a91.11.2026.11.23.22.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:58:01 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:27:38 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: ahb: Fix IRQ status flag
 cleanup
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
Message-Id: <20261124-handle-irq-retrieval-v1-2-e2403fac4e9f@oss.qualcomm.com>
References: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
In-Reply-To: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: X8loRztp00JYtCQJgC9uKGC2uAF8lY6G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX4bf3RQ6Pu87O
 XJ/GM6YuTb6DLnlvl9cgSZcxuWMW1wIDkIHgbS4VXCQUnPNmhhNfrTAo43zSvvowt60GrpRmNrW
 XhTwO7jf/FyT0G6qQmsXk86R41nuEHA=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05357b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Yw8OSCRprngcOe9xP3oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX9DuRpQOPtUvE
 hIrjBbWK4jDkP2V5C9jS7U+6fT9oUthD+6GgCrEfstds5oH6WEPRkEDSgixamsrAO8D3O4G5ZUT
 q4FxgQROLqhFFydvk90Y/sd0H1qs8yFsy8zEvKyBtTwFEjGiW/jMWomjgx46VDmRspD8OIILj/n
 FaIXkrx0giQKxo7KF4SSxcf73X5PWo/PlTOpRRhuZCQc5FQ2ArEMXOQjCsa0refOf1LvYt1G5HV
 7RjHfXRTBEkEFgZZe04GO8juGS1CN8CT0rqt6fLaKejfzcfmCmCnW0dPPZkj0tEC7sU710JDKws
 nOija1W8q2pfTkmwn18REzsxCvh30zonSSGFM0XCyOue9kEeYil324PmRZSvvmFFiwvb2gBJCMc
 8EPCg8+Wl7AzB14s3mMVGNLuUZ9FiW+DfXDDrzs+ohjv4EF+jRxWrojP2WU4LcVEaO4wjf1fkU0
 JF77vyrymezbiGQgN3w==
X-Proofpoint-GUID: X8loRztp00JYtCQJgC9uKGC2uAF8lY6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240027

Clear IRQ_NOAUTOEN and IRQ_DISABLE_UNLAZY status flags for all
configured external IRQs during cleanup to avoid leaving stale
flags on IRQs requested successfully before a subsequent IRQ
configuration failure.

Update ab->irq_num[] only after devm_request_irq() succeeds to
avoid storing an IRQ number for which the driver failed to
register the interrupt handler.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 64e4a6c5affb..030b1ec68b53 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -200,12 +200,27 @@ static void ath12k_ahb_free_napi_for_group(struct ath12k_ext_irq_grp *irq_grp)
 	irq_grp->napi_ndev = NULL;
 }
 
-static void ath12k_ahb_free_napi(struct ath12k_base *ab, int num_ext_irq_grp)
+static void ath12k_ahb_clear_irq_flags(struct ath12k_base *ab,
+				       struct ath12k_ext_irq_grp *irq_grp,
+				       int count)
 {
 	int i;
 
-	for (i = 0; i < num_ext_irq_grp; i++)
-		ath12k_ahb_free_napi_for_group(&ab->ext_irq_grp[i]);
+	for (i = 0; i < count; i++)
+		irq_clear_status_flags(ab->irq_num[irq_grp->irqs[i]],
+				       IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
+}
+
+static void ath12k_ahb_cleanup_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
+{
+	int i;
+
+	for (i = 0; i < num_ext_irq_grp; i++) {
+		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
+
+		ath12k_ahb_clear_irq_flags(ab, irq_grp, irq_grp->num_irq);
+		ath12k_ahb_free_napi_for_group(irq_grp);
+	}
 }
 
 static void ath12k_ahb_free_config_irq(struct ath12k_base *ab)
@@ -215,7 +230,7 @@ static void ath12k_ahb_free_config_irq(struct ath12k_base *ab)
 		return;
 	}
 
-	ath12k_ahb_free_napi(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
+	ath12k_ahb_cleanup_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 }
 
 static void ath12k_ahb_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
@@ -705,11 +720,11 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 				ath12k_warn(ab, "failed to get irq %s: %d\n",
 					    irq_name[irq_idx], irq);
 				ret = irq;
+				ath12k_ahb_clear_irq_flags(ab, irq_grp, j);
 				ath12k_ahb_free_napi_for_group(irq_grp);
 				goto free_napi_ndev;
 			}
 
-			ab->irq_num[irq_idx] = irq;
 			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
 			ret = devm_request_irq(ab->dev, irq,
 					       ath12k_ahb_ext_interrupt_handler,
@@ -717,16 +732,21 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 					       irq_name[irq_idx], irq_grp);
 			if (ret) {
 				ath12k_warn(ab, "failed request_irq for %d\n", irq);
+				irq_clear_status_flags(irq, IRQ_NOAUTOEN |
+						       IRQ_DISABLE_UNLAZY);
+				ath12k_ahb_clear_irq_flags(ab, irq_grp, j);
 				ath12k_ahb_free_napi_for_group(irq_grp);
 				goto free_napi_ndev;
 			}
+
+			ab->irq_num[irq_idx] = irq;
 		}
 	}
 
 	return 0;
 
 free_napi_ndev:
-	ath12k_ahb_free_napi(ab, i);
+	ath12k_ahb_cleanup_ext_irq(ab, i);
 	return ret;
 }
 

-- 
2.34.1

