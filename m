Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596021;
	b=lqSkwz8dVl5mz1jAxxJiiYGha74ZOjsT6wzPjaG2LthFXWBsnl4b3cT8G9OI/i110XJE
	 dx/13k2mgntE8K1rbMWVUhgoAzpX06LBQw2UO9X+SbUivbNxLBGP5iIFnA8NUeDHNIbQH
	 57eFNOBb8uQWRT7+26lSyb9uz5aqg1edxmWv19xNSJS0Ini4CVL+E0YKpzqUlPMDsvVtm
	 5xxOb0F2y+8FLLPbjYDg7Ju24oEsvDON8sKzmsjokhrSxwhLk4y8RxWTnsHiRsFYljhgQ
	 xzA2h5RnP34me7+EtUCTiFxH/pMUjhfnz8l40qshQnJ0hx07ZxfgnaNf3/eR9cpB0Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
	b=CHRbm4zLeaSkPsBAKPoRbVyVIZVWL8fPqC3npJ0vPGT+HayAOE1ns6FatY0upx8uJ8kV
	 bYfQcdH4ZHZS+l00PBAifB+agMGRYaf7Y5+TsY8ejuB4TXWU5dmiwPabtyQqo4pKf3mDa
	 pFATOkqnFRDExK5uzA7ADfn3N13n+PYJW1n/lAo3HcDzSIO70G4EnvmG2KSfBRCnqKpbz
	 yMS7EzxUBU3w0D2yRnFGEYvvey6W3OHhPqdZhRqyBx957xufPxEug6KgAN8tzeqOyPHbn
	 lCCj5Bd55uP/U1dedbuCp0VTDy4hvYv6kTjb5+pGiXxaL4jk3z1JGIM8yxFGu0rtfpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FlQglaKa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRfFGhZz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82635606A882
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82635606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FlQglaKa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRfFGhZz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQtBc074761
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=FlQglaKagUpZEUdwHsKRxWfwJTd
	uDYB+0aAyNZzPFH175mwxz3BJqPwv5s2jMDIFqyuCzk3yachMUCiXbgEJ8jtK8en
	njaYIweUasFR54cbpGpZQBUFocRLz5s8kh9dpZYuugDu/kcjgbAi+oQVJXzVSX10
	m3ep0d3TrgIe2Ztc+DhhBlZYS7NN/Eoxj5PGFiBZULVvCKa61/dejSnLQoxSXft0
	GG3q/5uQUXai64IwiZHQl+me8mZPlbGXgWhwqw6OT81Hbq+YIncYXXQrvet+58p2
	c2+dE+wG4tVng2F+RpmLExIqlyKqq/nP1sCVOfettrpnJ++qfwdiICCWSgA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu3vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so643415c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596020; x=1795200820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=dRfFGhZzsFuA8d78CyJngAIpudligNoAZItTJImMyA0TuROlFHWhCdKDeoPSNn0Mhg
         aaPKLMDrmPgtykgBDqHxoiFp1sIZHSHzsh34f0pBOGv4ycnn9WxYxDUmm4MBeNJ7feLY
         vPxGvDePuK7AtI3WS2QwIay54HrUvCBa9hYAwFTYKw3yo0YS90GfkcoaUttKLfCdJiGJ
         6unUVF+lhL5IXsiAMAcoNjJj24VdH0R6UTQ2/SAupjKi7d+7Di3frDLeHCLwjJtK3rti
         UzB9Hwlhd672Qa8L7pTCnLDmgQVNq9TLRtbwlLLq7QbvzS8wy7IESTOQLN/uP0KXuJYa
         1d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596020; x=1795200820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=09JH1Q8KTf2VQJWyCJEUFcTAy84ctv0X8jVb0v3w/i6DjYGN9ZOcuJXNV+7uPkedWJ
         q09iLSpN+nRdrBvioJz4DL6lC6QL79Kp/7vcFUJdc2mmGm7/goe6LnW0T+WXQhJYBoMv
         PEG15JhQ+Lo2KO7mHCRnRUYoh8H7C+HQORHZnsWnKB3ELxKwcfJnqTQWRYy4BqBb21iA
         X4ytkGbvyAskmD4ARNmqKi9xLr6jvNpUNzcHnHhSG8i/iHUc9wfh+kYoeIQ4oGtxom1D
         ihtG8ENbeEnNnO/H12XZtSIkJGeFtujbNbaCojNsbIsxEIRv/kdH5TsDAUo61dRGn3Eg
         NRyQ==
X-Forwarded-Encrypted: i=1; AL+hErG2cgO3mvz60TfUld3UKEc8Q/VmYZHIb/GmCzAhEv0qL1KCLHr2wCrfkaWYeyHfj2bIFpIKEXpbfspNaIM+sQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z82iBETJks1dlgbJ4UywjkkwzsHxfEzhvF0ZxoQ84xL2u8k26Ze
	gNt4NzphugNFWjuYIV8AsYixRUI+aRzbXEgnNXI/8g95GopwKs1FTFWE8w41E+OVvp/ldxjtwzX
	HJWrsYievwJLjPlpyV8dz2mz3e8eti9CX9G7azCXcvrosx9ezNMbveCHyaSi8RMN5INqQfg==
X-Gm-Gg: AYBFou3zqukcFs3Acka2mKDue9nUvpYeO+Wn7B/DRvtTiKQ0fNel/NIkfbHCxK7aWOt
	yeVkM4mDrpZ+Mekq/LwBqtiD2YWz9QEZ5QqFHPxR74Goma9gVnsKY8mKs1jsxmyqgVWv17lqZry
	Bju1M/koxB3BcQqwW5tUvHCPqAQmR9uFUMaeO9euFj2ewNLtX96YlItjAcwGCZXTkDOnzKhZGGy
	OwCoQFL9/JQ8LgjFSA83qT/+Ro4YCw5LjUHcpngMao5FtAO+oYB5DIw8uHhLN5uBkyPmn7AHVCt
	GZQRpA9/ZTWaY0RJs+4VQG/SZmGC4jT27yaE4trbZXxMAw3z7HQxN+gEyjPkZTslxNhxE0oajnu
	9PGNtbSKnu7dtjQNf0KOjbgaCVBJbOwJm87sEZTfcU+InIODt1WKsBxz8eoTBhFws/DcSceU8hT
	k=
X-Received: by 2002:a05:7022:b054:20b0:1b3:b6d3:b91c with SMTP id a92af1059eb24-1b50314c8b1mr3584821c88.7.1794596019992;
        Fri, 13 Nov 2026 10:53:39 -0800 (PST)
X-Received: by 2002:a05:7022:b054:20b0:1b3:b6d3:b91c with SMTP id a92af1059eb24-1b50314c8b1mr3584783c88.7.1794596019294;
        Fri, 13 Nov 2026 10:53:39 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:38 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:03 +0530
Message-ID: <20261113185009.157893-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: SsbsThhIUz8BqmMHQIHTFeZDu0x98y6Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX84LcrqsF00Gt
 fsn7TUHVbygxXwAjNaW+yQ/lJ7XBza2AlmbDDtshegq3e2rGxJkBeSKia4M7MUwAzMbTEEk3vmq
 vz5I1vbjxcmmCdeKr7i3mDwYzM4dtXflsCrNr738177zC/8QEpnDrBcwh6b7AYN7O3Epexbl+5J
 NW2DKCfxuLZa4ryCRVAKeeGFJqzzvgG9iGM0D4K4TBXB/mx/yQpFDkX0J+11FTzt9G/L00A8QQY
 9Uu1SMfr3yVIfxO+O8tVN6ulekPMgm+hustyXdCTvE1PuSJvzZ18yF2ignhLLAFZQ0jtZgftNsO
 jstMhoPjHVBORdeyz5OCcoL9qQX8hQ8HM5ixQTFKMgMYXd/mDGcEKphhswYN0/eJNHGRKp6KQ5V
 cXXMgZL4iCjIL/IOtpnNBeLVua7LcxRLTZV+0RkTdGH5Tl13Gy5LPLZ9DriIRidmyu6csF3ahhI
 zeAePo6l058F8K8p//Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX9D5olz5k+hNS
 BG1Og3p8/gza/P/Lsv1QeAn9OcEQV/1+KeTyoXu/w4/tkH/WyeSgF5F8NdDOsYFprm5lvbsb0Hu
 ruCvA8GrqBAoED/FenZheNqQ75Y5anE=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75cb4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: SsbsThhIUz8BqmMHQIHTFeZDu0x98y6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

zap_shader_load_mdt() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context.  zap_shader_load_mdt() also calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is the
intended behaviour.  However, a new qcom_mdt_pas_load() has recently been
introduced that works with a PAS context and can handle everything
qcom_mdt_load() provides, along with additional functionality such as
shmbridge creation and retrieving memory from the shmbridge buffer when the
same remote processor needs to run while Linux runs at EL2.

Replace both with qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
using a stack-allocated struct qcom_pas_context initialized by
qcom_pas_context_init().  zap_shader_load_mdt() is guarded by a
'static bool loaded' flag so it only runs once; the stack allocation is
sufficient and avoids any heap overhead.  The manual memremap/memunmap
pair is removed because qcom_mdt_pas_load() handles memory mapping
internally.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..8e4aa8e22108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -121,39 +121,32 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		goto out;
 	}
 
-	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	qcom_pas_context_init(&ctx, dev, pasid, mem_phys, mem_size);
 
 	/*
 	 * Load the rest of the MDT
 	 *
 	 * Note that we could be dealing with two different paths, since
 	 * with upstream linux-firmware it would be in a qcom/ subdir..
-	 * adreno_request_fw() handles this, but qcom_mdt_load() does
+	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
 	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
-		ret = qcom_mdt_load(dev, fw, fwname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +158,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0

