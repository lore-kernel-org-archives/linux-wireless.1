Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093050;
	b=amORjDX+WM7+w8iNlfkAXArUloKWEdFWgjOF7PFkQJhmYi+5P4/F8K/tnIDFrm9JPcXU
	 UAXLoWkHjo1XEpfI/Buz7zc7scEqskoke+9seDsF/PVCbfBep3BEDbgmyZcFAhsq/fWu/
	 pEV7pY3efy6DoemDcKphfD2LYlX4E1hXEuoreZydHElwc2054UcH9qZpo8TBM5d0GD0oU
	 I285HSqaGVV+OJerYbZla0HsomsBEoKpFhPG5QGd1REsmhXMKglYAx0HLyNei5OrPMVM+
	 RZjCiRDSHPVUoabHAn/MIlyVXRfjtPonLsvYboGnzkp+MMQ8u18Y2GRyhw0cQUOvSqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093050;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
	b=sw69i29y76BoPiG0rX2DDldp9rS9Yu0L9z0am8AqoGBrYtH5b9Vnaql/9jUlMDl+TVUA
	 VK4YneeFbo5RTcPQ4xUxVT3QYxzMnnoujdF+i7WpCrCCabyhfAiEJPfXyZkt+XBp5qaCh
	 6SoNLknjZWKPcK/hbKrIstn08NqgI6OfHTBBtthE2/cjpmlNqIvGuke28SyoyHDQPf5Q2
	 W06MvWV7Bpe/+R+QtmZ5GuMiGUkLYORF6zvD2hPq0EgltFT7lZmu+gyu0HSi+gecw5u/M
	 hYS7tayKJRnJh2hFmqSnaesOsRac/B8dgBiHGWUIuNowhFK/iZqmWsCPRgiW9rSubQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyyxNgcB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SsW7L/84";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104D606A326
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B104D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyyxNgcB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SsW7L/84
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjxoN2842835
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=; b=lyyxNgcBYDgj9KbE
	qmrx/XYf+tSkmtbyWk2R5fDOlviDxyoc05zZdzmgl3+DWButP928RJE5AItYT+cM
	s4cFX+ar6EkcxU4ajGkcXdbQvBRETTlCVv4XAmwU+YJ+HzYAo4lwDU5vRQ89MbjI
	yeoGY6hxQEuvqD8yUAbiXCUyFjftFeqAf1uFcbzKRKuSjcMCX+zFhp/9lKM7SRE+
	MvKbDyg9JLhmzg8mxzSHa8BEt9XWZyYOMVh16bIgqr6dWiRaVtLqh5X1gB0izFfA
	TnCxesXlUN18Ppwqq8CQDl38cf6LEFvMhAmwXPcwZHuXFE6xnDkCc+gF9y7oCxFY
	O5ZfCA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6rtt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3837afac185so4027733eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 04:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093048; x=1795697848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
        b=SsW7L/84sm2BM4ICdF1DjSa7a7uf9RKxGdXUpLW+sdTbSvIvsjULxMKnoQIAFDAR2z
         mdt/5b72yCIBbvmlsLJgNdNR42dNMmtCxzwtYtDqAv4V4lnO5Hhy53W8xmhSaif6tA2Z
         qLLlp6NveeM408CUsKENyc3doZ6MVkfSI8FddQqQ+r7sWedMH4wlNSYlGyDAQ4AGTs3C
         RGeJoGTrK2GWoBLp/HPgmZ/yEiuSQGj0s9jaYnWszElLoi8AmSubBfZqlUUUh6deX17m
         lrEyczMZE0aOZuiDRaA8YdNkKgWwBtdFlPFDhQqs52bJ5712vYPYuC0EUNPY4pw01k6x
         bhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093048; x=1795697848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
        b=yvwKi54kghzSiKmkHI5UrtNDmhTgeOc9Bc7coKoCcX01b2LIYVXpgVjZjvm31BvyhS
         62UkUimrjhjhE1zQgiofFPaEIrbK1oXmQx41Vpet0Oun+snzLVlQopZB2YUgISyrjIWu
         bLR7Qr70XKwiQ34Ee3jrXVwAIx7arvngVKX+7sdQLhUIgNvPx+zwPZwUmsXdORXPYJC2
         XOl0ma4uUf/eGovGVMu77fAqDJ0PkgJd+qgE2tz4JDAt8HW2Y1P4kC3l4oI08NpVc8Qt
         ZA97SgJSJ7hNe9yOWf2qzjaWDeXGjGJqaCmRIfCk5/CMoENjvxOcwsMuv0oANyF7qmjR
         zrzQ==
X-Forwarded-Encrypted: i=1; AL+hErFfipHyeJtMyJEzQaBkTW34yQURhkt2z6Z2E3T5fmfFKrWXtkc9TszA022jow7fCfzWD5wh5VM7Z7W0XdOx1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HJIEGCq93N30F8V/U0Pc8nYW4f6Mt7tdLPfs1NlBFUJGOvNAy
	S8yw8qOgdbqLTKve525C8dur350+M2pPJpycaiHuHIIt8Mv1jLCYvSdfGE3558HukK1oZFzlXLp
	kcC3vgO00MWsKazhCTclfet4veZQP5BgxlSObRvAr/vyX4dVXu94Vpfb5zmW3y6nwAx7g+g==
X-Gm-Gg: AZFdTZfiI8Da4fbge/5MoUh4/7lu15XPfqD6m4Y3mNdfVLckNB8ZkIBBvjczkb8yCVF
	BpCvQrMTTnwCRXjXmg2rSDKtaUTWZyNjGP/k/FlG1q9DVniQSoH49YnfCjakKPT6/bI691YHV1m
	HfLUeqfs5nE0dGetdtECKPqTYMP1E6bARJrkLLDFvgHc6iNpW4bvEJ78ykbw8StHPopo9DWnjA2
	c5PxNwfbSjI0370kuI38iSqChELMWQqkNt0795WV/clRZkQPlF+20PxdxwnhOuP4y5ojo9+h6Hc
	qkBv1OZ26INqX7lLEk0y+90ccOWzKJVzeBUIp8UuMBHzgektxebbrGQgAVGD1meIoPEKxrGItry
	NlErggnZVPcPEnYSdSGKbziwtgHX1o29fcgkjM+YtgW6yap8xwriGUjQ6XXCRGd/qD0BuQQLWeJ
	Ai6D/vGvY/
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr6041417eec.15.1795093048273;
        Thu, 19 Nov 2026 04:57:28 -0800 (PST)
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr6041394eec.15.1795093047773;
        Thu, 19 Nov 2026 04:57:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:38 +0530
Subject: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth scaling
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
Message-Id: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=3223;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yAllDll9YCBe68xUUxCszpos4lvTFYNXK5z/BwyDl/c=;
 b=+k1xuH+OKoHdW1RPtGLjE1H45txjZLkvtl/v7yQ80cCbYV1mjZYC938l9WQ1zSE8XTI68IedX
 Cs+qfOOnDbNCo9/sL+ruhb2wxcVo6/Bui29ICuhdCaqKSD6tDrSweoj
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afef238 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eVNgtL86jhWfyD6ZVDoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX+T/E9Xk5hEzL
 ZUMS3ZDVI1YPmiTbMdB9KvswQpWh+ykjjm4Y2PnbikJ2+P1m3i/NwhvAwua7tP7oE3DKcfrgVMe
 MWEKLIqGwg18CWoaema6bIdU7tfToU3hcRxvp9vaJMO1UQrFIvrQVj7Q7WC621gZJH/c1x7wa6D
 PfioziyaK5C+zYoar8UM2KZqwRzk80AnWkP2TiMw7qvbR4edJSx1JiSOZadrKAC6KaEgB3Mqyyv
 R9oexSIgkH0aDEYg/4qeUls5tsYNYyP6chUTqzWhbbrKMIS5rb5ZPc3VL/hqJODvrNcECU05F7g
 VZOMWozYf5Iw3CWxsqLviJxEUrGsDJx5MBFh8j5Awmb+Ju1xZuUjv9O3SaKUnaXScMX/qyKQY85
 /DaBEdmAzJQqykI+2OUqqFCNfHtnO47rwUMuW7RW/eqQgfFYIFlVIifCC/4MdxK4ZWrNbAFerSz
 F7OGzJahsnJLdROTFBg==
X-Proofpoint-ORIG-GUID: JovwhkLcrYso0MjVtWSzZ2gy-pui59_h
X-Proofpoint-GUID: JovwhkLcrYso0MjVtWSzZ2gy-pui59_h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX5vib1DWdUduw
 s38zlOqZEeE8BIWAHhTkiILKjlyMFi8CLpX2+r6NYr/xhI8Gq36QxkqrgRAu5jBF4llVz+SPxFk
 qgWKTvRcJGvyaJgJLN7sJDfodv5MKQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Add support for MHI bandwidth scaling, which reduces power consumption
if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Bandwidth scaling is initiated by the endpoint firmware based upon the
bandwidth requirements: with high bandwidth data the endpoint requests
higher data rates, and with less bandwidth it requests lower data rates
to reduce power. The endpoint initiates this through the MHI protocol.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c       | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 12 ++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..16d3f299c47b 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -184,6 +184,21 @@ static void ath12k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath12k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath12k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
+	struct pci_dev *pdev;
+
+	pdev = pci_upstream_bridge(pci_dev);
+	if (!pdev)
+		return -ENODEV;
+
+	return pcie_set_target_speed(pdev, speed, true);
+}
+
 int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 {
 	struct ath12k_base *ab = ab_pci->ab;
@@ -261,6 +276,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath12k_mhi_op_bw_scale;
 
 	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
index 367432676385..7187394458c1 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -17,6 +17,8 @@
 #define MHICTRL					0x38
 #define MHICTRL_RESET_MASK			0x2
 
+#define MHI_BW_SCALE_CHAN_DB			126
+
 enum ath12k_mhi_state {
 	ATH12K_MHI_INIT,
 	ATH12K_MHI_DEINIT,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
index 988affafcfd1..c482f0e04742 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
@@ -120,6 +120,18 @@ static struct mhi_event_config ath12k_wifi7_mhi_events_wcn7850[] = {
 		.client_managed = false,
 		.offload_channel = false,
 	},
+	{
+		.num_elements = 8,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_BW_SCALE,
+		.doorbell = MHI_BW_SCALE_CHAN_DB,
+		.priority = 2,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
 };
 
 const struct mhi_controller_config ath12k_wifi7_mhi_config_wcn7850 = {

-- 
2.34.1

