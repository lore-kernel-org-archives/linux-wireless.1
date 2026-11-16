Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846136;
	b=x6bGtPJHaHPlPfakRo95bWQkvc0kaH1to1b8+9muAB+SR0Z+aa8WvqT9f5lU8RTOIEwI
	 tCVLkIDT+suqQy8ExRC2pwp9v3ttuRF8RIzfscvppLTm8TogDISwKBx3gbOUzPTVmKIAs
	 6RlEbp5CnD8ZrhTTlZjXdKYGpT58V2OdAFjTcHC6oxsX0N7nucdcQOGp2gsuoBKVnE389
	 gRysyUTu06Q+cKTqELZpjb98SJ9a0XAlcmgE+LwxLKHFPcQdLimFCorYnBeafnopOrp4l
	 jna2O57WOzfs0167uV4GQbEp1k/3m82mE801EzLYCG8U+riasg0DTHP61F6lgRBIpuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
	b=pURd0SYpnaU1wOrdL7mhw5keDJJg1CToPY6RnW42dZljdslSmVfjQhwZn27nnno7KuG9
	 DKgK1NvRNB6EXbfhVzOxjEG3Thmzs6ZhqTuYjM6+8MDSQeFHcWIYXLVfKJAKOHIH4atCt
	 +lYeUKWRpLfRe7Vbu5OzR7K5uIWoLH2WCxk5BsG4k2W+rVsurR1kIcaGnsPPH+g2ZcHtj
	 3Ck5e64APxQwZh34b2thjRL+TGNipRWMq0TUV0kRhS4zqwDbdOUJrqxMZ+L4isO/sER0X
	 g9LsinA61N80OeTf2Mke3NnXj3vqiOORKjaF+EAbs1kuXy7gqcN70IP0oNYxQdnxWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iaOQbQ/V";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D3606A322
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90D3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaOQbQ/V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGISGB1677076
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k5XQA/BMzue
	iAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=; b=iaOQbQ/VnwK28Q7DB7onLCF1Vyv
	PQESzDoSFO1a/4RMUY/krilKAOkTsodyyfsg7daDC6nWKq9wBQINmJI4VospHbQu
	v4AvglZihlgUcqU0u8uidncVsg//B3evdhwddZuDa2qW8Sl/Ydbslys2C7JihE9b
	Ehd4oFDFdgQGVzgVIGxsKlcnIhBP9OljwUArJxBY53yks6K/IVXxiKaBrnsV5g0V
	+jBey2O14f2+UkW6oAtbZttFS9buS3FX5nOhyFT0AbtX0kepV8qrBdWEXTnO2m+b
	3o3dBNvbZgBtrcbRlwaXQan6GqLEDs/0yFEA3NOfdGK6LczaMljfKnoYqQw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003hc5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so1916817c88.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846134; x=1795450934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=idBLOiMAfkhXVjCCt2oOtWQV2K22SbQ94vCrOVFdEWNLgR/9Zn0MHMeKRBW5MAuUKr
         GFtqMH/OOsH0Q/vhhGt7X9KbQ+lhtXMqXKWeZkPVaqc871X0wNtzF0YILFycRxMP0RM1
         IypFac2P+tdGIa7auuHFK6N9eP/rv1DD/yu/EAPhL21jm85IGGEvWqnTx39qvhoBEKwm
         E1GBU6XUI++otMmK8omq55WCxq4jxFXnKGjuQe+omGw9uyyB2e6PhZaJzHcjfklb7XLx
         gSg2UjdJUro6IPcGi6mi+pmRThpGzObfzzyV8S774E8HiHRF7xWN0S1R8tKRYFoXqgNm
         N7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846134; x=1795450934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=DrsK4WZdNLoqOOMNYZ+/Pg2dhI1CucRdh9vm2jE+IyvFjoV5rkFJcCUUz0xzHTRd8a
         bxgA8ZLcbiItGVGpSEEq7vclzGd9Je6Ov8K7EAGX4atff5hq65ZMwMQALh6X6M44E+gD
         Q9kL92GB7EcYQpcM690H/c6mRn9Rb3aHKGJ1R8jHdsEB6YYgo27NyyzRxDA6NVbq2OYg
         2mGchrUNXV4q1WjK1etrkXQLIkkOvOfwwvgF45AIIntvnCnGXKAJjmSmo+mH/T6ek98L
         gwurkdOQhgFOVK8i8MeHmNtJ9e0OEnN3B1I+mdvdE3qZtyKaH+4Dr9TVrduDqTiBuJ/I
         qA/g==
X-Forwarded-Encrypted: i=1; AL+hErHd3x1TAy1R07VQ3pvwQfLICrOnp7R88plt7Xtw8Tam629SaExdQxGg7c015PY29YgbBMqLN1qSv+utLTrtbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TqqCcFPqeLiL8jZHsf3A6OfZtLiBe607UakC7CqevpXDZnp3n
	RzPha3rzQg104mO/2uzcGJOOafLkatjF5jrv//kTkH/KhJl0S0mMXR7pjTfqbnmILNtjP02PvCE
	3qUsCMLCSwA0M/FCXgotz5vj6FnmDiuFZPdclLhSyL31OA4UCKIK+hPj2jhxt2VKWGaSckA==
X-Gm-Gg: AYBFou05INVeaNKOcKr5GtnFychGiX/CekYAxKPRYixKvXsqAS4ooPd3mPUEOmoq19y
	qp3LdUA9GHMX2uYG0EJmrcwmd5jXK+H7MDV3B6V7nj0YUQMbwSMDKqkK8p991JPxk34q/M7Ox6M
	/O9gvz0TNP4s9ln4pm1nfH1OezLhhRYLis8/k4RCWtgaDzK3gytenLnO84ZsOrhazASacxcHL+7
	9K2jzi+tTv5rUoS63ixqiRsBBYm3e5wu+iNDD+N2RYhZPQmXNVltnsZVy1DwH2oWSV4TMKsj5MB
	FCUaMtwFKJlMUIAGzado3qI40kTu82ZEPvzBw6P5yWKceQA43Uye/IcF2j9NbUIgyGtsaI7Zd7I
	QaV1mi0HVjWu+O4NLD7c+3pMtha9Ji3A9Y4SKRpo8zsqtqOIPW93gpB2S409v7qVyoLXxBgOZsO
	Qs
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065915c88.19.1794846133584;
        Mon, 16 Nov 2026 08:22:13 -0800 (PST)
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065862c88.19.1794846132861;
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 1/9] firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated context
Date: Mon, 16 Nov 2026 21:51:40 +0530
Message-ID: <20261116162148.2864501-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: rJd2Eky1RuJZ_N9YRZUlVslU29KuuyDK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX3sdkrIbUM6ts
 ZTdpcNNV9frWWgGYjXiHTW8aFkAx8uJqonsYJLek5NUQfjQRf+h8XDH2BxlLr7vIROOsp1LmE1U
 oHgsySDkJxxnUgUlisjGLgPIzRO63Qc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwinhShZ2Uemw
 apWRnoK1yUK5KevrtyvedCuR05/sDsaYdEjJ2OdE0MKx59OJfL4nXn7Fgy0BwdUEl5maW8Ltgrc
 5fmyBarG35wgFMoMasxMaDsweQUQeW9PRCRZChEMaY+0EKKDTXm/VSlINP0cQUM+UC6ukAZFgDj
 R3uEqOG9hG9KUUHdIVVJ2Kng9i7u7eMQ/ar/oLrQvqoQuG7ET12iGhf7zxOXWcVuWUlV5Vu2j6B
 cGZy355QOcINNHnmsadBqZ642jaTHzXGLe1OdlyroGD+rjQOOcYZaPxzSWRetup8ARVIR6o59aX
 Qqxo8xxUCXElh/dc1YpIe3AU6sMmPUmfSuiOG7j4kKxhCbUUbmbi5erGzSC7WQD0evARv02tQsO
 2mTL9SpWHXr+kIpsaY8xzQmeT+uJlcz/P+yTS9USn6X2YOGS1gvobHUVmc8u/bBhAAS6Xs4mHqB
 YT0aSmO5rme0G+kBNfw==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afb2db6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=A8JJMgtFIkyHT4jqAlUA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: rJd2Eky1RuJZ_N9YRZUlVslU29KuuyDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

devm_qcom_pas_context_alloc() allocates and initializes a struct
qcom_pas_context using devres.  Several callers, however, either live
entirely on the stack (short-lived helper functions) or embed the
context in a larger structure that is already managed by other means.
Forcing those callers through the devm allocation path is wasteful and,
in the case of functions called on every power cycle, causes a devres
entry to accumulate on every invocation.

Add qcom_pas_context_init() that initializes a caller-supplied struct
qcom_pas_context in place using memset + field assignment, with no
allocation at all.  Rework devm_qcom_pas_context_alloc() to delegate
to qcom_pas_context_init() after the kzalloc, so both helpers share
the same initialization logic.

Update the kernel-doc for qcom_mdt_pas_load() to reflect that the PAS
context may now be initialized by either qcom_pas_context_init() or
devm_qcom_pas_context_alloc().

Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 26 ++++++++++++++++++++++----
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_pas.h |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index d74dd7b4f332..fdf62003fbf1 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -14,6 +14,27 @@
 
 static struct qcom_pas_ops *ops_ptr;
 
+/**
+ * qcom_pas_context_init() - Initialize a peripheral authentication service
+ *			     context for a given peripheral
+ *
+ * @ctx:	  Caller-provided PAS context to initialize
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ */
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+}
+EXPORT_SYMBOL_GPL(qcom_pas_context_init);
+
 /**
  * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
  *				   context for a given peripheral
@@ -39,10 +60,7 @@ struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ctx->dev = dev;
-	ctx->pas_id = pas_id;
-	ctx->mem_phys = mem_phys;
-	ctx->mem_size = mem_size;
+	qcom_pas_context_init(ctx, dev, pas_id, mem_phys, mem_size);
 
 	return ctx;
 }
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0d55e9e0af3f..c6ec67e1da09 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -476,8 +476,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * firmware segments (e.g., .bXX files). Authentication of the segments done
  * by a separate call.
  *
- * The PAS context must be initialized using devm_qcom_pas_context_alloc()
- * prior to invoking this function.
+ * The PAS context must be initialized using qcom_pas_context_init() or
+ * devm_qcom_pas_context_alloc() prior to invoking this function.
  *
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 1d132e89536e..458075868bf5 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -36,6 +36,8 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
 }
 
 bool qcom_pas_is_available(void);
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size);
 struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 						     u32 pas_id,
 						     phys_addr_t mem_phys,
-- 
2.55.0

