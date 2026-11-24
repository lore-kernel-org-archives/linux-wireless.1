Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503481;
	b=hfwY1R0r13A2vBcLNk9VaK4F2xH9EoiLcTOPJA/5VeETtPoY50IX6zeE1IjXWSyoRNJu
	 2mOZmsABQ02+jlvgQ4efJC21v1sfrFuKu9+AgtsVy4vti+1oplDoDTsFWZBspW+sB7kcK
	 YfjyfVRf44Q7D8BJuJQA8tpoSKFsRcZzdFamT52JOZQaUpDBHUD84CLVxwB9FNGdZejlG
	 2+O7lGfijvnJGvGqD1tDv7ecO626staqLU63KNeb569nwSgaFO8iUYtHDtsQxVR4PovJw
	 68SnRV3wSdx4FMCMBpqXmoBm3ny+6UoBtY9NQyEUWc5q3a03nK6McMlPmaKGm/mxJgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=;
	b=u/BlDv6ugUjmXmiw0t75XRCu7QpXabA+wV5xK2l78um4nswxUEJT3lEKA8Bq3WH+msOv
	 t7jIPS9dJCyg7EWxtzNrHgzNhm0hwzW2cElvcfqRqYHFHNBq5xFxnxVhtPKtUsklELqUU
	 JF1c6UxCSh9cHbsFHDD7DjkxJzSZyUg4tErurnjlD/Hp4vFjGTAk9ZQ4iddtvilYrBYgS
	 QcBv6VOLMhkTBCOcLnO1Bob5LqWg/Il2OeO39ol6/+mPgMQO3qKUPs4Lo7O1c5Ak39PTh
	 JfrvdhGraW4+hpaGSCar4KlNR5F6L2c3v3u7uJYMPkHdbgbwk1+2Zq+Ic/o6H+Hre4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXrqbQup;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HzTxqHyG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CB0606A333
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5CB0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXrqbQup;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HzTxqHyG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lARM017001
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=; b=NXrqbQupJfG6Mtnn
	SXb1TxP530Y0fs/L5JXMagoGaOEtVEfjk2EkKBeKB0auOij4TKPbVl01JxCqYGQD
	feBKyb+EDYSXelg5HMrhuW6Hip9/R1Xcwc6QQmct9s9zjJ/1fFn1/gSGDbh084kK
	6p2oSjDBudbtNUYAbMV4K7CewBkfWLzX8l8glsJuBLbVDUkpj77eRoOfG0YLqCqT
	uWVNLYEX0P3dtzBccgP3hYTXRVI6tAFtnDY98HVvIW6Uvzh9ajcMHZ2oUX2K9LaI
	LuEpbIEr+ugqcnlkexeNh2gZpTUQPdxkcUcpoLewOurt9Q3c3BKodSZz0AFWvtDg
	joyXgQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9ntcts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:57:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso2859471a91.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 22:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795503479; x=1796108279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=;
        b=HzTxqHyGqYB2sJZZc1ZqueH9+zTZ7YYz92b5613lMF6KG+Nde6k3ZtaVAU8h2soEwn
         zWoPUSWId6nDIpIQ7fLQuO2NuXo9YNjKXvqWKRJ64W8z3LHxl9NwXq+JllCFMiDtIsTc
         oYYhI0iYn5lJG3WW6wcF3CM7x69sOu9qQL41PEuI8hdURz3HhNznbetNuy5QBLtVic5E
         2n+Dm0r6edQfEVWzAMm6/9FxWR+6zNmeUMpUCbV22vRdDuW9R0/wDKe1nItAe0v+Gqu6
         cqoT3K86o0XzRmepBnRG+119GruAaqpP/646+/OANT5BvGY2YyeRzq/PSonvaAG/p0Wi
         WEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503479; x=1796108279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=;
        b=b2buP52RUUyobqSm49vCbbiGg5CzS1WbN0oOA3Ik72Z1+AcfWgYmkX6eIrq4yozBFl
         eTmIZSwl9v04hyj6G2i9pxCclYF6CL7GaVI95t3/zXOE6g09SFfvLSrtdlrp5JFFDvpU
         FowxuJAsBzVMHQ0TEeZkgSvoRM1gEDGixfNVI6doy9MpX6qfHjt+dZU2KbxmbAw4lT8Z
         1rqEHlcwJgVuZDUnzGYEXh0mTTJc5JvLQyGVK+zjMlQHyh0q8zAXA4kbA46P5IPQLJ5s
         YrtCVMr+BpKM7Hj1etaEOnu4GG4/xuC2SLAnUYkHgM+hLfQR9rv5fiFE6oDhbg+Ym16p
         xdEA==
X-Forwarded-Encrypted: i=1; AL+hErEyh/+HZXQ7Kw/AnQv1Slv1CP8BqED/ymD5yo6z+iWhissBG1wR+Xadv2EP0c/VK/VUcS0z/PvWw4sP4fMnfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+I00WQ2MOUF5bAk1dnmAeTTkzdl6Tdzo2vnO56TnlzFtDqbm4k
	fehQqapvMLShMFe9gfWWtpqc6zodnKqqNhsDWKeItA/WCKd7aTo6RoE2xlx3QM9QteikU3wbWI/
	moFHD21OjsHz7DcvZqkCvG68xoiA9DrTSxHTguaUtPqNMSx8kEXPJx5hb6dFOnPx0EOOAGw==
X-Gm-Gg: AZFdTZda0Qd7og9Zfiva70XEedbD7Jo7btZhHzBcikiXSEUtcMpMI09/f7BPAozRo3W
	n1V8Q89Z9F0M+BJ4Hp17dwqV6I2c7jWF83Ik8BqSf3CGXkj69zoWf6JviMxgQRyLZq6Q8+WOxxU
	x2LPSoV9d1nuFdcCbvAyoIPYQ0TlYbPn6H4rFtc+Y2v9nFNjVJozM2T6uHCJrT9XUIyhCASC8ZK
	s9gZCNsXBMLdQV4lKBzaLLVSE9z6TvIxw9xpQYvSf+zY05gZmJVektNXhOm/ZcLaMjgHDNnyop9
	hfigxXKSx0qH9u5Kroy5iHnq8GZww+yppkD9hCdNcqGLjvxQLOCeHDFSpQLPB9L/FsPUnqXjgGF
	WOyn8TxNpstUS/QhEjSj4V3vV1hYO6dJTYlQ6MF1eTCDAfCvd0yosDxFlPomWuEb4oGzvr1JhBM
	s3ytCyEeBf4ryKHCeuQFJY4q8zxLKUIm/8lLsH839txzJbMgPFTYI0gUkv5/RNqN4LZwEwQSZ/
X-Received: by 2002:a17:90b:5543:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b41cb33a0dmr11712161a91.57.1795503478674;
        Mon, 23 Nov 2026 22:57:58 -0800 (PST)
X-Received: by 2002:a17:90b:5543:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b41cb33a0dmr11712142a91.57.1795503478177;
        Mon, 23 Nov 2026 22:57:58 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm23819811a91.11.2026.11.23.22.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:57 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:27:37 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: Handle IRQ retrieval failures
 in AHB
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
Message-Id: <20261124-handle-irq-retrieval-v1-1-e2403fac4e9f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX5fHoI5R3h32Z
 fYM+eC/iVQgu/2cUDUqra7K2ZlReYDDnviRXa5c223X/sEUVOmEjB1gjF1QKpdOOT6JfiwHVW5U
 srJ9bHeCt1iVpTWWJkRMu+Ajm1l5k7aW9WgzeZWF+ZnK3TG3z2LSzErV3gfmsglMIhVnWs8hrLb
 1g4XWnyqo+T2qCla/yJeCI/NVmMpHFjHfV7PGGDEU1IFCvyY50mh9TXFqFvwCQS8WtfwEFHqHIe
 ckahbXcv/5axMAY72t9gcDMxee8Oub5DcotiSLO3mi2dnjKBKykrmRgZnj+uQcmaSmY+34DSTyP
 CGw+Fl0l7+E+Dtuz+NQqnFgI88EaO9nrtMwBUdKARETmJdnIPNz+ckbRr3KisGlXPY5mrKs6HuS
 ClpKq8+KThybSWJUR3lnSGOY2WdmuJyuVj0uym9ton4QrU6mQiaplcKGa0HTm+rCy6PawreYS1R
 VsMgi9crZWV5E0+hWTQ==
X-Proofpoint-GUID: WBpiMCkQLR6NXumd94GJ63CeSfcZCOCI
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b053577 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5OVhI-57ki2XEZi5AbcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: WBpiMCkQLR6NXumd94GJ63CeSfcZCOCI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX/FyEQlwHJLOz
 /V+JVzPrQaaWccF6sEt3FM0sVT46AWu3+4BYsFh27soMf1E9wWAYb6LNYNyOm9Zug/6P/9dTiyB
 K4Ags6e08DKic8icKnBJVmHaNWsDEf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240027

platform_get_irq_byname() returns a negative error code on failure.
Without checking the return value, the driver passes an invalid IRQ
number to irq_set_status_flags() and devm_request_irq().

Check the return value of platform_get_irq_byname() in both the CE
and external IRQ configuration paths. In the external IRQ path, exit
early on failure, free the current group's NAPI instance, and
propagate the error to the caller instead of continuing with an
invalid IRQ number.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8a3919675134..64e4a6c5affb 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -701,6 +701,14 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 
 			irq = platform_get_irq_byname(ab->pdev,
 						      irq_name[irq_idx]);
+			if (irq < 0) {
+				ath12k_warn(ab, "failed to get irq %s: %d\n",
+					    irq_name[irq_idx], irq);
+				ret = irq;
+				ath12k_ahb_free_napi_for_group(irq_grp);
+				goto free_napi_ndev;
+			}
+
 			ab->irq_num[irq_idx] = irq;
 			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
 			ret = devm_request_irq(ab->dev, irq,
@@ -741,6 +749,12 @@ static int ath12k_ahb_config_irq(struct ath12k_base *ab)
 
 		INIT_WORK(&ce_pipe->intr_wq, ath12k_ahb_ce_workqueue);
 		irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
+		if (irq < 0) {
+			ath12k_warn(ab, "failed to get irq %s: %d\n",
+				    irq_name[irq_idx], irq);
+			return irq;
+		}
+
 		ret = devm_request_irq(ab->dev, irq, ath12k_ahb_ce_interrupt_handler,
 				       IRQF_TRIGGER_RISING, irq_name[irq_idx],
 				       ce_pipe);

-- 
2.34.1

