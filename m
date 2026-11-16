Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846156;
	b=b+qZOoUHtL1FHzet3L782sCtAEj+5JNeOJIc0S3iYDna1eyZs2dXP9ETSo6NJ9kJD7vg
	 5rCIYQF2COOeIaeXxUY8L/ppRZsL7e+drERiL/9TsnMiC0zGmAO/6qgi6o1t722x9Ve/Q
	 WCsfPsC4utTnSStcw+fnpUpvxv5Dv2JdZbpDQyC5CyU65wU/4RtY4LPEimHzsHg6vFQ4p
	 +dsD2Y+rLQqyLY3Mfh9wNeW/Ntu/eaMjWyvWz0Qrzf9Q11tAiKZM5kcZouNI+Lpk1MOmA
	 AKy1gch5djWx/BJY9b7/6RCpaqhGu0IQmX5yooHPaeB7O5EP1PIe7noVAD35pf6xTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
	b=e0RtR9qHrK3+XXZD7YuC4BReulMyUrk1GR7RxKES+aAy7FUPghoBJjtrYcFCEytDDCJk
	 r0fRFZbvJKMyIq5lukkTBSyUF/miuJ0wOUXnhq0hDSWrxZDEyPF8b2jwsee1AWawsGwC+
	 14eLcGed91apAbC6/5gjH/NEz51vMiAbzBOlMxzF3rMeC4SflntMYo/XcwfQ+BjEmFDiO
	 JO0wv/+HzN4t2bI6EVgM3/gwu0tH4Gn/3gayucotaTfHIE5UdpgrBE0WjkUxUJN7d2+Qp
	 wf1e/9CBz9CvMc7PeQSSUldwpB6WW3c30hCfJZIUjnuVa+pXCvjDZsR+tTKE33GqwYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KKVB/IqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aXW/QU7w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A5606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 856A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKVB/IqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aXW/QU7w
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIQdl1580549
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=KKVB/IqJmIHW43Y5iX/SbkcNv6M
	4wqpIJ0CiEte9tqfaDQrZ9zzJqnYBCXMghfBaExOruMjXJ8ySaPDeUAOikyeXHjA
	IDIh23CX+6N9Hv+dhZ9XUPvO9G+2D63QvC76GObIDhBkOXCjyJ7NW1Il6rL0i1gK
	et8Hi2v5ywKSBGtMzY/ChlxUx3+cmrJHZlDrf1LZubrqw1mnJ7X31N5/Lrr7zIUE
	YSTuEFj5Zes9LFQH/0eCVzIvvr+A/Lqhx4SlG8pg2z3t4ZKjG68W26dfQfbW8Eit
	IHcgJZ0bUc2vLc731T4bAv1gXUjt3SzEzSYm/1aVm+lW9kc+w4K+Nh4UR5w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g1cjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:34 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so1238185c88.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846154; x=1795450954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=aXW/QU7wwo0KFJoURXoHe2aKBWEOXzCDZXZFqQ/dPY34of0n9KFFSmIgZ+eT5+EF7O
         h0qXD2JsIH9ZSUSH64HYjkrPt1MXGDPYffxyQy7jNdTQkd7wLlM/por0N41ydhxE/dit
         r7M2/0yhpP2HgRwQfFSuziYhwTIxUNBLa40lJRQgE/Uz/mDDX9tAD+E+QM9jaKA8HwPF
         nltSUXEEX7x4h8LRz9NegWLjGR6kkmE0hLVjRGcVA5zIB41DxGv8kwYOEF1zeyXbJ1B2
         cgrw3kNMtr/ZqgnJZG3HlEc78ZDydaZg5nqQddOdvvDFVN1tYobLPb1VeZK66U43veuB
         qbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846154; x=1795450954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=eFyUZ+NMl1GuQk+FG6tR2GmjWkxleC0AnWXpuvl1fkTquevccyVol7D0ckMO935FGN
         P8Tb7MNlc1SBbJ68SrwjYqLyFN5eXCLWZdBlgiTEX9XklkKLulWWiy0MOJwSdMXHWYRZ
         VoBNcE4zN2qyp9cBvIDXUE6FCYi2f43DRGodbeRIyZkJYhTEILI31ArRO3+IZPewOE9i
         LQigyhExcPNjAWlOUZdxNOfmlaNLoSMqFENYZr9MZqiI4e2Cqn7xVX6zKFTzOf2dlT3m
         cHJGxiEM/lnlC5f5EEBFyym6xUe6tHiMsCzq0iQLttrhZ6jiBvFvkNgh/1oKFDfWFOV+
         pGzA==
X-Forwarded-Encrypted: i=1; AL+hErHEyNcWF00Fdoa5Tlmhf0rsRPQbsLpWMLRWWsVzeAtBAxaqCjq52Q9jtItrb9tLUWFUEK/KcXi3NWw/80bFig==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HFNYT3CuoFUH9FLnj03P1q/rXCUmoumX7lpRceoGtDFUF0dqo
	vJy2gQKdoLdPVrlARrlAWyPFFEhFzAoZZaSSsWeJOQMgDGZ4zw+NmtOY3mA7Mh1NgTZajFLVtih
	0WmrhVaFSg9L5EzL/jkYadVulaO3o9ILHH0UCLhzRjDMM6a2aH3NWh2qwg5UWVJSTS4mWwA==
X-Gm-Gg: AYBFou2eWBBGh3qChDzwGZ6Yy+X6sWC/d9WbTEq2579+q2z6cZXqp5jbJu1z+GH5XbL
	48Rzr81lVYMEidXVstxMvn+3hX8ZVlXLPXHCVQK56h504AH6pi+4JwAop3EsO2x2MseZBNByLHC
	Ts3u/gqVVMgR7li/PMFJT20JyAesnxkOpQXd7doQl5K49IBugdLxlan+SEHwvDcVO+sptRoMCOf
	AfnUxACSkVBbYq+dD5SuUaNwiMYoDUnhSrPeSV+K7raRjexXNpZ0Qwuc1z1kHc7M1l+yA6jO1tB
	cU4SEKvvfFVVoD4tmY5erYIVmYtOB90NdioPiEEASKOXx5AtTxl6qiVIzvgHTk5445Sj0e7jsB0
	2CUIpIUBfYEPORDZ4hGiBz7tInqUIemzUVpr4/if9irCkkLdD6PmmWrXac1MerYsr8l2pPbtgzR
	A8
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533739c88.27.1794846153738;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533694c88.27.1794846153043;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:32 -0800 (PST)
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
Subject: [PATCH v3 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:42 +0530
Message-ID: <20261116162148.2864501-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX4VV7BJ5k6D2c
 ZVdUjYuA5vGEjGH+wAwsKRoIK3k7ByZ8pAqwYw3HWFff4lcHqUFyet20cCvZ1WhKSp3HbLTcO6V
 vynpByl6pDJibaNd/Sx4pPktc2+Dreg33IyqzsFr3hzss5a2NzchvoWsl6xqVsKp3EOblKylpRV
 xO6PnGyEjsGKlgGdXMvtZqkxOMvpyO49NivkwONQlXsQCfu/q3ZI2nHq1iH29Dd17CK9bFvT0ee
 jlpCh+lg4QVR0BQtJKW+KPWUV2QZWrqVA/IL50pz11XfF3nI4yXl8dlMB2SK04KzlMkR9WiCzYJ
 0d5+EAsODHWjRguIW2UhwejS5trhq/AYEqCrm0JUaK3vpt6lFsfkfHfxNoOyEcai94COF9f6l3Z
 QKgHICV52sr2r+ey1Mq4ylssNGmZSAa5ct9xwaprQBkXlJAJKkOc8DvcwITYUPgMYOv1WLk2JhI
 al0JKIa1O5VxfradlxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXyYMKRe7gGGRD
 Gcsi1vnlaiVPRzHvoHzjsaBbTZ76b+83L5IkyYnQ+d/wQBoxpTvwf5IGHBLOefIDKOKSFD9KWPf
 p7ooUWV5nZgfmvBRGo/1I087Q26K0/w=
X-Proofpoint-GUID: q8aOn8LcaiaJycLJttBfCUbiOUmX--wU
X-Proofpoint-ORIG-GUID: q8aOn8LcaiaJycLJttBfCUbiOUmX--wU
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb2dca cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

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

