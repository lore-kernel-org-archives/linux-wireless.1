Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596044;
	b=0SNYONF77+PGVVyTosAlIOPRwtJmk0GCofwpZOEfh7+Z2IV4phqoVEEdun4bzpL3Vp1s
	 SNZomunIM20bEFHOFyd5t0Zg8dwZUdiofET77ZvXEDbpHQU9mYg3lMx/aLPd4t2SRRkQ1
	 IR5ZpkxkU+K0VTNR7u6275s+ci163gsTfYNtLjUhNPBiyR7BOTXfcmLpMGdbv0G6JPxD3
	 nhpnlfCs1m8BzPgqwG++LUFJ/mdTh2WMS8tKK3WynSOWIrq6Xs888MuZQ+ZDuVHcX2gLn
	 yywZzMC41SdA7QlYgygemcbSAj9Nua00tMg0DMcMIJsIAWmxLi3gHucX39/URpRS3kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
	b=HQABkir4poSk2j7FcgS4aRZ1eRx+k0+O40G8PTtwzIFHR6t4l9Srw8SRjngJFw5p0Kq3
	 TeHvFLeANuBh75Ymhhd3TFhx5t02wF1K8SkYSkuylnzmdZHRwIwdVSvg8kAJU63PHb8Bf
	 dVdVB+uzyOzBbaKCAZJTZ76GLlaJfRv8QQJVdmVemx0v0aFu1/2T6/RIFnX9lt3gfrQaJ
	 DIgPwPizuTuYHCYR9C4MytHFjJpFSvrR0A4n8Jj4Y2IdR+ycCyh9PYgXyO4P6m0wLh/QI
	 Yof4ERzcomxPZNnertigX6DB3m6UJBUPecKArV85UFhfKDGmv8NHnfC1KdEpSfrhEsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSsCY0NT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC2HN0pK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9FD60A382D
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9FD60A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSsCY0NT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC2HN0pK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRpE0552832
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=fSsCY0NTXlvartabOwFgIj66jdN
	vofpr4TxtrxMNECIXDDGSBZ4KpYyrhYTR22a4EUgWcuv63U/2PTmqs3ULD3CkdPq
	Llei5ZU6jj1qUsTDW631MVD1FiEcIk7BQEbbw2+tXuZvKSxPCnai7kZRuy207yFp
	g/UxbKZw+JgwPOOa2tGSsHsdNgn4ZSMYLFMLBUb9CY5SdSNZ/md3q4FowwvrWQKp
	6YofDJm5ghJqsl/s3K/6TNRLLGFC+vjjLTl2MNEvjT8WdHKvcGnAcD7dLzUVRcSC
	tqqiMB1Thm7dyOl+aYwTpeuEMH1orm+iu8pz5ekAhw9DKzxMoOelPQWr0xw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:54:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so2441176eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596041; x=1795200841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=DC2HN0pKEtuI9w2gbQ/XzjgSZZ0bVGDsQUgzXRvTbbPdsYuJaKSHuNocfTD+bDkqb6
         taIAj1e5gn/FFgl5wKRZFopupjjTLBwycsrQzBcIJVlytO5XLTVt2TP2BKLdAfuu14sU
         tY7tITs2DoeeuwD/g2aMuV+gtmPzzHnPApgDyAud/rJ6NMqOnXFOk5Lc+W5t0s5hRIf/
         TiFumisg+VGqbjGr7cpAHkzHNxPVFGu6g+tuukS/n9h/N6sg2/GffIRKYXaRUL6Qfy8i
         V9AqeO9cn/mNZ00b1+yeLDf3ZQ3kUuGYjKOEixM3wDY1sjouRLJ5ffsXWA5ryWQCVl2o
         Tn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596041; x=1795200841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=ePNj+e9/hN8+RNqD+DGOZsE/Zcm5qQYuny1ykP/xAz+KOM9OwXuCUOpqJP/eAnrJM5
         jCw13RZ59H01+3KBoU7sBByAKu+OUq398L5MuUOp5lsiDzlEVGMaCCqiSooVe3aBs4zm
         TgEWdjjhUy2pFXAnsErJqPlV1FyL1Gf3byoVTpD81wZ72HDPP6kXeK9qS8tpLT6gk5wK
         I64UGtgQmfjoZswYllkH2unkYZaczQtXf49wrUoXrPPCnZZlJeUr9y8niE/g6lrjLreS
         yOVQmJ3Z/g3MitlFOXWDmSOfSy555ypiXg9C8lCR0ukf7yV63EPRhDFHeyooLoOiH6mG
         DWOw==
X-Forwarded-Encrypted: i=1; AL+hErGF/e+USDLh6uyO86k5zAAIBRirRyWrKQsBGhWOeMAmjTrv4TEFjRlvCvLqAHojlnIltVeK+UGeig9gOdmzDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wm2b9+N/3vN2Yz4KRIZ3JgcRHRPCZzabTnLlboVt0ORFxKnW/
	cuOsVyiK+s2lw/d/WdRw984zjnY9Ig4GgAZxI+XaMoQ/I174r0ThfP+c/ezskxInjewcpZhW6RA
	GUr60GPjiS5/2f/0ZtARzlgnpNAd1nwrFGqPHuYu/+ztjR8QjgnRlDz+4ljXqiBcNUbKw1A==
X-Gm-Gg: AYBFou3HGzoM1oP1pJPlb9cS8NJqQE4gEY8O9DjpNycViK5nPhka7BV9oD9zPztWhre
	h/WfqogtpVAE5YRkoIbZ7CLdWX8d2fhAyaXHysJ+JO9YlWcWswV2vfhnGB7DRqx1cxOoNL78Vmo
	izYXons4awzGHk3v+7n+D3SL7YM6u2Bmn8+nFihAZqJEQM+IE51NlLJTgTgeygC3NT3JHBZ7/kg
	ySKKZUFua3LgazmuYgyZQqOSykBqCJ/yVtI2AEXwst/iEiQg5gkO/MDm9vUL0V2mgEzVRLUaheK
	8PAWQ8kAwotbUP8aS9iAWRccc7/OGrxqukij+/Bu7I/fip5VOVnprpw3nfuuTQaf4AsfDQ/opAe
	+seTvYQVk1SpjERVXL/NYKLRAxeluaLxN2Kis67Oh/lWRrIoU8SR5Twwi3E6FU1hdbKbxymODTP
	c=
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr2852021eec.1.1794596040427;
        Fri, 13 Nov 2026 10:54:00 -0800 (PST)
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr2851980eec.1.1794596039826;
        Fri, 13 Nov 2026 10:53:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:59 -0800 (PST)
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
Subject: [PATCH v2 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:05 +0530
Message-ID: <20261113185009.157893-6-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cc9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Cg_gKmW3OjCDfCbM4E6iNgfVdAqFHCXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX5zXbeMzPJ5xh
 NJ2fy3MyAKD/4E+ScaSfDKvkNGFkcenZLaFejLyILMc7Ws2ugyKecg3SYMg3IS0IOY2yjZyOAJs
 kmB2Plec8FRRkHUx3eWYiCUnCAwqnlBs7yfEa4Pg1vQ4XIZ2dCShyNKxmNf5Q047EFpvPVh40fh
 sh2fCOdgTyBk2uTTta2Qyrdi8no5vEaLYAN/Uax5gozbs/gOQ2S6uubT6eCWEM/7DeYSoIki+g7
 6yQArBJS8h24e0njx0/tjTXqTPIztShmzu+AZOkvOfFsaKYRLa+Vl7nN9Q8kkWc/WzkrGvLs+ZB
 QVUwuMcAyMcZmQ3b/TFFDVu14brMWJ7/thVNjMxD75aJt6VHCEBsUQmRFxj2ZEHaVHqXU1CZv84
 pp9MlxfT+iroDvl9AZtpP3IHxU3uoAvVaL4lfxvB2Bptktgl/fF3FNaCaRStakyKf1uEj8Mlqri
 s7CoVX6RKAIRTs/1ciA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/E+pdbbcKoUf
 eh1atDWQNlEXsoKwFg66C6HzI1m6U03ZqZwiT0tq/6NQECOcvDhXpuXJbcfMJv04o9XnQJVuBDz
 hzUAil4qgZEKd4loFC56olWDy3v2JsU=
X-Proofpoint-GUID: Cg_gKmW3OjCDfCbM4E6iNgfVdAqFHCXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

venus_load_fw() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
for TrustZone authentication, which is the intended behaviour. However, a
new qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Embed a struct qcom_pas_context in struct video_firmware and initialize
it with qcom_pas_context_init() inside venus_load_fw() on each call.
Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 93fa77f05834..84a0d4a8426c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -228,6 +229,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..704343e241dc 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
+	if (core->use_tz) {
+		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
+				      *mem_phys, *mem_size);
+		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
+		if (!mem_va) {
+			dev_err(dev, "unable to map memory region %pa size %#zx\n",
+				mem_phys, *mem_size);
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+		memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0

