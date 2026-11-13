Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596032;
	b=toH13SBzuIrWHA1Ih3uZZYRUaF2wyT5CuP2f5dX7uBxJwmL/8+UdVaoUO5pRoZMOtYy8
	 XeoRwPaCZcC191ORFGf+zT4utNHg0JoOIPQVG2vV8iwNsYV2sCo/yVEjbwom3o6dM0hB9
	 I0odWSEVZTHBSQGr1KjqS3ew9vzh3+QkGFnIodgF0Jo2nKsq/cZQQIWkFW7m10UARuR8v
	 T369NCnkOxxr1RLjC+6QiuH0cuM/1XI5Zb9jFMGJzNkQCxMV2+75MCzb7Y2uSOouBNLJu
	 j/EhasXC/48j76jnEG012+BJGFdQHow5cShOWKeVpleecCPBsu7GurzrSklIhFK85VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
	b=n//wS5yQ0eThWCl8Cp4grxUhsqzqa3I41UASz6siI6fwIoi1TcXCXc8IJxqMaQ4KOMud
	 7gwDg3dUc6IU7WnInpG0ebCNy60GM0s6k84ifBYUGu9T/Nlfn9hcOQkp1fDX0ZN5xeQTV
	 UmC4gi7Jor/yMZSDndyLJURVSTZlE6CFhcZvO2g4aVTXmUpmUkj0a5WLNyQ2M6tP5EhSg
	 Qp6gepEzG77PyZ9e7O6x+9jb5rn1NbDDuyOWotYnP3sZNp/+FlQkI1Nbi33oVgDtFuL++
	 ESENgJmH/YK55flJx19vkbnw6M0W7QFws+/u0zAQ6a9K0X9heRGznVkDtTHe53CwyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chlWtNlF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgfCZh5I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA0606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chlWtNlF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgfCZh5I
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRTDW533308
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=chlWtNlFOsXFLmcefZtYaJNjW5x
	vy4O8EZdPf0zimj6RIz1A1D7MSx6iXjy7hDhXUfl/ad8fAVY2g3nyKLdbIsD/VO0
	fTeyNigeR9xlG2JaYFW3w5mG0fTreYlRb6BR27cUseLWXV8LlCIRgxiKYXva/twy
	xHBqPV6C+MiphHXqXgYfN/lr8EHponBTaA+2nxafx9I/h7OBHHbCxZfFSNyo8qi7
	HNGuwmxpZlhyr56WCuFDE9sBAmtjLV+/GacKnuXMQKi7vllonn0MUvQk7Tic9BLV
	gYqZb/a+S8yUTIGpcPVtN5NgfYidUal/f/dgNlvOCH0PEMi2kX7b8SQbfOQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaascg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so1518682eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596030; x=1795200830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=SgfCZh5IagFuyY8hk57HvwKOi/6Df2RzDDC+aZ+ZHm91Kj8nEtuPCEC6dDyibSVzyN
         fqoBnvDrNUJJPL7VLSs5+Myz0bNuwwQZAThz5uKm+LBCdSTx1qVdZgjgWKyBKcI6+5Mn
         X1WjHeV2FfGr+Iy4/PJnAo8eTiHMNZkJbd/QHFvokjArtrLHYg0NkOjniL/RahLEpKRL
         5BxoNo/BpKv+ylf12F3G5IiG8b6hJPmYdvRbSJZInfKDOV8JCYgLtD+BhvuEUx4eHpCw
         sVuniYvJNvNlLb9f72vdLOV2TsLLcqdQ9fbI695hb7VALs4vD5NwdvteMYGugNN81aez
         15cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596030; x=1795200830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=cPxYLJM7EeTcfM6ffbjEanLnSzpFSmmu/nFq0O8pdiR2L2U0cAzJE8az7RRdfIxS9u
         hVPH1wiFIjwgqB+VX8jaxin0p3TRStXz9QmBdtpIHCAgr/gGzoUbOlFoI12nO0xrxC0e
         W/KVQ9eXLx3rsGdmHr1AdW/KfH0RT6ec5pBHFERXoGEE5AqzV4pGYPHAjP2SVGXtJxYQ
         klBt3wM8bwydk3uG0sWBtJ8qL41AQShQ2A0Wi+0uyOMZpTcCEuftFEkHta2Fo5//nVFK
         JMis6N+EcxIgthSTV82ZKAdUpHYKHMfI/QvB7h+VJC5cnjLx0JOZfqtVqNBiCBS2iewz
         P7bA==
X-Forwarded-Encrypted: i=1; AL+hErGHJMbYDh58+M1moOHEiQlTBnpF1Vz8fdZUhe/xxLKj2v4dTUy4b6nGGNfEJ6KCKHV0euDSBi6luEVmuxsTOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9B29ICw33j+Qo+f+JL+TX8ixumqvmP07jXGXExZ9Jy7Y4kQO9Q
	rDMOOm7SB0/OJXA6CNNPAiaIY1B1OsDqNsvlu5EYx7DHralCZR4Ypy7hW5NHEuvud5KN84PAbth
	gzAGNaNo3+D53H7aw0NCNHMqAz3QYyyRBpOpz/ZsNmAzGV+RHN7GeKpTrwgCJvim8PLk6yg==
X-Gm-Gg: AYBFou1PJktAuOjK9L/nDloSD+3WVhyivMM53CQEikFH67bm33O5P2rbHrBA4Cnj9dk
	il6aeOs/j/unRPZgwfHeuNGK0Oc/LzJm45bIrj/xDfxc6qLV/Fl3hvv/2hP1L9gIFiHoO0ZTqYf
	9OCCPysFS1IcKUO2N0e2HGk4PeUyFC9Xfg/JFwEp3cAFYsUzaUnnFDwV7uivfi/2ky26EVHjZjd
	FQ+Pn5BsDyf5RGPTF0TPJFiJ3SZsi6UpsHbBx9fFqS2Mwf1LA9QkiKEQDF+LcUvra+jnuDqJkKT
	M9NvRsjVyY7K+Jf808X2//Az8lOV7xTfa3wUL2REIHSMhQvifdH86jsiN1eumeCCtpX/8R6QWuU
	OIOmH0o4X+0UBXwtVrQ3Lef1PyEMDhTngh9ZLMiGNDheRXJYjd2mjCE/Qu2Dl+NqM2TlqY5boie
	8=
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108374eec.26.1794596030333;
        Fri, 13 Nov 2026 10:53:50 -0800 (PST)
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108341eec.26.1794596029602;
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
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
Subject: [PATCH v2 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:04 +0530
Message-ID: <20261113185009.157893-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: UR73pw7dYcBLU8Gm9XEteMxbb3xUyBEO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXxW15JvOQ/W1C
 Xbxi4qpjvasxWgclY14AVYtmhgXvoBoXdj8ITdVBfNtpfCSwJq5xFRBSJ49km8w+q61GhGRxOvj
 E0UfglFtFTW4dyWBnRAieEvMNhuvLuw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/xXT/ypd8aEZ
 SDkCtkRFNhcYq9gEYce2E4dwWRjYyl0Tqbw0KR2hSzVWnIBVF1tN8AZxLsohU8WekPUt/cQD492
 s5CqTcjBZy/JzPWl02V8JJSuFGVz9Ly36F1XqgGCNB/e2UeTbwoB79+lP+ClL/4UxsFwglUpjxQ
 XrLachEK7SsIGRxhMg9Z8ip1wsTOZzLimml9FkLH4AuJX1zSrpzCe38h5mzYeekIU1CA2Lomq0k
 9wNEePGBVCKxQgRfnVT3pST3Xo9ptQv/UEXPEvz7V6083pV4vBf29XRKeU4+VIFw76gkdWRD2QX
 bx1mS7xnkKqRundu3Q9TjQyR59c1FDqom5HvLzQZKqBrmkxswdP/enYaGwafyuZeyJyKSYssFFE
 W3Cix2uF7HUR3UNDNsirX1G33Nf2GYOr1siiv1zX5xkqpKVsQWRAn5GvAJpC8VC8mZkOeAFWBEg
 E77+btZuF0U1YOA1CdA==
X-Proofpoint-ORIG-GUID: UR73pw7dYcBLU8Gm9XEteMxbb3xUyBEO
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af75cbf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
metadata initialization, memory setup, and segment loading into a
single API that does not expose a PAS context.  iris_fw_load()
calls qcom_pas_auth_and_reset() for TrustZone authentication,
which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with
a PAS context and can handle everything qcom_mdt_load() provides,
along with additional functionality such as shmbridge creation
and retrieving memory from the shmbridge buffer when the same
remote processor needs to run while Linux runs at EL2.

Embed a struct qcom_pas_context directly in struct iris_core and
initialize it with qcom_pas_context_init() inside
iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
with qcom_pas_prepare_and_auth_reset().  The
iris_detect_firmware() scan retains a separate memremap window
after qcom_mdt_pas_load() completes, since it needs to read back
the loaded image data.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39..ac73bda072f8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -129,6 +130,7 @@ struct iris_core {
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
 	struct dma_iova_state			*iova_state;
+	struct qcom_pas_context			pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..b701a7f43514 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	memset(mem_virt, 0, res_size);
-
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
+			      res_size);
+
+	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
+	if (!ret) {
+		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+		if (!mem_virt) {
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 
-	if (!ret)
 		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
-
-	memunmap(mem_virt);
+		memunmap(mem_virt);
+	}
 err_release_fw:
 	release_firmware(firmware);
 
@@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0

