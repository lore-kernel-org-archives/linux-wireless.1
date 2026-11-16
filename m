Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846176;
	b=w9Ubf8Lt69E7xgZ48Mji6ChAxuFPIK2jFLU4BI8RC6Ai/eJ6GdZW7ThrKpsD0DTerXYM
	 FEFuonQxIsKwbJftBIr47xHWMzXgX76dxEgi/YbMtTrw6zI/h7fXyaYF+AOOy3bbMMgwN
	 WbKTnZ8+p4/M3zt1Yo6f+k21OWTsUzVyKKWUQ2uF19wXbp8/D3VGgUcwRhOjrHvy4zuRk
	 1Y5sVmiL0owJjDMt3Mkt2lWz7/ne3+1flcu7I2vhDj7DQyOsn+v5mnSpa6zWnjXTos4+l
	 r/VoOYmHJjFRd3LdzAkRDe4/j+NsZEkyISUlv//X5gK941uZ5QfPyz7MtE9rR4DEHNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
	b=iEj5F1HeAHUC7eDArhRt4JoJmpmzHokema4R5ywU7hKBVbvcDBcLCi3wdGoR4ERkzIUT
	 t/tC1moMJ6V4Yno6cpTEz7109MO/6rAlPAMNibRgGF/q47wpAeJPw/uV4h+SCxWMs3Trr
	 YcYvwyE7afIXnFbgBpSWoM3tmdasqidtHDjobhlc9muye6HKVVweYSoNawXitYjBkRrk1
	 YhwhpdUQkPKf9XLILVJMWavsagmFa0HEsBQLBSOdxYgOPmRp6sUrhNk1tCim3LU+DqwcS
	 52c8Cr/c3B955RpYe3BlNy946rB2p47+6sgJtkuvzAiTSPzlzwVUClAYKB377h4MU6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F263606A32C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F263606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIJHG450657
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=JJXXqVQtYeE7I2LIEKqks+Aj4Og
	6mnE8TIi1ILCOq3qM3zVIKPZcwh5rA41aKqTA6PTkfDdudLi89hQdm0W9KNvl/Se
	V7ZsXAWS9TIyjztwC3XSBW02c2hQsa04UDoTLnpOwWu3P8l3aDQGk3y/heMjTuRT
	nNm5k5Zz+jk+oQGwu5nk/eX64P7cDzS9BS1E6TA2RfiRwgwpbu07xlAIgaXOdyxk
	X76qpzY8fUBZL81X9hbki8jvo2HfuhfgWqE/h0hlG+5IywHykWIzfTG5M6T/EOBv
	s8Vl8bPkaZGplcg+mhacoh3bDccKZF7hLzLP6YotlMs9sona+8iakVmMXyg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y0m3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5266128eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846174; x=1795450974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=d9sgcvnriVBI0vbCeHhHUbG9IeWuVL+9OJyu51Fdi5gcoe8z603BJyj9wfFvqukxRy
         4GjsBduEkjKRGesd8Cc1O+90jMA7iezGrl7LSY9fVVoTrwUnsl2aQtzHohhDirixDrHM
         lHjv5A6FjURb9pgiWdZSaeyatRB52I5AiTybeNxtdsXMBel3Cm72HaBRtmeYCKT4T1bM
         3xVAaT1lPv2+gjri5iHUg9I8j3rCkaXnjhvVZRRnImzhxJ4a/h4Wr1N/kYx38lR1jJYi
         YhQs5+7R9Y7BcPoa3cn6zT1sH7SP+4CeSn6ooqA6VB9tYo+E5fkmbxQ5GGzHDIUxJz+Q
         21kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846174; x=1795450974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=vOC7b13kIrXMQfxqYtQKl4tUomo3QG8OEH9egzk3Gl3ubFZq6y1gglI1kPOOq1nI2o
         e+ge3BeKqbBrirjIUIBA/9MDVY4SnmRm8ETCq2dsy0qMhIJMOcQaRJK0OKW0wDpiDSd+
         mCtif8zTTf4OKZ+Vmv8d3aqE6LHFMlGaCaOy0F1R2WKhSO3NMKEuEotVZSFASf9L6Hsh
         wxh7GhbGp4N8m3694eTIC51v1Tsi6Z8ZlKgM8yHfV4KeG3sE8WacKhZTJvYqoin+zApn
         3fZ0+LCkzjHcvlibfkeoNlKEM/kdgvHmCQwjTv3hI5ip8rQFd3BKAeyr19OSgHFly0Xw
         Vj1A==
X-Forwarded-Encrypted: i=1; AL+hErEDBGhNWcgGV8cK5/DqZeoStPVzeN/5eOeE04JBVKqGaKLmwwqSGPxmA/OyAy9xWBvs1ZeoZoemi3t5ZuYu5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DXAg+wTj7iiGeGooXaypuksOX+4NU+m2XqMSHFxC5XvNaRFL7
	M8mLvEX/+BUYGgzv2378YzyfINDKvhKNxnvmn7m3EzHBEdNku7RujmtiOlnrG8A1LbvFgDCZKMU
	j5NFzenvPPNfFsK3sVyq8kZ6Bc8lndujk+iq/j8sC0Hrjs0RtNj3piVAqhqPYY4a0xh2e+Q==
X-Gm-Gg: AYBFou0vuGKfKOIWycEy9f7RuO4aameMUbpzyMS/LgNv6x+mBU9mjqjPzA/vDHu2t4R
	HS23UJy2SkL9vrwQEp+kkIcDEvfTjv/H3fNgoSbAa3iFb/m2pqpzAN9IuRwAs6DDK1G9eOlc4wH
	sWHyFOjwE76t3PLAMcGbOzcwSd5gzrKLr7QtW56BkOzwYdl4pf+DtPDJ8dU56vqr+a3zaJ8G9tG
	OiNfctbvJ2tvi39NVJ9/bhnLlvybU/msgIruPKT/dj5Zmjqcco6qEkWppfMttSWwPBWEgFgvPWV
	gq5HoCcPXc+BG0hMzsVjfla6GVSoarQ1qXWn/7OqRat8FhsHHnvJAlbAFQi1IrDBSqbVr+6Qbtz
	hQZb1dqBlkC5CI2ZnoZcgKE4TwpT4iVMBO5Zy5VORVviyppg6cb9D1o0YQ8QSBD7UyMBaIiHDYe
	GK
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214632c88.33.1794846174001;
        Mon, 16 Nov 2026 08:22:54 -0800 (PST)
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214575c88.33.1794846173198;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:52 -0800 (PST)
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
Subject: [PATCH v3 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:44 +0530
Message-ID: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: sUszyPpt7GiSF7vryOiXj3b_M8dlgleJ
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb2ddf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: sUszyPpt7GiSF7vryOiXj3b_M8dlgleJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX+gl+yznDNvXZ
 SKZ+XegakLdVudk5pSHU5/XNvH2x1nbqpWCnTInvSmZ3hVToGgzUA+TuWcrJ3YB2BN7isEkTWfW
 37yVt+zs+tq08CGT6/VgNhLD93Mo+cg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXyoOrnMw/Am5Q
 9R0fjz8+T41HUlW/CnXNw7oPZiAeauK02lInDe3xCIWvmRBjqJYuR/DOVHhFXFyQNjIkyrodigt
 hcmfLgHqekBIBqS+mxU35p0hc3Zt6Hvvx7yFmHjNTbpalTQzFwMg3MnO7pXk4K40LhkM5hM68nF
 IO6MvVXKY/QTyW5GIXQp6kMunHC4vDIuEf4VUWxR+L7+ypTqygHaDuW2xjuDQIOKqfgkZXh4ccs
 GCl8EBs5t9eG8juLnF4dALgmjRUgUxzKkpvfWSPg2IPrnQ3mKhh3ilJAFdhlqxwbVjFBh/7oYQD
 j4nVZ8db08FUbLgdlrSXagKp9a9pPYV1SGN+i2joTol1rqwKMvvFRSiWGgCYbiHR9GbwyPSoOEK
 89RRjCqD2lZMggy5ht8iFzJ8q1nZbvnz9nszbRktLXan0hvEdjt3nrwltRZ+x7FN9VsJ4ECoX7U
 NUWiA2ueaNVi4krC3QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

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

