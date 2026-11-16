Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846168;
	b=eUoG6hdDbnT28lUx38vLymv1PiuxJlHaGO2Jyk1XnhfPCXJSkO7c2jLFNuOfxl1rgaKA
	 F+GC+ed/PVrrVdlYafOG6dnc+vTrl1Ai0Pn4+JvRhiZ0bO3NU1SiEOd5cWr67OZXrG7XB
	 BGtcwpOhGUxyYudC1eNYfnszGjmJ5L5p4CCZNUg31V3x/kACa0IbAQbUT9meae95jq72p
	 AG5oVSzthM1P0Ckr3J84Jp1ylZn8iGHHuaLT1UbKyBZR4+Qqp1kvcPwRDLSZdNqQZl1+q
	 OohBjQf//ezlWMT2DOa++dSDIbZo5WwWejpMc9zCyP4SgvcIqa8TBuk38KeI7Nd813Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
	b=BPpFJ42aSVq7EzkFqzrOB8A0HPcEurdjx1ZxtJNJKGLhvglHfXL/QmCGvc43zDNtYtkA
	 mhumdqvFXDm0eEK6H0dMOp4scSoDRNlgqNcHhqMuRyqysivyjD0KAb32weqcoJ5gbv9G3
	 JyS7IqOhRRVIHgSkVKQAcb6UPBvxV2VMo8ECDEdIFt6vXbixZ28T1Cm+xDUqDBbYGGXtt
	 VnWdKflfgC7sJwW2HuW6x/iSTfeOIgppOEXWD5I0jJJs5PC15odUk/H5WAreECcBy+WL5
	 g4QB3SnL6mCO1e0Q2HE+0iZlUoHr6ZgdTw5p/SOHCcJvQHoxuD4SIh11ERab/BrTevg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IG9B9Dqj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BCD606A880
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BCD606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IG9B9Dqj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIFQn1110380
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=ImKUP3XzzkcWGQBIHDld29kSpW1
	3G0uJ7xw4IKj6KnrhZDSfB9JFndd77V8uovcWSGwnRjYp6meXxZoJBI50ayEkCIh
	I330kLlI+/Ar3WA9eAymEYIX5A/kqaKYXMhTce83OnuGUbV62i7e5GZ7CKjqm7aK
	QF8Pn+N1ZojmqzzYyrfv/WTtBipZJUibUu/LVq72U5a0PnScjI1uzPbuh7NmL4o9
	B8ItKnCP9ocyMAghENDK6IwB1R6i4ADTkilLUnXEeH+jN+LYIeIb2Lc6KproX9NV
	2VR/aeYO4AzSy0m95rDre8ROZELsYzIzCRFwC+uWejLqZtliMUhFFFdJEew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgheab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so1238393c88.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846167; x=1795450967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=IG9B9DqjTu7mrVxZb8a6Jjj/ipavHF1A7/u0nHOHo/PcCI7DbblhyAyAUDSIhg4uDG
         s9n71Kse1yYUt6znQwLSiqPiqfNNqP8xXmIn+95bRkhBkHXu+Q4rV49J4odmATZYZ8cl
         f8YGFj0PuUwYSt4csHJucdwqqdS4gydvvGxZlo7cgOhhuHk+o37XdL3ejDaVTgNlVh4p
         vPybbGORCIAQRA6mDIZvx8pzLr7vahXX9vqS67HI1f4x1SVa0xSDmR/9uHtkM5vo1G8S
         c0ajt+pbkGM2qHXHwXuPw2MFqcrwqy5bi0LRRXsmwL8Rb2mONaELfso1JjYwBTELHKoi
         yslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846167; x=1795450967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=QcbNJDP5xK/7dInSJYiluhQ6YCZIpOkPAMoZIoBdL5XyUVdi9WyvQ+MmwsIicppvqw
         IVzCoIRaK4CZ9Jrn08NA2fV5Evn+jCwrJFsc4tlLXUD1jQ66cSBi4ouE9Ne5z449RaB8
         //eDCAE44Tkcx1gQ8mMEzN9BFt1Atk2jImCiTbhyUGegRMAY7coPgNYs96io6aEwCjsT
         Y8uXgw4S3PMzYWBda4k2sprXBU+FSPLLTn3CkGGYwQnTlOvItRBv59a4bRN8yKSlGcz4
         +/bM5824gJbpbhv6/rJ/d2VU7sRBbRDs/OvmLIL3zB3fgnCkbUnfTbnsnk2C2aL811zG
         GzbQ==
X-Forwarded-Encrypted: i=1; AL+hErHjpJyH1s3Zjf9f1gAoeDsZ83cYdkPJrA+7dQK3ySjguF/W3vWdrCyFsVTtaFlOUPUTDgevpDSbZIwVY3lZxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z94l5vG2CzrZq4HFEZ720JNmv51ICkwQQozHgW1Dkan0MgEvryU
	X0j8Ea5s6wSPMp6Vb+9i2OxQAEVggqA6F2vtiPC7f6+G5flC4okS5z3d+0u2g/dmgTMc8hAvm/j
	IVz/8uKxKGTj5rgas4bshLzdXlZwh42y5Ln7Co0Y1ZRTYKTqBHECWV2mq4CseS3R/DI6Wkg==
X-Gm-Gg: AYBFou3wuOKdsv737rY54MFfhThYFnPYk0Mj8oLl3s3VGYoiysNx2tuGLaSfQdTo2rE
	GHQebqpDsunj72gf9sBZwjZKrYGOwn5+qI5bDv29zX/SQscrpI2F083qJ55nPsMRcDhxkR2DDwv
	vV8O4CJN6y72WEeKHgTnPUHKLN/qZ4tQcEPYWwINbJXNBWct4ee4etAJPb5+FwKZ+CbML8ylQW6
	hhGYfzyFOBxLMpDFIjFR6K/eAlh3jRnQP8Et8H4PmmHDfC2jEZs7GuBRAsvYf7J6fKKUR0CYKLD
	nuWNzlBV7Yhl5GGONQTFKQ6YMaxfBHdsEPxYgAuNMah6s/aZc1wrkpFG8DTS0qOKUe49vux6sHk
	vFh3XO5u6CfksIR+e4hgj7QQN9vCWR6ypXQUsIXOMBgDJyHPIUExUcx65Z4Izrc3PzqFT1bFuEF
	zz
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473250c88.21.1794846166766;
        Mon, 16 Nov 2026 08:22:46 -0800 (PST)
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473081c88.21.1794846163018;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:42 -0800 (PST)
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
Subject: [PATCH v3 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:43 +0530
Message-ID: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2grBZwvljrDC
 yomrWniIm8lyt6sL/aMUsQDaMTn/4NCX4NLoFQ0nuaPorfep3jW88o9yTlFvNUsihLcY03fy/gq
 AsAn/LP3ZEXWG77+Z2UYq1Z/rIpFBCI=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb2dd7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: j1o17dXW9ppz7QJ6NzKfm4J_-c4Mk1hf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX4ISfLMAtEwv9
 RT4gspgeA/rbCFe8CE1DeNtFmCqZHQVsN8s57qbGci7CrokExEgMMwng9iVv0PrSawgSWFgRRgU
 yfefGAgVYMoO+SYxzaRwnVebybgeveTI5xbDJoVtWSIsbJSza8TQ6HpQ5WNfcoD8XxkQM8g83aM
 Psv2WfzgCMfXVP61FXVCDM258TeBOakjzK0DfPOLqzGJW2U1OztnzOniCGlGPjUI2NRsGfvZM6r
 0ci68eAY+spEARNqiWmVetGIUFtu/1kPstab01uAwvmGIVzpvnI3FQmKd6djUlF/zVjl/mLno+B
 cx0RLxQpBtYddGMIfPlh5pYq5y4z8XO/hbfltTs1AMIR9ABNT44cKJOho3K3rbGeDmJYweUyGgI
 dWWkP8B2B1xoJAzPqYp7pK83R1wCp6LlnpzRDVOMSsqX8qwjm+62/YXKy2uNgO/sGEu7R7Yi9uA
 7Nz754dsoiy1ylp8JIw==
X-Proofpoint-GUID: j1o17dXW9ppz7QJ6NzKfm4J_-c4Mk1hf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

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

