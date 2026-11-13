Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596011;
	b=sTBc5KR3nHGsWsuOVW/C9aK4f3nNXLOp1Bf+xgpH56v4KtQRwkd30l7Sn7DmrtyTnpUM
	 cHePo97ml+jby+RltPYvRcZ0dgouSBNCnMkWrGoqIbdPGFfBrNJYva1+5sqVBpvKqPd4j
	 4QC9miAo8yIJALIqGDbjBxc1ugtdc5m0mVHWDwjCPsiqcWVQacvAz9jmakgwgCezJSoO5
	 7pzk2pnemdhTl7V4uEBH3+VjEVSsMkyFDXInEgOf3JEaH17yczjxg3LC1R482Hg247IwR
	 ASkvW6GFUSm6w6frq25ySNZwlRf0W8fP190e57APAQILo9e9Z5ZpO3IPJ94LCsZOr5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596011;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BXGZv2S+cckoJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=;
	b=AfFjnIxFBqt/3BMBy7TqsTjIzJmQQYhypYqRE3Gq+8z9RthLT2kfkVFizGi98YsFXLgu
	 vYiVaNTwmHM81H5idXWLztzyGaHs75/N1f9S2ufpf2rHmvP0+H1iuCSgNHd2yjhON50ng
	 ZOLZiQC7oVZdvCsY1Peab7k162SFn6lwKZH46YMt9l9CDeRq+vNYK1HdbRK9Z7sG59NT9
	 BIQ6I7LGd0595qXiey48NE5W+piRcqxd1/YxzjSZMm1EpoNHefyNkPHEqylm8VgybNBpc
	 M7px3l/Q8dJ49RukdHSQ1NZNYwP0bLrtPxUbzL09vbjrBePMoLKbdpsjODC05JBKvpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bFgODGB3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuSQW4hv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6994E606A33B
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6994E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bFgODGB3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuSQW4hv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRV8t533429
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BXGZv2S+cck
	oJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=; b=bFgODGB3qZZaGg2fPtcRPUcqtQt
	+GEz8GgP7H0F1BFrwXRVppu7n/FTwcBZqwfYr6zB3uvrNxz884R0cVOp2J4piCAf
	2tyVO4tdyERuy1DeTxx9BptUJiXYUSDmTvTb5YS40gJJr4qVVWB2O3u67J5D1Mm1
	rNvKNnxq3d+IjL7iXxpC+VisJ/xUj51wJ5+VEgGMaR59bFnXjtm9/o2RtkN3hAtE
	9A+OJO9me4U7LzHkHYI49EetYOHZviEHhX3V5nfUhKHn/ZB3iqfK7X2IWWnMgSM2
	GgylAL4FWPY/GjFCuXV3E2d3CcnP6heEPiQNnzzEvAx1Mk5Xeo5AyrokvSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaasav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:53:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso5682247eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596010; x=1795200810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXGZv2S+cckoJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=;
        b=WuSQW4hvFSSqrNQYxJlfO73s4f6NkxGAsQRz4lVibLt75+r13LA3gjhQ4n0XQPBB2E
         BzhypBMlG+TOtLeggRjbKg9D01sPxWI5NEoN3N0rd0+fCsP/rbrYXWq1/XhtVcr+xFhQ
         5GapbtH/cAw/K/vMES+YdjeEFzJQj0mKSPI/hn7F+CmtI9cmNcWE9CpkxJDYXDoLj+oI
         UbE4bjMBGO4WWJlq3Y0zCn++eB6hBbfeJNHXpCPgL41Eh7x7QIV15uPbgq8qCkvUz/gK
         5x1SAPJ6pBXtMRNUx402Lwto5W6PyIRO2WRqbFihHRQFX9cQ2wFmINuSHzuy2XxDHPbj
         +z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596010; x=1795200810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXGZv2S+cckoJfc7J6GbRVXNyPJ++e4ifm1HrPgIkWI=;
        b=G03O+7hoYrDTkmhrHdgd/Q4cklkoEjoPCFdZCw3PT4azqdBwilS42o5BIBE+JOzx/S
         5JzuqToLmGHB4qKUtVe8bnIpfkx/BCTn4fDz2fcofkt/IZz6mislRO7KsH0FCLntqH95
         whwe/7c/U61bm5090JytWD4Uz6ynqsY+Yn/xg5y1FMcPvG4ReiET+1qMaJOGemycRp23
         bwl2EsHZtOMlUydu0nute4+tQGJnP/hBzBUOjnu8Bpc6Oc9spkofoyfwLVp171TQ635G
         XYFGxJ+A29GQQu+61QyrQqzf5Ojahu/cRDzc57tX3++h8TPuLnr7HcrKKEihbB4LDgXL
         9Brw==
X-Forwarded-Encrypted: i=1; AL+hErHPA+ZHVsQb5ervQ1kWdzOku5mEtV1sOwNEafjFrNUj+hD+ujh5V5KPWexkhBQdwF1epfD9Uv3PRZlWWu7dGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BDMcLHIuG060/knkfYMAG4t8ZE0ePm0rfdsbKZPM1xkt+lNKl
	y+AD9Ztuxg/EimwQSeq3G0jlXpLIq5qIotc9/ODUJqRuRor2u/cQI60WIPuukFUT8ZXWBFcIm0a
	d11VOwun/2mvxLw9eQFqrQxhN/nsUVoXCRwka+0OsqdsiQ50FUAGMc/JdGZ4xMfLUxzl0ow==
X-Gm-Gg: AYBFou0aZWzrFXHLX5Ge5tn2JwMroXSR5iIvJnfLA4Z6gTtGGdHMRlydXxoB5YvuB/q
	EqiWqwxVDISODKMJUCAiucrSSlNT5KY4u6bn4tdYWlV+7IfTlWHFl1AC/6TuFW1bLYgNyyYbRpA
	onAx5lKuE0de0KkjSaa72aqWlld+opn0hXWHgbpU231XbacPRDNxFrOCfSvxqOppz3VhviAWAfz
	h6baPO6j6NGIR0GpQAm+u61xmLPG/cy6TjSDObke43dKud0y1u9+NC4siTDHw1tsUFGAhD1q3fq
	73xjBLS24QA4SGoKZ430xXkndzIkm2daFK4wZPpDxrmLGhfVvtDQKS62+Xrwdo+oejL3hI5X4en
	AXEgq3LP4PGp1FwEp06InLvQsXnjnQ4yOB7eq4DYt9ucEEOQrecpXbM6FZg6pM2seXLlIjS7zqy
	Q=
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr4176066eec.39.1794596009938;
        Fri, 13 Nov 2026 10:53:29 -0800 (PST)
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr4176014eec.39.1794596009138;
        Fri, 13 Nov 2026 10:53:29 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:28 -0800 (PST)
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
Subject: [PATCH v2 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:02 +0530
Message-ID: <20261113185009.157893-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 38iOZ2jV8JSmp0RdupEHS2JGyn21h-Ia
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXzcGP1Ew3TBks
 GmhOptr+vW1dGzMKncnBTJwnxqavy05mj7Rxm0Ud8xepwi191HaHbs2b01I7rLT4csz7MTkjA46
 kjJ6q612Q6S5V9BAOKmib4ovGBAE3nA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX3bPfgYLbO+by
 5A6UCQJCwwNH/DP1UBL3Kgqw1Q+qLxtm0LHCAF3b6eiQs7Zjv33eU1slk2tT5FxxJCRuaO3LhR6
 HW8xfWVXG4cqOQpkdv4ufsrMmnt7dHGtC8atheqA8tE/JCDDPo6o9G9W/6gO8EGxydxLQ5kgVlr
 2Gi0vLBQD4pR1jcvSPN4wE3iAO8sEQLt+fiV2dRLUAlndfgV9YebiavoqwdL5G2UksbfnPgW8oa
 Lc+O9K2G59SxU0vmnqaGgUGx2pAoxzIM5yVEd04ij61W0UwydTACrCVKij7f2JQ7f8z+Kl2DFNR
 XxLGLR6NY3mFZnAodKJuNWL0X/IrqDI36AI4d9YHo86QCY4je7MLiw1c9TD5n3F7b+44R8vLZAW
 k3PzrGmCmXbxr7WpH67ts8Le2dhuNHiRNkoayLtffa3Xhn5lJLoq7Lmfb/2grZG0/A+JC62MvGq
 1MtMaps3v0W8L0FjTvg==
X-Proofpoint-ORIG-GUID: 38iOZ2jV8JSmp0RdupEHS2JGyn21h-Ia
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af75caa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

wcnss_load() calls qcom_mdt_load(), which bundles metadata init,
memory setup, and segment loading into a single API that does not
expose a PAS context, and wcnss_start() calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is
the intended behaviour. However, a new qcom_mdt_pas_load() has
recently been introduced that works with a PAS context and can
handle everything qcom_mdt_load() provides, along with additional
functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to
run while Linux runs at EL2.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load()
and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset() in wcnss_start(). The existing
devm_ioremap_wc() mapping is retained for wcnss_da_to_va()
address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..f377ce6d324f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -96,6 +96,7 @@ struct qcom_wcnss {
 	phys_addr_t mem_reloc;
 	void __iomem *mem_region;
 	size_t mem_size;
+	struct qcom_pas_context *pas_ctx;
 
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_sysmon *sysmon;
@@ -157,9 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
-			    wcnss->mem_size, &wcnss->mem_reloc);
+	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, wcnss->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -257,7 +256,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(wcnss->pas_ctx);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -599,6 +598,11 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wcnss->pas_ctx = devm_qcom_pas_context_alloc(wcnss->dev, WCNSS_PAS_ID,
+						     wcnss->mem_phys, wcnss->mem_size);
+	if (IS_ERR(wcnss->pas_ctx))
+		return PTR_ERR(wcnss->pas_ctx);
+
 	wcnss->pmu_cfg = mmio + data->pmu_offset;
 	wcnss->spare_out = mmio + data->spare_offset;
 
-- 
2.55.0

